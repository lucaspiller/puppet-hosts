The plan:

    host::entry {"001_localhorst":
        ip => "127.0.1.1",
        hostname => "localhorst",
        aliases => ["horst", "detlef", ]
    }
