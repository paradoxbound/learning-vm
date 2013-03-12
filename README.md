# learning logstash!

This repo is what is used to build the learning vm for logstash.

The VM runs:

* logstash with a tcp input on port 5001
* elasticsearch exposed on port 9200
* kibana on port 5601

## Just gimme the box!

If you want to just use the vm itself, you can do this:

    # Set up the box
    vagrant init learn-logstash http://vagrant-jls.objects.dreamhost.com/learn-logstash-1.box

    # Start it!
    vagrant up

After you've started, you should be able to direct your browser at <http://localhost:5601> and see Kibana.

## Contributing

Patches and ideas welcome!

If you want to build the vm or otherwise modify what puppet does to it in order to build it, you can do:

    vagrant up
