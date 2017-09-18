MRuby::Gem::Specification.new('mruby-atompub-post') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'mruby-atompub-post'
  spec.bins    = ['mruby-atompub-post']

  spec.add_dependency 'mruby-eval', :core => 'mruby-eval'
  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
  spec.add_dependency 'mruby-optparse', :mgem => 'mruby-optparse'
  spec.add_dependency 'mruby-tinyxml2', :mgem => 'mruby-tinyxml2'
  spec.add_dependency 'mruby-env', :mgem => 'mruby-env'
  spec.add_dependency 'mruby-dir-glob', :mgem => 'mruby-dir-glob'
  spec.add_dependency 'mruby-yaml', :mgem => 'mruby-yaml'
end
