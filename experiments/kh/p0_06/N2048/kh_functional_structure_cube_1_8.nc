CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            R/cluster/scratch/klye/single_sample_structure_functions/experiments/kh/p0_06/N2048         alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-037          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190713T011819        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
sample_0_E                                                          6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                @               ?�z����?жG��?�d(c{9d?�u7ʠ&�?�$��*�L?���vQ*@D�|��@	�d�h�_@h��X�j@��p�L@�;�`@e�y�d@8^��W@ jn�K'P@"[;��$@$]I�d�{@&o�n7��@(����oG@*�}"@.@->���@/TT�q@0إ^���@2ޅ`ƈ@3I��[o(@4��I/p�@5��O8&@7!�QK�@8u�V>@X@9���T�@;-����@<���?�7@=�?B��@?i�=j�P@@n�5�}T@A+3j���@A��`��@B��U%�@Cn@A)wc@D3��>��@D�a�R��@E�[}U�@F��H�Қ@G^ȉ3�5@H.��c��@I h쾧@I� �4Y @J�ĩ�h�@K�RWjv�@LZ��?s�@M6&��,@Nh��b @N�@�v:@Oӎ�tgX@P[<�>u�@Pͩ�G<@QAs��1@Q�y�䦹@R*��J�|@R�M3pg�@S�\p��@S�,��)]@T
�[k��@T�!�Vt�        ?���IIt?���e��?Ӣ�x�?�	��?�&ٔ��O?�|p��?�G�V�V~?����g@M���PO@�+��@
 l�(�T@o����@���ȇ@�$���@j^3���@ziG�@�ɧ���@��p�ޗ@ ���a-@"RL����@#��^c�@%�^�y @'6�e�C�@(�?P^�g@*�,s�@,�!5y�@.i�<g�Z@0*5j^0@1%7K�@2%� bO@3,Kq@�@48F�!�@5Iͅ��@6`��S`_@7}3��@8��Q���@9���<E�@:�9�w��@<#����@=Z^|U@>�.0T�r@?�����@@��T9�@A4*��(V@A�M	��@B��L��@C42@���@C���x$d@D�,�7�B@EJ��h�@FhfU@F��m���@Gw�V�4�@H6 �z�@H��I�*�@I�%�y�@J���[@KG�>��@L���(@L޼�U��@M�����@N;,W�@OSp�Z�        ?�Aj�*�D?���U��?УL��?�L���5J?�bn���?��5�fZ?��P��]?�M`[��?�J
�L@㜢���@^� S�@
5�:@ �'Ӿ@M��@;�>��u@~�[�@�E3ʵ@LS�5��@�4�;��@t��+u@!-7�@"x��=>�@#�3��@%`x �?@&���S@(o't\�l@*�C�Y@+�"[��;@-J�4�/*@.��_��@0Y��[�@1:�&Gg@2�T��^@3�]�_@3����f@4�e>Tj&@5��h��r@6�71�9@7Ӓd��@8���s��@9��]�@:���A@;��L��@= JD���@>r{«@?,2&�[@@#��}�L@@�]�@AD0��� @A�����@Bkc��#�@C|n�Ҹ@C�;��H�@D2�� }.@Dͥ�{U�@EjMB\|@F�8�>�@F�x���@GI�����@G�	Ub�@H�����@I7��!L�@Iߢ�=aH        ?�py�+L?��b���?�n��B�?���sI ?���I9@�O�V�W@
�k+�5�@��İ x@�e2@IQ��A@��3�'�@!m�,@$�;��'@&�_�hH�@)��ۆ+@,��4�:@/��p�ۃ@1\u�7@2��=�i@4��f\I)@6]�<$r@8#*k�c@9�!�.m�@;�C ��@=�2G�{@?������@@��P�fp@A�{QI��@B��ve�@C�(��q@D��U�D�@Eޅ���H@F�>&��g@H����@I"^�E��@J@��j@Kb�՞AB@L�B�wV@M�(+�P�@Nݪ�ۨS@P����@P�[�f1�@Q;��zPh@Q�US�Z�@Rv��D�@S�39��@S�� 8�@TZ��nt@T�-�C?@U��)�*@VK�z�eF@V�ZߐD@W�;/��@XIv�}@X�zK�L@Y����a�@ZSP���@[jT_B�@[�	UY�@\gۦ��@]ڂ<�@]���Gl@^�?Μ�W