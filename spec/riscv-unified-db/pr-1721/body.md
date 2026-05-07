`regress.yml` generator is quoting "if:" conditions, which github would just interpret as true, so tests are passing in CI that maybe didn't actually pass, breaking the main branch. Fix that.
