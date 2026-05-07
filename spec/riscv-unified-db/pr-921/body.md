**Add AMO Instruction Layout System for Zaamo Extension** 

fixes #223 

Supports #361 and #508 

This PR implements a clean layout-based system for generating Atomic Memory Operation (AMO) instructions for the Zaamo extension, combining approaches suggested by @ddrcode and @ThinkOpenly.

✨ What's New
Layout Templates: Created 9 ERB templates (one per AMO operation) that automatically generate both word and doubleword variants
Organized Structure: Added layouts/ folder for templates and instructions/ folder for generated files
Automated Generation: Updated Rakefile to generate all 18 AMO instruction files from the layout templates
Better Descriptions: Each instruction now has proper long names and bullet-point descriptions
Schema Fixes: Fixed Zaamo.yaml extension definition with correct schema path

🎯 Result
Instead of manually maintaining 18 separate instruction files, we now have:

9 maintainable layout templates
Automatic generation of all AMO variants (.w and .d)
Consistent formatting and descriptions across all instructions
Easy to add new AMO operations in the future

🧹 Cleanup

Also updated .gitignore to exclude the 270+ generated CSR test files that were cluttering the repo.

Ready for review! 🎉 @AFOliveira @ThinkOpenly @dhower-qc 
