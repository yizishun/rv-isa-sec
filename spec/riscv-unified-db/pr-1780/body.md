This new backend that can be generated with "bundle exec rake gen:inst_table" is designed to organize all of the requested instructions into a table modeled after the syscall table in Linux. The usecase for this is to commit the generated table into Linux which will use the table to generate the necessary instruction headers.

To be able to commit to Linux, I am marking the generated file as GPL-2.0-only and Reuse requires adding the License file to this repo for that.
