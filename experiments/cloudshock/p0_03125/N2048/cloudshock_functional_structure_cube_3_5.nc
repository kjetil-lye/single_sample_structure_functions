CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            ]/cluster/scratch/klye/single_sample_structure_functions/experiments/cloudshock/p0_03125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-037          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190712T105543        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           1          alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_cloudshock_dash_p0_03125_dash_N2048_dash_cloudshock_DOT_py          �N = len(a)/4
a1 = a[:10]
a2 = a[10:20]
b1 = a[20:40]
b2 = a[30:40]


perturbation = epsilon
normalization1 = sum(a1)
if abs(normalization1) < 1e-10:
    normalization1 = 1
normalization2 = sum(a2)
if abs(normalization2) < 1e-10:
    normalization2 = 1
#
perturbation_x = perturbation*sum([a1[i]*cos(2*pi*(i+1)*(x+b1[i])) for i in range(len(a1))])/normalization1
perturbation_r = perturbation*sum([a2[i]*cos(2*pi*(i+1)*(x+b2[i])) for i in range(len(a2))])/normalization2
#

if x < 0.05 + perturbation_x:
    rho = 3.86859
    ux = 11.2536;
    p = 167.345
else:
    r = (x-0.25)**2 + (y-0.5)**2
    phi = (x-0.25) / sqrt(r)
    r_max = 0.13**2
    if r <= r_max + perturbation_r:
        rho = 10.0
    else:
        rho = 1.0
    p = 1.0
         �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_dash_experiments_dash_cloudshock_dash_p0_03125_dash_N2048_dash_cloudshock_DOT_xml         d<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    cloudshock
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
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
          <value>0.03125</value>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <writer>
      <type>netcdf</type>
      <basename>cloudshock</basename>
      <numberOfSaves>1</numberOfSaves>
    </writer>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>0.0588</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.0012</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>0.0588</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.0012</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>0.0588</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.0012</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>cloudshock_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <sampleStart>0</sampleStart>
    <samples>1</samples>
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
          <basename>cloudshock</basename>
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
          <basename>cloudshock</basename>
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
          <basename>cloudshock</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false                    time                                           ,        sample_0_rho                                                        ,       sample_0_mx                                                         .       sample_0_my                                                         0       
sample_0_E                                                          2                                ?�333333        @GYҌ�ܠ@p�a'�^�@�����:@��tx�jq@���m	�@�:���U@�����@�2����D@�r� ��@�1\�(P @�-u��GJ@�p��Cw@�|$M�M�@��g TC@�b�H��@�I�!g@ڿo!�"@ݕW��J�@�Ab�uWo@�õ��'@�S5�Ñ@��d^^�@�Pkd@�f��E��@�;�"N�@�#�HB��@���Z��@��Z�C@�'��K�@�?^:�]@�_$4�@�x�H@�����Q@��dG�}@�"܂[��@�e�T>@���0�@�����@�`�ʱ�@�Ů�h��A ��,�VA �{Q;�A��c���AZ���ڧA$*�A�q;�A�K'�
?A�+ �As"Q��AQ*��BA3S�gm�A	����A
����A
�{ݷA�RΠ�A�G�k~
A�g��]A�˪��A�w�"�/A~y5ʄAm���A������A����j        @�|Z�A�@��k��C@�2

��A�u
A��k�AP*YC�	A$��'��A,j����A2{�8A7F7���zA<�����AA&_L���AD<��A�AG�9b�9AK��bN�AN��:Y�AQSlE%~ASc߆-��AU�	gX��AW�$ BXFAZC �E1A\����A_q�_�\�AaD���Ab���~\�Ad�H�9�Ae��B4^-Ageʱs|PAi"��nvAj�1�ij�Al�JvXGAn��l��ApXgD�rAq]	��_qAriB��|�As}In���At�df/�Au���;:�Av��{_Ax ���zAy_��`�Az��C��A{�ws�A}T��hA~��R��7A�����vA�Ϫ!r�uA��t�H�A�U�ԙ�A��I��MA��e��A�����T�A��a���A�u�XA�W�I�A�<��X��A�'e3���A�WZU�RA�	����}A�����A���>5lA����ܕaA�C�p�        @�@v�Ď@�>bc�'@�4�l�@�	�S��@�gzm@�9k���A ��}V��Aw�I�XA
r�r���A��*�t�Aϓ/�V�A��[��A5�T	��A�^[��AA "�e ��A!���WG+A#�#�h��A%�sE2��A'��Q��QA)ܲ��A+���ِA-�]�.Z�A/�v:_�A0�OaCіA1��aU�A2lO���A3E�����A4��,u�A4��G.�A5��#��EA6�����A7S�'�r�A8)�t�A8����A9�)�O(�A:Zl�ՅA;�$W A;�`DЋA<�q��A=B ����A=��t��A>��dC_
A?g����A@�M�A%A@iU�F^uA@�%�%�AA �M1�AAt:>G�RAA�m��&NAB!�CmwABwT�f�
AB�VC��5AC �CH��ACu/Y#+AC�$��!ADЯ��ADp,ot�AD�5���AE��܁AEi3"ۑTAE��$�AFd�A=�AFi���i+        AA
[{Af��ǉ��A~��W��A������A����5�A���-V��A�	�����A�a�_f�A�]�$e�8A��<F�ӗA���k��A�p��5*�A��,�A���v��KA�	�K��A�3A�i�A�xu��7A��q���A�S$��}�A��Z�_�Aޙ����A�Xa�(�A�&/�a�A�T�t��A�8ӎ�p�A��wԩ�EA��j��\A�=����A�'ԣ�A����7Aﵨ���A��.�:�/A��wŌ0&A�̮Ȅ�wA����[�A��73���A�����X�A����gA�/}����A�W�&�RA���9��A���]��LA��J��m�A�>��>��A���8d�B p(޵<!Bo�BГ�u�B���G͘B@k�a1�B��y��B��f6�dB��v�RBNQ��.�B?'T�8B��]��.B��MB	�z��LFB
r�w�\�BQD�|GB3~�:��B=���0Bj��v�