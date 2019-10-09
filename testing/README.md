This directory holds automated test scripts for git-publish.

## Running the test cases

Just run:

```
$ ./testing/run_tests.sh
```

Optionally, the path to the `git-publish` binary can be provided
as argument:

```
$ ./testing/run_tests.sh /path/to/git-publish
```

## Adding new test cases

To add a new test case, just create a new executable file in this
directory whose name starts with a digit.

### Useful environment variables

* `$GIT_PUBLISH`: path to `git-publish` script being tested
* `$TEST_DIR`: path to temporary test log directory.  Test cases
  are allowed (and encouraged) to create debug and log files
  inside this directory.
* `$FAKE_GIT_COMMAND_LOG`: command log generated by `fake_git`

### Fake git command

When running test cases, a fake `git` binary will be in `$PATH`,
which will only accept a subset of non-destructive git commands.
If your test case requires additional git commands to work, see
the `PASSTHROUGH_COMMANDS` and `SPECIAL_COMMANDS` variables in
the `fake_git` script.

### Writing new test cases using Bash

Test cases using bash can include `functions.sh` for useful
utility functions.

`$PATH` will contain the `git-publish` script being tested, so
you can just run `git-publish` directly.  e.g.:

Example:

```bash
source "$TESTS_DIR/functions.sh"
git-publish --some-arguments
grep -q 'do-something' "$FAKE_GIT_COMMAND_LOG" || \
   abort "git-publish didn't run `git do-something`"
```

### Writing new test cases using Python

Python test cases can import utility functions from the
`test_utils` module.  Example:

```python
from test_utils import *
git_publish('--some-arguments')
assert last_git_command() == ['do-something', 'xxx', 'yyy'], \
    "git-publish didn't run `git do-something` as expected"
```