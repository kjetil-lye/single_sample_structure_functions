CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            R/cluster/scratch/klye/single_sample_structure_functions/experiments/kh/p0_06/N2048         alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-037          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T134827        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           1          alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_kh_dash_p0_06_dash_N2048_dash_kelvinhelmholtz_DOT_py            $def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
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
       �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_kh_dash_p0_06_dash_N2048_dash_kelvinhelmholtz_DOT_xml           u<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    kh
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
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
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>1.96</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.04</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>1.96</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.04</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>1.96</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.04</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>kh_functional_time_integrated_structure_cube_3</basename>
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
    <writer>
      <type>netcdf</type>
      <basename>kh</basename>
      <numberOfSaves>1</numberOfSaves>
    </writer>
  </fvm>
  <uq>
    <samples>1</samples>
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
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
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
        <numberOfH>64</numberOfH>
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
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false                    time                                           0        sample_0_rho                                                        0       sample_0_mx                                                         2       sample_0_my                                                         4       
sample_0_E                                                          6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ?�              ?����YkC?�M���(�?���H�?�l5?�
?��L�${�@ ��ʛ+�@�b��M$@v�=R��@�ʖ���@f�y�@o_�K��@���,@�0�k@!H
L���@#CJ���@%L�>b�@'cU�$.E@)�w�P�F@+����;�@-�8���4@00�Սn@1D����@2r�?�Z@3�	[\o�@4���@6 A�-�i@7d�k�_u@8�j�i�@9��h+��@;O��2�p@<��X; �@>Z�d\�@?a�mi�@@b��Fe@Aj���'@A�)y��@B��'ha�@C=��=J@C�.����@D��Z�@Eu��(��@F6a���@F����`�@G�TT�@H�����~@IH/���>@JM�P5S@J��6��@K�����@Lq�{��@M?��@Nz C�@N��곭c@O���i4�@PC����Y@P��R�~@Qp?,��@Q��T���@Q�^��q@Ra��
@R�=*-��@S=��_@S�,�p�        ?�t��6�?���Pȵ?Ժ=-�p?��Bg��?�n���=�?�lzC)s?�V�
N&?��g�J�X@
q����@�66J�_@���@qO�Ht�@
v�;?@z�Q�G�@g�1B�@���Z�?@x��[��@Zc>8s+@!+8��h�@"�E:�R@$N��m�@%���ND@'�M��J@)`*��z@+(��ē�@,�-���;@.�ސi��@0c�Bv�g@1^�c �E@2^�<A�@3dju��@4o�B��@5~��&9@6��?~,�@7��%"�@8���@9�R���@;�*���@<I:����@=|�ps�@>�χ�*@?�_"���@@�
~?��@A@��S�@A��*v��@B����@C>o� �@C�8���@D����F�@ESOd�@F
E�:;_@F��{�@G��ޟ@H>��c�
@H��`u
@IÕ0��@J��F�n�@KR�EJ�@Lг�+@L���i@M��̝Z�@N�ꛜ~_@Odfe �*        ?��4Ȅ��?�4WZ��?�7Т�?ۉ+��?��]�)�?�	�F��f?�<-"B��?�~��L��?�C��C�@A1*t�D@�0S���@	)��{��@�C1I��@q3��o�@��jКl@�Ҋ� 5@�J?���@AL�PD�@�:Ǝ�N@)����@ ]�O�r@!��9�)�@#'�UN@$r�Ŧ@%��p�<@'Y�P��@(ڳم`�@*d(^��@+���c�@-�q�L��@/2�<m7M@0n����@1H�b>�@2%�J_	@3�0�@3�B1S�@4�����*@5�힆� @6�r��C�@7����@8�3��@9����NJ@:�I;hN@;���N+f@<��t++N@=����G@>�� ���@?�<O*i�@@aT#؅�@@��Ώ@AvZ�Se�@B$ܣ/@B�o�ٚ�@C!7�F�W@C�yd���@DE25`@D�_���@En�0 |.@F����@F��!�+@G8X�a �@GӒV��Z@Hp)Fe��        ?�?NC��?�3c/:?�S�@!��?�����@ R�YȨ�@���FB@c3����@c9u�X�@�mR��@������@!&�:5.@#�/�,�@&��/d@*��@/�@-YjU�7@0^dc�#@2�,e�@3�d1n�@5�ٹ0@@7�V��i@9�#^��@;��Ec@=��C��@?��f��@A	��
�@B#.⼶�@CB��6�@Dgy��Kg@E�MÎ6�@F���I@G���[m@I+���7@Jh!D�@K���.�@L�˯�`�@N6��S�@O�K��M|@Pi�b^�@Q�ٜ�@Q�n#װ�@Rl§�@S��^��@S�8�	�@T~Cq8@U1˲~�\@U���t;@V�'{�(�@WT�x�Q@X���`z@X�^ :?�@Y�	��D�@Z@�#u@Z����+@[�og#�@\~��1x@]@����}@^4;B�.@^��Ѱ�@_����#�@`(����e@`�w��9@`���m�@aT<H��T