Pry.config.pager  = false
Pry.config.editor = 'slime'
Pry.config.prompt = [proc{'? '}, proc{'| '}]

Pry.config.commands.import(Pry::CommandSet.new do
  $wl__reload_file = nil

  command 'reload', 'Reload specified source file or previously reloaded file by default.' do |file|
    unless file
      if $wl__reload_file
        load($wl__reload_file)
        next
      end
      
      files = Dir['*.rb']
      case files.size
      when 0
        output.puts "No Ruby files in #{Dir.pwd}"
        next
      when 1
        file = files.first
      else
        output.puts "Many Ruby files in #{Dir.pwd}:"
        output.puts files.map{|f| "\t#{f}"}
        next
      end
    end
    
    file = file.sub(/(\.rb)?$/, '.rb')
    $wl__reload_file = file
    load(file)
  end

  alias_command 'r', 'reload'
end)

def quick(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end

def beep
  putc ?\a
  nil
end