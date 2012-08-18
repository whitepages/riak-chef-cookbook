# vm.args
default['riak']['args']['-name'] = "riak@127.0.0.1"
default['riak']['args']['-setcookie'] = "riak"
default['riak']['args']['+K'] = true
default['riak']['args']['+A'] = 64
default['riak']['args']['+W'] = "w"
default['riak']['args']['-env']['ERL_MAX_PORTS'] = 4096
default['riak']['args']['-env']['ERL_FULLSWEEP_AFTER'] = 0
default['riak']['args']['-env']['ERL_CRASH_DUMP'] = "/var/log/riak/erl_crash.dump" 

# app.config
class ::String
  include Eth::Erlang::String
end

class ::Array
  include Eth::Erlang::Array
end

# riak_core
default['riak']['config']['riak_core']['ring_state_dir'] = "/var/lib/riak/ring".to_erl_string
default['riak']['config']['riak_core']['http']["127.0.0.1".to_erl_string] = 8098
default['riak']['config']['riak_core']['handoff_port'] = 8099
default['riak']['config']['riak_core']['legacy_vnode_routing'] = false
default['riak']['config']['riak_core']['platform_bin_dir'] = "/usr/sbin".to_erl_string
default['riak']['config']['riak_core']['platform_data_dir'] = "/var/lib/riak".to_erl_string
default['riak']['config']['riak_core']['platform_etc_dir'] = "/etc/riak".to_erl_string
default['riak']['config']['riak_core']['platform_lib_dir'] = "/usr/lib/riak".to_erl_string
default['riak']['config']['riak_core']['platform_log_dir'] = "/var/log/riak".to_erl_string

# riak_kv
default['riak']['config']['riak_kv']['storage_backend'] = "riak_kv_bitcask_backend"
default['riak']['config']['riak_kv']['pb_ip'] = "127.0.0.1".to_erl_string
default['riak']['config']['riak_kv']['pb_port'] = 8087
default['riak']['config']['riak_kv']['mapred_name'] = "mapred".to_erl_string
default['riak']['config']['riak_kv']['mapred_system'] = "pipe"
default['riak']['config']['riak_kv']['mapred_2i_pipe'] = true
default['riak']['config']['riak_kv']['map_js_vm_count'] = 8
default['riak']['config']['riak_kv']['reduce_js_vm_count'] = 6
default['riak']['config']['riak_kv']['hook_js_vm_count'] = 2
default['riak']['config']['riak_kv']['js_max_vm_mem'] = 8
default['riak']['config']['riak_kv']['js_thread_stack'] = 16
default['riak']['config']['riak_kv']['http_url_encoding'] = "on"
default['riak']['config']['riak_kv']['riak_kv_stat'] = true
default['riak']['config']['riak_kv']['legacy_stats'] = true
default['riak']['config']['riak_kv']['vnode_vclocks'] = true
default['riak']['config']['riak_kv']['legacy_keylisting'] = false
default['riak']['config']['riak_kv']['listkeys_backpressure'] = true

# riak_search
default['riak']['config']['riak_search']['enabled'] = false

# merge_index
default['riak']['config']['merge_index']['data_root'] = "/var/lib/riak/merge_index".to_erl_string
default['riak']['config']['merge_index']['buffer_rollover_size'] = 1048576
default['riak']['config']['merge_index']['max_compact_segments'] = 20

# bitcask
default['riak']['config']['bitcask']['data_root'] = "/var/lib/riak/bitcask".to_erl_string

# eleveldb
default['riak']['config']['eleveldb']['data_root'] = "/var/lib/riak/leveldb".to_erl_string

# lager
error_log = ["/var/log/riak/error.log".to_erl_string,"error",10485760,"$D0".to_erl_string,5].to_erl_tuple
info_log = ["/var/log/riak/console.log".to_erl_string,"info",10485760,"$D0".to_erl_string,5].to_erl_tuple
default['riak']['config']['lager']['handlers']['lager_file_backend'] = [error_log, info_log]
default['riak']['config']['lager']['crash_log'] = "/var/log/riak/crash.log".to_erl_string
default['riak']['config']['lager']['crash_log_msg_size'] = 65536
default['riak']['config']['lager']['crash_log_size'] = 10485760
default['riak']['config']['lager']['crash_log_date'] = "$D0".to_erl_string
default['riak']['config']['lager']['crash_log_count'] = 5
default['riak']['config']['lager']['error_logger_redirect'] = true

# riak_sysmon
default['riak']['config']['riak_sysmon']['process_limit'] = 30
default['riak']['config']['riak_sysmon']['port_limit'] = 2
default['riak']['config']['riak_sysmon']['gc_ms_limit'] = 100
default['riak']['config']['riak_sysmon']['heap_word_limit'] = 40111000
default['riak']['config']['riak_sysmon']['busy_port'] = true
default['riak']['config']['riak_sysmon']['busy_dist_port'] = true

# sasl
default['riak']['config']['sasl']['sasl_error_logger'] = false

# riak_control
default['riak']['config']['riak_control']['enabled'] = false
