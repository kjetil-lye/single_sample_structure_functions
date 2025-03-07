CDF           
              t                 x                 y                 z                    o       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.4          &alsvinn_report.currentWorkingDirectory            k/cluster/scratch/klye/single_sample_structure_functions_fulltime/experiments_full_time_average/kh/p0_06/N64        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-072          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190926T085722        alsvinn_report.CPU            (Intel(R) Xeon(R) Gold 6240 CPU @ 2.60GHz       alsvinn_report.revision           (617004f7d7728b42656c53eec72f8439c0aaa5b0       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce RTX 2080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11523260416        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           7          #alsvinn_report.cudaProperties.minor           5          'alsvinn_report.cudaProperties.clockRate           1545000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             68         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            27         )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           16         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_fulltime_dash_experiments_full_time_average_dash_kh_dash_p0_06_dash_N64_dash_kelvinhelmholtz_DOT_py           $def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    N = len(a)/4
    a1 = a[:10]
    a2 = a[10:20]
    b1 = a[20:40]
    b2 = a[30:40]
    perturbation = 0.1
    normalization1 = sum(a1)
    if abs(normalization1) < 1e-10:
        normalization1 = 1
    normalization2 = sum(a2)
    if abs(normalization2) < 1e-10:
        normalization2 = 1

    x = linspace(ax, bx, nx)
    y = linspace(ay, by, ny)

    X, Y = meshgrid(x, y)
    X = X.T
    Y = Y.T
    perturbation_upper = 0.75 + perturbation*sum([a1[i]*cos(2*pi*(i+1)*(X+b1[i])) for i in range(len(a1))], 0)/normalization1
    perturbation_lower = 0.25 + perturbation*sum([a2[i]*cos(2*pi*(i+1)*(X+b2[i])) for i in range(len(a2))], 0)/normalization2
    middle = (Y < perturbation_upper)*(Y > perturbation_lower)

    rho[:, :, 0] = 2.0 * middle + 1.0*(1-middle)
    ux[:, :, 0] = -0.5*middle + 0.5*(1-middle)
    uy[:,:,0] = zeros_like(X)
    p[:,:,0] = 2.5*ones_like(X)


#

#
#
# perturbation = 0.01
# normalization1 = sum(a1)
# if abs(normalization1) < 1e-10:
#     normalization1 = 1
# normalization2 = sum(a2)
# if abs(normalization2) < 1e-10:
#     normalization2 = 1
#
# perturbation_upper = perturbation*sum([a1[i]*cos(2*pi*(i+1)*(x+b1[i])) for i in range(len(a1))])/normalization1
# perturbation_lower = perturbation*sum([a2[i]*cos(2*pi*(i+1)*(x+b2[i])) for i in range(len(a2))])/normalization2
#
# if y < 0.25 + perturbation_lower or y > 0.75 + perturbation_upper:
#     rho = 1
#     ux = 0.5
#     uy = 0
#     p = 2.5
# else:
#     rho = 2
#     ux = -0.5
#     uy = 0
#     p = 2.5
       �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_fulltime_dash_experiments_full_time_average_dash_kh_dash_p0_06_dash_N64_dash_kelvinhelmholtz_DOT_xml          v<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    kh
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>64 64 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>2</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>weno2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>2</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>1.0</time>
        <numberOfH>2</numberOfH>
        <timeRadius>1.0</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>2</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>1.0</time>
        <numberOfH>2</numberOfH>
        <timeRadius>1.0</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>2</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>1.0</time>
        <numberOfH>2</numberOfH>
        <timeRadius>1.0</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <time>1.5</time>
        <timeRadius>0.5</timeRadius>
        <name>identity</name>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_time_integrated_identity</basename>
        </writer>
      </functional>
      <functional>
        <time>1.5</time>
        <timeRadius>0.5</timeRadius>
        <name>moment</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_time_integrated_moment_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>identity</name>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_identity</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>moment</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_moment_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>1</degree>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_bv_1</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_bv_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>3</degree>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_bv_3</basename>
        </writer>
      </functional>
    </functionals>
    <initialData>
      <python>kelvinhelmholtz.py</python>
      <parameters>
        <parameter>
          <name>a</name>
          <length>40</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
  </fvm>
  <uq>
    <samples>1024</samples>
    <sampleStart>0</sampleStart>
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
        <numberOfH>2</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>kh</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>2</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>kh</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>2</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>kh</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
         alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false          uqAttributes.fvm.name             

    kh
           uqAttributes.fvm.platform             cuda       !uqAttributes.fvm.grid.lowerCorner             0 0 0          !uqAttributes.fvm.grid.upperCorner             1 1 0          uqAttributes.fvm.grid.dimension           64 64 1        uqAttributes.fvm.boundary             periodic       uqAttributes.fvm.flux             hll3       uqAttributes.fvm.endTime          2          uqAttributes.fvm.equation             euler2         )uqAttributes.fvm.equationParameters.gamma             1.4        uqAttributes.fvm.reconstruction           weno2          uqAttributes.fvm.cfl          auto       uqAttributes.fvm.integrator           auto       ,uqAttributes.fvm.functionals.functional.name          bv         )uqAttributes.fvm.functionals.functional.p             3          1uqAttributes.fvm.functionals.functional.numberOfH             2          5uqAttributes.fvm.functionals.functional.numberOfSaves             1          3uqAttributes.fvm.functionals.functional.writer.type           netcdf         7uqAttributes.fvm.functionals.functional.writer.basename           kh_functional_bv_3         ,uqAttributes.fvm.functionals.functional.time          1.5        2uqAttributes.fvm.functionals.functional.timeRadius            0.5        9uqAttributes.fvm.functionals.functional.numberOfSnapshots             200        .uqAttributes.fvm.functionals.functional.degree            3          #uqAttributes.fvm.initialData.python           kelvinhelmholtz.py         6uqAttributes.fvm.initialData.parameters.parameter.name            a          8uqAttributes.fvm.initialData.parameters.parameter.length          40         >uqAttributes.fvm.initialData.parameters.parameter.values.value            0          uqAttributes.fvm.diffusion.name           none       )uqAttributes.fvm.diffusion.reconstruction             none       uqAttributes.uq.samples           1024       uqAttributes.uq.sampleStart           0          uqAttributes.uq.generator             auto       )uqAttributes.uq.parameters.parameter.name             a          +uqAttributes.uq.parameters.parameter.length           40         )uqAttributes.uq.parameters.parameter.type             uniform        uqAttributes.uq.stats.stat.name           
	structure_cube
              (uqAttributes.uq.stats.stat.numberOfSaves          1          $uqAttributes.uq.stats.stat.numberOfH          2          uqAttributes.uq.stats.stat.p          3          /uqAttributes.uq.stats.stat.writeInitialTimestep           true       &uqAttributes.uq.stats.stat.writer.type            netcdf         *uqAttributes.uq.stats.stat.writer.basename            kh                   time                                           B        rho                                                         B       mx                                                          B       my                                                          B(       E                                                           B8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ?��vT2        ?��0��
=                        ?H�vT2