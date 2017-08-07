MRuby::Gem::Specification.new('mruby-atompub-post') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'mruby-atompub-post'
  spec.bins    = ['mruby-atompub-post']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
end
