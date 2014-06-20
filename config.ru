use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public"

run Proc.new { |env|

  if env['REQUEST_PATH'] == '/'
    #[200, {'Content-Type' => 'text/html'}, File.read(index_file)]
    Rack::File.new('public/index.html').call(env)
  else
    Rack::Directory.new("public").call(env)
  end
}
