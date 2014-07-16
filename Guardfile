guard :bundler do
  watch('Gemfile')
end

guard :rspec, all_after_pass: true do
  watch(%r{^lib/(.+)\.rb$})   { "spec" }
  watch(%r{^spec/(.+)\.rb$})  { "spec" }
  watch(%r{^*.rb$})     { "spec" }
end
