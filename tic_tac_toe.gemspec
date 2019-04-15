lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
    s.name        = 'TicTacToe'
    s.version     = '0.0.0'
    s.date        = '2019-04-12'
    s.executables = ['tic_tac_toe']
    s.summary     = %q{this is a command line TicTacToe Game}
    s.description = %q{A simple TicTacToe gem}
    s.authors     = ["Mael Fosso", "Terver Aosu"]
    s.email       = ['terveraosu@gmail.com']
    s.files       = ["lib/tic_tac_toe.rb"]
    s.require_paths = ["lib"]
    s.homepage    = ''
    s.license     = 'MIT'
  end