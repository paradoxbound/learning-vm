# learning logstash!

This repo is what is used to build the learning vm for logstash.

The VM runs:

* logstash with a tcp input on port 5001
* elasticsearch exposed on port 9200
* kibana on port 5601

## Just gimme the box!

If you want to just use the vm itself, put this in a Vagrantfile:

    Vagrant::Config.run do |config|
      config.vm.box = "learn-logstash"
      config.vm.box_url = "/home/jls/projects/learn-logstash/package.box"
      config.vm.forward_port 5601, 5601
      config.vm.forward_port 9200, 9200
      config.vm.forward_port 5001, 5001
    end

Then start it up:

    vagrant up

After you've started, you should be able to direct your browser at
<http://localhost:5601> and see Kibana.

You can send logs to logstash by pushing them over tcp port 5001. For example:

    echo "Hello world!" | telnet localhost 5601

## Contributing

Patches and ideas welcome!

If you want to build the vm or otherwise modify what puppet does to it in order to build it, you can do:

    vagrant up
