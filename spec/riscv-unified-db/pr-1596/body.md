Trying to run "tagged" regression tests fails:
```
$ ./bin/regress --tag smoke
/usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/signature.rb:75:in 'T::Private::Methods::Signature#initialize': The declaration for `cmd_run_tagged_tests` is missing parameter(s): tag_name (RuntimeError)
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/_methods.rb:359:in 'Class#new'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/_methods.rb:359:in 'T::Private::Methods.build_sig'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/_methods.rb:328:in 'T::Private::Methods.run_sig'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/_methods.rb:230:in 'block in T::Private::Methods._on_method_added'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/_methods.rb:461:in 'T::Private::Methods.run_sig_block_for_key'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/_methods.rb:422:in 'T::Private::Methods.maybe_run_sig_block_for_key'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/_methods.rb:240:in 'block in Cli#_on_method_added'
        from .../riscv-unified-db/tools/test/regress-cli.rb:215:in 'Cli#run'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/call_validation.rb:282:in 'UnboundMethod#bind_call'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/call_validation.rb:282:in 'T::Private::Methods::CallValidation.validate_call'
        from /usr/lib/ruby/gems/3.4.0/gems/sorbet-runtime-0.6.12690/lib/types/private/methods/_methods.rb:259:in 'block in Cli#_on_method_added'
        from .../riscv-unified-db/tools/test/regress-cli.rb:232:in '<main>'
```

The signature for `cmd_run_tagged_tests` was defined to accepts no parameters, rather than the tag string.

Add the fixed signature.

Also, even when that is fixed, the tagged tests are not found:
```
Did not find any tests tagged with 'smoke'
```

Correct the string used to find the tags.
