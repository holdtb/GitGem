class CmdProcess

    attr_accessor :cmd,
      :start_time,
      :end_time,
      :stderr,
      :stdout,
      :exit_status

    def initialize(cmd)
      @cmd = cmd
      @args = []
    end

    def add_arg(name, value = nil)
      @args.push ProcessArg.new name, value
    end

    def has_arg?(name)
      return true if @args.detect {|a| a.name == name}
      false
    end

    def args_matching(name)
      @args.select {|arg| arg.name == name}
        .map{|arg| arg.value}
    end

    def arg(name)
      args = arg(name)
      return args.first if args.size > 0
      nil
    end

    def to_s
      result = cmd
      @args.each do |arg|
        result += " " + arg.name
        result += " " + arg.value if arg.value
      end

      result
    end

    def elapsed_time
      (self.end_time - self.start_time) * 1000.0
    end

    def run
      @start_time = Time.new

      stdin, @stdout, @stderr, wait_thr = Open3.popen3 self.to_s
      _ = wait_thr[:pid]
      @exit_status = wait_thr.value
      @end_time = Time.new

      exit_status
    end

  end

  class ProcessArg
   attr_reader :name, :value

   def initialize(name, value)
     @name = name
     @value = value
   end

  end

