CDF           
              t                 x                  y                 z                    p       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.4          &alsvinn_report.currentWorkingDirectory            u/cluster/scratch/klye/single_sample_structure_functions_fulltime/experiments_full_time_average/cloudshock/p0_06/N1024          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-006          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20191018T182024        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (617004f7d7728b42656c53eec72f8439c0aaa5b0       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_fulltime_dash_experiments_full_time_average_dash_cloudshock_dash_p0_06_dash_N1024_dash_cloudshock_DOT_py          cimport numpy as np
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):

    N = len(a)//4
    a1 = a[:N]
    a2 = a[N:2*N]
    b1 = a[2*N:3*N]
    b2 = a[3*N:4*N]


    perturbation = epsilon

    normalization1 = sum(a1)

    if abs(normalization1) < 1e-10:
        normalization1 = 1
    normalization2 = sum(a2)
    if abs(normalization2) < 1e-10:
        normalization2 = 1

    x = np.linspace(0, 1, nx)
    y = np.linspace(0, 1, ny)

    X, Y =np.meshgrid(x, y)


    r = np.sqrt((X-0.25)**2 + (Y-0.5)**2)
    phi = np.arctan2(X-0.25, Y - 0.5)
    perturbation_x = perturbation*np.sum([a1[i]*np.cos(2*np.pi*(i+1)*(Y+b1[i])) for i in range(len(a1))], axis=0)/normalization1
    perturbation_r = perturbation*np.sum([a2[i]*np.cos(2*np.pi*(i+1)*(phi+b2[i])) for i in range(len(a2))], axis=0)/normalization2

    #
    r_max = 0.13
    left_x = (x < 0.05 + perturbation_x)
    cloud = r < r_max + perturbation_r

    rho[:,:,0] = left_x*3.86859 + (1-left_x)*(cloud*10.0 + (1-cloud)*1.0)
    ux[:,:,0] = 11.2536*left_x
    uy[:,:,:] = np.zeros_like(ux)
    
    p[:,:,0] = 167.345*left_x + (1-left_x)*1.0
        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_fulltime_dash_experiments_full_time_average_dash_cloudshock_dash_p0_06_dash_N1024_dash_cloudshock_DOT_xml         �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    cloudshock
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>1024 1024 1</dimension>
    </grid>
    <boundary>neumann</boundary>
    <flux>hll3</flux>
    <endTime>0.06</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>rungekutta3</integrator>
    <initialData>
      <python>cloudshock.py</python>
      <parameters>
        <parameter>
          <name>a</name>
          <length>40</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
        <parameter>
          <name>epsilon</name>
          <length>1</length>
          <value>0.06</value>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>0.03</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.03</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>0.03</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.03</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>0.03</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.03</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <time>0.045</time>
        <timeRadius>0.015</timeRadius>
        <name>identity</name>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_time_integrated_identity</basename>
        </writer>
      </functional>
      <functional>
        <time>0.045</time>
        <timeRadius>0.015</timeRadius>
        <name>moment</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_time_integrated_moment_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>identity</name>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_identity</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>moment</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_moment_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>1</degree>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_bv_1</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_bv_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>3</degree>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_bv_3</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <sampleStart>0</sampleStart>
    <samples>1024</samples>
    <generator>auto</generator>
    <parameters>
      <parameter>
        <name>a</name>
        <length>40</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>32</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>32</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>32</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false          uqAttributes.fvm.name             
    cloudshock
           uqAttributes.fvm.platform             cuda       !uqAttributes.fvm.grid.lowerCorner             0 0 0          !uqAttributes.fvm.grid.upperCorner             1 1 0          uqAttributes.fvm.grid.dimension           1024 1024 1        uqAttributes.fvm.boundary             neumann        uqAttributes.fvm.flux             hll3       uqAttributes.fvm.endTime          0.06       uqAttributes.fvm.equation             euler2         )uqAttributes.fvm.equationParameters.gamma             1.4        uqAttributes.fvm.reconstruction           wenof2         uqAttributes.fvm.cfl          auto       uqAttributes.fvm.integrator           rungekutta3        #uqAttributes.fvm.initialData.python           cloudshock.py          6uqAttributes.fvm.initialData.parameters.parameter.name            epsilon        8uqAttributes.fvm.initialData.parameters.parameter.length          1          >uqAttributes.fvm.initialData.parameters.parameter.values.value            0          7uqAttributes.fvm.initialData.parameters.parameter.value           0.06       uqAttributes.fvm.diffusion.name           none       )uqAttributes.fvm.diffusion.reconstruction             none       ,uqAttributes.fvm.functionals.functional.name          bv         )uqAttributes.fvm.functionals.functional.p             3          1uqAttributes.fvm.functionals.functional.numberOfH             32         5uqAttributes.fvm.functionals.functional.numberOfSaves             1          3uqAttributes.fvm.functionals.functional.writer.type           netcdf         7uqAttributes.fvm.functionals.functional.writer.basename           cloudshock_functional_bv_3         ,uqAttributes.fvm.functionals.functional.time          0.045          2uqAttributes.fvm.functionals.functional.timeRadius            0.015          9uqAttributes.fvm.functionals.functional.numberOfSnapshots             200        .uqAttributes.fvm.functionals.functional.degree            3          uqAttributes.uq.sampleStart           0          uqAttributes.uq.samples           1024       uqAttributes.uq.generator             auto       )uqAttributes.uq.parameters.parameter.name             a          +uqAttributes.uq.parameters.parameter.length           40         )uqAttributes.uq.parameters.parameter.type             uniform        uqAttributes.uq.stats.stat.name           
	structure_cube
              (uqAttributes.uq.stats.stat.numberOfSaves          1          $uqAttributes.uq.stats.stat.numberOfH          32         uqAttributes.uq.stats.stat.p          3          /uqAttributes.uq.stats.stat.writeInitialTimestep           true       &uqAttributes.uq.stats.stat.writer.type            netcdf         *uqAttributes.uq.stats.stat.writer.basename            
cloudshock                   time                                           B        rho                                                         B       mx                                                          C       my                                                          D       E                                                           E                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ?��Q��        @iF���u$@���-;��@��-L��@��U����@� �W�@���U^�<@�����"@۪z���q@ᚁ�q|�@�L�|@�6S�WX@���yC�,@�
 ap@������\@��E��6&@�m˧S�R@�t���A J8�;k�A�c`A�o����AAIQ�A��Kl�A����&�A
��@�AnO*_MAP@�^�AQLV�
A��Aʚd�A�� SAq#�        @��1D�@��fM�.@�-f����@��ќ�_�@�f�#С�A �����LAXbm��A:�+�JA
3�;�AN\JA�Z��+\A Jqy��A"�`���A%W��V�A'�Έ�N�A*��f�v6A-zlxy_:A0'+�Ԧ+A1�	���A3nTA4����U}A6��׾A7��¿XA9	���q�A:�%����A<1�ت�A=�|��A?5�,��A@b��5SAA+�[���AA��uR!n        @����J@�1�QM�@�@��$�A���|7�AW4�5UA���Ln3A#��A���A)����A0� �9WfA4��ӭ�A8��8��A=LSҪ��AAW	��AC�*�J��AF.��z��AH�PsMAK����dAN�m��/�AP�$�L�yAR?�t4AS�'���AUT ��CjAV�v�z�AX���G;�AZ �o@<�A[����*�A]m�k���A_��#WA`g Uz`AaB[mfAb֪���        A$v�8���AHF�~�#A_T����ZAnJBV�Ax�F���A�����biA���]���A�)�aA����}4A��+NBNA�1�ccv5A�4�Qz�A�k�Mi��A��ZyK��A�h�rB�A��ixnA����ofA������)A��
t!�A��lR���A�8ǒ��A�i� �A�����^A��j9A�\�:�4AäJ�IDA��ʂ́fA�H���AǦ;��x�A�
�{XOmA�v�U�