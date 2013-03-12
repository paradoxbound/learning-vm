class learn::logstash {
  include elasticsearch

  user::app { "logstash": ; }

  runit::process {
    "logstash":
      ensure => present,
      user => "logstash",
      require => User::App["logstash"],
      command => "sh logstash.sh agent -v -f logstash.conf",
      directory => "/app/logstash";
  }

  file {
    "/app/logstash/logstash.sh":
      ensure => file,
      notify => Runit::Process["logstash"],
      mode => 0755,
      owner => "logstash",
      group => "logstash",
      source => "puppet:///modules/learn/logstash.sh";
    "/app/logstash/logstash.conf":
      ensure => file,
      notify => Runit::Process["logstash"],
      owner => "logstash",
      group => "logstash",
      source => "file:///vagrant/logstash.conf";
  }
}
