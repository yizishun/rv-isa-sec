This PR unifies major and external interrupts by forwarding all major interrupts to ACLIC when the ACLIC mode is selected. The additional technical details and discussion can be found in the #605 issue.

Fixes: #605
