Replace paths to the ISS and configs from being relative to current directory 
(which was assumed to be the UDB repo root) to an env var `UDB_REPO`. 

Replace path to tests from hard-coded to `tests/isa` to `test-prefix` argument 
(just before the tests themselves).

