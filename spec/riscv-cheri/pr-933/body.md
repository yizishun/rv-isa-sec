* Introduce a 4-bit RVY PTE field.
* If no revocation extension is implemented, we continue to
  have a single bit (now called Y) which enables cap loads+stores.
* If Svyrg (new name) is implemented, then implement a 4-bit
  scheme based on Morello.
* Add kernel revocation in the same way as Morello with sstatus.SYRG (new name)

It inherits the following from #929:

* Combine and rename CHERI load page faults into a single lowest priority
  fault (fixes https://github.com/riscv/riscv-cheri/issues/923)
* Remove Svucrglct - require exception when tag is set, allow exception
  when tag not set, no change in exception priority for the different
  cases (fixes https://github.com/riscv/riscv-cheri/issues/915)
* Update all exception tables to show updated priority (includes fix
  for https://github.com/riscv/riscv-cheri/issues/924)
* Add rule about allowing SC.Y to set PTE.YD even if the store fails
* Add notes about (future) AMOCAS.Y (if rs2.tag=1), AMOADD.Y (always) to
  set YD even if the store fails
* Add rule/notes about ensuring YD may be set too often, and load
  capability faults may fire too often


Fixes: https://github.com/riscv/riscv-cheri/issues/915
Fixes: https://github.com/riscv/riscv-cheri/issues/923
Fixes: https://github.com/riscv/riscv-cheri/issues/922 
Fixes: https://github.com/riscv/riscv-cheri/issues/924
Fixes: https://github.com/riscv/riscv-cheri/issues/906 

---------

Signed-off-by: Tariq Kurd <tariq.kurd@codasip.com>
Co-authored-by: Nathaniel Wesley Filardo <VP331RHQ115POU58JFRLKB7OPA0L18E3@cmx.ietfng.org>
Co-authored-by: Jessica Clarke <jrtc27@jrtc27.com>
Co-authored-by: Alexander Richardson <mail@alexrichardson.me>
