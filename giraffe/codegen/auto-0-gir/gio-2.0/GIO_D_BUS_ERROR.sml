signature GIO_D_BUS_ERROR =
  sig
    datatype enum =
      FAILED
    | NO_MEMORY
    | SERVICE_UNKNOWN
    | NAME_HAS_NO_OWNER
    | NO_REPLY
    | IO_ERROR
    | BAD_ADDRESS
    | NOT_SUPPORTED
    | LIMITS_EXCEEDED
    | ACCESS_DENIED
    | AUTH_FAILED
    | NO_SERVER
    | TIMEOUT
    | NO_NETWORK
    | ADDRESS_IN_USE
    | DISCONNECTED
    | INVALID_ARGS
    | FILE_NOT_FOUND
    | FILE_EXISTS
    | UNKNOWN_METHOD
    | TIMED_OUT
    | MATCH_RULE_NOT_FOUND
    | MATCH_RULE_INVALID
    | SPAWN_EXEC_FAILED
    | SPAWN_FORK_FAILED
    | SPAWN_CHILD_EXITED
    | SPAWN_CHILD_SIGNALED
    | SPAWN_FAILED
    | SPAWN_SETUP_FAILED
    | SPAWN_CONFIG_INVALID
    | SPAWN_SERVICE_INVALID
    | SPAWN_SERVICE_NOT_FOUND
    | SPAWN_PERMISSIONS_INVALID
    | SPAWN_FILE_INVALID
    | SPAWN_NO_MEMORY
    | UNIX_PROCESS_ID_UNKNOWN
    | INVALID_SIGNATURE
    | INVALID_FILE_CONTENT
    | SELINUX_SECURITY_CONTEXT_UNKNOWN
    | ADT_AUDIT_DATA_UNKNOWN
    | OBJECT_PATH_IN_USE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
