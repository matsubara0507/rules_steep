workspace(name = "rules_steep")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazelruby_rules_ruby",
    strip_prefix = "rules_ruby-d61b643a1dc7c2de538a8ca761bd24a42228789e",
    url = "https://github.com/matsubara0507/rules_ruby/archive/d61b643a1dc7c2de538a8ca761bd24a42228789e.tar.gz",
    sha256 = "e8014705f1718b80cd0ba59b92e3554255adc98c50d92bbbd0e911ae3c974158",    
)

load("@bazelruby_rules_ruby//ruby:deps.bzl", "rules_ruby_dependencies", "rules_ruby_select_sdk")

rules_ruby_dependencies()
rules_ruby_select_sdk(version = "3.1.1")

load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_bundle")

ruby_bundle(
    name = "bundle_example",
    gemfile = "//example:Gemfile",
    gemfile_lock = "//example:Gemfile.lock",
)
