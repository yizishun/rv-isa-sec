The hardware floating-point calling convention was under-specified wrt empty unions and arrays of empty structs/unions, this proposal matches GCC behavior. Key observations:
1. Empty unions are not ignored while flattening like empty structs but treated like zero-length arrays of empty structs/unions.
2. They seem to be counted as one empty field, i.e. `struct { struct {} e1[0], e2[0]; float f; }` is passed in `fa0` but `struct { struct {} e1[0], e2[0]; float f1, f2; }` is passed according to the integer calling convention in `a0` (because it has 3 fields?).
3. Same goes for unions and non-zero-length arrays of empty structs/unions in C.

EDIT: However, Clang seems to adhere to the existing wording better, so another option is to drop this proposal and fix GCC instead of the convention.
https://godbolt.org/z/r8qn8dEc4

```C
struct Se_1f {
    struct{} e1;
    float f;
};
struct Se_1f echo_Se_1f(int i, float f, struct Se_1f s) { return s; } // C and C++: FP call conv

struct Se_2f {
    struct{} e1;
    float f;
    float g;
};
struct Se_2f echo_Se_2f(int i, float f, struct Se_2f s) { return s; } // C and C++: FP call conv


struct Sme_1f {
    struct{} e1;
    struct {
        float f;
        struct{} e;
    } fe;
    struct{} e2;
};
struct Sme_1f echo_Sme_1f(int i, float f, struct Sme_1f s) { return s; } // C and C++: FP call conv

struct Sme_2f {
    struct{} e1;
    struct {
        float f;
        float g;
        struct{} e;
    } fe;
    struct{} e2;
};
struct Sme_2f echo_Sme_2f(int i, float f, struct Sme_2f s) { return s; } // C and C++: FP call conv


struct S0ae_1f {
    struct{} e1[0];
    float f;
};
struct S0ae_1f echo_S0ae_1f(int i, float f, struct S0ae_1f s) { return s; } // C and C++: FP call conv

struct S0ae_2f {
    struct{} e1[0];
    float f;
    float g;
};
struct S0ae_2f echo_S0ae_2f(int i, float f, struct S0ae_2f s) { return s; } // C and C++: int call conv


struct Sm0ae_1f {
    struct{} e1[0];
    struct {
        float f;
        struct{} e[0];
    } fe;
    struct{} e2[0];
};
struct Sm0ae_1f echo_Sm0ae_1f(int i, float f, struct Sm0ae_1f s) { return s; } // C and C++: FP call conv

struct Sm0ae_2f {
    struct{} e1[0];
    struct {
        float f;
        float g;
        struct{} e[0];
    } fe;
    struct{} e2[0];
};
struct Sm0ae_2f echo_Sm0ae_2f(int i, float f, struct Sm0ae_2f s) { return s; } // C and C++: int call conv


struct S1ae_1f {
    struct{} e1[1];
    float f;
};
struct S1ae_1f echo_S1ae_1f(int i, float f, struct S1ae_1f s) { return s; } // C: FP, C++ int call conv

struct S1ae_2f {
    struct{} e1[1];
    float f;
    float g;
};
struct S1ae_2f echo_S1ae_2f(int i, float f, struct S1ae_2f s) { return s; } // C and C++: int call conv


struct Sm1ae_1f {
    struct{} e1[1];
    struct {
        float f;
        struct{} e[1];
    } fe;
    struct{} e2[1];
};
struct Sm1ae_1f echo_Sm1ae_1f(int i, float f, struct Sm1ae_1f s) { return s; } // C: FP, C++ int call conv

struct Sm1ae_2f {
    struct{} e1[1];
    struct {
        float f;
        float g;
        struct{} e[1];
    } fe;
    struct{} e2[1];
};
struct Sm1ae_2f echo_Sm1ae_2f(int i, float f, struct Sm1ae_2f s) { return s; } // C and C++: int call conv


struct Seu_1f {
    union{} e1;
    float f;
};
struct Seu_1f echo_Seu_1f(int i, float f, struct Seu_1f s) { return s; } // C: FP, C++ int call conv

struct S2eu_2f {
    union{} e1;
    float f;
    float g;
};
struct S2eu_2f echo_S2eu_2f(int i, float f, struct S2eu_2f s) { return s; } // C and C++: int call conv


struct Smeu_1f {
    union{} e1;
    struct {
        float f;
        union{} e;
    } fe;
    union{} e2;
};
struct Smeu_1f echo_Smeu_1f(int i, float f, struct Smeu_1f s) { return s; } // C: FP, C++ int call conv

struct Smeu_2f {
    union{} e1;
    struct {
        float f;
        float g;
        union{} e;
    } fe;
    union{} e2;
};
struct Smeu_2f echo_Smeu_2f(int i, float f, struct Smeu_2f s) { return s; } // C and C++: int call conv


struct Su2e_1f {
    union{ struct{} e1, e2; } u;
    float f;
};
struct Su2e_1f echo_Su2e_1f(int i, float f, struct Su2e_1f s) { return s; } // C: FP, C++ int call conv

struct Su2e_2f {
    union{ struct{} e1, e2; } u;
    float f;
    float g;
};
struct Su2e_2f echo_Su2e_2f(int i, float f, struct Su2e_2f s) { return s; } // C and C++: int call conv


struct Smu2e_1f {
    union{ struct{} e1, e2; } u1;
    struct {
        float f;
        union{ struct{} e1, e2; } u;
    } ue;
    union{ struct{} e1, e2; } u2;
};
struct Smu2e_1f echo_Smu2e_1f(int i, float f, struct Smu2e_1f s) { return s; } // C: FP, C++ int call conv

struct Smu2e_2f {
    union{ struct{} e1, e2; } u1;
    struct {
        float f;
        float g;
        union{ struct{} e1, e2; } u;
    } ue;
    union{ struct{} e1, e2; } u2;
};
struct Smu2e_2f echo_Smu2e_2f(int i, float f, struct Smu2e_2f s) { return s; } // C and C++: int call conv
```
