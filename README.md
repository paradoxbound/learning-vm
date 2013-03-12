# learning logstash!

This repo is what is used to build the learning vm for logstash.

## STATUS

This project is in the "make it work" phase. It may not be pretty, and it may
not be correct in some cases.

## What's inside?

The VM runs:

* logstash with a tcp input on port 5001
* elasticsearch exposed on port 9200
* kibana on port 5601

## Just gimme the box!

If you want to just use the vm itself, put this in a Vagrantfile:

    Vagrant::Config.run do |config|
      config.vm.box = "learn-logstash"
      config.vm.box_url = "https://vagrant-jls.objects.dreamhost.com/learn-logstash-1.box"
      config.vm.forward_port 5601, 5601
      config.vm.forward_port 9200, 9200
      config.vm.forward_port 5001, 5001
    end

Then start it up:

    vagrant up

## It's up! What do I do now?

After you've started, you should be able to direct your browser at
<http://localhost:5601> and see Kibana.

You can send logs to logstash by pushing them over tcp port 5001. For example:

    echo "Hello world!" | telnet localhost 5601

If you want to play with the logstash configuration, you can do the following:

* run: `vagrant ssh` to ssh in
* edit: `/app/logstash/logstash.conf`
* restart: `sudo sv restart logstash`
* check logs: `tail -f /var/log/service/logstash/current`

Your `vagrant ssh` access has sudo privileges, so you can do whatever you like.

Kibana, ElasticSearch, and logstash are homed in `/app`

## Contributing

Patches and ideas welcome!

If you want to build the vm or otherwise modify what puppet does to it in order
to build it, you can clone this repository and run:

    vagrant up

Vagrant will download the ubuntu 12.10 base box and have puppet drive the
configuration.
