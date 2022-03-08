# rules_steep

This repository is bazel rules to type-check Ruby using [Steep](https://github.com/soutaro/steep).

## Usage

WORKSPACE file

```py
# Setup Ruby
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazelruby_rules_ruby",
    # for https://github.com/bazelruby/rules_ruby/pull/124
    url = "https://github.com/bazelruby/rules_ruby/archive/d61b643a1dc7c2de538a8ca761bd24a42228789e.tar.gz",
    strip_prefix = "rules_ruby-d61b643a1dc7c2de538a8ca761bd24a42228789e",
)

load("@bazelruby_rules_ruby//ruby:deps.bzl", "rules_ruby_dependencies", "rules_ruby_select_sdk")

rules_ruby_dependencies()
rules_ruby_select_sdk(version = "3.1.1")

load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_bundle")

ruby_bundle(
    name = "bundle_hoge",
    gemfile = "//hoge:Gemfile",
    gemfile_lock = "//hoge:Gemfile.lock",
)

# Setup Steep
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "rules_steep",
    remote = "https://github.com/matsubara0507/rules_ruby.git",
    branch = "main"
)
```

BUILD file

```py
load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_library")
load("//steep:def.bzl", "steep_check")

ruby_library(
    name = "lib",
    srcs = glob(["lib/**/*.rb"]),
    deps = [],
)

steep_check(
    name = "typecheck",
    bin = "@bundle_hoge//:bin/steep",
    dir = "./example",
    srcs = ["Steepfile", ":lib"] + glob(["sig/**/*.rbs"]),
    deps = [":lib", "@bundle_hoge//:bin"],
)
```

### Steep

If use Steep `>= v0.42`, need use [my fork](https://github.com/matsubara0507/steep/tree/use-absolute_path-in-print_result):

```rb
gem "steep", github: "matsubara0507/steep", ref: "1f0a384202d52cbe7187b4a2d4eed620d3997178"
```
