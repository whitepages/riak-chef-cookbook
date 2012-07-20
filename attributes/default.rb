# vm.args
default["riak"]["args"] = {
  "-name" => "riak@127.0.0.1",
  "-setcookie" => "riak",
  "+K" => true,
  "+A" => 64,
  "+W" => "w",
  "-env" => {
    "ERL_MAX_PORTS" => 4096,
    "ERL_FULLSWEEP_AFTER" => 0,
    "ERL_CRASH_DUMP" => "/var/log/riak/erl_crash.dump"
  }
}

# app.config
default["riak"]["config"] = {
  "riak_core" => {
    "ring_state_dir" => "__string_/var/lib/riak/ring",
    "http" => {"__string_127.0.0.1" => 8098},
    "handoff_port" => 8099,
    "legacy_vnode_routing" => false,
    "platform_bin_dir" => "__string_/usr/sbin",
    "platform_data_dir" => "__string_/var/lib/riak",
    "platform_etc_dir" => "__string_/etc/riak",
    "platform_lib_dir" => "__string_/usr/lib/riak",
    "platform_log_dir" => "__string_/var/log/riak"
  },
  "riak_kv" => {
    "storage_backend" => "riak_kv_bitcask_backend",
    "pb_ip" => "__string_127.0.0.1",
    "pb_port" => 8087,
    "mapred_name" => "__string_mapred",
    "mapred_system" => "pipe",
    "mapred_2i_pipe" => true,
    "map_js_vm_count" => 8,
    "reduce_js_vm_count" => 6,
    "hook_js_vm_count" => 2,
    "js_max_vm_mem" => 8,
    "js_thread_stack" => 16,
    "http_url_encoding" => "on",
    "riak_kv_stat" => true,
    "legacy_stats" => true,
    "vnode_vclocks" => true,
    "legacy_keylisting" => false,
    "listkeys_backpressure" => true
  },
  "riak_search" => {
    "enabled" => false
  },
  "merge_index" => {
    "data_root" => "__string_/var/lib/riak/merge_index",
    "buffer_rollover_size" => 1048576,
    "max_compact_segments" => 20
  },
  "bitcask" => {
    "data_root" => "__string_/var/lib/riak/bitcask"
  },
  "eleveldb"=> {
    "data_root"=> "__string_/var/lib/riak/leveldb"
  },
  "lager"=> {
    "handlers"=> {
      "lager_console_backend"=> "info",
      "lager_file_backend"=> [
        [
          "__tuple",
          "__string_/var/log/riak/error.log",
          "error",
          10485760,
          "__string_$D0",
          5
        ],
        [
          "__tuple",
          "__string_/var/log/riak/console.log",
          "info",
          10485760,
          "__string_$D0",
          5
        ]
      ]
    },
    "crash_log"=> "__string_/var/log/riak/crash.log",
    "crash_log_msg_size"=> 65536,
    "crash_log_size"=> 10485760,
    "crash_log_date"=> "__string_$D0",
    "crash_log_count"=> 5,
    "error_logger_redirect"=> true
  },
  "riak_sysmon"=> {
    "process_limit"=> 30,
    "port_limit"=> 2,
    "gc_ms_limit"=> 100,
    "heap_word_limit"=> 40111000,
    "busy_port"=> true,
    "busy_dist_port"=> true
  },
  "sasl"=> {
    "sasl_error_logger"=> false
  },
  "riak_control"=> {
    "enabled"=> false,
    "auth"=> "userlist",
    "userlist"=> {
      "__string_user"=> "__string_pass"
    },
    "admin"=> true
  }
}
