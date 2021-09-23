Current challenges:


Matthew,
    The first big consideration/obstacle is how to handle the data transfer.
    The system on which /groups exists is not accessible on TC and that functionality is replaced by a separate storage system there.
    It's likely to take a great deal of time (weeks to months) to make a copy of the /groups/deq directory as it is
    based mostly on the sheer number of files residing there.

    I may be speaking somewhat out of turn, but the migration to TC might be the right time to work through what's existing in
    that data store and work on establishing a tiered data storage paradigm. Something like:
     - if any data is duplicate or otherwise completely un-needed, then remove it;
     - if data is not likely to be accessed in the coming 1-2 years, then archive it (tar + compress, and maybe move to an archival location)
     - institute an organizational structure that makes it easy to maintain the paradigm

    Besides, we need to:
     - set up Slurm accounts there (ARC will do most/all of the technical parts of this, but it also ties into the contractual arrangement)
     - get needed software installed and start testing

Jin:
     Data files should be manageable.  Not all DEQ models need a large amount of data inputs to run.
     We could begin with models which are less data intensive and one-by-one, gradually run those models on TC.

     For data intensive models (such CMAQ and CAMx), we will still run them on Cascades for a foreseeable future and
     then gradually run new cases on TC.  After a while, most needed data files (and models) will be on TC.
     That way, data transfer or copying can be kept to minimum.

James:
    If we can identify a subset of "live" data that DEQ uses most frequently, I agree that it makes sense to start by moving this to TinkerCliffs
    so that we don't need to wait on the full transfer. I can see how a tiered solution would be useful, since I do think there is a fair
    amount of older data that is not accessed frequently.  Poking around a bit I can see that there are some files that have not been accessed for 2-3 years,
    which is usually a good indication that they will not be needed again soon. We should discuss this more in the next few weeks to formulate a more concrete migration plan.

    We should be able to move forward with the software tasks first, so that we are ready to run tests. I think that now is a good time to start this process.
    For most applications, Tinker Cliffs is quite a bit faster than Cascades, so I think you may be pleased with the performance.

CMAQ, Matt:
    My understanding is that mpich does not have capability to use the Infiniband network interconnect. Mvapich is specifically designed
    to recognize and use IB, but installations need to be linked with the IB drivers and also with the Slurm libraries and utilities,
    so it may really do better as a system installation. Openmpi has a very large code-base and can do lots of things in lots of different
    ways but that complexity causes some problems and lots of ambiguity. Intel's impi comes with their compiler and could be a good choice. MPI implementations have come a LONG way in the last 10 years. Notably, on the Cray cluster systems with IB interconnects, I've learned that the packaged MPI is Mvapich.

    My instinct would be to use PGI+Mvapich (keep with long trend of using PGI compiler) or Intel+impi.

    I agree that the whole application stack should be built with the same compiler and mpi.

MOVES:
successfully built CMAQ with PGI/18.4 and Mvapich2/2.3.1;

1. fast-scratch, 20T for groups;

2. home storage;

- project space, 25G, then later migrate; keep the same folder hierarchy;
- Building procedure on Tinkercliff, modules, easybuild, store stuffs;
- easybuild stuff;
