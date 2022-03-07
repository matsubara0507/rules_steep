load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_test")

# `dir` is path from WORKSPACE root.
def steep_check(name, bin, srcs, deps, dir = ".", rubyopt = []):
  ruby_test(
    name = name,
    srcs = srcs,
    deps = deps,
    main = bin,
    args = [
      "check",
      "--steepfile={}/Steepfile".format(dir),
      "--steep-command={}/{}".format(dir, name),
    ],
    rubyopt = rubyopt,
  )
