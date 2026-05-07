Fix Wavedrom display for amocas instructions
Fixes #612

Problem
Long constraint text in amocas instruction diagrams was bleeding into adjacent fields, making them unreadable.

Changes Made
1. Even Register Constraint Detection
Added [even_register_constraint?](https://bug-free-trout-5gxxvj9vgprvhwgq.github.dev/) private method to detect [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31] pattern
Uses compact mathematical notation rd = 2n instead of long exclusion lists
2. Enhanced pretty_name Method
Updated to handle even register constraints with clean display
Maintains backward compatibility for existing constraint types
Added new example in documentation comments
3. Method Visibility Fix
Made [grouped_encoding_fields](https://bug-free-trout-5gxxvj9vgprvhwgq.github.dev/) method public (was incorrectly private)
Kept helper methods properly private ([even_register_constraint?](https://bug-free-trout-5gxxvj9vgprvhwgq.github.dev/), [inst_range_to_var_range](https://bug-free-trout-5gxxvj9vgprvhwgq.github.dev/))
Fixed NoMethodError that was breaking Wavedrom generation
Before/After
Before: rd != {1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31} 😵
After: rd = 2n ✨

Testing Performed
✅ Built HTML documentation successfully
✅ Verified amocas.d displays xd = 2n correctly
✅ Verified amocas.q displays xd = 2n correctly
✅ Verified amocas.w displays xd (no constraints) correctly
✅ Confirmed existing constraint formats unchanged (rd != 0, rd != {0,2})
✅ Validated Wavedrom JSON generation works properly
✅ Tested method visibility fix resolves build errors
Files Modified
[instruction.rb](https://bug-free-trout-5gxxvj9vgprvhwgq.github.dev/)
Added [even_register_constraint?](https://bug-free-trout-5gxxvj9vgprvhwgq.github.dev/) detection method (private)
Enhanced [pretty_name](https://bug-free-trout-5gxxvj9vgprvhwgq.github.dev/) method logic
Fixed [grouped_encoding_fields](https://bug-free-trout-5gxxvj9vgprvhwgq.github.dev/) visibility (private → public)                       
Community Credits
@dhower-qc for the mathematical notation approach
@AFOliveira for the detailed bug report
@kbroch-rivosinc for identifying additional affected instructions
This version now includes:

✅ All code changes (detection method, pretty_name, visibility fix)
✅ Comprehensive testing details
✅ Method visibility changes explained
✅ Files modified section
✅ Before/after examples
✅ Community acknowledgments
✅ Still concise and readable

Ready for Review.. @ThinkOpenly @dhower-qc @AFOliveira 
