Jekyll::Hooks.register :site, :after_reset do |site, payload|
  site.cleanup()
end