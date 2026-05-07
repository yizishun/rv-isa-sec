Done:

Combine and rename CHERI load page faults into a single lowest priority fault (fix #923)
Remove Svucrglct - _require_ exception when tag is set, _allow_ exception when tag not set, no change in exception priority for the different cases (fix #915)
Update all exception tables to show updated priority (includes fix https://github.com/riscv/riscv-cheri/issues/924)
Add rule about allowing SC.Y to set PTE.CD even if the store fails
Add notes about (future)  AMOCAS.Y (if rs2.tag=1), AMOADD.Y (always) to set CD even if the store fails
Add rule/notes about ensuring CD may be set _too often_, and load capability faults may fire _too often_

