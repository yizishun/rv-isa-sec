First proposal for the newly proposed Fast-Track to add support for virtualization (H-extension).
The Shwdeleg/Svswid extensions add another delegation level to match the additional level of privilege hierarchy that the H extension introduces. Two HS-mode registers (that are not visible to VS) are added, called hlwid and hwiddeleg. Another HS-mode register called vslwid is added, which is also accessed via the slwid CSR addres in VS-mode.

