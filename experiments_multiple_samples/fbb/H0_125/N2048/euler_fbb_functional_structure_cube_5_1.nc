CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T101921        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.125</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
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
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
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
          <basename>euler_fbb</basename>
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
          <basename>euler_fbb</basename>
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
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?��޽��2@	ռ[H@$cTW��@6������@Di[U��@O� �vs@Vп�9�@_#ЎG�@df����q@i�l*yc@pW���@s����	@wy��U�@{�-{��v@�<]!�@��!yR��@��ˢ��l@��r��@��Ր��^@�H�7�ng@�|��(�@�r:�7�@��<��@��q`�@���t/@�lT���@��)1$O�@���Q��@�(_��@�����@�o�d�@���6��@�*T*ྤ@��O�KN@��<hK�T@�AN,��@���h��@�y,�7�@�q����@�r��).�@�|��)�@��L�9��@���P�Z.@��$5u��@���n4�m@�-�+&5�@�i�e:~�@���9൝@��>����@�R�<I&f@���2o� @����U@�G&AS�@���o3@���Yc@Ñ4/�ۮ@�^�� =b@�1i.��C@�	�rxU8@��K>k:�@�ʡ�E@�@ȳ�K7��@ɢ���b        ?���H�?��9���@��Qف@1��[@A��r �@P��^�ē@\=i~�O�@f�'�@p����2@x��2��H@����v�@���a�@�V�J��@���v�*@���:@��l�z�@�����0@�ƻ�Al�@�D�x�f�@�):ڜ@��b�
�d@� M��~@��d�3��@�k�{�@���i�@���H� @Œ��K@�C;�d��@�*�LJ�@�J΃ᩱ@�ҷ�ƾ;@ҝ�8��@ԇ��Vd�@֐]z��@ظ�_k2@���XY�9@�do!�Ax@���B%r@�E���@��)]�@�޴	bX@�͢�d�@� 
*.�@�Y�l�>@�b����@��B���@��c?���@��H>�@�Ɩ��@����Q@�Q|q�@�U���d@��!~@��zť@��+.��@�cJr��@�6� פ�@�cx�<��@�����|�@�Ѵ}#��@��6&�@�]nv	��A Wk��        ?��{��@��t}@2�<cdM@D�7x���@R�-F��]@^�H�@hH��n�@rHC&R�@z� ��1@��c�G��@��E\7�@�_�%��-@��y��@�w��E'@���>�G�@�Y!�@��9��@���O4�l@�,R�{��@�L����6@�������@���	�(@�~�]�|@ǲ����@�5��|�
@�e(�@іf+�oM@����\�@�7D�vj�@����A�@ہO�	�@�f��Ϗ[@໷B��@�Y�;�@��� K�@�ט�S�@緗�E#@���,��@�5Z
��@��ӡ�y@�
����@�1��c@�c��^4@� {J@��h~�@�6���j�@���pm�B@��k�y@�a���ߧ@��0�t��@�XM�`"b@����A :�zىQA�g2A�C��AZA�k�;!A�z��,
Asq��)AZK�V,�AF ���GA6��2YA+�1�A	%�$ۇT        @jM�O��@��"~�D�@�2�K}��@���]E?*@��ζ�`@�"$Eݰ@��T�d�(@��U<�4�A��Ǚ#A�Z�K��A�
�t�XA�Ó�u�A-QaquHA��|�x�A�$�QܢA V�g�+�A"�/��9A$�pa�|�A'�:�>�A*=��L�/A-"�`�l�A0c���CA1�e�VkA3g�W��A5,<�D9�A7�Ƀ'A8��Ɋ\A:�g�X�A<��K��tA?���A@��8�0�AA����OPAB�0,���ADh�>AES��=�AF��y(�/AG�����AIW�.�.�AJ�	s3u�AL@�.N1�AM�0K�AOY��k�AP|��AQQ�DAR,���AS�����AS��. 'AT�&@>QrAU��vlAV�@ ՘3AW�s�@tAX؎$�2UAY� pAZ�L�蘜A\�e
$A]<�%�FoA^e�j�A_�;M��A`el�AaA����Aa��AbG�6��'Ab�cj0z�        ?�GuU��@%S�@�
^� �@-�`]��Q@9�}FnK�@D&��Y�@M�.�Q�@S��6��]@ZX�9q��@`�Ys �F@d��A
L
@i��v�@n��`�^�@r�`��@t��i�|�@x)�P�#�@{�?Sw�P@/�8��@��{�5@���� &V@��l%�&�@��28@��y9.a@�Yy*ف@��UYk�z@�J��}�5@�ıF'�
@�O��*@@��< @��̽8U�@�R��)y@�!�j��}@����l�@����@^@��f�	@��ĭ��@��7+���@��ʋ_L�@� K�d��@�;l"2��@������@�ж8�)@�*��L^�@����n��@���G��@�u>$�@��0�9�l@�����
w@��~5n�@�\8Rw��@�0�.�A!@�	��_@����{=@��nq��c@��Y^��!@�����U@��8Xe�U@�z2�
o@�q����{@�m8{�*e@�m\=��@�rAJ�k@�{{tʓ�        ?�Q��#p�?�;L��@����N@"�a�*@2��޾�m@@x�����@Kۑ�sH@UK�z@_v%|�D'@f��*�<@o����@u[�7�8@|6���7�@�:�@T�2@���1*�@��p&.�@���(�,�@��'~Yy[@��P�G*@���XzNC@�)�3�@�����A@�V�2!�-@��iE̠�@����
,�@���kA�@�R�!�x�@���*�@�XRM
�@�R~T��@���@�@�r�E�-@¶+��3@�r꼀�.@�HV��,@�6�v��@�?0����@�a?����@ΝHU�@�y���@ѱ��{�@@��ϻ+��@�H�@Z�@ը���$@�jl�y@؎�k/@���դ@۩[���@�K>���@���7�1d@�[�"�g�@�A3��A@�-^��@���ga@�[7Rj*@�{���@� +�'�@�-W�fm@�@�s�R�@�Z�!aU@�z�G˦@� t�@��1�Sy�        ?�l�+��?�E%#%�p@ A~W@!�;���@1��(�h�@@Uy/!n"@K�����z@V#,��@`� �1@h�&���@qJ=-���@w�����@��	��@����61@�`�@��@����a�.@���7n~�@��^:w�@�5���x�@��J���R@�/>���@��G~	.�@���N�L@�_�f�+Q@���dW��@��<�hf@��Jjt�@��"�1a�@�[;�^@�W�m �@���?@��Rj\��@źN�˴@ǻ{8Vg�@��gU���@���R@�g�lp�F@�m<�~@ѵX��$B@� �~�@�q����Q@�姳;��@�hN*�H�@��uz�x@ڙ	cԸ]@�F�}P�@�����@��&_�@�ҋ�[F�@��U��	h@�� h��@�����@�����@�Ӟ�5��@������@�&D��@�$�z<�@�M�Z��@�}h�**@��{��@��޴�1@�68U���@�@ګ���        @hk^@j�Z@�G���@��1��5@�SH��N@�Yh�=�@ڦ�.��@�����>�@��6!��@����L�G@���ˌ�)@�j�l���@�����f�A{�8ώA�iA	AS5��^�Aͥ����A���}��A��"8��A���f&AgN��YA^��3�hA�����Akuux.BA -��DA!|e��A"�V���A$��I�7�A&���yA'�3m�2�A)~��lo$A+H��WK�A-$����A/�D*ߏA0�`��ޤA1�gi���A2����SA3�uYd�dA4�F��hA64�?u�A7y���tA8ʃ�BA:&Q�
.�A;��#�6�A<�ɓRMA>v��nVA?����A@������AA�0�_IAB[ظ!��AC.�K��\ADM b]AD߸�NV�AE���Q�\AF����AG���� �AHk�g?�AIV�J>B�AJE(� AK6��h�AL+>v��AM"�Q��RANd����AOM��        ?��Ά�a�?������@�e''�~@'�:��E@5#3W�o�@@�K$�@H^���;@P��(���@V/�2��@\_\FuY@a�^�58_@e��`O�1@i���A;@n�m�g!�@rT1j��@t�y5\g�@x$�{�H:@{�8m��@8�=xp@��	#)��@���p�f@��Q =5�@�/����@��i�!@�2��X�@��\�p��@�W0��h@��U��'@�P���C@����1@���zG�U@�8=a�#@��#�u�@��T=�ϋ@���u3^�@�K�+İ�@�J��$�@�Q�ɴ��@�`:�B�@�vG��@���?�@���S#�{@���#9�@�S~@�V �Qq�@����'��@��9W�@�5�t:�@�����C@�vnM�{�@�);ы��@��x��s@��B
ąz@�V�����@��fCL@���f��@�����
D@�rG���@�B�(pL�@��()1M@����U@��M��@����N�K        ?��ZhNa3?�i8���@��{��@&w��@70�N@E�\��@Q�a#�@\��p�n�@e���v�X@o����-@vy�:a>@~㧋��@����Y�@��b��K@�ae9�`@���
�u�@� �?��@��!��
@��e9-@��Z���@��#,@�I�(ļ2@��~*�̭@��q�Y�X@��*���@��ǿ��@�(��s�@�\�����@�GF,���@�L�䨶�@�l�ǹ@ɧ�"�]�@��J>6�@�m~���v@�|R.�L�@�ϋ\�Q@�0�$|��@ԟف�+@�{֩!@ש�\��@�E���!@���S���@ܬ:s@�w��o�B@�)���Т@��U�~@�6�b��@�$��L�@�3j�Ʀq@�I�1��@�hI��-K@����@�1�N@��T��
@�)��9�}@�k="y³@���S/Y@�&����@�*�g�t@���s<�@��L�S@�:�^Y��@��W��P        ?ڃvfe�]@I� ?��@$t�F���@7�����@E����9@R>2K�`@\o��@d��{���@l���U@s���!��@zV��ae�@�5�}��H@�+��@����@�T��!�@�E���Kh@����e�@��e�@@�ZB�L@���2�r@�'��>�@���:Lb@��׽��@�M�J�@�����$'@�s ���@�y[Ȧ�@��W%U�@� ��AHZ@�ӵ:�@��/`�@�7w���@Ɉ�m�"�@��k��v@΢�ڹ�@ж���@@�2�Cm�@��S�� @�kK}�5@�*d���h@� �CID�@��${���@��ۄ'|@���Xxp@��	�$@��L��t@��[�Q�@�:$e[4@僰kq)@����%�@�:`c�@駵[f�+@�!)�%c�@��qa]v@�8��\~V@�ֹPR�@��v!"KN@�w���@�|���k�@�c�@m�@�P�в̮@�CNP��@�;bnfk        @c8y>��@��y:9*l@��O
a�@���� �@��VqB@��FM^�@���f[�@徣|�@�-�Du�@�(� ���@����Z@�s[ ��A q�4�~Ap[ܿ��A���E�A
J[Q��mA'�dA#A(M��AbP����A����AF�#��A�&���A��Q��A W��
�dA!�B*���A#����o_A%0M���A&�i8?A(����?A*�@E��"A,�8.A.�����AA0_�G���A1u��"�rA2����l A3��jl�A4�e���NA6)(AngNA7mH��:�A8�ңwBA:ˀ�pA;r;Y2v�A<�0���A>O�&9ԘA?̱��=A@�{K�iAAqy|s�AB<���^AC�p_M#AC�r��pAD�ts�AE��3G7AFs-�VlAGVԨ��@AH>�d��aAI*��i�PAJ��q=#AK��L�AL
�g���AM	M�u2+ANiM�wAO%S�#AP>6�F        ?��D�)�l?�/��z�@��m���@��~%@�@,�q.z?@7"Zy@� @A� �.@G�X{�1@OpT��~1@T:��+x�@Yb%I2�Y@_5�I�@b�U�]�k@f}�!e�@j|���@nߠ18i@q�\y�@tv��ܐ�@wYWDώ�@z��g�
�@}����-�@���ud5@�� @�)��O��@����.S"@��Y�@�����@��G����@�k{E��@�;�|�Z@�Ȓq'f�@���ȏ+�@����G�A@��m�a{@��E%��@���;�@������@�������@�����^@�E,���5@��ap� @��c�ׇZ@�b���z@�ا��C@�YL^��Z@�䮶�:�@�z��m�@�{�4�@��̟;;�@��4#��@���R�@��
Ӻ @�j���ԑ@�X�si�O@�LU@�D
��@�@���n�@�B1��[�@�HG/@$�@�S/	n�o@�c,��@�x7[�@�����UO        ?�Yn��.�?�bIη|0@
r�ߣ@ ���q@2�v^��j@A�v�[Fl@O�W6��@Z4d��Y4@d�����\@n��*@vk�܋B@��,�O@��	>�D{@��� u�@��n��@���%X@�`f��@�Դd�Z@��b|@����.�@����5@�����@��4��@�yJ�໰@�o�Yw�@�^f'�@ð�m���@�/�%�@�ۄxy@˵T�L^�@ν���� @��6�3�E@ү��v�7@�}#�'@�c����<@�c:iJ��@�|Na(�=@ܮ�L��;@��э~�@�(��@��@�;��]Y{@�o>H�m@��ꞩa�@�l �{@���(;�@�vzvV�,@��?�(z@��H���V@�dv�B@�fݮ�@�v$շ�@�a|%@�S���@�K�b�@�IN~�D�@�M�&��@�Yz0;@�j�ǖ&U@��,��"�@��R����@��\J��~@��as�Q~        ?��/$�8?�*��|@	��I�@#,�'��@7$r�kA�@H!�]�V�@V|SN�3�@c�#��@n*�ڻ�@v\$����@~���C@�F~ϑ�D@����%p�@��l��Q@���E\L+@���yG�@�9U�t��@�^�B��@���#d�;@����է@�sMm�@�A�XČ�@�YTÒ�@�9[�Ì�@��J�QL@���Υ�$@�ԈO2�@��{n��@ƄTp��@� Q���@�����@��d��p�@� ���@ҩބF@�h�q��l@�@�9���@�0͝[S=@�:B}2�@�]tꖤ�@ޚ�/Cm�@�yU�j�#@Ს^�r?@��i
� �@�Mͅ?�@����e@� Lip�@���w@�*qc�@���{�@�n<�f�k@�%�Q+��@�v ��L@�`�S��@�RD6��@�K!u���@�Kk��*@�RS�	�@�_��?�@�tt�^�@���H:�@��[tK��@��A0��@��"?8        @F�,��@y�1�W��@��8��>@��ta�@���E�@�a����@̩Rdn�W@�����(�@ڬxl�&@�@�`G�@��g���B@�����@�lb�A�~@�O�$@�ty�c�0@��+�j�A ��'6/A��k_�HAW(d���AW�`"�A�A�	OA��s]�Ao�Y�Aq�H�jaA��y��
A֢����A:8�&L�A�wZ;l�Ag1힋�A!m���A"�r���WA$ŋ��A%��X��KA'a�G�2 A) "ؑA*�})�ėA,ϋ���pA.��w,��A0`%��	A1h+ܜ��A2w�Ǹ[�A3�Y
��A4�`�r�A5���ɥ�A7'��A88���?A9u`�qA:��*�>�A<�n��>A=WJ�"�A>��邟�A@o��\�A@��J��AAr]���AB,F>�AB����AC�O�f�ADj�#N$�AE0��l��AE�}����AFŘ�f�AG��TAHh3���        ?��j�@7rf��@�Ea=�3@0�:��@=�����u@G����n@P���@V��E�8@]�\���@b�wd�"�@g��R�A@k��(�@p�hNw2�@s��ާQ@vց�Ր�@zLH�~�@~Y��=@���0+@��[ŧ4@�[��Y�@�����@�;ddX_	@�ܢ���@��� �@�A,���t@��N�l8�@�U�@��t@����[\�@�����@�q��4��@�Gt<�ؘ@�.�N��@�&�Mipp@��U���[@������(@���Ћ��@��}(�,@�Ӏ��@�8�j�ɶ@�u�8� @���\�E@��`o>~@�iyB�`�@�����>@�AX�Lg@����Ϊ�@���R�c@�l�FK��@�<�y�6@�^ z�@��%'u�@���5�Š@���ƸZ�@��sDŁ0@���A�4@��6X�Y#@���1&h@��H^OM@����!to@��<��6@��l6�.@��y���@����w@        ?�Z�{�|�@��Mb�@2)��O�q@ET���@S��I�@`��D��1@i��W�@r����@zp�u`�@������@���_�@�u��g��@�%��:{�@�an�r�|@����d@�F���(C@�M<>�Z�@��4	0�@�x����@�M��F�@�pDh쥜@��$��Z�@��r�ie@��;��@�#k�*x@Őѡ>Fe@�/�%2��@�t2�K�@��R�a�@О�fK��@�T��V@�$L�"�y@����$�@�4�Z�@�0���@�j�k�6u@���h�	M@���ǈ�@���q5|�@�4��a��@䗅w@������@����#@��$#z%@ꯦ�m��@�W�jq��@���$�I@���?�@��t���5@�f-��@�^�
_x@���@@����u+@���� �@��пҿ.@�����<�@�����@��Q���"@��KS�@�;���@�i���Y@��4�ӛ�@��W�V�G        ?��y�Wz@�TV�@�@">�DⲄ@5��c w�@D��M��@Q��� K�@[���C@5@dN�w���@l��Kf��@s{���|@y�d�9��@����&o@�m��I�5@��
��P@����?�|@�Wv�-�8@��v=��@�h�2ic@�k�]��@�v�9J׳@������@���D<�@����*@��zN�]@����chS@�%&���V@��|��Y@�
A "J@�(^��@����N@���Cg$�@���ci4�@��-���@����/I@��m��7@�(p�:@�֓
�@�=�+�>�@Ӹ�l�3v@�F�@��@��#%@�|@؟]W��*@�i��^��@�H�8u@�:�QMX�@� ��H*�@�..P!�@�E����3@�h3����@�b��z@�ͨ�B'�@�Hm���@�`��bT@黣x&�@�"�7�S�@얩X|7�@�!�'@邏.ap�@🕿_��@�s��J@�N����@�/Oܶh�@� ӡ�        @q��g�:Q@���PT�'@�Yܩ\�@��t���@� ��I�@��o��u�@�L̼�7@�9�`���@������Asx*�ިA�1��\�A	�� ���A�imUSA"h�1W�A���7A"�M(s�Au/>[�A�䥭��A!`'�8�7A#]V"�Q�A%w�-�4�A'��!6A*	�6`�+A,�'r��A/�zQ��A0�aUځ�A2^�/���A3��浛A5s�Àw}A7��!=ZA8�3Mq��A:��p�A<dk��A>G���xA@���}AA
�$�AB&Ԍ
ͷAC7�����ADP���LAEq��~cAF����[vAGΡ���AI
LZ{�:AJO�L.�AK�6#I}�AL��&-�]ANV2�AO�g7_0�AP�M�&g,AQZ��(�AR�]��#AR�,��iAS���QI�AT��^�AUb��p��AV?���AW ���.�AX��AX�Τ��AY�]j��.AZ��Jl&A[Į�o�A\�y�        ?�P |��w@�^���@/^ �Gj�@@��uX�@Kj���~8@T��?{@-@]8�=�"@cvK��@h飥y�D@n��TY�R@r�c�6�@v@���N@z+��@~ F��6@��	���@�V�j�z�@���Z�j�@�&ݮ A@���N�>�@�z�ճ��@�-�Y���@��f��ʍ@�FE6�Q@���aQ_�@��eU[0�@�{��# �@�_�7��@�W����@�c�x�!�@�A���}�@�[�&��<@��.�D��@����34@��T�o�@�0�r1�@���0��@���B[@�M\�\�@�Â~���@�D��H]�@�ТDJ/@�3�ч�@�X�$:�@��Ztd��@����n��@��c�N�j@�|{KA
�@�g�i\@�X�Ov'p@�N�i��s@�I�׈RD@�I�y�$�@�N�TY�I@�XΙ�@�gnl���@�z����@����l+@����B�@�i�����@���K:��@���H;@�1�|ف+@��@cy)        ?��S7��#@#��z��@<Zꆧ��@L���N@X�;N��@cr��6@k�T��g�@syfa�h@zw�5��@���ꐘ�@�ߧɂ˱@�I �G �@�yٯ��@�=hs�
@�YX�@�H>��3@��]^��@���H�p@����j�g@�������@������b@��1��Z@�����@���Ժ@�/D#"�@Ī�P�j�@�_�x@�P�ؖ@̀Uc^t�@�xg�WS@�RE�_��@�N�7�h�@�oj'�@س��D@�z`#�@ݫϵ3�@�/�VAO�@� L��9@�w��@�JSW@�V�G��@��U#�@��	|�
4@���/�@���_�Mb@�-u�@��(~�ƣ@��PD�@�C�WM�@�>ŝ�@�o��@���@��c@��$�1�@�9�j�@��	�D�a@�j��@�X�G�@��1��OA #�c�MA ���H
A��#�sA|��QANv ��        ?��{���@(���m@&XCF�@8y�gt�@Fq#tK�@R�ܓ|��@\��s��@e,�n	ś@n"��Y�@tϥ/���@|��Zzn@�s��-��@���*$�k@�D��@��q�>,�@�V���"@�kl�3	�@�8�$�@�]4ZN@�)�p�@����:@�F��K��@���D\@�j�4�g@�T�Jq��@�{g��j@��na�O�@�A�����@�3�ttЩ@�Gei���@�|�U%�@��p�E=@�Q�)w�r@����@�܃ޅ�&@�R���W@���H�@�z��7@�,���@��b�ò-@��il�>@ܾ$S�{�@�±[�o@�nv��@�<�=:k@�Ο�v�@�ұI8:@��bZÍ@�H�Ű	E@�zi�H@���]�@@�DP�"@�Kx=�@���Ǻ�@��3k�,@�
�B �@��+���1@��3��@�hF{3��@�;9^М�@�����8@��'�ր@������        @�7O��T@�����y�@���nL�@��,>@��p-˺@��O���AI#vOЋA�W�M5nA�	h��A�,���-A |m:A��.w�A!ݿ�1YJA$|�{���A'A�:�f�A*.�f�X�A-E�e�dA0Di_d/A1�ɳX�zA3̬`0�A5�J��;�A7����ʞA9�ȆVtA;���,A>ACb�t*A@Ph_��AA�@��AB��]y�AD$�\LSAE�/�.�'AF����AHY���/�AIծ�T��AK\�I��!AL�f��AN�m���bAP��'R�AP����=IAQ����AR��h���AS���JATf�S{AUI���AV/߽!5DAWA�iAX��-m�AX���Ƽ�AY�笼�AZ���[AA[��c��A\���*�A]����+hA^�8�	A`=bi�A`����sAanP��Aa�R�0�AbI��bAb�\��ԳAc�,��=Ad/2��NAdۜ_a�jAe���'+        ?��<���@ ����o@����#@.�0�m@;�$Ȟ,G@E����P@PEanp@V�V|MF@] 皊��@b�ǜm��@g,��7�@l8(+]�@p�M%�R�@sޘ$�@wv��]�@z�����@~F��Ҍl@�����@�>�C�@���� �@���C�	�@�w�6Q�:@�,値*�@��d!�q@��)f�Z@�t3�#@��L�]�@��j���@�hd�s�Z@�Y�ܿ?�@�b�~�@�������@�^�~���@��Y�K7�@��S�7�@��A6UZ+@�I�mT��@����Z�R@��̋u�@�r*Q@��uEbd@�m}1��@��Y��OP@��C�I@���Qey@�s9m�@�O�>`V�@�1dəh9@�pW�ͬ@��Rv��@��V��.@��Bse@�雰 _L@���B��@��o�T��@�.P���@�����@�-��<��@�L���@�p�s���@�MO%M@@����M@���h��        ?̧b	3�m@�+�d�m@$�d�L�@;B��U��@LK@+iB@Y�"<Ie�@eT�@p����̊@x�7�y�E@������@��Ղ}H@�
�`��@�ӏ|x�@�pl�d�^@�v��5@�)�R$�@�V��驻@�9���@��Md�@������@��u�$@�v<�\��@�)�V^�@�dꙸ�@�?h1�L�@Ŕ8h�ط@�C�wX�@�÷6:FL@͠�F�@�VH!�y@��C���a@Ӫ�`Y�@�ywŨ��@�a?�T��@�b$K.�i@�|fU�Q�@ݰQ�ur�@��7����@�33��:@�t��7��@��@�Ç�@�R��C@����,@����s�Y@��	���@�f�/�@�`:ثx@�`��S�+@�&�N~�@������C@��i�,,O@�ʭ����@��3X{S@��؊�_�@��|o�@���X��@��A�s~�@��)���@����q@�#{�K�(@�G�h��@�q#I�-@����:T         ?����?�g2ξ��@	|�wXX@+�s�'@=�Q����@LT�Z��@X|#k��@c�'�/�{@n2��@vL���C@~��x"@��e�Q@���G�@����d)C@�-�`3º@�^��Զ@���8�8K@������v@��B���M@����C�}@�" ����@��Z4��@�X�i�_@�Qd@����=�@�	�綐�@�g]o���@�ns`B��@śD V�@�����S@�g�]&-�@�	5��@���s�}@�`�~`�S@��7GV�@Ԋ�f���@�<A��(@� )r�@��N�8��@۾� �@ݸ����@�������@��;�
l\@��{�j@�%�?�@�L�[j�@�{i����@江u���@����z
@�3�����@�-�=Z@���<v�@�)D9:��@����&�@��5�67�@�9)�x@�c$�Z��@�����@���s�@����M@�]kp|6@�"W\8�@��-�>�        @f�P&��@�Pvi���@��i����@�`v�u@�g	H<@�u�(kIu@�tLۡ��@�w.��@�:�l@�V�̰��A,3r��A����A
-���4A���.�A�˽5y�AG��2�:A �dr9A��O��UA���α�A "X�P�FA!��1{�A#�|w���A%��[�^A'�/�6�A*
{��/A,gv�ݯ1A.�T�"�$A0���+�A2,1*�VA3���"A5-D��{�A6�"C�ݕA8s�+�2A:.��i9�A;��!&A=�﫶�A?�6&j��A@�(U�PAA؆�ϒAB����AC�~�LAE-���AF!�Vu��AGE3�5��AHo}zY�AI���QͫAJ�%��)ALd,b$AM[L�ٙAN�^ �AO���AP��B*�AQZ@�{�AR�:LARǐގ�AS���6GaATF&}HAU��4�iAU��I�lAV�V2SAWsb?��FAXH0})�AY ��m��        ?�G.��@IH��@/�����@@����O@M���f�@WV	��,@`�_� �C@f�ny_@mբT�\@r��k�d@w��ڀy�@|Ӣ��V�@�OKh�@���A���@��"�~@��J?�Y@��K���@�W��%c@�����@�b�8Fr@�(�VN?@�X.�<y@��� �@�����C�@���,�F@@�j	�df�@�c[5��{@�wH���@��:O��0@��L,I�@�&u_�\�@�c,�(|@����Y�@���4�@�fCY��@���-�'@�UI� @����֢@�{Cl���@�$��tP@���p @�Q�"tN�@�=ת�!@�2K���@�/��uW(@�6"�@E=@�FN:�F@�`�`Hp@ǅ*�w^6@ȴ��c��@��tt��@�6΢-�@̈4�{�D@�� ��1@�O:cԙ:@�a�peV@�!\	��6@��/ā�,@ҰΑ�@�~�)Ԇ�@�R�t��@@�*�f��@����6        ?��(�zk�@�]AU�@3�>���@I��^7�@Z�Ʃ0D@i"�쀅�@u�:0,�@��3Yf\@�a�tC�@�7�o�f�@�C�m@�Я���b@���2�@�g���R@�W;Dc�@�-�u�>@������@�o<���o@��P�o�@��h�g@�]yM�@Չ�>-�@�
�PJ@���ц-�@��9Lz��@����'�@�4�Gm:m@�̛C?ү@ꎝ�	w=@�z[��"@�G�B8&@���,G�@�˔���@�c�q���@�AW����@�4�)�O@�;��<��@�W�s�t^@����z^�A �w���AA��,�JAB��||A|�irA��/A��A�㬿AJ�CL�A	����A
���{�A+�˽o}Ar�WtEA���5"A�b�M�A�F?��A'���BA���|P�AD�V�A��V�ANP�>�.A�^��wAF~q�ذA�'AlH�A0��G+1A�ת��        ?��m��[�@(���D�C@C���r�@V����@e�?��&@rl}�P�@|�:G��@�A�'�R@�"��[�?@��$�> @���O��@����@�
?�!�&@��O���6@��x��ُ@�ƛX���@�1���VA@�*nLX�o@�\�F%r3@�s� H��@��A�,/@̠��#�@�^�����@Ҝ�l�)�@�
�`��~@תK��(@�|U�pO@݁�c8f@�^�Otj�@�Olu&@��bt�D@���x胴@��hd~Z�@�-���))@쁰`�R�@��2gߺ�@���$�;c@�!CL�(�@��t�s@��W�@��#�cb@�<tC�:�@���ߗ@��̞�@����ꌘ@�s��3A �ԮIOA�!�Ï�A��o1A�%��\�A�&�q�A�4{�A"�����AA�/BA	ah���A
�y�B�A�/�	T�A�
�	�lAݵ$.QdA�.�dpA
�J �RA��a�}�A$J�W        @��	�^��@�O_W�C�@ҾQ/�(�@�2�ȝP�@�tH���@��mcU�A��d2��A9mVM�,A�U,�A�{ڈ�A��wM��A!���S��A%����A)ʚvV�A-pi�,�4A1jH"O�A3��ϵzA6rZ��!�A9j6PZ"iA<��l  A?������AA��pOAAC� f�AE�1p�L*AG��b�<AI��� /�ALA=X���AN�o{5�AP�/m��6AR�ڱ�NASkZ�w�"AT��	��GAVj̀mTSAX 7����AY��5M��A[U�?:&A]��6DA^�EP��A`bםy��AaZ�')tTAb[��]�Acd4���Adv_���)Ae���O�Af�G"�'�Ag��~�_ Ai ��{I�Aje�M�Ak�x�dAm�jm�An|�cAo�n���Ap�ĺ���Aq�~f���ArVyIw8'As.vp�At),�N�At�FheAu�{�!ACAv�lL�v�Awī���Ax�Ȩ�a_Ay�W�G��        ?�v���7@ w��b@8��;��@H��Ņ�n@U@�%��<@`0;���@fހ�3��@n�׮�,�@s�<a?P@xˢ��@~ca�H[V@�H�l�7�@��܅��@�_X�o�@�_b���j@����R�@�%K�d_@��ׇXz@�7Cұ?@���B�R%@���$�/�@�wS���}@��隿@��aga�@�veF`@�C�I&��@�!��,��@������@�mo�@�"��)H�@����b��@���ȓ�@����T�@�оf�]@�@1t��@�} �Q�@��8�'@���*d�@�e$�iM@���{��@�)ԤX��@���.C`@�	�Fyi@��R>B�@����Lm@�`;�{��@�2 ��K@�	��@��)���@�Ǝ�8@ƭiF���@Ǚ�RP*�@Ȍa}A�@Ʉ˲�=u@ʃ��@ˆ�8f��@̐%x ��@͞>w�@ΰ�=�͑@���)� �@�qmW�%@��!�Q@ђ�	���        ?ܴ��}�:@Ovؔ�6@*uJUV@?���k�@OLRNx�@[e�<yT�@f$���-@p��`�c@x�.��9`@�J$���@��mM���@�W�z��@�c�;�d"@��)e�@�Yqi4�J@�;\Ӻ�@�������@����6Z@��sU�&p@��P��@��ˢ�w�@�t�@�cO��@¿F�D�@�Q�3�7@�zV��*@�!�ӖXJ@�c�ڳ @��<�g@�Ю�s@�Ϫ9�@��L�@�-�1�#X@ی����@�s_ �q@�T���@ᳱZZ.@�!�|�~O@�B��@�+@��\��[�@�m�17#(@�$E�Z@��.��@@�����@@�L~	o@�B~w�@�>�H`�'@�@�ʆ�H@�H�a6�@�V#���@�h�.2�;@��N!��@��A(�+s@���u�َ@��A��Q@�H���.@�/�Nؚ�@�]��Ԃ�@�������A aS"��QA ��Ŭ��A�!���        ?�E�� @!^�ȯ�2@>��2�&@RP��Aa�@a�ӌ)�@m�ۦ��@wM]o�Z	@�B.�ǜ@������@���2�I�@��xX3�@��F�fw�@�D��d�j@�bmB��@�^{C@����U87@�� 
�a@����X@��h�.�@ª��E�r@Ţ�@�/y@��V�7�@�\P�Z\�@��P�]�@�S^��@�J]A��@֣Vޞ@�&����@�Գ��z�@ޭ_�6(@�״X8@�l�����@��!�@��Q�V��@��i�@�p��H@�X�O1�V@�O,����@�SI��@+@�W�U�	@���D^@���*�x@���{�@���JQ�@�:�����@�g3B��I@��E���=@���Aq��@�J?�@�Dz�V@���Kh]@������A ���/�A �1n޷AT,��A�[�'A��)BAU40�<cA��w�A��x��^AkFa��A".�ՈA���M        @�iv��@�����a�@��e7���@�fev��	@�����A��r\U�A
��V��A�[�#/�A:L��M#A+0��A!�-oV,A%L���A)"樜��A-F��݌^A0���W@A3::��gbA5�/n��A8f�c���A;3>x�wA>"G��!A@�}��:AB2G:���AC��-gAE�nG��DAGZ�a�AI0��E�AK�烷�AM�
e�/AO�� �AP�RR��AQ�'�5��AR�7N�p�AS�Ws�BAT�T��AV��W��AWM"�2�AX�����AY�~�_A[��HkA\Q|�k�JA]��R��A^�M�@�A`- e�>�A`�>V�Aa���UT3AbQ'`9Q�Ac�}�SAcЬ���Ad���p��Aea�h�d�Af2/��rAg�"U'Ag�t��AhʘM��Ai���)c Aj��P�3Ak�7�=Al��)g=tAm��#p2�An���?��Ao����ApQ	{K�.Ap�8T[�m        ?�V�k�Z?��NH~b�@��>��@%�vXG�n@3}
�@�@>�
o��@FY��III@N�5$���@T3���q�@Y�2s;�C@`d~v�.@c���@gv���@k�,Ć<�@p?�sW�@r��Tp��@u�;�~�@x��� �@{�8�5@]`��C@���{ꘑ@��"#�.�@���P~�@��֭a	�@�4����T@����_GM@�I��9g@�N�?/@�s?r_#n@��a��@��Q�̶�@�0x�c@��
�F]h@��q6��B@���6�I�@��k5�?@�NJ���@�\�Pj�.@�t�m�P�@���n��@��ɳ�l�@��.�,@�3�C|r�@�|8� �@��x�^�U@�-����@��,�	�@�nB��U@��Ɩ�]@���Jb�@�Z�gv�0@�.V�C�@�3d�x@��S���@��u��K@��>�TD@��S|�F�@��d$���@��)A�7�@��b�F��@�����0@��v��H@��$=��D        ?��͝��?��f��@\"���@"F��$#@2�&㥇|@AA#����@L��M�@V�G��J�@a�Ǿ׫@h���஦@q1�u*Y�@wC�Se@~���p�@��/ތ��@�-q.|V@��BND@�igKR@��u�U=c@�t�5˟@�<�<Y�@�	�ӈK@�%���"@����P%�@�Zeü�@��Hx�ـ@��'�h1�@�k\= ��@�U�PJr@��Q\�w;@��C��1�@��j�D>@�K9��%@��+'B@���Sl�@�ď&T@�9l�ǘ�@�w�<��y@��Ɍ��^@Т4BH�F@��S���@�=�c�zD@ԟ��>@���!W�@׋*0���@�ת�@ګ�u�i@�O(�O��@��B�N<�@߻���%@���sl�j@��m�@�X���@㐇��<4@�@��g_@�x�dr�@�)�Y��@�S��@��1!��@��1��~�@��t���@� ���?@�'�#���@�U�I�        ?���h�@g1RM@p=���@29����@A䝎?�
@OR���<e@Ys�f��r@c��QGH@l����@te�u�|@{�p�a�@���*˞�@��L��@�xP
}W@����D@�+|��V�@�>�@���o�i@�������@�� ��,>@�Sm�5�@�'�|�R@�%G���@�^
E���@���^�@�G�\e�{@��]����@�Ԕ�w5@�m ~��@����g�@ô��T}@�zހĢm@�X�A��@�N0V���@�\.�0N�@͂�!� @�2��@��	��@�G2���@Ӎ1/�t@�߫�Z�@�>s�$��@שkdю�@� �����@ڤ��:�@�3�@��#��@�xR/�g@���bn�@�u�RN��@�ZO�yl�@�D*�.q�@�2�d�L�@�&O�
�x@�S'�<�@����gn@���@�!8"���@�*�qFP_@�8�z�[�@�J�� a@�`�{@�z�Ad�v        @]�Vj�@��� �Z�@���eCg�@�m�^
@��ip4=@�w�c�@�����Bl@��
v�)@�U�<�Rc@�Ֆ[@�̋���@��~|��F@��Ⱗ��@���v��A@�u^�A�ڰ�>�Aڪ䅥6A
�*V7��AG�. �A�j��oeA��od)-A�*��-0A���X-A$[t�- A�ߠ^��A �-וSA P�0 %�A!�n�&A#'L�p�A$����8A&Gw�n�?A'���OA)�.�d4A+�C�g��A-py~y��A/lz5@��A0��vM 0A1�
�}BA2��7�LA4�޷~%A52��V��A6fe��~�A7�,'��A8�x{y�A:9|�O�MA;�fz*�"A<�X=ZG�A>ec�}�A?݌=��A@����.AAv9|�w:ABA�`��4ACp��͎AC�T���AD�._)�JAE��_���AF��ަ��AGng��wAHZ\k AII~�C�AJ<j}�`�AK2�/?��AL,�|��        ?֝h�O%b@f���@�@"��d���@4=��9@A�g}�/H@K�RZ*q-@S���@[h�ЈՕ@b�tW��@g/P���@l��0Jn@q��m��Y@uXw�z��@y@s�Z�k@}t]�=EV@�����:M@�c�w�@���H�2_@������@��<�X@�ٷ�]R@�<}��@��A?��}@��%�x`@��t~\��@����_Y@�vp�Gv@�U�+�@���*J@�'&MBjM@�{��,�@��a�a�@�P��:�@��D��4�@�_��'@��D�ux@���*&O�@�b���7-@�+ć��]@���w��@�u���,@�q@�o@�t���*@�~�%�.
@��϶>�(@��M�/�@��D���@���I��@�$3H:!�@�\�NR&�@��,�3�M@����o�@�7T�q�7@�H�/�VP@������@������@�h�	Ed�@�&a2�-�@��M��@Į/���g@�w�C�9,@�E1�@��]mH�        ?Δ�mI�@��Ѭ3�@%��HZ@9����m@H�m�kqR@U2�h~@`�?\��@h^[��#@q,��8WD@wc
��A�@~��
/D�@���,c�@�C�Beh�@�Zz�\�@�#���C�@��P��,@�`��%m�@��[�3@�����r@��ǲ6@��M!^�@�5���@��,�W�@�� ����@�j��4@�e���a�@���p��@�yPw+�@�B�AN�@��(��@�.,sl�@��GC*��@śh4K@�xkL���@�p��@˃+��@ͱ�=& �@��}hI;@�3Q8Bxu@�w-���@��쏹g@�/:oD�@֤ˎ�#@�,E�["�@��+�N�@�r��[��@�2�0L��@�]j�P@�u�?I_@�r?���!@�x`���@���`@�=��r�@���^�<4@��f����@�&���i@@�f���m@� �N@��t�@�d�-��@���B;�@�"��@��-�h�~        ?�h���7�@"�d���@=��w�N�@Po3� �R@]1u�Ҩ�@f�<dx��@p��b�A@wG����@f��@�)Hy+A@��O,�@@���UN@�pS��@�xNuV@��#��@����B7@�]jg�Ɛ@�{4�p@��i�'@������g@��C1�_@��u���@�`�� ��@���!�!@��TMo��@�k�S�0�@�6��?@��t*<@�y��1�q@�<���k@�e����@�@�vo�@�W]�a�@�1\2�t�@�l���])@��U��eU@�m3�M�@�^����;@Ա�2(��@�S�L�@׀�n�@�����o@چ�j�b�@����A@��u ~@�w!I��@��:��b@��P���@�l�<(�@�^AZ:�@�U.X��h@�Q� ��m@�Tj4@�\f��[@�i橍M�@�|�gU��@�f&j��@별ᒑ�@��w�;@�����@�2_5`@�5!Ά@�����F7        @wH��3\@� �Ў<C@Ƥ�򛆆@ؔ�B�u�@�in�ک�@�n���lg@�I��Rj^@�?�f��A%��ȧ�A	44���A�}�7?An���A�^���A=o4_�XA�"T`�A {��zIA"��y	lA$���*!sA'�H�:mA)�*R�RA,���JA.�I!��A0�KA���A2W2�A3�d��[A5D��W�A6����$�A8c��i�A:!�-�A;� ~�D7A=��F���A?�X����A@����NAA�����AC
�Md%�AD)d��AEO���&pAF�{�AG�8���AH�`�k�AJI��Z4,AK�3D�GMAM���ANtـ�p�AO画Q\�AP�1w]��AQ�����ART$%��AS)�\��LAT��&�AT�"٩�AU�/�JvKAV���1AW�`L�{AX�8�b�NAY��ja9AZ�VVo<.A[�J3M��A\�)$l{�A]���5;�A_��&��A`��ϝ-A`��(��        ?����U��@����`@,��Ȅ+@>Sf�j��@J�<�d}�@Tß&,en@]�G�.�@dT�$���@j�aJ�9@pૺ[O@t�z�U)�@yi�@ݶ@~c*o8�@�������@��8m���@�eAm.@���vaw@�Gh$�@��䍋�@��#y�@���'��@�O����@��m�Cv@�l�r
�@�����K@�����@����O@���R@�2I&�2@��|�s�
@���ԨP�@�m���h-@�Nt��9@�@��]@���n��@����,��@��sz$@����G�@� m:�;s@�-&cW��@�bJ��*�@�����dz@��D���9@�5@Ӥ3,@���TU�@��a��]|@�V�5t�@�d;NQ�@�!m_�00@���p3qb@¨IWt"@�q��Y��@�?��iy�@�G�?.@���O �_@��b[�S�@ǝ��ه`@�~[��Y@�b���Y�@�Jx$��@�4�((Tb@�"��^��@��G��        ?��<�Nd@[O��d\@;S� {�@P���z�@`w
8��@l�.^~��@wA���@��N��U�@���l%�@�$�S�@���zNX�@�)i�q�:@��g^�>@�����@��;�s)@�Ek�r"@��;���q@����@�Fi�p�8@��iU%g@�mf�2�@�	^6y>@�ǻ�}7�@̧$�W8@Ϧ6M�m�@�a�%/@��9�3r�@ԪuXQ�@�b�k��>@�(5nV;y@��c���@��Z���e@��=�t�_@ߺ���U�@��]�m@��¤�i�@���G�f�@�d�Q�j@�);	Q@�M�*��>@�zX~�R�@����@�]>f@�7;*��@�g)	�@������[@�I��_�	@�[Q��{~@�����@�Ӂ�55�@�]Q[U�@�W�+�u�@���T@��[�n@��i!Z�~@�x��eL�@�C��C�X@��0�@��N���]@��4���@�y����Q@�J��g��@�f��©        ?��jJ)&�@'�l��9�@D��x��@Y�vW�8+@i�=߱@v���L
@��e	�L@�	�UQ��@�";�J�@��	�I�@�"���28@��� �j�@�������@��G���@���ˢ�@������b@��f�� �@��!'(-|@�{�y���@�R��\1@�g0�[@̽m�)T@�,�Wace@��Y�#�@�:@«C@��y��@���BB&D@ۑ�
�5@�c�&s@ല_�{P@�R"R��@��:L@�߼���@���a�L�@��$��T5@� [��@�>�"��@�J{�I,@�"\-+@����W+@�!��X@�e�I;<�@��V��]@�0�+k�@��m\40�@�!Y\�2@���Kw@�50�%��@��V�Sf:A ����t�A����RA\�=k<A5��<�A�ƇN@A��?u��A����A����A�w�rs�A�@��X<A	k��,'A
X�'�C;AH�G4��A<�(D�        @��,ռ@�Hz�U@Ӥ�LQU�@���ۭ@�Q;���&@�m�P�DAC��<xAL�O�0A���mdcAnTWE�A�0$��A#H�!dײA'{Ԍ8-A+D��'�NA/��i�A�A2A[���A4ʱ��UA7}�`��A:^%P�A=n�g0R�A@ZZr��AB�Œ�oAC���VTAE���8�AHX��-{AJ@#�fAL��=�AO�PGAP�\`�{AR1|���AS�I8s�AU!�xf�BAV���c_8AX_���iAZ���A[�W�'�A]�����A_�E� 9�A`懪�SDAa�M�e�pAcQ-fy�Ad"���AeG ��TAft[š�Ag��P�6WAh�jտ�Aj-�*��Ak{�h"5�Al�Z����An.9WCn�Ao���@XhAp}�c��Aq6 �h�Aq��g�Ar��g��Aso?-m?At2��W�At�)$ȆAu�E�c��Av�;L��AwQ�,A��AxG��rOAx�Z$?"        ?�@��@*�����@��˺�@-����Y@9��8'�@C�lKF��@L���-�A@S����{�@Y�&���@`Q�HŮN@dMg�R��@h�;��g@mˏ�W�@q���;�@t�ȯ�`?@x�7�gj@{���\F@�<��w@�]X��@�h�-�_@��&��@����]@�v��?־@�������@�^ 7�	�@��4j��@��x$��@��xI �(@���ܲ,@������n@��:��@�h�ߓ�C@��k�~@�,���p�@�}�o��@�ݥ<n�@�MI�x�3@��L�,Wq@�^;�>p�@� ��x)*@������@�z���@�*r@8@� R�d*@@� %��yW@�)v�Y�C@�<+Dn�	@�X<h?�@�}�^|��@����:Y@��c�i�@�'��Ϧ@�tb����@���=��V@�+Zh*�@��Ű"y�@��
�Ŕ@�D%é"�@�3�{O�@��+�b2@Þ�C4d@�qq0���@�HsÖt        ?ص,�왶@�Ē���@%"��
TX@:��ni�l@K��|@ZC��i�@f��O>�@rπ�:R@}a���~@����~�G@�����$@��u�څ@����֧@����*U@�P�h���@��W,�@��'N[T�@��ʨ���@�����r3@��,���2@� �`�@�c���@�s��� @̭�����@�	���\@��׼\��@ӯ�*��@դwI��@װJ���@��#X�%;@��ti��@�f�:@�jGI��@��u o�@�����b@�Y��Wk�@��շ�a@�2���@�nLր�@�5��i,�@�����F�@�_d�O@���yt@�V�I�	�@�1����]@��ަ+�@���Ϝ`@���mP.@�ҷ����@�ɻ��Ԝ@�� �Jd(@���w�5@�ի��m�@����j�@����2[@�	��'p@�C�x�@�p��1��@���9��IA o�O�!Aj�A��A��oIA\>)z�        ?�j�oR��?�&�}�#�@P��(�@)�_n�@=��=%@N0�o~��@[�ݱ��@gK����@rvL���@{�t��2{@��9����@��^����@�y��zL^@��g�;@��=\([�@�;mԪ�@��x� �m@���ˎ7�@�)�6�,�@�O]ກ�@���|m�@�����B@��j���@�6XU��@Ĳ���}�@�b�LB�j@�G�3�� @�bëNk�@�ZrXu��@�l�Ǹ@� jD��L@��I)S+�@���[�m@�H�5�@ܖ7�R@����Zo@�y�Vu@����@�]]�d�@��6���@�&-�>�@瘟at9�@���@ꗦ㫆�@�#�y��@���+X�@�U��~� @�}�Mvd�@�U�N�@�0�Q��@��B@���N���@���a��O@�̹X@�@��.}�T@��G���@���Abߠ@��6�Z�9@���._:@����@�͑���,@��h�8@�����9        @kNʁ�t�@� F��-�@��@!�d@�}B���@�/wǨd@چ�z��@�&���@���Y��C@�
�F�3@���V��@�'=��oKA �d)x�)A+tyA\�z$AI�HUA�b���AWT�o�NA?����AemɄ6A�����A 1j�5�A"��Y�A$&P3>�GA&N�
E��A(�0�Y��A*�@˨�A-�&}-^hA0v=B��A1{YW5A2�T(��dA4s�ӳ`�A6l�(A7�X��)@A9f�7�qA;0��Qb�A=nu8�A?��؛A@�0_�VAA���#�PAB�RN�hrAC�l{�?AEku"�AFU�=F<�AG�'o�XAI��x�AJn�]� AK�D��2AMj��<T�AN�%���APM9 �AQ#�Z��AQ��AR�����gAS�	���eAT�T[F@AU���R�qAV��$V`AW�줽`�AX��?l�&AY��d�gA[�\�!�A\'A9z�/A]SƂF�        ?�َ	��?���B� @��|Q�@&���Q@4��مw�@@ks��@G�͛��#@P��o�~_@U��|��$@\8��Q\�@a�
��ZA@eĶnB��@jPU{��?@oW�!p]�@rn)}*]�@uo�i�K@x�(�#�w@|3�Q��@��mG��@��_�?@�$p�ح�@�kG쁻{@�Ӷ/;�@�]?���@�9�QA;@�hv��@��ɦ�@�`6AK��@��_�h��@������*@�AآD	@������@����b�p@���R7@!@���x�-�@��֟�S@��0��H@��	o���@�֟.Uf�@����V�@���(��@�*�d�@�Tx���@�����I�@��^��~@�����9�@�?�h�A@����M��@����a�@���l�v@�KD��[@��)��ci@��#B��@�m��@�(��lX,@�簜��@��#�,<�@�mC�#"@�3�H�=�@��?���H@�����@���
A�@�g� �vI        ?�j��@��?��C�t@�)-�@0�t'v��@@"s8�J @Ky�m�A�@U���׿@` q03�@g���G�@o�'�"@ueū*@|A�"-Y@����;@��L��k@�I���@� ��T�@����R�,@��{�^��@�9a�K\@@�"=�+��@��r�o@�]Z��"@�j����@�" Q4;�@�)Li�T@�L���|�@��˦��@�G|��@�|:o�5@�}MI=�@�����&@�c�ܝ@�<��.�@�4��8��@�K���
5@ʀ¾ 2(@��(<�l@�Emua@��>���@�@��ԁB@Ӧ�
f͡@�:Ǝ�@֡�M	�@�8-�K�v@�ߏDg��@ۘH�c�@�b��g�(@�>���r5@�����@�Ҧ���@�_�B-@�I��Dl@�Ϧ����@����@�$�6��y@�]wzUfC@�SBb�@��&-i�@@�=����@홟[R��@���U���@�4Ϲ�}X@���3��        ?�!4P�@ =X�Lp�@����u�@/��ϖ�@> z�b��@I8�Ы@SW�XX>4@\PK܍�@c�_.�@kAwt]8�@r(�a*��@w�j-�+�@~PQŢ�@�;K�e�@��Z��\�@�	@�ߦ@��d���@��aW@�
�}��@�|G���n@�9$����@���Q$i@��9,�@�\=��R@���|��@� b?�qD@�*�x�@����	0@@��o�@����x�@����R��@�^��*#E@�)����@����Qu�@ūg����@ǩ\�c��@��Ԓ�8#@���u+�@�^ 
K�q@�m�&�r8@ѽb�lGZ@�^X��@Ԑ�⍔�@�pJ-&@׬���@�U�{ڽ@��ߺ�@�ߨ�y�*@���}@�\/�M!@�a����@�q���!f@㌼�(K�@� =�/�@���Śk�@�"��'w@�l̝]H�@��{�f%Y@�'Y�e�@�Ûk�r@��M�.Y@d�t�@�u��*        @`I����@�aFP��1@�Ӿ~�$�@�@��<@�J[�vC@�|���T@���e'��@��D\l@�i5-,��@��/<���@�/��(@�Մ�N�M@��� O}A��3��A�H��I�A�`�79TAm��\=Ao[A
})��A!����*AXD�yS A�`8^�A ���A��Ӣ��A 1g�cŉA!��`<0�A#�{��dA$���9�A&(��VA'�Ҡ���A)|#}�TA+;ަ�]xA-	��K�fA.��?`�A0g�E��A1c��P��A2f��Y�A3o&�*�A4~����IA5����cA6��I��9A7Ӗ �A8�]��0AA:+9#��A;`��A<����A=�r�ѨA?#���lA@8Iʑ�A@���� AA���+AB=*��2NAB��,l�AC��ѫ�ADZ�wV�CAE"P��AE��pR��AF�����AGNE�bi�AH�ĖFaAH�}�W]cAI�:[<INAJd��f�        ?����*h@!�4����@;
8�\v@L��ʝ@X�b$�j�@cJ�5�G@k༓8=@r<�׿ܹ@w��룝�@}�x�RЩ@�%���@�ց���D@���Ⅹ�@�XQ�y��@��B�	�@�D�Rl�R@�(�]���@�I�xn @����)|@��lS�*@��q��@��Ү�s�@��7���@�"N��!@��V�j
�@�.�L��y@�tJ���@���X��@�gv�'��@� ��N�Y@���ղ�@�|k��4@�bCrl�k@�a� ��$@�u��Sv�@�Mk<��@�f�N0Ru@��nz+@ì��r@����uc�@���T_@�?,qb��@�|\`\�@ɿI���@�	,��R@�Y�p���@ͱ�� �@�ŧ��x@�=:��f�@��%ޠ@ѳݨ�6@�v�"���@�>9�:ޚ@�
�?|@�ܘ�nӪ@ճ2^�;�@֎�TS@�oKB�`@�T@��D@�>c���@�-k:�b @�!L^��@�?6�        ?��r+>�@$���%@@�#}��@S�0�/ݡ@c��!�@q�vT���@}��V}@�$Z��@��P��@�#���m'@�hrr���@��V�l-@��&�L@�y�&��@���`�I@�)�M�+"@�Kx� I@�z�x���@ŖU��@���	�+R@̰b�PE�@�]���\@ґ����@��r�}g@ו��hj�@�l�x��@݁�!G�y@�kEy�,@�7�v3�@�%]̰�@�7>�[�@�m`;��@���0�@�J�oY�]@����1j@�_U���@��(ax@�b��R!�@������@��xL�o�@�j��r@�:;53��@��G�{�@�	��|�tA �`Qd�A�[o	�A�?Q�ݷA�=j�M{A�X����A����fA K$ru�A#��RA	Juvx,A
sj#�|�A�����A���A�}����A-#�VA0o��Z�A�Gt�%Ag�@��A�a�W�A����y�        @0T#V�@Z�ҍ�j@t�4<JØ@��eze��@�;$OTy @�_FO/�@�/�re@�w�*�@���i�#,@����@�Aq/�@�ب�f�@�E����@��g9��C@�g�~M@�)��tՑ@�
/���@�1����@ЗQ�[�@�;�X�j@�����߉@�ď-ԖK@׬��(�@٭����r@�˴�݋
@����7@�1����C@�n{��k@��EFL�@��޶�@@�tǥ��@��Lk�:@�[���@��5b=�@�wBA�9@�<�}O�@��C�y�0@�I�Ȋ�b@�3�]�
�@�%�WԶ@��~@�#E���@�0���X@�F����p@�h���=@��O���%@���2�D�@��#B!@�e0L�76@����@�3A�/hA XC�D!A��<}A�T��\MA�;
WA���&��A�O�`MAkBW���A]@��ktAVb[o�AU���w{A	[ym#��A
g����        @�^����@���*ᄠAk#&.j�AB_���A!����h-A*%�#�A1�	D��WA77n�&z:A<�)��[AA��ƭ�AD�!�v~CAH"y�D�XAK��C�ֲAO�;��zAQ�v��QWAS��E��AVO"<��5AX���� :A[��=
mA^p-C��A`�:pSGAbb�d��Ad�r�<�Ae��e��Ag�Գy�Ai�Ҙ�CAk�����	Am�+Nw�>Ao�B-�-�Ap���e��Ar���p�As?G��GAtm���cfAu�l[`-4Av�����JAx2����7Ay�s�5��Az��af�A|Q�vNA}�2�>A=�A.M�A�`M/��A�&C.AA���2fA���й^A���q��A�f����A�A�e��A�"?l	�9A���8��A��e���A���	6H;A��D��F A��NL�ρA���E��A��Θ�O�A��Z��2A���@�՝A�b���A��<�Pj\A�(�,�NA��1f�K�A�T3O~�`        ?��l�-@��-�sm@!��J�X@3
�2��@@ȅ<�vR@J#���Q�@R�}w�@Y���~@`����@e��'H�@j�Y�Y�@oz��і�@r��<fZi@u��H�@y�X8Ȑ@}L���'`@��^0�@��"�FV�@�-�_�M@������@�<d��@���&~�@����l��@�s��+�@����i�@����M@�xU%q#G@�N�G���@�;��#@�@z�@�\y��@�G���Yr@�m��d+^@����K�@��6��+Y@�%�®�@�{�N�| @���∷/@�O�W�x@�̜�J>@�W��v~ @�����@��&��@����WE�@��u��'v@�n$(#�+@�\�RT�@�Q����@�N&C��@�Q-��"@�[^ /�@�k����@���d�?@���2t@����N�@���6	@�$ړ%_@�^�F;ӊ@�O����@�� !�H@��*��}@�H2=2�@����(�V        ?�ͩTM��@:�`�w@;x�f��@P�`���@`�Q&�@kc���@u�b� �@�3���W�@�`�O�@�]��58|@�Z9�`�@���]���@��:��@�/"�a�2@�ܖ`G�>@���/
�@�O澜�_@�_&,np�@���9֝@Ė��[�@���(��7@ˎӄi�y@�k�YD@��4䊑@�񄂚�@�=���-@ب��
��@�1�Y��@������@�K�����@�_&�##@�4�F�@�6��,�@�RoOmvv@�����{�@���Cy@�v����:@�R�w�|3@�CL�T*�@�U�_�@�" "@��xˆSq@���D�N@�Ve��@�:�����@�n�t�	@��)#�!�@��F����@�!��*X@�dL�qo�@��O���@����WA �_��6A z��Ai@�j`Ae��A�mf�8�Ae�ȴ�AZ�BnA�-�P��Ax���A1陸�vA�"�`�        ?ݨ�;��@-Y�_G�@*ɺҹ$T@@
1��CE@O�d(�@Zs�I��x@d��(�b�@n�����@u�e�D��@}z�.�?�@��{?ϼ�@��%|&w@�L@�P�+@�y��D�@�Y��s�@��4r)	@���M�w@�p�؊�@��V���@�\:5�O*@�Tzs��k@�I�kP'b@�����@�;�Q�=�@�"�9P[-@�\}tv�@�Ήn�|�@�{�{z@�gIt��u@͒��0#@�~r���@�S���!�@�G�����@�Zz�z^�@؊1�}j@���$���@�<�q�{�@߼����@�*��\�;@₊�1�C@��y�*�Q@�R�G���@�ʼ��e@�Lx�5-�@��ޗ�@�md1u�'@�W��@�W&@�38Ua�.@��<�1�@��Z>@�����x�@��c
U�@��c���@���pA�@���ZB�@���;{�@��s�z@���C�C@�����H#@��w��i@��k����@��sM�        @w���xGZ@�����@����2�@�ۢ'��@�߫hah@�>����@�>V���c@�iU�h�A`��h%A	��=A����A8[��A���{A�hc��A�k6��A!����I�A$ ZL^&�A&�ڴ�`A)���d�A,��C��cA/�[0�ɚA1��!㦠A3^�Y]uA5DAU�A7Eu<8�A9cfטeeA;���QR0A=��^�*�A@<�m�\AA���@�DAB�~�puADf&��AE��!��AG��"��PAI;��%{AJ��i�z�AL�P�3�ANŠ`�gFAPd8��AQo�s�4�AR��)��AS���-AT�^VB7EAV
 �-AWR炊�AX��2#I�AY��:H��A[]���A\���#A^?qMߑ	A_�V�f�A`��(K�Aah��vV�Ab3�����AcN{�iAc�X�>Ad����|Ae�ޱ%x�Aff����AgK0����Ah55>�t�Ai%:�wiAj-�)�        ?�U��s�[?������@U#��`@#��Q�\�@1
{
tG}@:T�!(-�@B�T:LS@IolF� X@P����@TՖ�%/�@Y��Kj��@^��ݥZ@b`B+��z@e���K�y@h�\B�N�@l��q��@p;9w�a�@rKV*�3@tyh��U-@v�[�~Z<@y2��a @{�W��5@~l��c�6@��:|$�@�=�`�N@����'@�>W����@����\@��^�e@������@�gc0 �B@�a��>�@�8>~��@�I���)T@�f�?�@������@���ݛ�o@���P7�@�?���/�@���v9@��/��ݻ@�N:8�0�@���I,@�2�Z�g~@��%�>P@��?�L}@�g��h�@�5�:d1�@�C����@��l0-e�@��׈��@��-�9>@����1@�im:��@�VR�:�@�G��SJ@�=�)�a@�6��:�Q@�4�}�	@�6��d� @�<�H��@�Gp�>Y@�+a�P�        ?�B��,2�?�o���@xa�@!Ѡ5�n@1"��w�L@=|r0Ř�@G�Z.1�W@Q�ǣ��@Z�[�1m@b>�-��@h�b��|�@po�I��@uI3�TF�@{UL_�@��cK�@��]��@�3џ�GW@�A&-���@��19t�l@�()���@��}B��@���I=�\@�o�b?��@���v��2@�O�l�p�@������@��s�&i@�6�p��@����E@���x��w@������@���Q�N@�ܣ,if@�/�rE�%@���Y�t@�K��@�wo��B@��n���7@�`��~@��7�R@Ǐt��6@�B4�2�@��sf�@��A���@���k�%@�h�3���@�u�p�_@Ҍ}���@ӯ�.PX@�ޏ*Ч@�ۧ���@�a�M��@ض�| ˃@�Uf��@ۇ=�#��@�D#��n@ތY/���@�-���+@�⌋�[�@�)��+R@��Sn_�@�{��M*@�e���;        ?��1���9?��]t@7���Ez@D�PA��@(U+h�@6����] @C9��<	@N����@WuL�8v�@a$u^/E�@h2���
�@p���YA@v'v�R��@|�\F~@��s�@�X�Z�Q@���虞@��째ɰ@�T�Sa�@�qs���@��H�0x@��B���@�[-�E@�i�]T�@��n���@�U'�!yd@������@�0��͢�@�l��6��@��B�W,@�^�}ǰ@��\#n@��{ ��@��E�*�@�#��|q�@��xNc�@ƥ@�a��@Ȉ_�@�1@ʂ�3q1�@̔	�#A�@μ��o@�~�|]�^@Ѫ�<���@���Ɖ*@�&�o��@�v�,֖;@�ҷj��8@�:6��t@٭?X@�+���i�@ܵKx��@�J�g2A@���"�,@��bo�6@�dag�o@�ʞ��@�lh�Cg~@�X����@�Jۋ�N@�C4Km�@�A��ѽI@�FЍ�2N@�RN��        @U�Jp�_�@��ׂF#c@�{� ���@��ש}�}@���u9C@�o���
�@Г�5�e	@�4����t@ܖ����@���̢3�@�����j@��O�Ov@�ˢٍ��@����m�@��ta��@��F�L��@���M��q@��FR �A ��O?�A�|��yzA~��G-;A��s`dA��-��A
�1��)A?��6�A�[�1iA݃Aq�h;��A��k�AB��1+A�d���AOJ��sA�OļA�/'FΐATڮ���A(v�xA {�cO��A!n����,A"h��T�:A#h���A$oæ�tYA%|���W	A&���k[A'�Qb!�JA(�K�ˤA)�a�ʯA+�?8F^A,Nϲ��A-�0���A.ŭ^xP(A0%�~'�A0������A1S"�A1��6��sA2�fȸ��A3^�]�"5A4k�q�A4���DkBA5���	�A6C�J8�A73��:�A7���*�A8�z��z�        ?�:�!?��>%�@ެ���~@*�}sK�@75��œ@B:�r�Ĕ@Ji{L�@R����@W�چQ��@^?�d��@b��k�@f��U;e@kU.��@p!s��}@rэ�F��@u���2�@x�lz�!@|B���*@�����@��[�fb3@��6��;@���mz@�R	.�j�@���s�@�4O��@��Md.��@�DC� @������u@�%7�{��@��Q�p�@�=6%�v@��lp�;@����a5�@�J��(@��p/�!@����=>@��4��?@���}ֽ@��嚕�@��7
�c�@��)�C-@�,t�-�u@�O��V�%@�zO���@��;�,�@������@�&_���@�n�#��@���R��$@�R l�@������7@�ne7g*r@�%��^��@����m�t@��GrM7@�aKAb-�@�' )���@��'NW�#@����䰼@���'�"@�_ϩ�@�6]�iu/@�H&"w        ?��|Z��X@0��(@+�����@>��cF@L>~��@V�ZRڂ�@a_��U�@iX+�U@qV�3w@wY��7O@~�U�d�@���=�6M@������@�V�L��@� !� x9@��fܟg~@�sz�ke@�9�[3��@��Q	K��@����iZ@�c���2@�▌�s@�{���~@��O��$]@����pV@�Sq��4�@���BA@�����\�@��:Ґ��@�Y?��N�@��Q���@ĮW��o*@�xM��.@�W&ʼ�@�JНP^ @�S8y�@�pD��Ws@�P����,@�s�G�-T@ҡ#�9�@��{)�}�@��AF��@�e� ���@׻1*���@����n�@ڄ�B��,@�����u@�w�m��@���w�@�I�]j[@�ya�=�@���mUT@�å�Q`�@�s��an@�r�6@�l��12T@�Z/4~�l@�M��=F@�ED��2@�B��F'"@�F#E�0@�N�׈�@�]5NP:�        ?�;�L�o_@TM��� @1\�&�6�@CD�|���@Q�)�`�C@\N���W@e?Z@�@nM.Ѱ��@t�x���>@{�����@� 1�3S�@�5w�͏R@�?���@�,�S`X�@�O�b�@��G�ۿ@�E��'�@�_W���@�޾�3��@��>�1ۃ@�,[�C�@���n~?@����C-�@��g�]��@�⣕z��@�d�};6Y@��ҭ]@�"���O�@�R� e-@Ǧ��**}@� n`t@̿b�PI@σ�]3@�6�KĒ@ҿ	�}��@�Zlq6@�	g���@��X�s��@٣���qO@ۏ���Pe@ݐݔC{D@ߧ�~ʵZ@��&[?�@���HW@�8V����@�pT `,J@峕�w�@�r||�@�[��
�;@��2EjR@�/�Q���@����m @�.��7@�U��@�#�:Q�@�~T/��@�U�⤺�@�2�{�=�@���)�8@��o���@����zЦ@��Mگ�J@��Ҥ-�        @t S-�=�@�I��yf�@�ߛ��gu@�݅xh�_@��a�6@�$nZMw@����9�@���{ak�@��3�S�A M
��|Aͳ�%A"h0�A�b���A�ï�y�AV���3xA"�-�9A�E�zAH�<��A�j�A!�ݪ�T(A#s�5���A%hC��}A't�r��A)���_A+п��A. ��u�A0C[�_IA1��H4]@A2��`	U0A4�]�ŌA5v�p��A6��A�(}A8K\��A9��d�L1A;F[v�/)A<��o�3fA>i�?&�fA@1D�/A@ڽ�̪AA�R���`AB��8�`�ACx�-���ADa���)�AEO=<ԼAF@ɻ���AG7�.��AH1���z�AI1�/u��AJ6O�IAK?�0�ALL�?	�|AM_׬߻ANuݐ��AO�	��zxAPXD,�1AP�"�=��AQ~[%�AR*8.��AR�LN��ASF}j\YGAS��� AT�Q�AU!do`        ?�g�m?�{��9�@�~	@'JD����@4���c�@@�k�d�@G%���_@O�c�dO@T��s�8%@ZEci̧e@`J-��ʟ@c�[S��k@g��.��@k�.:��z@pPW�4d@r��~���@u�e��1@x�pS
(,@{��uX@ 6��V@�I!��@�-�<�@�.��@�I��C�N@��CZ��@��a�©@�C�{B�@�g�=�@����*�@�64�a�@��4�{�@���6m&@��Q��@�80��a�@��3��rS@����-��@�a�L��-@��69>@���"Y@�	'a�@�m�KF@��Y�@�'��6#@�Av(�T�@�c<�(�_@��ћ���@��#�F��@��&9^�`@�7�*�@��	���@�ϻ�:\@�b�-P�@�עuO@�u&��@�+G�l U@���I@����W+@�blŨ��@�&D�V1@��a�fs�@���K��@����>@�U��}        ?�$}��?��[�s��@���Ru@��,��`@.g$e���@;U��>�@F�J�-�e@Q��*�+@Z&�ز�@b��H'��@i�E�|�@q^Y�PI�@v����s@}V��Z�h@���׻��@��++@�B8^8B�@���1�@�z�uڈ�@�D����@�}:�}��@��ǲZ�@�&�2���@��W��[�@��r�k@�S�\��4@��b7}�<@�۷��!@��(�ON@�=�Wbk@�fѡ$�@�����@�@�w��E@��F��h@��WʼQn@�͂Bg@ĳ>��sN@�c�rw@�'�VEGp@����=@��`#1@��|u��@���<	�@�'yƉ�@�O�ٸ�^@ӅM�n�@��F���@��Y�{�@�w���@��gPq@�^��)Ä@��_⭡�@�}�9��s@�"`��O�@�j2VK��@�I�B��e@�0/�bq@��J�B,@������@��#��S@�yr��@�C���@@��)�2s        ?��@���?�3Þ�O%@�S�V_�@(����C%@7�D\S@D`�z({j@P'���̛@X8���}@agJiໆ@h-?7?�!@pTx��X�@u�� ˰�@{ۨ=p�>@���3%@�"&���C@�NC��@���p7y�@�4�?[@���´�F@�L���@���͵@�N_�"Q@�J��R,@��b=�F@��c#�@�zUw��@����t6@��:���*@�!&��._@��&�U1N@�R�	W}K@�(C��&@�r06G�@§���S@�QO�0�@�o'KU�@��[|ĆO@��PUA
@�р�a+>@��g�C�@���tQ�@�.�Բ�@�\
X�@ӕ�H�
"@���S��@�+�=X�t@׉?���Y@����%��@�iqqM�.@���e�}@�}��O�@�-�m�+@�d:R,)@�AeF�A@�%�6B��@�9G��@��c/@��v��ph@� s�/�X@�
==�j@��A�@�6JŜm@�Xj���        @Y�i鱷�@����`n@��,T��@�d�0A$�@û�V�=@ε|�T�@� f@��.��?@�~��ؘ@�ʇ�#�@��(R�@�}~�@�2�#+�@�'(�i��@�w�c��A�� %�ACA�ʀA�&g%:�A	�ű�(cA�;���A#9_M7�A�Jk��A�/����A�k��\Aط!�iA��2�AJ�ϩ�A����A ����A!�z��^A#+�C��#A$��\�vRA%��%ģ0A'r�1SqNA(�����A*�D�nA,$�H�	[A-���xtbA/��ސ��A0�~xWA1��ɺ�A2yI��XA3n,i��$A4i�
���A5kVwbA6s|U�A7���e��A8���J�A9�==%�BA:�?f7�A;��.�l�A=%��sDA>X<�ZK�A?��ԶiKA@g�����AA	��a�AA�x~ABWE�흦ACo]6�AC���m�|ADa{����AET�J�DAE���"        ?���,�@n�ع�"@&��l�@8�R=�@Emcv�A@Pۼ�w�|@X��&_��@`�V�{��@f9q�t�@l_j���j@q���|�@ur�7P@y����@~Rl�a@�|�$�m7@���^�t@���ah�@��ngI�@����d@�$_і��@��P�	�@���2���@���R�@�ӎ�{6�@���z�@�[#(
��@��EϠ�@���J���@�	���h@�s��o��@���ą��@�x�MD�x@�I*��@�Ãȝ��@���y��@�WB��G(@�=V-W��@��6B)�@��Y�ų�@��8	�@���Gp�@��(��@��[ib@�R�fd�6@�����}@��i��@�37��@���D�Ț@���|j$@�lE�u@�s߬-r@�6��.t�@��6KA	@��9_1k@Ú�O��@�o��߇r@�H�P�B�@�%�!\��@���P�O@��\1I�@���G{�~@���s�@ʰ��݉        ?��T&"@ ���O<@(�~6,@;��d�S@I뵝_�U@U�����@a_���@i��W���@r�d0�w�@z7�(\�@�͵z�Z@�)B�2�@������@�jR'��@���NP�@���&@��H����@������@��J~9@�����Wu@�R���@�XF�k�@��&���=@�6#���@���,�+�@ٺ��@��w�֩@�GhR;ɘ@��:H�7/@̞R=� @ώ���C�@�W4.ϣy@������N@Ծ���@֔߉�Z�@؃0�w�@ڈ�\`b�@ܦ[�'��@���ߢo�@����k#�@���.?2@�	�6�S�@�XS:�@�I�#ԭ@�!bu�9F@蝋��S@�*�]��@�ʑ���@�~?�';@�FȢ{�@� ���Y@��rz*�@�sܝ+�@�*p�A<@��~��A@���Xh@�A87��t@��
b@��@��P�#�@�V#�H,@��8ʒ{�@�V��Q>@�왮۟        ?�)�k@�q�A�9@"�Nԇ��@6�qڸ�@F\�]�L@S����U�@`�b�s@h�W�޵y@r��|L�@y����G�@��,��)@����&�@��vW �W@�嬱�rh@���ޮ�@�N�e�,@��ܖ�(�@���9�u@�!8���@��ڲ�]@��5��@��$'P�@��zk;X@��ӽ�@��	m�e+@������@�L� A6@�N=��A�@Ⱦ��$��@�W^�<�@�����U@ЃD=�@�d�t�@ӱ�$q��@�j�/<i�@�:u+��@�!҂Z�E@�!	��q	@�8|�0f@�h�YZ�@���XKQ�@�
&A��@�H|�C�@�$�~��@��y:z�3@�T�BC�S@���\`�@�Oq��D@��N5�X%@톭��@�9߸��N@�~�TT�5@�h~Ա�3@�Z��u�@�U��D�@�Y	.�u�@�eJ��@�zr\��@�������@��Г[�@��!�/�E@�)���\5@�k��Fj�        @x��t�a@�ƭ^�@��;#.�@պ���˄@�$�h(r@�����c�@�Y��'@����ZA&�< A1��N��A���̫kA5�)�5A����F�A�Vv6LA�IȁMmA!d�,��A#e�zs�A%�w�q�A(z���<FA+7l!'1A.<�A0���jf�A25�u�A3�6�3��A5{I��VA7F�oNA9&eY�.A;]�� oA=#��w�{A?B���9vA@�d�GlAA�+|8�rAC؞��ADU;)��AE��GX�AF�*��%AH^��� AIω&�N�AKMɴd�HAL����'ANq�S��APT���AP��#R]�AQ�g���AR��`��AS�?����AT���+�AU�ҥ�k7AV��+�uAW���O`AX�S���6AY���g�AZ������A[�����A]#Y�#��A^P�G*A_�OdlA`^��z_�A`�a���Aa�6Η�AbEU�iAb�e�4�mAc�A�?��        ?�$q��o�@��c�Zw@.H�=�h^@>U���@I[L=��@S 0�8�@Z{�7\@a�����!@fZ-����@k��@�*I@p��Q�^�@s�
(��@w`��jG�@{��AԒ@~�����@��1O��@��	e�@�I���@��*��F`@��
d��@����Ҧ9@�W���h@�پ��@�o�q�@����7@���4�R@���U��@��z��@��҇b��@��I��@�v)���@����<��@�Ϣ���5@� Vs@�Z���@���l߾@��t)�@��_�q@@��=XF2e@���y&�@����^@��fvvlO@�����i@��	��@�guO�]@�M�e�A�@�:Y����@�,�8��D@�%��=d@�$�O�I@�*D����@�6޵���@�J�T�@�e�T�
�@�����v�@����y��@��L� �@�����@���/)Y�@�Z|A۷�@������@µ���@�j��D�Q        ?�Z�Fl�]@aWk�D�@!���Bb�@5:w�7�4@EB��U�m@R��E� �@_T�@��I@hf��_�F@r"��\��@y�/6ʎ�@��ݷ4@�!ɣ�p@�� Re�f@�g��4@���E�@�1�K˥@���ڤ@�|�"z�@��@كEy@��M} &A@�(��lD@��6}l�@�3IW�q@��(̩�W@Ï�{��@�k	�q!@ɉ��C�@��_�&�@�Lѡ<j@�F��,u@�e7�10@֪R��>7@��T�F@ۧ�{*	@�`s�"�D@��ֺx�@�"�� M�@㸄Lf�m@�a`M�oY@�$����@����n��@��&w���@��I>l>�@���|js@�p��L@��s��@�B$/�@�����p@�Rw4�@�=8.RF�@����Ś@�һ��2T@�,�_�(�@���!2�@�I�!�@�|*ת6A L�D'FA �5���A��UR¤Ao����AL@��LA/B<�jiAu_^        @�!)�Ŕ@)�v�j-@@y�@.�G@P>��ƥ@[���\@eO�2:�)@o8`�q��@u�<EcH�@}���8�T@���P��@��$�By@��t�v$@���n�i7@���/Y��@�lbs���@�{6�E�@����!|�@�rR�3�@��h��j7@�����6s@��D��,�@� �M�@��pO�U@�O �I�@�t�=D.@��c>�Q�@�6�X�.�@��h��V@̗�4�A-@σu~i��@�K9�ڢ�@��.Bw{@Ԙ��"QS@�\q���@�4(��5�@�����@���g4I@�1^�S"�@�+قJ@�Fj��^�@�jo���@��:���@���4j�@�	?�b��@�O&0�I@�g41�R@��q+�k�@�THM{@����@�.��Җ@�=�}@�D=��@�^>�&V�@�*j'q;@���4pk@����t�@��8�Թ�@����Ƅ@�s)ĕ�0@�^�b�P�@�Oe��]@�E�;�@�?s4Wj        @�QJ���@��զ�FF@�E�_�ȕ@�45�.�@�3��@�@�xb���@����uA?c�gv�A	��,��PA�����3A*��W�CA��_A��Y}�PA���A!�~`uA$qwi:��A'1t��$A*(����A-W�V,��A0_�@V˒A2/�q&�A4,W˂�A6%�$�A8JX��l3A:�Y��4AA<�acV�`A?g���AA �8��AB\���AC��\B?�AE?���xAF�y�LhAH]&�J�AJ }�xΠAK�����AMpu��ãAO=j�Ͷ�AP�[����AQ�H7X�AR}��w��AS�9��G�AT�k����AU�>%�lAV���W&�AW��$AYW�J�AZ8Ѕd�A[r0UN��A\��Q�5�A]��fi��A_T~*�hA`YbE��Aa��t�?Aa��p���Ab���b�AcI�k�ϸAd���KAd�EUG�Ae�.`��BAf�U3�N/Agl�	�d�AhOs羃\Ai7��_�        ?��y#@Ee��@Y����U@0d�/Vl@<��IѰ@Fgu��m2@P��:�@U�o8�0@\��HI�@b�E���@fX� f��@k��h<@p+�G�Q@sc��@v6�r�6~@y��#OV�@}Y�^=�M@���+I�@�γ�L�u@���7ѭ@���S�G�@�H�|W@����I@�@���0�S@�Z$;#[@��]bM�@��S�Mz�@�^��3�@�6v� ��@�$㱘�"@�*f�T-"@�F�H��@�=�R�)@�a�4�b@�����;T@��y�
V{@�>�6��@�c%�k�@��I�jy�@�&�-��@����,~�@��Yȼ@����v�@�4�I���@�i�2�^�@�>&�[��@���޸E@��P�]L#@�ٸ3��@����J@�����f@��6Q�_@��i���@��Os�8�@��ܞ�;*@�����A>@������@���-�3�@����k~/@��:f��@��,���@����֍n@��+�B        ?�u�_V2?� O��o�@`*����@`���&�@)8ʃ�S�@76]���@C��y��}@O�~�4G�@W���Z�@a��G��@h���bVr@p�|��@v��E�^�@}oiZ���@�۸�Gj8@�ŽR�@������@��"�:H@��S��@�Z*{Q��@�N��_} @�m��ew@����M�@��^c���@�������@�d���H�@����3�T@�7./�4@��71��@�~���@����S+@�b���.@�3M�\@��z�f�@�➞�z@��9d�@�#*�)@�_�xbf@��R�=�@С-E��@��Y�w+@�N��n�@Խu��0�@�<z�ϧ�@�̞3�M�@�n��W�@�"��`K�@��`��{@�ŨGp��@�Z���n@�\��:@�j}J��@�]��@�X�@��f嫮�@�Θ[�@�R!�q-�@����@��ɱ�X@�g |?�@��Ն��@�Z�VK�[@�s3��v        ?ΈJm�q�?��¯�Ik@�.��fG@.��!ۥ�@=�D���@I��s��M@TQ��@^�
_s@�@f	�
"�@n��in��@t��a��j@{LA)�@��ss�0�@�7*;�V�@���ƕ,�@��tnp!g@�]B�C�@�IŇU�@�����Xf@�����g@�j<��%�@�S�(�`�@�XN5�@��8���(@�S�4�@�S��"�>@�{��@�ˇ���6@�F�=@��z�۳@��|Q�A*@��d�"U@���@�4  S�@���H��t@��j��4�@�����@��5E?=@�B��zQ@�-�2�x@�X�9ԣ@Ҏo�au*@���05��@�/)m��@�o�Iq�@��U�3��@�;j�6@ڱZ�@�2Y�?Z@ݾ�_�Z(@�VW�И�@�|ٰ`@�Tc����@�1ˡ�5|@�jn�@�� Tiz@����@�����%H@������l@��i�ʭ�@����a�0@��\���@���yar        @c%NF��/@��|:츂@��&}�@�`��u@��+�Ȯ@լf�v��@���d���@��ӊ2@��?��@������@����@�\��`b@�(��A�XB�*�A����e7A����p]A
��!�UA��)�/A'Է���A+q0�AK�k��A��Or
*A��=�A\�Gm�A�ki��A Ѧ��o�A"9C����A#�����A%58���>A&�߁R� A(m�g�A* �i��A+�?���A-��X��A/��d���A0����@A1i�{A2��|АA3�`Mc�A4�k��(�A63�m_ A75�� ?�A8c�C��tA9����B]A:�!=@WA<	'%��A=h[f/%�A>��\dD�A@m�pڕA@�jÌl�AAp�6��AB(�ld��AB�9J�aAC��}vJADed�n�AE*��L)AE�Meh�AF�f�}�AG���مKAHa�4ޥAI8 ǭ;AJ�0�AJ�_�S�        ?����w�@��SF@����m@/A����@;?��#m@Ef�1D�{@N�`ϋ�@T�J����@[Oa��@aL�p�$@ef"mJgD@i����@n��7��@r:N� �"@u2����@xg\O9$@{س���@�a��:�@���8��j@��3o� }@��xg!�@�h�Cg�E@��u���N@���e�B@�#�@��4�J@���鲼@��ȧ��H@�SιMH�@�
�J��R@���Q��@��eM�Y@���?���@���:8�@���n�Q@�����@����k�@��bu�@��h�@�G�;�i@�xCJx$@����PJ@��l�>m@�8'�8׳@���)2��@�ܰ��@�9R�yI@�M��,oL@�fǤU@����&:@�s�
v�@�0��I�@��S��?@���H@�v�w�U@�=���l@��i �@��V���@����5٠@�u�%C�@�J���&�@�"�~��@��}��Ҭ        ?�0�g#�@ �%�j@Ւ�>�@1_Cs#i�@@Z�4 ��@K>�<N�@U�;`�@^� Jޗ�@e�ϐe�@m���j�@s��ĩ�V@y��}vE@�p7:cP,@��b�*��@���*?a@�J����@����)@����He@���=#r�@�2�!
��@�$�|.NM@��D��H�@��~.�m@�{��J��@�8&�q�@@��#kB@��T��Hy@�G�d˔@��X�2V5@��R�Ҽ�@��� ��=@����g�F@·�>%@Đ͔�ŕ@Ƈ�c��d@ȝpt��i@�ѱ�Mn)@�%ԙ��@Ϙk6@��Q�@�o>����@��z��B�@�Tv�r�@��_���a@�}S��G	@�+c廒@�����d@ݺ�~QQ�@ߜ�r���@�ǩ����@�ɱ7�� @��hF���@��ۺ�@����@�)%E���@�W\7X:@��c�a�@��k5�4@�����@�g&NO�@��2&x{@�#�R��@�G� I�0        ?�"g^��?�ꃹ�/V@K��4#�@*���A�@8�q���u@DM����@O�ʍ_@V�,��@_��H3N>@ezBH�_j@li���_Y@rm�	/��@w� t�n@}���6K�@�a��j�@��3Up��@�m���@��˷�]�@�����P�@�K2��@�Zͦ���@���rW�@�y��Y�@�Ds�}�@�Uî��@���@0�@�S<[j)+@���Hy9@��å�%@���c��@�m:�(O�@��[�a�o@��k����@�Eʡ��#@��	9N:F@�S����@��	2ND@ƥB̲�@�f�u��@�8���Z�@�
�'@���pPZ@�"�(j+@�����@�#��q�Y@�=��@��@�_�d!@Պ��؅�@ֽ��9��@��>�M@�=M�u��@ډ��c9@��S�� G@�=t2�b�@ޤeXu<�@�
�A@��]�S@���ݷ@�Lԡ�@�`l�Ǐ@���8_�!@䴺��"@劗��        @k�����@�TS�#�D@����[��@�~��@��;H�H@ުӞ:Y�@�˘��9@@�Y�( �@��xW�@��EQ)y@�6�2�o7A��,��iA�X/��AE�n���A�E��Az�$��A/lw�7AyR���A�G�P�}Avy���A*8Q�ۚA�5��A ��?vXA"�T��n A$2!��A%�;U��A'��Ŕ{�A)�J�(6�A+s�����A-p�d�A/~�j5OxA0Ρ�b�2A1�4��RA3ι�kA4-Fn�*�A5\d��mA6�l��1A7����A9�˯8A:f�YkOA;�t��A=.��g�A>�*�ꮨA?���)+A@�!�T��AAp}�RcAB2a�*FAB���<��AC�-� �BAD���2��AEZNa�AF+�㼿�AF����AG�ٯ��AH�$��IAI��f�xpAJm��\�AKP��r�AL6a/�MAME=] �ANI~�L}AN�w�6�=AO���u        ?����	f@�~ �@/e��-�@@�"����@Mc���Hz@V����r@`�D-V��@f��c1�@m��(��@s4��=�@x,m�4{@}t"thk�@��a�޶@�}��@��PV��@��c��G@��qm�@��Ku@�w���N@�/�E�@��~�x@�&�$��@��+�0�@�i�I��@�7E,�c@�p��@���M0@�/����<@�_�m�`�@��B�\@��žIS7@��k	�`'@�(cҜ�@�t ��]�@��{X뙅@�Yh;,@���v��@�y�%�_@� hɑ�&@�����`@����ӱ�@��%�JM@��:+Wm�@ j�(�@ß~iD��@ĥNs4�@ű��n�@��&�u."@��`����@� ��4@�(�z+�!@�XO~| �@̎�R9��@��ț��
@���AХ@�,��-!@���S�B@рz�0@�.��=�@��V|��@Ӕ�Y�j@�L�5*@�O�[�\        ?���Y"@
��nO@%���jE�@9٬;�΋@I�˂�.K@W�
S�@d4�ԫ@p� ����@z��c�@�����Z@���N0u@����J�@����j��@�Zw&�H�@��\�E|�@��e�^�q@��z�CMN@�$�%Y�y@���E"@�p�-)\@�=:�hQ@�uq2�4�@�l@�@җn�>7�@�Y}b?��@�Tr/@ۉUZ7y)@��U�l$@@�R͈L�@�G~�ّ�@�Z��lO@�cZ�<@��/~�@�E��^��@��!A�{@�-k�Y�@�"'5��@�n�z�A�@��o���@�M�'�L"@���2�$'@�G��w�b@���_��@�U�د�@��Ae+@�sj4K{A ��W��AR'8��A".SD�A�� B��A��9D�A���j��A|6��, AY ���A8zfX��AQ~�L6A�wԅ�LA	�ę^5�A
���A�U�f>$A�{}*�A���TlA���8��        @�lRm'�@4�u��c@R���`@d�_c@sZ���E|@Wq�M)t@�_�Qh�v@�~F��S�@�Y��޼	@�W�bJ�@�Ţ�(r�@����ӱ@��<�H.+@��>TJ�@����R�f@����<.@����߲@���О�@�O/���@���,U@�	��v�@�<R�{�@ϩ4���M@Ѩ���@Ӛ�#��@ի��Y8�@��4T�a�@�-@.Mb@ܟkCٰ�@�4q;�H�@���h���@�fX{%�s@��	��@����@�0O�9�@���4	�@���;�@����!@��~	��@���
Nq@��\3�@��d.	q�@���գk@�j7�Q�t@�ʅiV�C@�;.��@���N�t�@�PPi�@��Kj|@���7���A =C��pA,w| CgA%T����A'�ԻH�A2�g���AG(m�Ad$/A�&5#e�A�I�t�A	�5/ҿA'E��Ajz�:�<A�l{5��        @�Ö�0]�@��X-<��@���y��@�%Fq��_@�b� A �(��;�A���ӄ�A�tdjDA��� )�A}��X�A X���A#�t�8r�A'�?@:z^A+�V�A0i����A2t�٫A5
djX�nA7�Dj�RA:���v�A> ��A��A@��r��AB��W��ADh=�빲AFi��!u|AH���JL
AJ�N�l�YAM��E�/AOo� �|�AP�s��ARG�yV)TAS���\AUF��QAV��}Y�AX�,K��AY��n�A[M�;�NA]�>�A^�x�vA`Q6��;AaD�v��Ab@��BAcE3�?T�AdQ���rAef��6�aAf�"j�Ag����ɞAh�s��MTAj�s��AkO�B0��Al�_u��Am��;��AoDQ�z)�ApS�K]~OAq	�(�Aq�ֹ��Ar�>n;HlAsD���W�Atp��t�At��^BAu��ǸlAvwIX�8�AwM�Y>YAx'm[(6�        ?�/@��@$�J;�W@@z{��g@Q�;+�!@^~~��`�@gt��I�@p�i�uH�@v��C^�@}Dª��4@�o�V���@�����_�@�[u�*�@�<�5�a0@���eM@��B�C@�;ҙ�B`@��,��@�(�|$@�Z�;@�9�'U�@�5A@3vE@�f�B��@��(��b@� �!
�@�d����@���07@�)n@�?�@�m����@���vFW&@�
j忠U@�c&���@�çPǟ�@�,���@����*��@�
��4�@���G��@����Y�@����Z�@���m!�2@k�Z�L@�h�ue�@�IoM=;�@�.�Q?�@���kb�@�
\[���@� ���Q�@������@���N�2�@��~z��@�&q��@�)�s��{@�DX�O6@�e� ��@�G��X@���\�@�z�s�g@��¯�n@Ҿ�\ �w@�g��Y�@������@��ߺ���@�~\FO�@�:v�\�        ?������@1�<N�a�@O�-�][(@bG��!��@p�3ߢy@{ן�;�@�?|�9[Q@�޵��@����M�@@�i9W&�P@���AQ�@�[���@�,A�Ot@�KԼ���@�Y�D@����_~@�Jv�@�+nȧ4@�Bpτ�@��I"pU%@����6�z@Ծ8�%4�@�Ζ�X��@�&����@����@�[�k�"0@�yىNc�@�o���@�+�'�P�@��S"�@�yB����@�,��XL�@��Sfԅ@�Eh`��@��QD-:@��At7?@�u3�JR@�T���@�Gv�5��@�L����A 2�׷ɫAIm�-AiE�r&@A��_�Aȯ���HAE�0��AR��M#jA����3A
��1�Ar��T��A���.WAg==�.�A���A��{ENA��೜DAbG�e��A8��̕AMj�H{A�d}��A���G*�A�g��F�A��9��?A�{�ј        @���V̡@?X���7�@W��I2��@iJU��2�@vW^QV�l@��!�Y�@��V#L	�@�#��(�/@�o���@���e�Vd@�.�%�3`@����aL@�����V@����MJ�@�ш<)��@��W�O6@��Eع��@�;�C�P@�q�:��@�N�.�e@����9�@Ԍ3�{��@�X�cf�@�d'���;@ݰ�ܗg�@���c	�&@�/]0U@���l@�d�/:<@���'�@�Iݲ�((@����`�@��d��O@�f$���(@�Aϸ�W@�Y�\k@�m�d�z�@�ғ�/� @�=.���@���j���@�#�M��G@���ۋ�@�!H���@��I�A �N���Ac��A.];JQA�/	�[�A́K���A�T� w�At����AL�.��A' ���A=�u��A��We�A	�"�V3A
���7WvA��8�Az�3�AfL��t�AS�g>y�AC�WY��A�*�        @���œy�@�l���@���H��A����FAH'�$$qA�=f��PA  ���A%Q�J�+(A+6��܉�A0���E�HA4c�+N��A846�`�+A<Jf%�AA@R�L��AB�H�A�AEC�`-�AG���7�yAJc/U!AM;'�&�VAPl�z�AQ��/˷<AS9�w���AT۴�Q=*AV�
o�&ZAX:���2AY�zs��A[���)�A]wWS�f@A_B�.p(FA`��P'�hAax��U_�Abk_JY�Acc_cр.Ad`�L�Aed	�[��Afl�d�p�Ag{�
lUAh��z�ӟAi��~ki�Aj�t�Ak�4|�AAm�a�ʥAn?%bf�Aop��ApR�P�eAp�b�(VOAq�����&Ar4 ����ArڨM��yAs��"�b�At2��f��At�bX��Au��7AvS���>!Aw�wcM`Aw�:h�Ax�?fyAyf�*�@$Az7z��6oA{�j�A{�%QޤA|�A(��wA}�C�~�        ?ƛ=,���?��ް�C/@�I��@"�C���=@0�D��:�@:��%��d@Ce6-e�z@J��.��7@Q�����@Vq���f�@[�Es�@`�J6�Y@dYCf��?@h���^@k���u�@p%�a�]�@ru�� cR@t����u@w���<kM@zaY�oD@}\� u@�Aճ9�(@���!N&@���P�D@��+��ڔ@�y�ӅE�@��o��8@����+@�ުWj@���1@�LV���@��p���@��Q���1@�0(�)�@��,ϲ A@���F@��8���v@�
A�cH�@����� �@�AV���,@��U�.@��PC?@�����)�@���d�5@��rLl�N@��U�@���K�@����
G@������@���d6�(@��lN��b@�ݏ�w�$@�8�@��@�-����@�_�HZޞ@��� șQ@�l�r=�@�J�Qs@���7��~@�b�L�Ƭ@�^�O{�@�Ã�@�y�0�        ?�J{I�!�?�l�R�6~@���%YU@�kI���@0��*@@��	�@N���p?@Y�٢�N @dC|���?@nz��U�a@v� i.�@~�8"���@�؃b��=@��3k� @�֦��~�@���@<��@�F �Dq@�b�@�F��@@�A+����@�咅��@��ǚ�]6@�Q��Y�y@�`�p^�+@��k�'��@�A�-�@�
����@�ۥ1@�?�XJ��@Ǌ���?@�������@�|�О�6@�$R���D@��;��J@�g���h@��o��&�@�z���͆@�����Q@��5
�@ڌm���@�\-�`=U@�;6��@�����@��\�@��+��@�#�9�ڞ@�6����@�Nj�y�|@�lr"'�@��˯ @�gd���@���5���@��1�)c@�N3&��r@�^�?I@��--:5@���<��@��9f�.@�O�_��@��Cѐs@�ȯuw�@�Ot>�)I@��:��=z        ?�qoP�I_?�]Wd�l�@T�I��@+�)v$G�@<.5 K�\@I�a��@U�NZ��,@aس�F@i�8b��Q@r�3��x@@zM����@��_�ݫT@�
VM�@�v�˻D]@�7f|�ټ@����O
@���&5�@��%�@��<Z��@�z���@��!�x/�@��%��M�@�A��g�@����%@�9%�Fz@��G��@�"Fy>@��8N�5�@ɘ�#@̬e!�"�@� �ڋ��@��l����@Ӿ�	(W@��-�[�@��{��+@ڂ<UhZ�@�ɴ,I@���hU�@�b��w�b@��%�-01@��{ @�@�@�Y6�@��d��@�܃l:��@����A7@����J�$@��(�t��@��B��s4@�v�8@��Oy�@�BD<@�oZ_^�K@���6�\@��t�l��@�'��j�R@�w
�r�l@����J@�2\`H��@���gw3XA 
t�Z jA �~�P�BA�]�TAX�ݽ        @UM?���@�L����@����3��@�ŀ
3��@�ȅ��	�@�_Y�cU@��'�D�@�[��~@��gM�d@�6�N�@���b�0�@�4�;�]j@�L�Zu@���C��@�GC����@�+9�fI<A)�:�GAa#��eA��:�*%A;�� jA
�PH3A�9H �AL����A׸ő�DAv �HUA'�r6�A�"�n��A��4o|�A��[:A��vqy�A��>��A t\v��sA!��v�#7A"�R�CLA#�	$A% ���jA&c�)�v�A'�i�Y<$A)�^�A*fEɄz+A+ϼ��aA-C+*��A.���1fA0$�����A0�/�s��A1�v3�ӲA2��߳A3m����JA4N��R�A55���?A6"��ӤA7ݛ���A8Q�ʻ{A94��A:�[�A;#r����A<8f:��A=T�:�A>x�{�~RA?�fGS�A@k�Ed6EAA	-YHAA��'�        ?�>��\��?�zM�ȫ�@Zjz�?@&\��D^@3\�P��1@=�uj��@Em�v暉@M!�P2��@S��u�@X,��W�C@]��\4T�@b9�I���@e�����@iƖ�A@n��N6V@qg�'�<�@s�:^;l�@v��95m�@y����1@|�g�7@����c@���5��@��6��s�@�y��(�@�~�͵�@��QL��p@�ҁ�*p@�!,�Ӹ�@�D|��@����le@�ω��GJ@�'c�tES@��iB��q@����ԓ@�x���@��b�3�@��}�`�@�=�K�E@��D��S@�W���+1@�>����@�+ME�F@�`��
|@�A�K�@��d˰�@�$h|%��@�3���d@�I�d�@�g3\��@��m�F��@���{�	>@���ڙ^@�"4���@�bD�I W@�T�X�@��4�5w$@��%-x��@�ROҜ�@�����@��L���q@�m&�Xi�@�'LZ�P@��Ң!)-        ?�g@㭞?�לdM@�S��@r��]��@/E���)"@>?6�g|@J��"�@V};<�@a!�qd�@iUs�)�b@q� �TH@x����KQ@�U����9@� ���t@��N�zC�@��P*`�@�E�҈a@�j֬K@�`Q�yD@�����
@��?���@�\��@��e��y�@�H��z��@�3@F�@�r�@���UP�@���G�@�v�x�@��.�y�}@�����@���@�ա��OT@��|�i�@�E$��@˻hL��@�]�Wy�c@Ж��ӗd@�&n�l@ӭ�$Fe-@�^-�4@�(h��ƿ@���]@��T��@�()��3�@�`�K|�@�ڨԛH@�J��:@�]e<�8|@�k�쀦@�Й��+@� )w��@�%^��L@��I��)�@�qS>λ@�2�4�@��L�m@���d�F7@����c@�����Rf@����+B@�~(�F@�?��<�        ?�d'��Ϡ@ �z���@��Zs�@.[tԎ��@<3H��H@Gm�z�q�@R 0\�3�@Z��$�\@b業+��@i�E����@q[�R8�@v���j�T@}	����@�@�?I�
@��e��]�@���}a��@����.@����C2@�4����@�_!m�:@�O��H�@��?6�&@���aW�_@�A?��(@�:�y?�@�p�6m�W@�r�QVHS@�L�_a@�HZ�az�@�e���U@���$��@�ۇ���@��$�ͯ@�.��@��͊�/@��{��5@đ���J@�5�U�@��g��@ɸ��iY�@˙�+��p@͐J��|�@Ϝ�"+M@�߿Kd�@��{(O)@�$���r@�X�BG	@ՙ0��F�@���h{nU@�>�&|@٤᤻I�@����@ܘ���@�%���6@���� �Q@ഷ��*�@���]�@�rF��[@�[�p�0@�L,)�@�C�g�WI@�B�Q@�H�f��        @_x�2�M@�N}�-@�S�	�,@�cj����@Â�����@�21%��@՝,�ݭ@�M���=�@����{@�#6}&�@��{0/��@�	�#�0�@�~0:�@�D��⓷@�^O'm��A ��PAE�|?A��n��TA��j6�#A[��w��A_j�z�ZA�z�
�Aq(�
�0A0�?�9ABv��A�;� aA��#�A��B�ɊA#׃J�A /eg��A!WW\2�jA"��p9��A#Ǆi�P�A%FF��A&dx��?EA'�L�4��A)/�u^�A*�Xo�A,*�bN�RA-������A/T&��g�A0}��,A1UʖS��A24.��X�A3=����A4��4�A4�X��A5�jY�HA6�2�eU/A7�Ծ�A8�&�bsA9�7
���A;/�^��A<��R�A=;6B�U{A>]�iR��A?�9{�bA@Y�=���A@�_w�EAA�fX/-AB,��DLAB̀�M�uACq"��        ?�� mc�@�I8��@2R7Ut5@C��HM�@Q��9���@[����@c��`2�@kv�X>@r#	��HF@wAG���v@}�aby:@����d�@��.����@����v�@�&����@���&*�@�%z��j@����g�(@� ��tS@�<�Г7�@�W�;q�y@�-A�FM�@�{N�@�-D4���@�X%�L2@��u�"9@�� ���@���n)�@��R�@�f�����@�Θ����@�DɃ�P@��}�4>/@�`�l��@�	i-%��@��ǗR��@����	d@�v�Fe�@��%BD"@��mEzܱ@��wd`�@��dv�@��?,�@�Et���@ǅJrL��@��GgS|�@�-F��s�@˗4�mY�@�u�O�@Λ��@��A��@��1��@��3���~@��S#��@ӷ�7��@Թ��Y��@�Ǆ�`fv@�� ΅\@��{�Ү@�8x}�$y@�v[��Ӥ@�����5�@���S�        ?�]���@'���g�@F=�,��@]�$����@p`�����@�?=�|@��[�
@���%�@�c~L��@@�;��l�@�U"л��@�x瓳:P@�����@Ƭ����@̒�ӫ�a@ѢDNc��@�_Ͱ���@ف��0H@���~>�@�y�����@�"ɶ}��@��p?��l@�b0��r@�Qn�O@�a��'�!@�1C���@��D�@�
�ut��@���{@�"�
-�@�@S�͞@�g~���A KjWn�Afї�U�A��y�%A�z@Z�A����A�ܟ!уA&�K�GCAW�@��+A	��\�A
�A;߀BA��K�A8�D �QAv0�T��A�4Μ%Az���6�AFe�w�A�ё��A]�sA�ɷ�SdA�;�Hv�A>-{6I�A�wS^��A{�����A�s�N�A�g�BoARb���?A����|A����*UA$
|z5A��^�œA\����        ?��Q�t�@���|@0^*�k��@I� �ņ�@_<̫���@pѶ��@}8X&�?@�ϼ��y+@��9I�0@�ږ���@���ķI@�d\��9�@�hf�B�@��}'%��@�iF�� �@�vxƋ`�@�a���@�.��S�@ǜl�m�@�X�G�U@�e`ōv�@����/�@�=(eeġ@��Lߞ�@�tDV�2�@�P7�0!n@�Vj�O3@�C2I ��@����S�@䰥6O'�@�+KS�@�l�q�Z�@�f�M^VG@�s��8�@��2"w�@�_�^o�4@��<�@�Y�Ɛ@��2��b�@�I��/@�E���#@��//1Qc@��Hb@��@���<@�Q��ٜ�@�����N�@��>}�t@�-�񉮎A =�J��A ���KA�����A;')���A�O��/<A���H�AXRnȒVA��@��A�&K�SSA�}OE��Al
��A>( ���A	M.�%AA	� =��A
ڹ�L        @�m�v@��<�,)@�;0��@�<dq%^�@�8S�J�yA d�C]z�Ap�I4'�A�aEeIA��I�zAbY#l/lA ]��4�TA#�	�.�A'�*Pr�A,$S%P�jA0f�PߓA2�-�fA5�mF���A8v*��.�A;�SF>��A>�����AAⱌ��AB���%AD�	�M��AFÈ���QAH�)̪��AKC�\AMVG��AO���AQ�l���AR]��aAS��9j�<AU����AV~ �.,AW�G�p�AY�k'��UA[RU#*A\�����oA^�	��e�A`&(�-�Aa�a���Ab�p&�Ac����Ad*���FAe.|F��AfOH�$rAg|�@�\Ah�H�T`�Aj �'�AkW�?�MHAl�4�>h�An9��ؗ9AoŒ('�hAp�D�f��Aq��#w��AroG3'�As]%oj AtU:ؚr
AuWI���Avb�����Awx���GAx����fAy�ȭd`?Az�?���;        ?�i��D@��v��e@ N/���@1a`�/��@>t�K�*`@G�K� �@P�TUK��@Wq?�7�@^��A)�@c�P��@g�AU�4@l���k�@q
4,,�@t��l^@w7KD�k�@z���#�@~O�q��D@�m{n�@�+�l@@�Y�:C��@����2��@���f�@���Rc��@�BN���@�oxH@�v��!v@��)�'@��`o��n@�-��/�@�߸^Ԛ@������@�r�I��@�S�2�5@�"Q�J"i@�"�`8K@�*����@�;0�d@�S���I@�u�ΐ�@��".D��@�ӹ�]�@�g��y@�V#�c^@����fa�@���4}��@�]X�\�@��D����@����O;@�Y%A�@�{��BI@��*���@��'c��e@�xk�֛@�J�CX�@�!��X�@���!���@�ܳ]{�@�����@���k�@���~)��@���lS�,@�~^ �6 @�x���$p        ?�I�>���@ݝ`��@-�[�^�@A����U@Q]g(��@]Z����@f�{?K
@p����d@xԥ�@�{���k@�ٹ%7@@�=�9�&@�ߗx���@�<2a��@�C�ó�@���m�/�@��<k��@�s�����@���/�@��xW�@��;�yf�@�ez�E��@�n� 3��@��E�?p@�K���@������J@Þެ��q@���b���@�'�?���@ʣ��K�
@�E����@��'��@�~p�K @�	�z�U�@Ԩ��5��@�[��2�@�#�!@���԰@��a�h��@���d���@�\K�t:@�����a@�=J���@�gcg\/@��D��.@��`M�N�@�Ua[^�@�o��!@��]�rȶ@�,J�;L�@�_�9�@�{���@�w���L@���}?@�Pǻ�)�@��,CW@����)�p@��>�7&�@���d{4@�vx�,�@�WW�,?�@�<H�@�@�%C�T��        ?Ȇ��	�?�DAGCd@X恙�@&�6��i@4��ˏn@AxXe���@K��7+��@T�D�n�@^��*[�@eЛ´��@n0�;��@te�����@z�0�2�@�w3a�]P@�7��w�@�̫Z5�v@�"�Xu$L@����4��@��ßqT@��M#�J@���و�
@���lo�@��*��O�@�y�ʹAx@�if��@��^�ƪ$@�!�wNs�@���y��@�7߆"��@���ݱ�@���)��C@��8p�@³�?N@�q@2��9@�ED2��@�0	���M@�1��4(@�I�� ��@�xlK1@�^[�>�i@ы�v��_@�à���4@�c)�&�@�S�r�(�@֫�|n�@��c��@�z[����@���![�@�q}��*@��w�@ߐ�����@��|�TB@�k�~F��@�D����@�#%�S@�M�	,@��PɷT�@��7F T@��\�g@��	�^��@��M�n@�����@�|�� �        @fkS��Y|@�o��'�@�M��~�@�M u�*�@�lLi#��@�~�� ��@�c�:S�@�s-��@�p=pؖ@�S�;�;�@��?>�|A�Q��gVA����NAf9;t�AlmFGA�.��A4%P�AEJ%�A�J9QVA3K4x�A�8y�AG�ݱ�A ���.�A"�����A#����s�A% $��q-A&�(�4b@A(�w[��A*J�_f��A,%� ���A.�<�{A0�8�J\A1�]vA2���@A37�y���A4Y+��2�A5��xq�DA6���Kx�A7��^�$!A98	����A:� �-^A;�u�4oA=<�݊�GA>�G3�66A@Ld ?A@�o�_�AA��~5�ABP@��H�AC���mAC��0 �AD�P����AE�$PUU+AFxF�.)tAG\�	OAHFq���AI5n�&AJ)�j܆fAK#j���ZAL"M�7��AM&B��ĬAN/,U�^SAO<�)}�!AP'����@        ?�1>$�'�?�߸�<w@��?O¿@$.7L�@1���8q�@;��z:@Cְ�Ex@J��o��@Q����I�@Vl�T�r@[̀�e�{@`��8��@d7[�JZ@g�&7F�@k�0����@p���@rabvg��@t�4J��@w�b+�I(@zZY�wY�@}ZC	B��@�CYz9�@��8d�,)@��.y�{-@�����=�@��LO䦇@�����J|@��#�@�@�����j@�(�B,�@�c�R]�@���^6�@���84@�l�s#@�����%@�eYC�1@���k؂�@����i��@�BP_��t@����˖e@�b|�~2C@�M�����@�@B�]7�@�:>VYʹ@�;��@SF@�E	�f@�U��J�@�n5�1@���ҷp�@��OP7�H@��a��@�Sp��@�O�l+ճ@����s@����J�}@��%A4T*@�<1�Y@��\Ce@��a��~@�L���`@�|�<�@��ZD{�|@�zn�{>        ?����?�(K�VA@�w� �@$��}ă�@6M�\=@E}��J�@RNd�2��@]٦�=ƒ@gcE<I@q�4��@x7L8�F@���A��@�ep�a>@�dI���@��P���@��#�Cn@��8���@�fV�@�b��%_@��o��@���f�\@��e��@��Z�{@���좑�@�J+�A��@����|�S@��3���d@�9ZvI1@ǻ6	�.}@�f�sV��@�=���@� Q�zD@ѹ4����@�i�ՌB5@�2ZUӱ�@��,��h@�F�0>�@�!�ȘN�@�N�Z7	@ߔ&4�0/@��+1��@�4m7:.�@�{���'�@��'7��@�.E�C��@�l����@�qe��@�>���@�!�5��@����Ik�@�`�C���@��0̬�s@�e+��Y@�F��u&@�-/��2�@�|���@�qhU��@������~@��mʡ�@��-�t�@���QD`1@��,�E@�@��_���        ?Νt�_K?��J�4;r@�9M?��@.�z�P@q@>c��7@K	��fҞ@Vi#)v�@a��be� @j�kw��@sK�ZC@{�$ ��@����}*�@����=�{@���3�+4@�\5�b�%@�t�߲��@�S�[�Pr@� ���]@��Ic��@�CE��a@��!��"@��͜djL@�yM�R&@���^���@�?�vA�*@�[��^M@�,�i��@�v=�y��@���1��@ɓ����@�ix��p@�n����@�Q�1�wH@���[@��>=L�@ֳ˧��)@ذ��U�@���p9@����a�:@�6�j.�@��ҴZ��@��O�:@�Hr�t/G@�����@���V�@�T�>��@��P�X�@�6���"�@�-Ԭ�|@�9�R��@�Ƴ.���@�-pd\l@��奔C�@�ˬ|��@�{��@�v3o��@�O��i)�@�+�4$,@�
L��@��9�2@��gf��	@����Ȼ@���^�        @Xթ�҆�@�N�U�o@��;�Ci@��s���@�%]jPB>@�L٭��@�mṚ�q@�k��[yV@��� ��E@�Ά;��@��6���@�Ԩ�t�@��1;-�@��w��M@���	]r;A�%��A�˽-D1AUE���A
[F�G�&A��"n�.A�����aA\*2	*�AN���"A^����A��hhz A֒��\A?nt�ƇA��Y�A!6�H8A"��Հ�_A$�]��-A%�3S��A'!�<l"A(�+/>A*s�I�PA,2`�_��A-� �CVrA/��p�sA0�.���A1�S�(�A2���`�iA3�6���A4��5��A6g���A7�Ud�<A8>4���A9d�: �A:���M�A;�er�A<��D ��A>:((��sA?}=�G!A@b�'�"WAA	p���AA���Dq�AB_QH��AC���tAC�ӲSzADv4R�˛AE.�ue\�AE���)�AF�/gd�AGm,j        ?�YY`-��?�S�A�@�X^�ޮ@ k�b�oE@,�c�K�@5�S!�r@?C����z@EB��1@K[�P��@Q:�P�T@U4{
�P�@Y��̳�@^s�e�i�@aߍ��o�@d��4,^@g�a�u @k2ckz;�@nť����@qKE�E�@sS[�/D�@u{�c�"@wŐA�g@z1�9��@|���:e@n�g^@�@� �`Hٿ@����@�@�'� ��9@�ž��E�@�uXפo@�7	�^��@�
}qN�@��.f�c@��h~�#@�y���@@��[<�f�@��s�"h@��\i+0=@��4�~@�)!|f�@�jD{o�@����a��@�G�7�8@�k��@���N��@�Hs�~��@�Ű�"_�@��"���@�m���@�:0�#B~@�
�
��@���&�L�@��@����@��2���$@�y��aP�@�`�_�@�L��3�R@�=���@�2�Q�@�+��~x@�)��}@�,�V4@�32Gn��        ?�2@E
�?�ׂ`���@������@!}�&2E@1��+�-@?%��t@I:+.@S>cUC5@\ϼ��@c���J`�@kl����@r�H]�@w�B�3ڝ@~5$�dĲ@���*׉@��՘�W^@��~s@��k��z�@��y�@�u���J@���v�@�D`�L�@�F��Eq@�OX��@�^�k{a�@��a�b��@��<Z��@���D��@�Ue��"�@��r���/@�W��3*@��)j�Y@���Q��@��m����@�!d��@���1F�3@ƕ2���Q@�n~bt�@�[ՙ�@�^�ǵ.�@�w���Q@�R���z7@�t�3��@ҡz��@��e!km�@�8n �"@�iڿ,u@��'�X�m@�$�'M�{@ڒ]#q�@�	.n��,@݊*���@���}&@�Tl�c�@�#s��@��h|q��@��C��@㪥�eE@䋈G3��@�p��Z��@�Z��i��@�H�uߪ<@�;qm��        ?�Bu2�?��5o5Qk@
7�:\�r@Zqw��@-S緮�@9v�<���@D��Sΐ@O��/���@WOe,��/@`�<�6�@f����a@o�=8@t�� MP@zť��2�@��x*k@��j)��@����ѡ�@�\4�b�F@��0�u��@���� �@�~��@�@�s�֨�@�!� y�@���U y@�Ee�1VP@����t��@�>Y��y@�A�WZ�@�jL�q�@���?զ@�-�@�P�@�� ���f@���)S��@��8�"@�I׽�d@��k�Ҙ�@Š~*�@�j���;�@�JJ @�m@�>��ì@�G�s�@�e�7��@��^5s��@��K�EZ(@��9J��@�XS�Q,O@՜�ی�#@��?���@�F�yu�K@٬}d@����@ܘ��k��@���BG@߯�.�@ृc��Y@�xZO��'@�P[��@�-���o@� �XO|@�����+@���asc�@��\�x��@��D����        @W�`���@�F�˸l@�C*�Bv@�V&%F�@�����	w@�S�9�W@��;��H@װ}�?˵@�R��u@��N�9�@��s[��@�J,G�3�@�u܃��@��p���@�Z�K_0�@�M5 �۽@�r1���E@�ʚ,�@A+��٥!AM[���A)�*��A�2��A	ISW�oA�,@5iA�².�A0� ��Aws�A��E�qA)N���A�gk	^A��k�=A��@f��A*^޺A�A�e�=!�A�2$A?��'*�A �Ӎ��yA!w��q�<A"o�gؔ/A#pz��jA$y�h^�A%��_�
A&�&8xu�A'ȐbA(����3�A**g"��qA+hۂd�qA,�Jt�A. ��#+A/Y��2��A0]�M��DA1[+�A1̑�iA2�jǔ	�A3L�9^�>A4��GA4���f�A5�"�;�A6�_����A7W���A83���}�A9�2ؽ�A9�䙡t�        ?��3 q�?�|���@
�$�B�@O��+�"@*Zx"�m@4v�}�h@=���1O@DE"�χ@J��"۝�@P���X.@Uh���@Y�1ß\�@^���u@bS��Om?@e�bT{�~@h�mnk`@l�6�=)�@pm��~(P@r�p͈W@t��nX
@wo�x��@z̺�=�@|� &H%@��>�.�@�^A7�@��,��-@���gj��@�J���[q@�+��c�@���A�6@���{@�Ȝ!T@������@����QL@�!��_5@�05~>�@�X���-�@��r�D�W@��^����@�d,hbI@�LM�H��@�������@��7B�-@�RPmg�@���7˳�@��p�@��yf
@����b�@�EG��@��uFp�@��
	�@��>��k�@�j_��
C@�=h�X<7@�L`^͎@���1��@��S��?@��Q��{�@���)�#�@�~	�V.�@�jȑ��@�[0��lQ@�ORl\SV        ?�p>OV�?�3�t���?�B�E� u@�x����@"s���F@1��wzi@?�f��@I^�Hi@S���Z@]�"h@d�P�Z�@l�LF6S@so��K�W@y�����@��6cX@�����@�9�"',�@�!���@��_��@�|���M�@��k�^=`@�Z��C@��M��b@��!Ii@�"�*�4�@��y�K1�@�&�p1�@�&P��-~@�I�~�#�@����?�@���;Y�<@��)�-M@�IJ��@���D>@�3�
�@ë��ʠ@�T�+�h@��꡿U@���|��@@������@��(!j�@��)6���@�y� �@ѕ@6;��@ҼD�-=]@��E�f��@�+\�	��@�s��$��@���B���@�%v?��@ڎ�,�t�@�N}�k@݂M�a;@��6�6�@�O�Sl�@�*�Z�@��m]�d�@��+vj��@�9�k��@�uy�O}@�iţT\�@�R�Cv�@�>|�B�        ?����C��?�'�eI��@i��kD@!��(@1b4}on@?SJݞh@I�Ȟ�y@T�����@]{zKM�\@dم^�@y@l��W�H@s�t�G@x��;�"@�����5@�L�|��@�����3@�u4)hc�@�i�[ֵ@��c��3@�6�nD@���+�a@��7I@����u[�@���Fy@�-̈���@��"�R;�@�zX��?@����$u�@�rE�Z@��L�FNP@�T�+��@�A|>���@��^d�f@�Y݁�	w@��e��@��K��#�@������@�hD���@�En�y"@ΘF"��@Є�TD�@����3@�%6�]@ԍv�ݒ)@�X;$�]@א
�H�@�*ʖ�)�@����,��@ܔMvǝ�@�cj�(��@�"$�h�@�|#�/�@��0�@�(�`��@�<�HTO�@�Y�Ƣ=@�~۰��L@笗�SE�@��f�&�@� �'�@�gb��h@�c'5��@��:��#        @I�AM�;�@{1����@�/L���@�4fa�Z@��}fS��@� ��ߘ@����a��@�Y���T�@ٕ���%*@�X.=�tr@�W��E�k@���G�<�@��^��;�@��j��@����U�@�ښ�rc@�Y@��_/@�7 ��A�L�<A�*�wl@A��>J�A(U���A
�=��D�A%Kv��,A���GMAJm�KN�A�`�,�A:"���!A�|�)��A`@�`�OAaa��@A��]Y��A}��0�ALL���A �³o�A!�T4��A"/Hct�A#C|r��A$�Jy�A%y�9|DA&!�X�;A'4�n��8A(J踞�A)d9֦A�A*�i����A+��K�4�A,�Q��%A-����k|A/79z�A0"H�o�NA0�@�8]A1[6ЦuA1�U�U��A2�����A3Hn
�A3�r�X�7A4��+�A�A5SO�y�A6\��A6��#�A7{��|yA89n���yA8�r��