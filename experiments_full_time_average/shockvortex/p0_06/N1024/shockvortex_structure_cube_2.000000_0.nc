CDF           
              t                 x                  y                 z                    p       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.4          &alsvinn_report.currentWorkingDirectory            v/cluster/scratch/klye/single_sample_structure_functions_fulltime/experiments_full_time_average/shockvortex/p0_06/N1024         alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-021          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20191019T075913        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (617004f7d7728b42656c53eec72f8439c0aaa5b0       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_fulltime_dash_experiments_full_time_average_dash_shockvortex_dash_p0_06_dash_N1024_dash_shockvortex_DOT_py            K = len(a)//10

a1 = a[:K]
b1 = a[K:2*K]

GAMMA=1.66666666666667

r_c = 0.05
alpha = 0.204
x_c = 0.25
y_c = 0.5
M = 1.1

perturbation = epsilon
normalization1 = sum(a1)
if abs(normalization1) < 1e-10:
    normalization1 = 1
#
perturbation_x = perturbation*sum([a1[i]*cos(2*pi*(i+1)*(y+b1[i])) for i in range(len(a1))])/normalization1


# shock part
if  x < 0.5 + perturbation_x: 
    rho = 1.0;
    ux = sqrt(GAMMA);
    uy = 0.0;
    p = 1.0;
else:
    rho = 1.0 / 1.1;
    ux = 1.1 * sqrt(GAMMA);
    uy = 0.0;
    p = 1 - 0.1 * GAMMA;

# different value than
# book by Shu ( https://link.springer.com/chapter/10.1007/BFb0096355 page 407 )
# They use 0.3, but that doesn't lead to a prominent vortex.
vortex_epsilon=1
# vortex part
if x < 0.5:
    tau = sqrt(pow(x - x_c, 2) + pow(y - y_c, 2)) / r_c;
    sin_theta = (y - y_c) / (tau * r_c);
    cos_theta = (x - x_c) / (tau * r_c);

    ux += vortex_epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * sin_theta;
    uy += -vortex_epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * cos_theta;
    p += -(GAMMA - 1) * pow(vortex_epsilon, 2) * exp(2 * alpha*(1 - pow(tau, 2))) / (4 * alpha * GAMMA) * rho;



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_fulltime_dash_experiments_full_time_average_dash_shockvortex_dash_p0_06_dash_N1024_dash_shockvortex_DOT_xml           �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
      shockvortex
    </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>1024 1024 1</dimension>
    </grid>
    <boundary>neumann</boundary>
    <flux>HLL3</flux>
    <endTime>0.35</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.66666666666667</gamma>
    </equationParameters>
    <reconstruction>weno2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>shockvortex.py</python>
      <parameters>
        <parameter>
          <name>a</name>
          <length>20</length>
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
          <basename>shockvortex_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>0.175</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.175</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>0.175</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.175</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>32</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>0.175</time>
        <numberOfH>32</numberOfH>
        <timeRadius>0.175</timeRadius>
        <numberOfSnapshots>200</numberOfSnapshots>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <time>0.26249999999999996</time>
        <timeRadius>0.0875</timeRadius>
        <name>identity</name>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_identity</basename>
        </writer>
      </functional>
      <functional>
        <time>0.26249999999999996</time>
        <timeRadius>0.0875</timeRadius>
        <name>moment</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_time_integrated_moment_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>identity</name>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_identity</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>moment</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_moment_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>1</degree>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_bv_1</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>2</degree>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_bv_2</basename>
        </writer>
      </functional>
      <functional>
        <numberOfSaves>1</numberOfSaves>
        <name>bv</name>
        <degree>3</degree>
        <writer>
          <type>netcdf</type>
          <basename>shockvortex_functional_bv_3</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <sampleStart>0</sampleStart>
    <generator>auto</generator>
    <parameters>
      <parameter>
        <name>a</name>
        <length>20</length>
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
          <basename>shockvortex</basename>
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
          <basename>shockvortex</basename>
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
          <basename>shockvortex</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false          uqAttributes.fvm.name             
      shockvortex
            uqAttributes.fvm.platform             cuda       !uqAttributes.fvm.grid.lowerCorner             0 0 0          !uqAttributes.fvm.grid.upperCorner             1 1 0          uqAttributes.fvm.grid.dimension           1024 1024 1        uqAttributes.fvm.boundary             neumann        uqAttributes.fvm.flux             HLL3       uqAttributes.fvm.endTime          0.35       uqAttributes.fvm.equation             euler2         )uqAttributes.fvm.equationParameters.gamma             1.66666666666667       uqAttributes.fvm.reconstruction           weno2          uqAttributes.fvm.cfl          auto       uqAttributes.fvm.integrator           auto       #uqAttributes.fvm.initialData.python           shockvortex.py         6uqAttributes.fvm.initialData.parameters.parameter.name            epsilon        8uqAttributes.fvm.initialData.parameters.parameter.length          1          >uqAttributes.fvm.initialData.parameters.parameter.values.value            0          7uqAttributes.fvm.initialData.parameters.parameter.value           0.06       uqAttributes.fvm.diffusion.name           none       )uqAttributes.fvm.diffusion.reconstruction             none       ,uqAttributes.fvm.functionals.functional.name          bv         )uqAttributes.fvm.functionals.functional.p             3          1uqAttributes.fvm.functionals.functional.numberOfH             32         5uqAttributes.fvm.functionals.functional.numberOfSaves             1          3uqAttributes.fvm.functionals.functional.writer.type           netcdf         7uqAttributes.fvm.functionals.functional.writer.basename           shockvortex_functional_bv_3        ,uqAttributes.fvm.functionals.functional.time          0.26249999999999996        2uqAttributes.fvm.functionals.functional.timeRadius            0.0875         9uqAttributes.fvm.functionals.functional.numberOfSnapshots             200        .uqAttributes.fvm.functionals.functional.degree            3          uqAttributes.uq.samples           1024       uqAttributes.uq.sampleStart           0          uqAttributes.uq.generator             auto       )uqAttributes.uq.parameters.parameter.name             a          +uqAttributes.uq.parameters.parameter.length           20         )uqAttributes.uq.parameters.parameter.type             uniform        uqAttributes.uq.stats.stat.name           
	structure_cube
              (uqAttributes.uq.stats.stat.numberOfSaves          1          $uqAttributes.uq.stats.stat.numberOfH          32         uqAttributes.uq.stats.stat.p          3          /uqAttributes.uq.stats.stat.writeInitialTimestep           true       &uqAttributes.uq.stats.stat.writer.type            netcdf         *uqAttributes.uq.stats.stat.writer.basename            shockvortex                  time                                           B        rho                                                         B       mx                                                          C       my                                                          D       E                                                           E                                                                                                                                                                                                                                                                                                                                                                                                            ?�jv��?=�a��C?P�:���?[�C��7�?e��8��+?nǮ�-?t�u�:&?{�k�.�?����m?�����l?�H"$��J?���.�?���ݥ/c?�Y���4o?�S@�]�D?�����0?��?$�V�?����<t1?��h��{�?�����"?��z��?������?�6P��e�?���*Ǫe?�t��UL?�[�>��?���T*�S?��޳�?���@�:?����?����'        ?#�q=�I�?HCRx��?au�aQ�&?s)�+��?�㭛��?�*^�?�U�����?�$� �CS?�p"J�-?�_[FǮR?��I���X?��A{��x?��$ʊ��?�ۗ���?ʿ��]Z�?�("���?�K�����?��!����?ں&���c?����1|?���`�?��3�?�_7���P?�wD���L?�Ѝ��?�2��Q?��*i߰?���$�?��֕��?�V�|FN0?��k2��Z        ?VmeQ��?F�"��,P?a���W�?r�mQ�j�?��wK�˧?��G��#�?�J�AL�?�!�ߘ+?��_���?�a���G�?��&�,�?��.���?���M޳v?��fƸM�?���¼"�?�.�a�R@?�S�If�?�ٚ��?��g2��\?�6���?��SQ���?��zS�?�iI��?ꂮ=$n�?��h�m�y?��N���?��@pr�?���YhT�?� ��j�z?�a�*�)0?��U$�L        ?H�"v���?k01��a?�n���?��KQ��?�$$�5P?����?�?�������?���e�/?�\�5�T�?�y:*�AD?�ʢ���S?�5ү�'4?�;*��q'?�*p�?�˱����?惒��-@?ꮽ�9?�SLD0�?�;&���b?��|P�?�'ƚ�.?����k
?�2�p&��@��̑VL@��9�
�@�cL�@x:¸�@�)k�@�q�`	�@m�o��<@ u�0��