# Frozen-string-literal: true
# Copyright: 2012 - 2017 - MIT License
# Encoding: utf-8

try_require_if_javascript "autoprefixer-rails" do
  Jekyll::Assets::Hook.register :env, :init do
    config = jekyll.safe ? Config.defaults[:autoprefixer] :
      asset_config[:autoprefixer]

    # --
    # We don't allow configuring AutoPrefixer from within
    # a safe environment, AKA places like Github Pages and
    # in other places.
    # --

    AutoprefixerRails.install(self, config)
  end
end
