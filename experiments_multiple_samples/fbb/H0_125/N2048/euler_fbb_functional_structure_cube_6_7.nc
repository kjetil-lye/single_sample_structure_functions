CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T115440        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?Soݺ�?�j�	�)�?��9�	\�?�����?˫d��J?ֱ\s��?�竸���?��0�f�?�p��Na�?�;�C�P?�\6����?��?���@�CsE@T�(��\@
>p{�@��� � @��!H'�@s)O�h@ҧ�a�@�o]c=�@�
[��@ [�M"_@!��I�@#��/���@%�K�/�@'��Ş}@*b��ki@,}d�\b�@.����0@0ϱ�^�@22����@3���ɤ+@52!�c��@6ό��:�@8�zE�>_@:H���@<#.l�X@>�s�w�@@>x�@A>bok@B-_�pV�@CM��{J@Dx[��]@E����,@F�{�_��@H8�b�qn@I�.[\�l@J�?�8�@L`m�fU�@Mۇ|��@Oc*A���@P{���Y@QLT�V?@R#����@Sd����@S����@T�2 ؛�@U�skO��@V�Y��@W�x�1I0@X�_;r�@Z�[��@[EU8�5        ?$I�m��?`q��.	{?�8N���F?��z#�?�K����?�C�u�?Ǵ���3"?ԙ��:�?�eun\n�?�x���?��F0*=@�lE���@���̜@����@��d:�v@$Zq�>�
@,X� ��@3 I/�w�@9:��{N@@vh���@E#�.�d�@J��|��@P��"+�@T�'��J!@X�l��^/@^9l�`@a�q�;X@evwQ~9@h�O��c@l���?@ph��e�@r��{k@u<����@w�ҍڀ�@zѨ���4@}幪#��@����&h@�Q�.E;�@�'�yɚ�@��1��@� ��^�@�D��_d_@��U]#��@��6��@��B[�P@���.S�@�Hgo�K�@��C��KV@� ��M�F@��yn*Os@�3+� ^@���#9�@���D�;�@�?vM/|�@�^��@���,�dV@���E��@����%@��۬���@��ͯ��(@��t��@�1����@�W��0�        ?0�%�qB?gMot��.?��֖��_?��0�G�?��Y^g�0?�oP���?�/j�.L�?�F�9)�?��TIc��?�6s���B@�~��,@�)Fa?@PS��A�@!�7��G�@)�~֬�@2�4�s�6@9����g@A�aA?�@G�ԫ0�J@O7P߿�@T'��@Y���C�5@`i�x@c��ly�s@h>H[��@mJ��:5P@q���e?@t���f@x_�J�@|f�pO��@�l�蓅�@�����,$@������.@�u�V$��@��o(�D@�
xk'>@�]B��}e@�X��c@�y���P}@�������@�/��P�@�ǵxJ��@���ϲv@�<�����@��M��.C@�qSϱ-c@�/�8ok@�>zY�@���ZA�'@��v�^@�,ĳ��6@�8�!�@�iq�/	@������@��Q�#:+@�YQS錰@��ޣ�i@�LA�v%@���uG�@���b��@�?,���-@����^D@�v!��<        ?�M�6N?B@&R&��@F�Q-D@[��~(ȃ@jz}}T�_@u�4���@�<���G@��hn�2L@�/�iz�@�mt��I�@�]��$��@������@���n�@�����B@���2:�@�� a��@�S]��L@����Dt+@������@��s��ڇ@�iK��U`@��!H��@H���@����9
@�3��rA�@��\�n�@̓Q��@ϕA�k)�@�ik|ܫ@�&��6F@���[@����y�@�.zq8*e@�~1��w@������@�M��<A�@ᵤnkD�@�2�n>�@��2\��5@�l�?@�)�!1�@��sͿ�I@��	>��;@��@���Q@����7�@�@�*u@�#� ��@�IO�@�w_C�+�@��^��ͤ@��0b5�@�4]Z��H@��S�0Ģ@��6�@�20>��p@����3CJ@����A 4�'zfA �m`��$A�c�I-QAo�t+�A4����aA�IX��5        ?IшLdq1?�W"�'4?��� ݅?������?��>�G"�?�1h�uf?�jxK�)?�ƽز�m?�� �>p�?�\����?��Jм�?��6θ��@ yJ���@R�*�@_5Ws@	���T*G@
3�[#]@S�{t��@:3���@8]ѦP@N>��j4@{�8��@�!�q^|@:]��@�<$Z�@!-j�S@"b��4)A@#�7��T@%.Z@���@&��l�@(/�R�Q@)�R�+D@+m�&�@-$�=��@.�S��B@0f��Z�P@1`��Q� @2e���_�@3w��+��@4����@5�r�^V�@6����@8IKC^	@9�q=z,�@;��-o�@<�@S�
l@>l2F�/@?�MLEu@@���T��@A��M9�y@Bt�2x�@Cc�~�}?@D\Vڇ�@E]���[!@Fg�8��@G{���Z@H���f�m@I�bW�w@J�5�d�@L%��s��@Mhn"�56@N�;��<@P%p�E�        ?15�/ݓ?p^�+�?��l����?�����?�`c%�$?ƅefC�??ӷS5�?�ȱ��?��0}r��?�Q�*@
~�bl@�9��j@����@D]���>@%o��@-�-e�3�@3�J^�ߏ@:Z0x�b@A�Ev�@E�����@K#H��^@P�%@�F @T_��ɚ@X������@]+��� @a1��>@@d�6��t@gLA��"@jҲJQ�@n� R���@qrӥ�c�@s�8f��@v8Թ|�z@x缦�vT@{� ���@~�H
�@�]�O��@��h(f@��z�:*�@���+��@����r��@�CF��en@����: @��^z�@�v�d�	0@���LȬ�@�_�l]18@���0|@����@�O&��-B@��I��@���t��@���5���@���b%�a@��]L�@��@��U@����r�@�����@�T���@��%²�d@��u�H�f@�fŞ���@��I����        ?!���Y�?X�B.�?{��#Ȏ?����X?��F���?����k?�T��}�h?�__��R�?�y5�@?�Q�
z%(?���Q@����@u�t��@W9�A�@!	*jZ�_@'�]��]@/�����@4��ĉ�$@;'�W�&P@AHSb�p.@E�W�'8]@J�.oڊ�@PLU��#�@S��ks�P@W`��|�@[�l��T@`���i�@b��_��@e|2��p@h�!IJ�@k��qǳ�@o�ۼ�i@q�O#��=@s�
��Z�@v&:0�^;@x�ˊg�@{B��LDW@~H`I�@�������@�3�[1�D@�����n^@�˧2{�@��S>[��@���Ggڙ@����t�@�v`�.@�{2ݍ�@��].���@�2?��Ԉ@��i�Ap@�6n"�
q@���V�~l@��S���@�WZڟ��@�8�����@�0]�L��@���zt�!@��",f�@�ҮAo="@�����E@�72b�m_@�|���r�@��H�)J.        ?�u\�w��@!{)i�o@B��1ib�@W����R@g*��Z͐@s1����F@|��8��@�(9-�j@���F�@�*��J�@�n�� g@�$���@�E��m�B@�fF�X�\@�Y� {}@�{��h��@��ddw@�A%u��@�q���/@�U��"@�N��� �@�Zݠ���@�z�r�y@������@��C�_��@�'3�C�\@�^BD���@��+߇@���_O�@�Cl�a=�@ƧRc�@�t�fh@ɗ�c!<�@�'�r#-@��(���@�y�)���@� Xl���@�ڳ	��@�	b
���@��|�.@�&C�~��@�Ji�Ʀ@�~&b��@��>H�׽@�V'�@�}��n�@��R<��j@݀��ה�@�ݿ@�e���2�@�E�L�
@�/�~�]@�!4A
�@�Q?��@� t��4@�-���z�@�C�Gf"3@�ccpR-�@�汫�@�vk�)8@��Lq#}@�;qN�d6@S��p        ?kA�F�A�?�[�R�!f?����		r?��p����?�'�8M�?�I7s��X?�Y��0Ơ?�,���+�?����?��$��x�?�aR�@�P�?@fu���J@�m�rD�@�yB�i�@��Z�V@�cG��@#{d�j!@�af�@\����@5�H��@ {o_�@!��aP�M@#^����V@% �����@&�;
���@(� �O�4@*�w�R��@-	���@/=���i�@0���`@1�i衧@35�T@�@4��D>�:@5صr̞@7>!�V��@8�e
rjj@:3.g@;ÌS��@=cc�	��@?��p�_@@iIF�M@AP�@B@qr[��@C8!O�/�@D7�p�X@E?[�Ӫ@FN��!��@Gfqd��@H�5,mr@I�b�m�d@J�0t.�@L�X7@M[{����@N�ft�y@O���"f@P��q:�@Qb���.@Rs��b�@R��X��@S���~4@Tl�]N@U=��Ǩ        ?r��淪?���F(��?����m�`?Т�^�0?�k79�[?�D4���?�&}���@ -fU��@n$p�{I@:<�^r&@���iw@#��Y@,D�����@4]�Iu�@<�5"@C=�`���@Jm��߅@QN��E�@V�fA�9�@]G[��>g@b�Q���@gj���@mB�,@qНP��(@u����7@y�HU�E@~ф�)@�%W�q�@�/f�E<Z@��ƻ�i@�3�e�q+@���OM�@�A�I��:@��}�:�@��w��@���fZ�@��-�h(�@��b�ͳ�@�hI���@��S�@�����-@��Lb�I@��s���@��%
؂r@��XN�@�^��x�@���J�a@�)�H��@�~H��}@��+R�,@�V��U(�@�ܽ��N@�tq�K&�@��w�ǯ@���cyY@�����s@�Iy�A@�F,���@�M��:;�@�`����a@�~wi� @ŧ����@@��{6:�        ?=^2�ʜ�?t�p�a?����u�?�w��)_�?�Hٹ�p?�[����?Ԗ���?��|*}A??��)v7	-?�'C�"@ Mb��w!@����#�@H��ԉ�@~}�,0�@"�6>�@*���	�@1�{���P@7v���� @>��w�Y�@C�BJ �@H�?��I'@N�vn��@R�� [�@V큌�A�@[t�<,"@`B�/��@c�?��@f)�@�c@i�IG�@m1~2��@p��
��@r����*@t짨�'�@wO�^C��@y�m�(�@|���iM�@N�b�X�@� �x�c@���U�v�@�K��'��@��5w�T@��zy�@���wD@���ӄ@���@��@���g[@���zU-@���a��@�L(�ю;@��qژ�@�Ҡ�nV@�'��acg@����]�@���uF��@�n)�l@���	�G@�����9k@�H��i�@������@���F7ϻ@��I:U�j@���~��@�m��m�        @�)�^>@Bu8PD��@^��C�Q�@qSM�&։@�34�@�Pr�u�@���}��@����7C�@�	2�Y.�@���}���@�#��3u�@�'���M@�S�]�"�@�R�4���@��� ��2@�_\kz@���z��M@�}�6a�@î����{@��4�C@ȇ��R��@�3-�N��@�	�`�VU@І��Ca@�Pu�y@��H"&S@՗$�8�@�wy�]�@�p�)�F�@ۄw��@ݱ�|��@�����=@�0$�ݼ)@�q��}.�@��:��s.@�"�9JJ@�^�s�A@�6�ux@���ꮶ@�R��?A@�
�&X;'@��5|;�p@�WJH/T@�L�Y��@�K(*��@�Q�(���@�a�����@�y�;�r�@��$s�6E@�ŉ�'"@��O,��*@�6���ǂ@�}�?ç�@��<�"@�*��EJ@��(�Ã�A ����kA<�+���A��[_��A�*�z�A�2��Acq��?A9���6�        ?C��	���?zA��Odu?�>��?��?�w�P')?����@r�?�v���U�?�t�I�
H?�aq��W�?�E�@?��>X�?�r�6�?�U�i7�?��F�xr�?��M�l�p?���t�\k@ ����@�{V��@3տR��@
����@2�x�T@�H�4@���.�=@��ފ�r@�bppp@���ϕ@!R�q@#��^|6@&�WU@(��M"�n@+��a`W�@.������@11�!\	
@3��zh�@5��w�k@79c�6R}@9�=
�`�@;�Cj5�-@>��jjSs@@�O-l&@B*��l@C��<���@E�T�L@F�����B@HF��z�i@I�CY[>@K�����@Mu�t���@OCJ)��@P�V�Hq@QzT�p��@Rk*a�/@S]��X1@TR�=�@UGV��ui@V=D_@W2�(�q@X(>T��@Y\o���@Z4y��@[ {%{*@[�pI��@\��Τ�@]��EDF}        >��6�o?<k��{�?g#n�|��?��@�E�?���Z�޳?���
F?�c�;���?׮fd�K�?�6�/��?�[⽋&@ F	@@	��GUd�@��"�<@]��@$Ǧq[|@,����L�@3����H@:&5�}=�@A�*>HO@E�@�l�@K�#86�`@QX����c@Ufm��K@Z��7`j@_�dj��@b؉-�u�@fW�<��@jDB���@n�i�<D@q��pt[�@tq����@we����>@z�3cT�@~*7� h@� �=�@���@�X}[r@��a=��t@�f�p�Ȼ@�7��� �@�.��A@��}2!W�@�t��ڡ@�J�I�\@�>dFi�@�P֋>�@���ك�}@�Օ�|�@�$�6��@�p4�b@��7��f@�<d##9_@��1��5�@�S++U�@�����.�@��!1��@��0ϴ�,@�o7����@�5PB��@�=�"��@�Q�}�=�@�pe�v��@���Ѝ��        ?#۪�d�?Y���6�?z��}�x?�@�)Y�w?��_�Ӣa?��6	a�?�֗
�o3?�&��]/�?��Sm�?�h_  |�?�!=0�@��@���.�[@����@$�um<�@-(�J˺@4��nRB@;�2}�,@A�Õ�=@GA�`�@M�_����@R���}��@W*#����@\b�}�O~@a2ve[��@d��1�[@h���$�g@lޢ��G�@p޾�i�@s�K;Ъ%@v�ƒ&��@yЪ��l@}`�T4Q@��xvN@��`�@��pe�)�@�Y:�(�@��8�d3j@���Gf�@��am�@�J$Kw�@��z�wm)@��u�,�@�``����@�>��r��@�3F���X@�>�MEY@�a��h�@�N"�Rwe@�w\�³@���W�tR@�K0@�<�����@��4�!@� V]s�@�u�R��@���8�'@��e���@�'���&@�Ԭ\/�@����0�@��ĺ��:@���ؓ        ?�<��b@�*�i7;@1R��#�M@F/��N&g@U�1i�@b��y��@la\i=i�@t> ��֓@{|l�]�k@� ���h�@�����F@���J�h�@��r���@��.f)@�[M���@�L�z�g�@��GX��@�)����p@�.�W�ti@����y��@�@�wɥ@�CU�'@��}��W@�g]�% �@�hQk:x@�����~@Ũ����@ȾAkw��@�'�=B*@��q�41@���i�E@�9�_S��@֢M >=�@�9}k��9@��`ʰ$�@����:�@�
{�b(�@�!�u�C@�l�����@�;�S��I@�?^s@���d�"@�_^��e@�g��8�@�0�G"3@�&�~�	@�8J���@�J�5:�@�]�bJ�j@�on��1@�Hc�;@��xR�J-@���H8sU@��n�V�@��k f��@��)m��@�~�90@�gdއj�@�H��ֲL@�!7�d��@��u5�|A Z� U��A �G��        ?�ߑu^{G?͘�L�?�~Է?�����J�@	�Ԩ�q@�c���x@��k@1�`�@"d���=@&�����z@+x�b�@/�e���@2� �@�@5*r �'\@7�O�>��@:ܞ�DN]@=��{Uj@@��ֆ�@B#d���w@C�?g]�@E��l�` @G[�p��@I6�!;;�@K �Q	��@Mԕ�h@O#�g֊@P�{�r{@Q�&r'U�@R��@P�@S�Ԛ_^@U/*i:�@Vm�gr,�@W�{�"��@Y����R@Zt)��@[��9���@]d��)�@^�0bt@`ET�ё�@a���go@a�7ۙ@b�-�j�@c�k��*@d���c�@e�����@f�����@g��~ባ@h�4�f(@i��.k�L@j�d�W�@k�h��@l����<�@n*�x;�@o\L�X��@pJ��h�@p��G�p@q�;��s@r4�B�@r�/��@@s���U@t>�l�/@t�Յ��@u�+����        ?^GeA��?�*���ʙ?��C0��?�"T�t�?ز���+�?�1ۇA�/?�j�i��?���p��@ι*8.@R���pT@�׿��
@ ��V�i�@'�����@0@`n�f@6�E,��@=���k��@C����'�@Ii��? L@PT��X�}@T�����@Y��a,�@`<�$�@c�Դ�@g�<�ج@l��i0�@q	��=��@t<Ib�@wy��M<U@{>�H��6@h�k�O�@��;��[�@��'���@�:���da@�1�^j�@�gzF�'�@�n����@�K+g�kF@�I�OS>
@�k掏@��Q�N�1@�)ݿL�@��~���@�50����@��k��k�@�,d����@��z�M6@�w�-<�@�>��v�@��"�f?@�߷�f�@������@�Lk|"v@�4���@�ZV��%�@���W~>@�����|@�~�Y�:@�l�$��	@��=�4�@�B��n�@��5�tǌ@�Of�n=�@��Ƣ�/        ?c0ɶPe�?���}$�"?��ݚ#�?��.fY?�vW�F�?��<d?�/��j�?�Ől��@=wbtQ\@}Y��@��?��{@��f�B@����_@"<GR
@'���C�@.��?�t�@3{`��M^@8���V��@>�,$��I@B�U�S��@G'���@L+���M@P�<jR�@S�l���@Ws+��S�@[`�f�4b@_�޼3�@bAj�
��@d�V�m<M@g�{��|.@j�
J��@n9�#G��@p�:�UF@r���g�B@u�?��@w^��/]@y�/%��\@|��}��@mȳ{<f@�C�̅��@���ϻ;�@�� ��#V@����(@��=���/@�б�G2@�GQ�d@��.B�#�@�����y@�r�hl�@����PZJ@�m��y��@�
�˦�$@���~�g@��z�d]r@�hn|���@�aN� @�9_*�B@�N���)@�pܣsͳ@��4l��M@���@#��@�'_?2�E@��
���        @<LO����@pXR��@�)	�r��@�tf(%�@���P��@�ϳ�߃!@�"V#�sH@��C���@�S�5
D�@�`�έ/@ҁ�]za@���B��@��v�6��@����@�CW��^�@�T�=�@�00��x@����f|@�\���`@�5�(�aw@�~5��@�'r�1�w@��<�X�6@�{l�]ˁ@�A�%z��@���Q�A@����@�ϜJ@�,_�"x�A ����A����SA�V��APIDv�A��,��qA]	���Au��Q��A	���3�A��:&5JA(v*�A�sҶ�AK���'A2�ɣ�<A!�>7	A��:+A]���=AE	��fA"f5m�_A4���
/AN���}�Ao��lA�<i��A�(�4U
A�o�PA>8��A�9��{A hټ3ȆA!�|_�A!�*(�}A"t�]K0�A#+���&�A#�5e7�_A$�ӏ_�A%gDl�T�        ?P�g�|"y?��ê�V?����H*?�+�f�\?� �l�?Ӱ/����?�T~v*b�?�s-4Xh?�.7�͘u?�k����?��묟8�?�m&OjQ�?��1y�@����e@�g�<�q@��H%@m����@8ڹg@���@9~��Hk@}����@�)]���@u	Y�U�@,�����@ ���SkF@"43�ŵ@#���V�@%kї�S@@'B�/m@)5m��̟@+G���@-z��spM@/�w�#�X@1%sn��@2v5�Y�@3�d�_@5V�;ez@6� ���@8�_f�v@:W����I@<7��<d@>2֎�1@@&7뇒@AA�7��@Bm0��f@C�����@D��Vh@FN��v@G���3m@I5�K�/@J�DŹ>@L_�,��p@Nr|��	@O�*��(�@PϒG�@Q���%=@R��m�6�@S�e.?��@T�����P@U�j@}^�@V����v@X ���@YP�k�7        >�,�.��<?-MwP��?V!���,�?u�*�f�Q?�.<t��?�	� ?�b8A�?�|Rd���?�:���4�?��Q���?���W�7�@s���@�}���@j쫴I�@!9�C���@(��!Ti�@1�M]�@79��]�@>�5�Z'�@D'�lҾ�@Iޙ�O�@PZ��6�@Tf_���@Y#G����@^�j٣9@bz�U�3>@f#���@j2�ͫ�@n�^�@r8%D]@t�N
�%@x/*��_@{˒�M�@˸���@��L҂�@����p��@�8�Fߠ@�'3�ت@�\TL�o@�n}o�@�UI7�4@�f#L�@��xL��@����m�@��j~�G@�q�-�1@���8��Y@�R�.H0~@�����@��C����@������@��	Y��l@�	��@�R�wPh@�`0�}�B@���m��@� QӮ%�@�j�P�)K@��+��@�u1?56@�{� �@���-��@���΄�        ?;7��tK�?p����\l?�y�M+�Q?�5�Z�n�?�Þ��|}?ùm�<�?Щ+=��_?���Y붲?�2�m��2?�C���?�g
��~F@��� @	���{@�1ٖH@<�A�I@ ���#�@&��[_�5@-�J�B�@3Z�]xh@8�pp�@?bи��@C��OG,�@H\5����@M�q���@R3��&U2@U�q�C3�@ZO�NU��@_H%�w�[@bwW�Qx@e�����@i>�'Q1�@m@�?!f+@p�ur:@sP�P�kk@v���	�@x�>�" �@|9{:@���mړ@��G7��@����P@�d{�z@�\z}pVz@���A�ץ@���K{W@�0O�_�@��Qf�y@�E|#��@��H�&�@��|�a��@��^��e@�uRC9�@�xo�.	.@���@��@�`���@���݁�@����V�@��/o��@�/��ʹC@�h��E�@��I�N'@�@X�>x�@����e�2@�.8�h3        ?�K�W�@!\�Fd��@@�)�_�	@TG�-�@c�B�7�@n�Z��j@v�����@ZO��!@��3�VE@�7��N]@�7�����@���E��@�g�$bO�@���@�@���Y�֓@�j��Ԡ�@��8F�z@��8��&@��
UX@�\{�Fd�@������n@��mq�Q9@�[���3@�W��M�@��b���@�wR ��@�V.��@�7J,9��@��dM�I[@Įn#�Q@Ɲ�����@Ȳ��@��b~XH@�T�ǯ�@����}@�U?���@��C���@�cIny@�sM]Ϥ@���a
K#@�Ƙi+��@�͙2�l@��u`��@��#��@�O� �a
@⒥9�N�@��L���h@�J�K�@��cM�:@�G��7�{@���Lq�@대��@�KC�2̜@��b��@���'��@�����l@��*�@��.@�@����[[@��#��;@�5I��@�X�@x�@����Y        ?r *7=�?�89�K�?������C?���EN?װv8Nc?�;�����?���뭃?�Z���?�Z��:�T?��'�b��@ � ��^@P� ��@�F�@���P�@·S��W@�(
W�@k��T@���c��@�vCI@i \$Z@r�i�'@!Y3:Ł�@#v�l �@$��Y�@&��b�@)F��@+@�p��@-����F@0��X��@1g���^d@2� �<+ @4N��w��@5�#s1�@7�B��@9K��� @;%�`�d@=Um��?@?#�N�a@@�-��(n@A�M���"@B��L�}@D3kE�Z\@E�����@F��1�m@HK�h�A�@Iɿ��T/@KXA�"@L�&5'/#@N��I��@P3a�:��@QV��@R{C)@S�钨�@T�N�T@U��մ&@V/�5�w@WP��H}@Xz��@��@Y��C���@Z�_jApF@\5ᱍ�e@]�x$��A@^��$o�        ?%M�KŎ�?a�ؾC��?�?���]�?�Җ߲�4?�dTdc�?�%{^<?�=Q��{�?�L�:W�?�� .½?��pON?��1���@ĢM�;@�ȭ�M@����I�@�7}�wM@%��0=�@,�߷e��@2����
�@8h�\H�@>�<Ӂ�i@C`�,�@G�/aϰ�@M%�[�)	@Q�޲�g�@T�t��@X��"�ZD@]@4)P@`���u@co���S@fC�[�S-@iW�,�Ь@l�t�V�~@p#>��T�@r	e�T�@t#���p(@vX�~�*�@x���I��@{/rgT�@}ћD�e�@�L���e�@�āߜ�@�O�?2@��*°@������@�oL�#%@�P�@"X@�I/��O�@�Z*���@�B4|)�@�d%���@���aD�@�ѯ�5�a@�H�;nB@�z;�P�I@��%K�@�b�o�}K@��j[`��@��	o�z@�Bf�*5�@��-@���9�@����@����j3�        ?!Q����?Gp�o�?h䐿�X?����ԥJ?��젴:?���E?��=h�-8?�Fۤ�?�YՕhU?�a���?����ß,@HZQXlv@5��b�M@��s�{@"p���2@)�����@1Ȍe�ս@7�8j2�@?_N�r�@DKJ;��@I�<��@PB�?���@T2��Q@X�S�\V?@^-�����@b/w^��@e����z@i�U�6��@n][�@qĎ$v=�@t���*�s@w�ܦ<�@{�g3�a�@�Q�e�@���j�'~@�c3��A@��)Oז@��o�x�@�O>��*@�1��#�9@���0�@��\a�[@�mS��a@�Iu]4^�@���?kR�@�:���@�򼢵��@�kV^��@��8�"E�@���e��@�M��j?@� e$�<v@���x�@�;=E:N@�7 ���g@�;)�H��@�iGPt�b@��D��e@��|�mg@�NG�?.�@����=�@�5�	��@��o32=        @�Ι���@4�_{sh�@Q�N5�f@b�5Z��@p�H���;@zc\Lh4�@�q�ֆ�@��c���@��z�Vl@�gIb��@�i׏ۡ�@������
@��3�wZ@�X��;z@���k�I_@�퀚��@�s)�x@�uG�9@�1��D�@�ɚ�UW�@��0���@��D@K@�W{�0>'@�H�@�>9@�c�� �@ǩkW���@��-Z�@�����C@Ϙd�P�@�Qp?�O�@����8�@ԭ��H�x@ֆ�� m3@�}\�#�@ڒ�N�̞@��g|E�@����@�˰B��'@����@�y�J�k�@�앙���@�r���@������@��SjI@����}d@�\�xQ��@�M�х�*@𪭬��{@�5S:-v@�����\@@�����@�2��F�@�t����<@�ę��R�@�"���c�@�����>�@���,�@��W�#�M@�2�_H�A oX8<)>AM����A4'�>�A#W��        ?R,܉[��?���I;�?��ӄ'�?�$ɬI��?�ѻ�b�K?��^*��?�O�o�D�?���F��?�����0C@߄��7�@� ���@�H)ܟ�@�Y�,�@*�a��@�r�h�@yYZS�@!�$��f�@$Gy��׉@'.�1�9�@*\��`^�@-�>~F�@0�AB!�C@2���#�@5x�d�m@7s�AMg@:*5C@<��Dk��@?���e��@A[#}��@B�����^@D��xZ@F��ZoND@Hq�8���@JuW?��x@L�5�f��@N���-��@P����@QY�/@S���D�@TV��M�F@U��:��N@W"�jl��@X�X'�P@Z)k�S�@[�w	�Օ@]nd�Is@_)Q��.�@`z���;,@ajC����@bb�xd��@cdӓd!Z@dp��z4�@e�v$���@f�uQ��B@g������@ijo���@jDw�_�@k���t�M@l���@n?���n�@o��H�@p�X�-�o@qK��QR�        ?B�oE�A?��/Ź�?�ԯd�?�`��y8_?ͫ�ԁA?٤
���?�<l���?�RR�)P?�1t�V�?��nb��)@=�.B@�g7;Z@u�7X
�@L�]Fɕ@#��Z���@*<۪v0i@1/㫻�Y@61�?�
�@<Bl��K�@A�J�5�@FM��@J���SD@@PS��0E�@S�HS	^�@W?K㻬�@[^](i@_�i���@b��F�@eW�Σ�@hm��6[@kͅ�a�l@oy����\@q��(@�"@s��flh@v3Y��: @x�ڭ���@{[��z�@~5���@���A!�P@�>2&$Y@��7Ə�@���h?�y@���h��0@��<gY]�@�蘪�_@�-�?�~@�H��r\@���� ��@�ܑ���@�?'"�@��Ҽ�}@�8
s8�\@��G/���@�y��-I@�5��xr�@��+@��N罪�@����@���L-S�@�
t��h@�'x�U��@�O�`�#�@��2���=        ?4ƺ&�?n]R��V�?��l8?���ܱ�?�N��Bt?�S�GT�?��8�})?�|FU�:?����M?�S}IO�@��\��
@��JC@���U�@$��=+U�@. +�8+@5�@b�&@<ӊ6t@C@~@��H@I(yU�@P�ȕ�!@TBs,�@Y5M�s�@^���bZ�@bW�b�@e�4�g:R@i���扲@m�s���@q��(@s�KC�Γ@vR���@x�]�_8�@{��h8Sc@~򈁇7�@�!$v��@��W�+Q@���L�T@���K}�@��ɣ`��@��o;���@� _�@�~=�R�@��[pIA@�H@4�v�@��6�@������@��Q)�@���غZ@���L�Z@�_��n	�@�"*���K@����R{@�r����@�s�kޡU@���YA@���c/�@��h���,@�������@�8 I�:@��K6G�@�鶋�ru@�Y��TT�@��O�U@�kq���%        ?�~q8r@=s�~ю�@`u&En@u��&��@�;~Rsx�@��Y���@������@��a�`@��w� �@������@� �J��b@�s���@�]6�V4@�`(��G�@�P��\m@ǃ��B=�@�� ����@��[�d��@�i>xz�p@ӛ���w@��%�ʵF@؆9��Gm@�B"�ۗ@�/�9R?@�" w&@�R\��zZ@��$�Ud@���.i�@��-�.@��&P�@U@�)�����@�o�XҧR@�hb>���@��Tb�u@��ް���@�O֡�w�@��`n��@�7
����@��Y%��@�`�*@�ȉ�Ż@�������@����H�A �3yX�A��@A̘�7_�A���(��A���օ�A(�A|�:A_=�itA�̲ڛ�A	��B���ALٷ#��A���k[�A+�=�QA�+���UA���ɰAn�'k�AD��sv�A!4qi��A`V�e9A�6���Aޯ�ؖ�        ?N�M���l?�����D9?��Y��?��A���W?�-h�I��?�C�4�R/?��^��F�?��	E+|?���5J�?�%n����?�"��l|?�t���e�?�й5c��?��Udr�P@��3x@��v���@?�;��A@�'���
@�┸6�@��m�>@H'�Y�@Æ�#�l@o�?+(~@N��5F@b5��@!V.*Q�@#�\�e|@$��f�4�@&���]+@)��%�@+Nҟ��@-��^�\4@0:�ÄI@1j��f\@2Ϡ���C@4Hn�@5Ӳ��W@7r�����@9$� @:ꝯ�"@<��.S��@>���[GF@@Xo�z�@Abh���@BvAf*�@C��I0j@D��3�@E��a�@G*��G@Hpa�R�@I����\@K�|I˭@L���-�@M�G��s@Oi�cm�@Pwh��km@Q?s���@R^%�O@R�sLi=�@S�6ۺu@T��h0�T@U�F֏�^@Vv��["�        ?8����?B�lr�:?g=�Ͽw?�Q/�?����Re�?��0KEoH?�Z��x�?�o����P?�{R�)m�?�˚:�?��/���?�("@��P@GI�}�@"��P_@�;��#^@!��^@'�ۃ��@0L�5�Yn@5�r�G�@<؆��Ql@B�Lr��@G�ua'��@N6[���@R��Cj+�@W=g2 n@\a�g�^@a+߬@`g@d��ܚ��@h��=O~@l�U]�3@q |I@sґrO��@v�x��%s@zzB�03Y@~ZN^��@�Op�t�@���0��0@�4�p�@���B�_X@� ���$K@�B]=?J�@�a�p��@�C��;��@�F�K3@�l4>[nB@����H	�@� ��u#@���%���@����S�@����|�@����@�3K3��@��#i�Y{@����`@�dwJU@�G�H�O�@�@��p=w@�'���@�:?8k�@�X��@��x�Ð�@���((��@��R��Q�        ?�8�?s?A ���w?cA ��?�z���?�dO��?�l<	�7?�nH�?̼�5�3�?�|1Q�c?��j�!?�/2� ��@K�Gr�)@��$�@w;f�=@�I$��@%?��$��@-nw�8��@3���'�@:}�]ͳ�@AM�s¸@FA�nn�@L;��h�@Q�x��j@U���@Z����@`K��(@c�E���L@gZ$���~@k��<�k@p1�ۑ�@r�N��3V@uЕ���@yk��@|�B��/�@�A0��D@�[����@����)@�ЃvUy@������5@�l}���@�\�ۡ�@�;����L@��S`�;@�����6�@�e_էu�@�H@WmU�@�@+��:@�Mõz@�n��:�U@�R�/|͆@�x�޻@���&@��@���+\J�@�*�]i��@�{���2@��R*!�@�>&)*�@��'�TO�@�-u�@`x@��0$VVI@�Jv؛Z%@�u4�p�e@�Ku��        ?���d�;�@�r���@5C@��@I�Uq�h@X_��0@d�
�q�@m���a�@t�2�AW�@{����@�	�_<W@����?�5@�͟�	�@�����@�fE,��@��q/�W�@��oM-�%@�)^�/M@��So΋@�h���(@�n�����@���R��m@�Z#}O@���pM�5@��ֶ��@�g���@��P�p,@�:q��h?@�����c@��G�c��@�9�^�@��|%8#@���J	�E@�ϊ�'�=@���탚@�%���61@΃�U��M@Ђz5���@��RHWs@�:�v�@Գ@eN��@�?#բ�@���k�9H@ْ�R %@�Z����h@�7~%!U�@�)B5絊@���"��@�Mw@��@�F��ٲ@���^Q&@��t<@�KU�5}6@��|,�*@��]ך�-@�9��F�P@��TM��@��X��a@���@�W� �@��lh���@���rP�@�}Kl��@�Z�T        ?O��M�Ā?��uA��?�ȀS[g?��.MpqA?�a�W���?Ћ��t?�g��8��?���yJ��?�=q�[�?�S���3l?�E[_'?�N�H�d?�kV|x�p?��:����@g�b���@�^��@��!T��@
#wGs��@�X��$�@����t@�`����@�w�o`0@���W�@�h�L�@,��Р�@�p����@ ��"�@"{5"n,@$��\e\@%�#ƄS�@'�ȯ\��@)x(h���@+m��'@-z �W+2@/�(�V@@0�b�(=@2o_U>�@3P��V��@4��s���@5��2@7Hc�)�6@8��fY	@:.H\59>@;���hU@=E���@>���JX|@@G ��Լ@A"!��H�@Ba��ES@B��G7e�@Cؗ�N@D̾}˯�@E�a�Ҕ�@FȖ�5@G�n����@H��!��>@I�iD��@K�zq7t@L1��[2&@MYe>.�'@N�̈�'@O��D�e@Py���        ?gT�q�w?��:�A�Y?�g��9ض?ѳ~�f�'?��s�h�_?��Ǹ��[?�����۹?���yRBh@E��7)@!r�Xo@�r�`@y9
̒�@�Te-��@#հi�	�@)��^�]@0a�L��@4���+@:MRUTbK@@v*W��@Dnd"F@I#,ѵ�&@N�����6@R�����:@VC�m6׺@Z��䨇@_[�Ũi�@bjm�0@e}�e�7�@h�;G6�3@l����?@p~�0��@r�t�%+�@ud9���@x0��,�@{<|>D�@~�6/x'�@�� u@���p�6P@�	�
J�@�>q9�@��Y�{��@�>+��@���YDJ�@��
ׄ��@�>Qz��@�ʼj�@�j/O$#@�|\/uC@��g�b�
@���AJ�@���`�4@��Ŋ���@�Tr���@�b��O�@�y�r�d�@��zp�7�@��)�� �@��x�.�@�#�L�@�a�Jd@���]l�@����@�E~oV�        ?)u�,q�?`~�S��?���%h�!?�2���Q?�V���ʄ?�Iѥ�O?��^��c�?�]S��?ߨm��?�G��S�P?����{v?�;�2�@��n)M�@���5�@�?����@ ����A?@&��٥��@.���� @4K��b��@:eǨ 2�@@�Mp�-O@ES8�J�O@J�[�(�j@PQߢ1��@S�<Z�|�@W�5��~�@\bI	��@`��v^��@c�Ύ�PJ@f�:/T�@j"�9�W@m�eY�I�@p��O�.@s,E[��/@u��r?��@x��P%�@z�29բ�@}��ȟ:g@�S	7+��@���d��@����F�4@�br9��@�>ZC��E@�0z�Lص@�8��~�G@�W�ua��@���/?�[@��-0=@��>W@�\��lA�@��R��g�@��f�z�@�^AzC��@��8�LE�@�IP�� w@���߂k�@�j�ۓv@��^D@�b���0@�D�Y�@�/+ ��@�!��׻�@�猕��        @D�(L�@@8�o9�}@X#�޸3@m��`��P@|u�yrr�@�K����@�K<�j�l@���o��@���3eS@�>Ǻ<Lt@�|�T@�@XS�k4@��R���@���)5@��n��@��f��f@�$'��/=@�*L�z@ÊPa�$@Ŵ�p[@������@�d�$�@��+o��@ϒ�I*L@�,c�?@Ҟ��!�J@� ��Yp@ձ5¤�@�P龗��@� rsb-�@��!uu;@ܔJc��@�{B�(@�;,��#G@�Ch
��@�Vb1�^�@�tb�J�@�v��W.@��G0�7@�T?%ji@�S[��0F@�$�8�n@����X =@�b�&���@���/F�@�I�9u��@�fyr�P@�-�q�@����l�L@���0�$�@�� /��@�؊ @�k��эb@�WwK@�Ir��Q@�AS _�@�>�f�tr@�@�&��@�F~�ٯp@�O#��@�Y���R@�f�`�+@�t��%�        ?{�:� %2?�K#�b�O?О0Q:�?� `E�?�d��?��(9�@9�,Hn�@@���@���@]����@!��]+�o@%�����@*95�]�6@/Q�Ô.�@2}8�Ci@5�G�V�@9�ne�@<�ny���@@���	*@BÖ]g�@E:��gZ@G�E�S�@J� S0mp@M�h��@P����,@R{ (�@Tm�"��S@V��z�u@X��j�]@[G��V@]�R)�5@`$����@a��O�@c�h�1}@d�>���d@fg�$G�@h<�k�,@j1a!���@lF�?ݘ@n||&�U@ph�}��@q��@N�@r�k3��@t<2�5�@u�e���@w	E�XT�@x�!5J��@z
pe�A�@{���O
g@}C}`C�@~�:B��@�[�	=)c@�C�<Jt�@�3`�3�@�*q;*@�'���G@�,exB��@�8S�7@�J�4Z0*@�c�.�)~@��=�"g9@��iENU@��r���        ?x�vh��}?���Ȍ��?��Y �c�?�w�]�n?�"��j}<@�i��s@w��t@���)@%?j| %@#����W@*�xo>��@1�Ed���@6ϸ&?�@=��r��@BV�4�z@F�?�!KF@LU�@�@Q#���V*@T����D�@X�-�I0�@]M��mI�@a6���@d<��cz@g5�740@j�8��`&@np�!��@qE;�W�@s}��F�@u�y�n�@xxY��W@{>8�ݏ�@~77?@����j��@�e��S8�@�6�g-%@�%����`@�5��Jy2@�g�
��@���=z%5@�9�d��X@��鑺�@�V	m"@��p����@�h9g_�@�����@��c�l�@������@��zG�rZ@��`<Do�@�������@��|X3y�@�绰AL�@�0�_��@���(8��@��!���@�qWu݁@������@���G���@�T�ጪm@��kK\�@�|���P{@�uH+9�@�xn���5        ?�u�4�?�:�<�?��ތ��.?�k*{�@?��q���@�}>mp@�O�I@tw�,�	@��2v@#�e \�@*5mGf�{@1( Ҏ~@7ar�C��@?"}�|��@D�����o@J���X�@QXe"��p@Vj���@[�ɫ}8H@a9-�[@d�̵��@h��9`p�@m3��?0�@qv)��C@s������@vW���X6@y6��ɗ@|2XE�l)@I� ���@�<�}�.�@���%GY@����A@�G����@��ɧPu@��\����@����̆�@�����@��mA�̖@��/(m�(@��}�"@@����̡�@�T&�|@� L)&0@�F�^���@�uk0��5@�� ����@��sj�@�3��]�J@���ޝw@���T��@�I��a�@�]ʑմ�@�zsȆ@���!V��@��f`���@��2���@�^�%)�x@�BI~�PO@�.��p@�#�٥�@�#B�P�@�,s}@�@�v�M        @E_�x��J@y^<X�2@������@�������@���2�?@�%���L@�rVR�@����@�w��r@���!l@�	�%��@��~�1@��s��@�s5��H�@�`\v��@���H��@���7��@�� Zo�"A�>YFA嶾Z�-A'0/�A��$n��A��ezAԎ��y	AZJ�yՔA�;ƳvAy�\�(A)�5���A�7ȶ A�M��)WA�:�A��6s��A���|A �)�&�A!�^�~�A#0X�#�A$� +�@A&�'���A'���m�A)L���vA+�^�K�A,�ӎx��A.��ٱ8A0izMuߑA1p���=A2~~ɞ=A3��%�A4�v�t�A5ك���A7x6d��A8@�W�A9��:��A:�VA�A<M8���A=wm5��VA>�Iا3A@#�n�k�A@�rZF7�AA�B<KC�AB`Pt�zAC'���\AC�y�AD§^��        ?G�x&4?���@&x?�{��L��?�U_L��?�}�y��a?΋c���?���4Yl?�F���?� l��?��I�H��?���;�?�J��f�g?��u�AQ@{��95@*AW�@�����8@k����@*J�#��@�#�#�,@ΰ
O��@�i#xy@o����v@ ���Su@"�ܪ<F�@$�L�]4&@&�gM�.�@)(��)�x@+��8^@. Ws E�@0_��^�@1����@3�:���@4�,^��@5��T��@7b�iR5@8�$|��@:P^��a@;ʒQ�@=H+r��T@>ɑE�P�@@'�F�i@@���ě@A�z �2�@B�;Jx!�@CWň��B@D/�R�,�@E|�	k�@E�¬[cl@F��@�@G��0�@Hˢ�ڟ_@I�~�S�@JߥQ�@K�#�gl@M!���@NU�H��h@O��$�@Pu���O�@Q'�I��@Q�ӝ�@R�Z6w@Sq׈q��@TG���Q        ?
�Fn��?G�s�&�?n@(7sz}?�sЅ��Z?����2?�F{�8�?Á�N��?ӕ,H���?✮)�C6?���j X�?� �}Gb@��� q�@��6�@P�MVQ~@%ٽ���@/��n_��@6g!M�*0@>���*W@D��L\�=@K���$7@R?
S��h@W~�)��@]�*2R��@b���2@g%�q^2b@lZFW(Q�@q0|�^�Q@t�� *�@x�7R��`@}U�(@�GE��	@��e���@��7YC@�b�]D@�+�����@�(��@�i��J@��:,�b�@��^-KnK@�]����.@�m����^@�� ~):C@���/GƔ@�s�8��g@�j��3%�@�}��z@���@[R@��U�4@�]$���
@�� �u@�;��z�@��^EҰ�@���̶��@�lz��@��Js!
@�n�����@��#YQ�@��&��@�;�/G��@���@��@��ƷX�@��зQL'@C5��        ?!�Q��Å?Y79��?z�ig�l??��s[��?�sb����?�MO�?�B����?з��s�?ݠ|'a�M?�] ��ɉ?���b�)@ �"P�:�@	� �B��@(xG�
 @��\Í3@#��[�Qh@*�H��m�@22��@7�*%��@>�ų��@C��|���@H�����@N��|_�E@R��m��m@V����@['�H�@`G�w'@b��<�,|@f+��A?@i�Q�h8@m� #ˑM@p�wixR<@s=ޝ+�@u��ȇD@xv�G�MU@{`��#�u@~�64��@��%��5@��h��[@��$�`S@��c"M#�@��@�$�@���]4��@�''�P�E@��N��@��73��@�^3��@��MkT�z@�*w�[ x@����n��@�.uE�f%@��A�72@�i�32	�@�L�'�Y@��m�W��@�U�w��@�B��Hu�@�7#r;�@�27$sI�@�3�ɰ�\@�<U*Х�@�K\�h[�@�a�'(�        ?�j��ʸ@#@��j�P@C�Ǖ�E�@X}=��1l@g�)����@s�}_�F�@}�!�f�@�7f�lG@��Q�UV@��£&@�M?(���@��崦d�@��/'A�@�'#	+@���m@�ܚK���@�$[�z�@��m��Vd@�@�V�
%@�����1�@�d���@ƈ��$�@��f^�@�����3�@��w ��@�U`��@�Ŗi�na@�[� ;��@���@��>u<ג@�hK�x�K@��a���\@�k#�s@��M�*@怡��7@�U�o�@��p�v@�0o�`Jl@�����@�Z�M��Q@���*��@����9 @�����@�y��]!�@�Y�\\G@�?2�G�p@�,�?�h�@�#)z��@�"��@�,ǂ O@�@k8MD�@�`��+IF@����1@��<�"��@���)%Q@�ob�L�CA nDl�xA.+�Y�A���K�zA�dwFA�C���@A��t.�RA���]��        ?e���B?��(C??����7<�?�.��c?�8{��x�?��fF�y?�.���?��t�?��X��?���P�[;@��J���@)|'G�@Ʒk�T@l�z:j@2p(���@6����@z���o�@ �e�@ c�����@"hey+>�@$��uK��@&�!XWR@)?y��a�@+��!-��@.x�G=@0�μ��q@2�V|Z@3��w��@5KL���@6����w�@8�����@:����k�@<��b���@>�`���@@c�0s��@A���P�k@B�i1�n�@C�!����@E)t�N��@F|閹��@G��aR�>@IP��@�@J�`m��@L`�Q@M�K?�Q�@O�l�G��@P�B��@Q�u�~/�@R��Ӕ@S���(P�@T���չd@U�]�T�:@V�X��@W�=G@Y%|��Cs@ZkZ��a@[���`�@] �E�@^���uL'@`�)��@`�4R�X}@a����^@bd��\        ?�W+%?I3āQ�?p}�w�Ѭ?��c��Y?��xn��?��P����?Ȅ�����?��k���?�x)1f�"?����{@���x��@�Q/��@Mx�5�x@ �k78�@(5o}�$?@1��f�@7k�1b{�@?n�{b�@D�v��m@J�y|��@P�BL22@U��@�@Y���J%@@_���4QH@b��a/!@fo3ɋZo@j[&w��3@n�I6['-@q���W7@t?���@v�w�A�q@y�P��{@}���Ʒ@�/P��c�@��({�a[@������4@���7�@���1���@���^��@��:{"�1@��#�+�@��Sm_@�1�OH��@�[\�6o?@�����8@�¯֣/�@� J"dP@�D�ˆ��@�����v@����@�:{iRMS@������W@�#T�X�@�q9�/�@�tY8A@�3��x�@��;])�]@��G3��@��ᝠ�T@�]@O]:@�3�<��@�(ú��@��%c���        ?>�gdK �?rȷ~�z�?����I?���$��b?���o�PI?��-��O�?�kx���?�u��?�KaE��?�~�*+��@��ϚVD@�[8M]�@:�cZF�@��ߺ�E@#�  Z@+""�Fz�@2�;Ş@7�����@>�\K�^@C\gᅫ@H2!�S�[@M��۫�@R)CB�@U�D���;@Zv���@^�ν���@a�8��@d����1M@gЍ�� �@k&����@n�pڿw@qK�+#�@sY=1D�@u�()��@w�ywʑ�@zD$�	>@|ҋ����@��T @�'mb>0�@�� ĕDi@�$z�1��@��oS@�*@�_���@�$!���@������,@�����h@��P�T��@�D�j�v@�FԁP�$@�R6���@�e�8`"�@�����@���Oc�@��ǯz@�i?��@�T��2@���"�@���n���@�_�4�KB@�ϡ.��@�%��Z E@��{�M@���~�3o        ?�Š�L��@.�Y��@Lw�&F�@`�`���@o����JJ@y�ìu��@��s��@�1eX�@�P�0�+�@� ��r~@��W��%@�ɟƢ@� �a\H�@���"s"�@��n�k7s@�"�(�Y@��뽧�O@�,׮�4n@���ՏW@���<ư@�a_�4L@��l�E@�֚��|Z@�����G@�������@�9�)�p�@˛����X@��tI�"@�b�+��@�ǡ��\�@�?���ŷ@�˕=��/@�k��3�4@�!��@��^��@��ȶ-�@��-�M�@��Uf1J@���7���@�C� g�@�B�ךUO@�z:��8�@�X}G �@��&�y�@�m���@��,����@�T���[@�ݪ��+@�v{j���@�#m�G+@��r���L@��Cq�7r@�˞z'B�@��D���@�و�@��Pr��@�&I�ì@�J_g�Bn@��I���@��[!ص�@�<�Tn�@�u���H@��ѸԸ{        ?/���^�^?e��� ��?�V�I�E�?��U�
4?��D7���?�3����?�o��O��?�(aJ���?Ѣ���T�?��Xά~{?��?<�7?��)b�?�hF��'?�ͣ�*�?�j�9��?���:�?�N�dC?��S�y?��|�3=�?�?�kZ2�@��s*�@��6�@3웧�n@��/"�*@	��Θ��@��!@s�Tt]A@8>I��"@�Ϧ,��@{6�N0�@A����@ �B4�@�y�<=@+���z�@Zq4��@ R�.�jg@!���n�d@"���U�@$P���@%�[���@&��t�Y@(�E�ӟ@**�l
{@+���@-�i�C��@/���W��@0�,���@1��U���@2����@4snӍ�@51���z@6l�D�S�@7��`7f@9
���x�@:m�c}49@;���U@=^pJ��@>�c'��"@@D�e4�@A�'[�@A�L�Z4�@B��# l@C�h "        >�5h��&�?$<��!?O
6'�n?m�R��*Q?�#�*�h?�}�/F?����,�o?�_�l��z?τܗ?�m?܊��>��?��lʊ�?�'��В?��OXS�@Hf���@�J�&�@ִ��M�@""JhH�@(�xW{@0�ˏ���@6���-@<�cN�@Be�R��@G;̦Q��@L���C�@Q�,-�R�@Uͳ�/��@ZYt��mv@_��׶�@b��o	�@f�h�!C@i�,ܦ��@n��(=�@qW
��@s�.ͼR@v�*cy9y@y�~g��@} b����@�^�� Q@�Q���݆@�i����t@��C���@�]�4[@���@���@�G���ȸ@����<a�@��VJ��@���Z��@�P%#}�@�2z�@��?6@����`*@����3�@�� �j�A@�}��qI@�� ��|�@��d����@��g��B�@�4Bډ@�}�`8�@���a2�C@�0;��@����L�@�����        ?#����?Y����?}N��	?��aO.�?��Yz�P?�a��R?���W���?�z�ˎ�?ٷG���?䖍\O̱?�*��!�?�����@� n�y\@��b�aK@�
)��@�Z�vٗ@#PZOE5`@*#���tW@1^�[��@6����@=(6�G4e@Bv�Q@Gv�׵�@LmN<81�@QP�z�@Tܠ܅��@X�6fI L@]a �b�@a1��n�@c�%���@f��1�@jM�PLJ@m����W@p��Z�ei@r��o��@u+��-�@w�h���+@z�s���@|��� 4@sш��@�/�tA�@��Z�^E@�P�^���@��"����@��"ߔ��@��o�)^�@�b��d8@�R˗�8@@�S�����@��-��N�@��-����@��
I�@���Od�@�0����@�g)��U@����I��@��7%Scs@�Cs3�#@��°#*�@�`G�P@�z����[@���
k?@����[�        ?ƚ��Zi?�y+�].a@!q��N�@6�� @Gk���|�@T8|��t�@_JHM�6�@fvhvրU@n��L@t���F@y�7��o@��sh_�@�vp+X�@�|�*A��@��yP��@���%�n@�[��9@�}3YL@�����@��$47�@��W�o��@�9��6^�@��h��v"@�^'"�0�@�B2�A�@�_+��@��ʘ�7@��zJ�$�@��R��i@��� ��?@��I�?�@��x)@�v�׷�@� hJ{`B@�U�;�w@º��B@�0Et���@ŵ��[c@�L1F@�@��4SRd@ʫj�O�o@�uH�!d>@�QP���@� Ŀk�@�!-��Č@�,lp�%@�B8����@�c�@ՏH���B@��t~��@���u�n@�]Ms�@ڻ�[͂W@�(&W:��@ݢ��$�@�+�����@�a�5p��@�5h�i��@�����@��:��@��c@c�@�Ը��@����?        ?wómMf?��k!�)?��Z��yg?���;�-�?��e����?�xm>�?��q�u	�?��O�ߪS@*���zJ@�Eŗ�@*ſ-�$@�d�EB�@-�)��@�/C[=�@co���@lF�;�^@!�jK(�@$5\�o�@&��󇈟@)\
8XW�@,2���@/5h���@13Y.�X�@2����w@4�� "�@6��)�s�@8}B�+�w@:��Ya-@<�)[7�E@>�@<���@@�I�)�}@A�� �+�@C�6�<#@Dhȑv�@Eŉ���@G/,ɀ
�@H��?F��@J(����@K��<ڲ#@MT���
@N��ڤ�A@PY�h�N�@Q:�xӐ8@R"AIY%@SR�/�@T{�zw8@U�pj,�@V����
@W��	Ɩ@X#q;��-@Y=���{@Z_S�9�Z@[�B��,�@\�\F瓦@]��Eo@_-�N�@`9p)I�t@`߃�4.\@a�L�s@b68�7^@b�����A@c�C%(�@dSM~���        ?[M��9?R*��� ?z-U7��G?�J6:�/�?���l�.&?�����?��)�K�?��y1�?�2 ��?�Pn�/s�?�}K����@qL�u@\V�o�3@[0=�@)�P�_@%G�/3S�@,�3>2�:@2�c��v(@8x���ɞ@?]�[���@C�C�Y�@H��n�@N�
�	�@R��W�@V� N�@[G��� �@`9�.a\#@c$���Ss@fh���i�@j
-S��@n��tm@q9���p�@s���1�@v<{���m@y��{��@|Ӣ��1@Y4'q��@�i����%@�C���[@�:p���@�Nb�G6�@�{<�p@�ͮ$@�8�&�+�@�`a�\�@���v7O�@���@�@���!��[@�����Ě@���͊�@�� �I�@���A�@�n�İ�@�*��--&@��0$��@����\w@��A�50@�ʘ�X�r@�����@��A��@�@�ћr\F�@��(Z�@��x��        ?_@�ec�?��K<�?���x��.?Ɲ��6e�?��f�:H?�F�V��U?�=� �?��2��!@An@qe@�4l#Ub@�Nc	9�@��}�!@%��&�o@-*�[��@3��Y��@:8��C��@A/_sS@F0�W��@LDP��@QƁP�7R@V�#��@[(�?�x�@`�"CSi@c�p�Y@gʺ�;>2@l0/�
�@p��2ﹱ@sW`��� @vl�J�z@y֏��h*@}����x@���v��@�49�@�������@�6>� ]@�����@�*x)@��g���A@��-�@�i��Xq@�pB����@��37�Lq@����k�,@�Qйi�@����2@�P��̄�@���/�@�H;�Mi@�����V�@���%x�@�]�}%?@�=��I��@�5����!@�E���H�@����~@@��:���i@���j�J@�C�ǧ�~@��|cHl�@������@�J��f�k@�����0�@�A! �uW        @Z��s��@Ec���B`@a�|�6P�@s������@��b����@��l��a@�wO^!o@�;��@������_@����g�@�Ȱȯ�x@�2��&@����&�@�酺�m$@�Y�[�g@��7 ��@�@D�߫'@�"�R�@�EÙ+�x@ͬ �4�n@Ь>�[�@Ҧ/Wa�H@��"l��I@�	�-�M@�t}�
@�--Ǵ�@޿_�3�@��bhڣ@�U�Ɉf @���E@��T�=�@�c���@�@�>w�vp7@�/�,F�)@�7Z���@�U���@��h��@��SYWF:@����Tk@�Yx+�F@���$��@��5Y'�@�V�f6�@��gG�9@�<����n@�ðVK�@�W��@����]�A �1�?A���1	�A�f���fA���:�A[`� A|����A�s�S�JA��;��A��W��KA	���s��A
�0���A�<Z��A?����A{=�K!A�ݫ��`        ?SP�1��?���â3?��!�Y?�P���]?Ƕfw�R�?Ӄ	Q�?�=�`�?�tf	?�r`���?�*�5�?�,F��w?�%� �\Y@ O�Y)��@LK�G2�@�_7=@
�*�@��޸�@�wS!X"@�]���@v�%�M@�yo5<�@��;��@�dX�w�@ K浊X�@!�TuL�@#� �oK@%�V-��@'�w���n@)�9�w�T@+�/�_m@.<�L��@0]����@1�n��J#@3����@4~�٬@6�ׁ�@7�\l�n�@9E�EBOq@;2� f)@<�8��*�@>�ź5�@@_l����@Ah;b�q@B{V�n��@C���8@D��x�t�@E�@[28�@G0d'|@@HxJ!E�`@I���R:@K(�s8_@L���n
@N�����@O���:�5@P�Q�}�Z@QU7�d��@R'(p@M@R�>!��@Sݔ勺�@T�J��6F@U��J���@V�WF�U@W�� 6        ?6#E�$?�?r�
\G�?�h����?��8��	?�q���u�?�0�LPg?�s���i�?�o�g��j?��X�3�v?�Q��^x=@9���[�@
�U�M+�@_Gt�@q��f�@#�?5�@)���,�$@1c�J�m*@6��=�:@=����L@B���0X@G��zLA@M�R>�@RS�9B0@V\B�LD@[i�G7@`2�]Z@c@�,=��@f�_�b	@j�7��7@n�<)w�@q�f�B,}@t�L��@w��σ0@z�]���@~Q����@�*J�e@�( I�ʑ@�e����Z@���{���@�b,  �@�"�a*��@�yzŜ@��Q���	@�;*���h@��zx�{@����y]@���jl�@����Թ@���N��^@��Y��~�@��KPu\w@�ʚ�=�D@�_��Ͽ@�BY�!�@��G�n�?@���p��\@�?���O@��$�"�#@�C���@��R���@�G!r	{@���әQ|@��'���        ?Q!�|��-?��ka�i?�L�'�?��p��[?����?�h��HZ?��`����?�MEh:�?��V�K'�@�dB/@DVx�&@1��Q[U@�m
�#@�A�l@!��fY��@&��~3�@,�%K;|�@2(IL�@6���po>@<o�D!�@A<b	w8a@D�p^�@IH��$E@N?M�M�@Q��3Y�@U+q]���@X��
�@\�2�1��@`�7���0@c-,I��@e�f�-g@h�7��d@lA|�PBG@o���?�@q�ت�Nn@s�>y��@v<����@x��´eq@{D�ʿ��@~��+,�@������Q@�P�m�@���q+D�@��%�\�@�id|�	�@�fR�k?3@���ƶ@���\��@�;�^�|@�@��(Y@��:�v�@��T�)@�Rc���@���2���@�_چ1v@� f��L�@��Uק�>@�{:3"f@�U{\�M@��� �}@����i#l@��V�/�@��]L���        ?��E/1�@/�G;6@O�0j��@d�s��Q�@t�n��r@�|:
��-@����|�@��}�#@@����hh�@��0�Ń�@��o\�0�@�_�S�@�w]��@������@����>]Z@�)�$� 4@����ȒE@�0�e�6�@��d�6^@Í=@Y@ųb��@��H�yj�@�\�w��@���U���@ό/
�)8@�-c�m�"@Ҩ����@�8���@�߇A*�7@םm7��@�s���5T@�b��S@�k5�� !@ߎ-z;��@��bkTp@�!���@�N�>l�@䘓��x@��{��y@�Y}�g�@��}K4��@�V��!]1@�돧�|�@폙���P@�B���E@��q�Ń@�k0�j�@�[�!�~,@�TY�`E@�Tf��i�@�\����@�m�]�n�@���f�u@���W��@��r/�Y�@�
9OB�/@�H����8@������@����KA �򞡧A �b+���A�d`��aAJ�1q�        ?~&$��|d?�b@���?Ҍ��}{$?�4�s�Q�?��"�\�@ ͔5��@��'|�@)����o@�f�R�@�pݪ_@" �@[��@&��G"@*���Df@/\ժ��@2Nv�u@5$��O�o@81���t�@;t��¾�@>�о�]�@AN�֒S@C?R��"�@EJR��@Go=��w@I�.?KE�@L���2@N���Y�=@P����p@Q�*�&]@Sw%��ze@U���u�@V����V@Xu1��s�@ZP�ࣱ�@\F�xsi@^T�6�wR@`>/��2@a^D'[,@b�2;@c��>�"@e��hDn@fP�F�4@g����@i���4@jk�I���@kڊUx2�@mO�g�u�@nˠ���b@p&v�QM�@p���@q� ���@rv��w�@s@Lz@tCi���@t��G72@u�F  @vu�j��@wG0��@x��1*�@x�'1&��@y�y���@z����I@{u[���@|Q5�(=q        ?S|��	�?�N�\)=?�.���g?ÇqI��E?�U�{UcF?����.T?���S�S?�`��39�?�JÆ�&@ �:1�@U�~b@ ��[ 6@Fa�EZ�@*j��<@"�@�rm@'����@.���O�}@3����	@9X3����@@Nx�@D���@H��9A@N�X[T�@R��e�t�@VvO�qR@Z�1
	c@`�3�Y�@b���Ь@fQ�)AĊ@j���L�@nJ�cD�@q�/��q@t�3���@wF%��@z0���|@}����;@��m�d>i@���ߟf@��L��3@���k%��@�5'=�!v@�D���@��>=]@��1Xr�)@�x�7���@�Y=
Q$@�X��'r@�xO[Zx@��Q��%�@��R��(@�NY3���@���a�E@�X͐'\@�{=5�%�@��5��@������8@�Ha0�	&@�.�䢂@���o�@���d�B�@�U��G�@�X����1@�dL�.�F        ?@�8	G�?s�Ȣ��?�p�E+zd?�9��UP?��^�w�?�@%�m?�Q=��%6?ޤ}Io?�ܬ��?��ߑ!m�?�P��XC@ դz�(@Q�H@)��]��@hoM�G@!���gY{@'��8�@/0q���O@4 
��In@9�M2��@@K_^@C�Rȥ�@Hs�O���@M��~��@Q�Ϲ�+@UB��1�@Y!*@]|T�:�@a.`�Ԡ}@c�Uc��@f���Bز@j<��/�a@m�Ľ�@p�oY�@s'��,�@u�^͛�@x%t� �2@z�P�ǌ�@~ �&wy1@����8��@�f|��}i@�Ib1ͩ�@�M���G=@�t?	�@��%;?�^@�,5�HƵ@��D �A�@�<�X88@����R�o@�.�:r��@����@�qa8�9w@�1
 �@�I�scV@��N?�>@��>�(\6@���Dh@����f��@��n�&m5@���[[w�@����@�N��|N�@��ާ�        @g���x$@V�(���@v�V�Gh@���z���@�oNpME@�v�Ѱ�V@��G���@��43ir@��-Q�k@�u�3�)@��F�t�@�ؔ��C@О�:!)q@ӌ�!_�*@ַ��R�@�s��i@��^���<@���׏�@��6�\u.@�
���#@�TˋQuh@���M @�Bη�"@��w���{@��uK�Up@�P^	�@��t}h��@���?�H@�F�^v@�#
{	�+@��g��@�4�>��@�j��ˡ,A � :u&A� �CA^ �g7�A�=�rdA$:�<�A����A��;��A
y��r�A�ˌ��A�v�TyA1S��&Ah�e�/�A;$n=A�ZZ4VA嚂�A��bpA������AmB㺌AEL���A ��w/A�V�!�A��!�
�A�jӅ
�AuG�6�AI�����AU���A�H��oA�Os�]A��F�E5Ao��_<�        ?7p�)�Q�?r�]�$?����	�?�OV���?���aI*�?�\���;?�r��f�?�D8?�P<�ی�?�0�ԦM�?�_��?�ԽXvO�?�O�.�?��ǤF��?�/m�/�?��	�?����I��@������@ѫª>@E/؜� @�@�a@���r�@��M� @�2y�@�Z�Pc�@m*�b/@XA���@b�Y�g�@�s̳=�@� 7�^�@P����@ ��X���@"WJ�2I�@#�wZĻ#@%\%#��@'XiK�^@(�S:j�@*�f�.+@,�hue��@.�S���@0`�	ͥl@1���g�@2�sz��@3�����@5U��0�@6��֫Yb@85��$�@9�0>T�9@;]�@=���(>@>����|@@S�9︖@AI�wUn@BJ�Ь�@CV�&��F@Dm�˻U�@E� g�b@F��͂��@G�<�-�@I<�q�n>@J�b��D�@K�cPTX@MW��"!        ?!�^=q��?`6qw�y?����!*?�?U1�?��~Ϸ� ?�P ӕ�?��t(!�~?���i��?�ʻ���?��~N7�?�	%�O"K@e���@sp��@�Wtw�@!�mb�@)dspm+@1��2@��@7�㠄m@?���^�@D�H���@J��p��@P��m!�@T�j;9�P@Y�T��C�@_1��YRT@b��(A�@f;DtG@j&��4{�@n}��\�O@q������@t=_0p�@wq7.i�@z%V��O@}t��e�/@��c��Q@�h͙DA�@�qm���@��2�IH�@���C�@�\	�^�@��
\	�@�W��p�@���jU�@�O�%��@��C�,\U@��kXZ(�@�Z@Gv�`@�2���@��k�K@�!q�/��@��Ԋ��@�4��>*@�V�|FV�@���Q_�@��n�+�]@�^3p��@�V��A�@���_�7�@�"2�ľ�@����<@�#�[�\@��/PP@�/��{h        ?����'?D/?
�m?g6(+b^?�k!r��?�.q��?����X?�����?��v�T ?����5?�_.��A?� ��;p{?�D��!�@ \��F�@
�y�K5@���Y��@� �6�@#%�\3��@)��%�#@1��(Q@6<e��	@<fk�@A�-Wk[@F"�T̆�@K�[=�@Paw�ο�@S�d�62A@W8�����@[E��(�\@_�
~@b_�ܷK�@ejW<�C@h��bƻ@k\�b���@n�&��g@q_K��@sp����@u��h�\@xtz[#@z����?@}Wo	!q@��R\��@��r]��@�OO����@�.��Y@����FE@��*�J[N@�����@�
U���@�Qt��@��1��s*@�����@�p]-J8{@��?�f�@�I*t:>�@��e�~�@�jSg�V@��p�D@�ػ*�\�@��q2n��@�L�}��@�L��#z@�Xk��@�oR%[w0        ?�~>���@�&��n$@9�SA�@O�y�zRi@^�h�G�@iu&��B}@r�P*y�@z+a	���@�F��H�(@�^����@�S�Y:Ci@��?�Z�@��<��@�`[��@�;�@q6"@�kS�_�@��j�x�O@�j��ݪ@�6�o$m@��^0��@��ٴ�^�@��BO��@���*uk@��e���@����	�@��q� @������R@�*N��@��iK�=@����<f�@��PU @Õ/��@�.\!}�@����\�d@ȭ�nW�@ʗ�d�@̝�s	@���,n@Є-�h�@ѷ��{�@������@�T(���@վ��,��@�<���CG@����b�@�u��1�$@�1���U�@�촤!�@��&(�z@����9@��U.B;@�R�gд@�6Ń\�=@�ež<5�@桔�Xz|@��n�2w@�@��kr�@�e��|�@�5w�O�@�j{�@�%c�[�@�a�	?��@�8\�|۸        ?t�4�I?��|�3I�?�Z�B
M�?Ֆr��-�?��Q1��?�oJ��?��]2��@ 9Ѷ�)@`�=!�B@=~�ڪC@�r�c�v@��~O�3@�e>Q@��-��J@ ��UW%@#3��Z��@%�aYֽ^@(����w�@+yLw���@.}�A<�@0�L��dQ@2p���@4 V�#@5��`^�_@7��{�J@9�C����@;v�Q��@=re%���@?|���@@@�iR�3�@A�v�$�@B�G��f@D�b�n�@E>���/�@Fl��ϗs@G���Ջ@H� @Jkљ@Kf�����@L��AF�@N��M�@Ok��a~�@Ph�f��@QW�_N@Q�er`@R�(e���@S\�@J��@T%E���@T򚈞��@U��!�u�@V�"�M�@WxH����@XY? �@Y>���4@Z)=����@[8�z�@\d�'W@]��3�@]�d��l@^�]y56,@`��;:@`�����@a]%��        ?I]��n*?��*��Ͱ?�r��I�j?�/eCi�?������?�כoQp ?�z�\G�?�'���?��|$�D�@;7�X��@�'��,@�QtT�@^q�5Do@%��"��m@.�^�w�@4I�<���@:�
��X�@A-�eJt@Fuࢧ;@Lq�+f<@Q�3K)J�@V �t�@Z�l�;�R@`SJ�S�@c�(3H�
@ga����?@k�ۧTK@p</}�ܯ@r�=�j@u��� >@yE�R�F�@|�n�E�@�z�9�@��6�@�>���R@��-I�@�^oա��@�S=�@�=71@��_��Ө@�����J@���~�@���Ben�@���w�4;@��P���@��8  @�,5x}�@�av�Ћ@���~��'@��lL���@�;PRy@��;���@��Qʔ�,@�`�
�
@��l�ފ�@�H��c	@�ų��Gm@�H��@ |@�h~*z��@�/?��+@��y��
�@���@��I[[]        ?C��^V?s����Q�?�;z]��?��Ɗ��?���U��?��I�vs<?����5 ?��H̀?�@ۛ#�;?�O��3QL?��2�f�@�����@���eQ@��6�Z@!�pϽۘ@(r+�i�f@0��ԩ�@6 a ���@<�X�r/@B�I3�P�@GwÉ�Ї@M7ɠ�4@Q�٦�R�@UƷh���@Z$6���@_H|�l�@bS<�;@es����@h�[F�sm@l�DH�@p� Ȇ��@sG<l�_@u�=\��@x�aM��@{�<u���@�Y��q@���<��@�븁���@�H<�[�@���o�`[@���3p7�@����@K�@����Qq@����@����v��@��Y�d��@��DI#�E@����*`@��mܲ�L@���77@�z�$@���y�U�@�����@�+6NZƽ@��SXhw@����s�@�����A@��!����@�����A@��@�1@�8�Q��@�s��R�@�����`�        @�nn�@F0�-��@c�Ǳ� �@w��5?@�εy�#�@�zh��@��v�-k�@��/�-@�N�|��@�8r��[�@��VDg@��t$\�^@����@�d����K@����	@�2>3	�@��R�_<�@ɜ����@̔rk�@ϰ�wj|�@�w�/.�m@�(,/'�3@���{�%@ֹ�B�@ؚ؍TQ@ڋ�����@܌+@ޜn��L@�^K�8" @�vG�@�%v��a@���bs�@��r�)d@�$�g��@�d08���@諀���.@����53@�R�H��@첗�\�Z@����@G��@��w��S@�C]=�G@��`yܿ@��}�~[@��Nφ@�t`���#@�L�+\W�@�)�;���@�H���/@�����@����D<e@��Uz��^@�ǯ�#j@������@��c=�(�@���!��t@��A�:@���T�&\A {мmwA�I\nA�~�r�A*ގKں        ?L�Y�q>?�Hy2�?�.JM���?�1�2�J�?�'P��d?��n�ͦ?Ԗq�k�?�~6hcnQ?�Ә����?�	i>�/d?��]X�Ү?�0���*�?��$'p�<?��u'��?��)t�a�@PK>Va6@�e ��B@�ƌ3�@	��a���@�/�}�@b�g�@�`7�(@�L%�_�@*{��@a�A[�.@ۥ���	@�͡�Z�@ ,��/@!�N�Î�@#O״z3�@%	a�w�@&ޱ��s�@(�e�k{�@*��?�#�@-
��Ȅ�@/Tbn$:@0���ڀB@2 ��{�@3ra�.��@4�:Ƅj@6C��@7���Ӂ�@9O�M�/@:����x@<��/u� @>O�-l�@@�q'{@@@�y�>�@A�1IY��@B�С�?@C�X5�i&@D��+�R	@E�r�+6�@G	M�k�@H%�M�^Y@IIxU�cr@Ju&浀�@K��ǘ��@L䲬%�G@N(�`"��@OuҌ�9@Pe��׼q@Q%�=7        ?+!��"�?k4���	G?�x=-d��?�[�R/6�?�0oOp:?��(��?�W��!Y�?����cV?�1C�
>?�KN��?�a����r@&���@"�k@�_*EE@�
���|@#�F@-@*�]�/�<@1�����@6�l1���@=V�vi�@B��U"e=@G.Λȩ�@L� B1��@Q|u<v�3@U(
$ܞ�@Y^��A@^,!�gڗ@a�[�ԗp@d�+C�]@hKbd'�8@l���@p*Zt�E`@r}�� �@u
���@w����@z�n-�@~#�Bv��@��w��H@�����@��{_t�@����)E@�Q�af�R@���o��@�q,����@���3�@��np܈@����L>@�Hr\g��@��ƥ*@������@��� �+�@��<���I@��[ҧ�@�er.�C@�~�jX�f@���O�@��>W�y@��-W@�F5	`H@���<�@��SZ V@�=�cD@��k�^        ?-s:֗�?_7fT��?}�<���?�⬆ی?��=gƊ?�h�	���?���2��?�:��{ǎ?�n;�<z�?��۱[ ?�m=Vr?�,8�	'@�����@��_��e@�a�4m\@!��`��@(�ů�t@0�4���+@5�1�Ñ$@<���:V�@BE��9~P@G�����@L�n��!�@Q��2hS@UlF7#�@Y���F�@^ħ�h [@b2T���/@eŽ��@h��N^��@l���k�q@p�*��-�@r넙i|@u�*C�g�@xS'"*0�@{``�*�@~���F�@�$�}��@� �9tϔ@��&y�@�0I�`�@�z��ڔ�@��w ��@�v���@�@��_���i@���k���@�z� �Ƈ@��1�pU@��<f�Is@�V7v�M@�8��	;@��7C�@��LC�\@��<���@��<�,�@��Sl��@���^�@�!�E�.@�G�'�@�v�Er@����Ün@��54��@�:J$�        ?�2��]�@ xֵ���@@�3,��-@T����@dB���@p�#L��@x�b�"�e@�)�0u@�¨1�5@�b�*�Z@��%��@�5`�z@�s�Q���@�@�Pk҃@�A�?��@�"�P'Cv@�G�oO�@����w@�ym��W@��r���@� 4T��@�zC�r/@�$z�ؘ@�	�" 0�@�-}~@�H�,��@���f��@��HOE@�-4�}ǚ@�k��&t�@��<{m@�ZI�;�@Ѕ��>��@��_a���@�p�Ƿ�@��b~�@֪�c.ʥ@�e72@�3�B�@��^���@��{[O�@�
΄V��@�ڼP͇@�3'�{@�V��1�E@䄲�M�@�x�I\@�%�N�@�O��HfE@��Y�.�@����@�
Z �@����$�d@����@���O��i@�a�E�6�@�:�B��@�m�B��@���˞@��&�%��@���c�j@���~Բ@�ሏ�F        ?iz�X!�o?���~��?�G���cH?�`d���?�J<�l?�]�鼝?�"�'�,�?������@��W@"Fዥ�@j'!4 @�;|eϓ@q� l��@p�Q�q�@�7b�[@!@�c�@#�rb9<@&�,�$S@)k�&X75@,���_�@/�G�S�@1� Ы��@3u�����@5`?o�@7a�* Z�@9y�z�gy@;����9@=�O.I�v@@#����(@A[�d���@B���P�@C�2�@EG鶒��@F�Į4�@H�*��@I�w6��F@K��=8�@L�u8s��@NSܹI�@P �]0J@P޳��'@Q���H�U@R��wt [@S�
řڴ@T��s:�*@U���@V�F䶹�@W�DX�|�@X�����@Z3�����@[u_��Q@\����O�@^#/iE�+@_��Se��@`���K@aM�8���@b#��M2@b�ه�ۥ@cѾ���b@d���œ@e�X���@f�*�_��@g�g�9�        ?(q��? ?c��M� ?�J�cAj?���YgF?�~�;�/c?߻���	?�w鲡&@Uf��/@��x�3@�jZ7D@#�+��@-1f�\`�@4��`5Y@;�%��^�@Ba�=��c@G���O@M����1�@RP>���i@VE�ǆ�@Z�^zg��@_���jh@b�Go�&\@e�m0�O @i=���h@m9�-@p��Pv��@r�����O@ur�ݼ�@x2?�b|=@{0��m:@~q4M���@��X8@��A�{��@��ߜ�T�@�"�E�$@�~֤8ڰ@���&O@��3�!�@�Ȭg4�p@�L�
y�j@�����[@����s�@�c{t��3@�D�#��@�>](#�V@�Puە��@�{c��aU@�߬�Om�@�5�+�@�II�
��@��ը_�<@�乫r�@�D�Y�1O@��ֱ%uJ@�(�Y���@���-Ry@�:<�zf@��qO�o�@�;��Z}@��U#U�@���2f�@���t�x�@�����h�        ?Ndj���S?�L�t��
?���:�G?��$�~Ƴ?�,���V_?���?�ע�bL�?�x��ҽ�?�߶��`@
HO�d#@	�����X@N����@Ә�W�@#���	@+�'[���@2��JO@9sl�f�@@w�9,�r@EA��x7e@K	��k�[@P�)�_�@U�x�^@Y�3}=��@_B�񼸋@b�uc�Y@fZd��L
@jd��b�@n��_��@q���@t˖o��<@w�n k@{G�O�@~��#�l[@���4-��@��KD�@���Q,�@���H0\@�Tw���@�@|6��@����vN�@�Y3��jB@�����@��Ҝ��N@��k�R�X@�?�r��@�Lq��@���@%�@��y��@���U��q@�3�*��@��}Za�I@��Tw�@����E{ @�P���c@�HӲ�#@�̱vv�b@��Qk|�s@�J���@�KԵy�#@�W
�r�@�l�J��f@���Ō�@���`��        @ݹy�-�@8�۝��	@W�ĺW��@m�+�ɫ�@|M:I*�@�3V�u�@�4���^�@������@���@���@�'ȓ��@�ڦ���@��s��lK@�E���*@���U�`@�%�n���@�V�}��@���0��1@��H�V�3@�/"2���@ǳF�_(B@�\����@�+xn >c@��Z?�@ќNbT @�:��3X@��=�!�@֮�t���@؃�# ܼ@�j����@�cV���f@�m�{'%@�D�H7��@�[T���@�z�����@�z�d��@��Kz�&�@�>IL�@�P�]*k@���X@���`��G@�X�$:�@��||o6@�B�����@�ˋ�w @�9�3�@�Y>6|@�bU�J@�H��Zj@�9�u�@�7*G8��@�A'�ܳH@�Xƨ���@�~�)���@��%��&w@������5@�H�Ў��@������"@��6[QA N\�g��A�:~yA�l�A����`A�?��        ?�a�x�~I?�i���A?�$���N?�H�Iii�?�6^�=?�>ʊ��@����@	�4	@�S{鎎@����@M好�@ ߷�;��@$��w��3@(�B���@-�>�#@1�)���@3�M��A�@6ز�w�@:##��ġ@=�9��@@@ƫ�N��@B��'��@Et2��@Gj�O�O]@I�ũ�@L�����F@Ok�7Pǟ@Q3����@R�oWND@Tp��H	Z@V0�ɀq@X�Jz�@Y�R���@[�k�@^dp��:@`+]U�T@aT�"�e&@b��`r��@c���l�@e!��~��@f��&�@g�q�@il2?#�W@j�y�$�@l��?C�@n:lr�@o�>5@p�D�A[@q��] [[@r������@s��UN��@t�Z�p8�@u�2o"�A@v�iV��@w��G�@x�|�'@z#����@{P�ؚN�@|�-�^�@}�Y�G@Ar�W@�(�E��(@��fB�y        ?��י�?P���%N�?q�G�|0?��&��w�?��nC�?�
4��I?���j���?�qI��q?��'�J�?�x)�=%�?�g�@Bl�@ H:��bJ@����a@{�}�,/@���P��@"��:��#@)L�x��@0�j,Ts�@6:Ѐ ak@<��f�@BSsi�@G?�y��@L��-��@Q�&ʓd�@U���ʑ�@Y�/�?�@_u6m@bo�H�)�@e��ի,@igx�x��@m�,nW�@qI�v@s�����@v]u���@yl���@|�Į~&@�6KȪ�@�1�� �I@�W�W[�B@�� �8:@�*7
a�@��G��@��,>�@���(@�����c@�J:iKA@�$A�]�k@�$��"r@�,d����@�[y4X�@���Q�Y@����ϡW@��w�0@� �i��@��� �w�@����A}%@�z6�~ʃ@��Eu�f@��_�qw@�lAR�$q@�6�AC��@�
H@'�'@�Z<G�        ?]�kW�	|?���P��	?���;Xz�?�b��T?���Kn}?��|���?抂���?�Id��?���y�T�@��� *@.Ù�7@%��@��X�K@$�cY?w@,q��@3�4Kq�@9,����@@O�L:�@Dʧ룷�@J����@P#~=��@S�Q��ɬ@W�i��֣@\M?�NTi@`����@c�Y�?#�@f�pD���@j	����@m�=�2��@p� P�|@sY<;J�@u��ʋv@x�T�@z����3�@}�<{!�@���J�@�`�wQ�@�G�_���@�T��5{�@����I�@���P�	@�u�Pi5[@�NtA`@��ss0�6@�"m�R!@��Pf8��@��v?Fc�@��;�$mI@���:��@��S(W@����:@�����@��\��@�g����@�ڱvC��@�b`6rgQ@��Q��>�@��!e1H�@�{i�@C@�[��@�S����'@���
+@��v��!        @Ż�{�I@I�z�'\@gg�ᖬ@{��Xȍ@��X�4@���p9+q@��<))jk@�-"Ǫ��@��Ns3@�O��r�@���6���@��.�W��@���. �@��b�C@Ǆ%�7�@�r���@���_��!@�?us��@�҇PW�@ם[�&�@ڡ��%��@���@���@எ��ҙ@���E@�׆�_�@榗oQ��@���;�jM@�Gv�^*�@�̄+��%@�;��vB@�XH�a@��!p@��R�sT@�Q{�۳�@�	Զ�@�ږ�,c�@�����@��*��f�@�ӊ��֫A ����A$��V*�AUoY�-A��s��A���rߓA:d ��A�Qf��XA
c�0A� ��&�A8b�=)PAޏ AyAJo{:�A-�*Y�qA��7RA��}=ADH�\A_���A �U�"�A8�b7$AZ��W�A�г�+'A���~�A�e��>AAB)Z<iF        ?>�;͈�?zV��>?��
���?����(�[?��e��k:?������?ԺT�s�?��2`7n?���e�?�l[�e8?�l���?�2p?�=J̹��?�G���9e?��w/�Y@��/vm�@NU�o�@�&���@
e��]@(���G�@>z��4@�c��+@���T��@�2E2��@��ʼ�@$#ai�6@xJ!��w@�܇4#@ ���o @"�X���@#�Ɲ�<@%b:��5@&�#����@(Aa!F�@)�w@��V@+��йX.@-�G�s@/���C�v@0�۩��@1���ߺ�@2�o����@4�s;�@5P�_vL@6�\Lt:�@7�����@967m{Ņ@:��-Ȼ@<�K��@=�3[�@?��8Tl@@Y���[�@A+�M>+�@B���@B�)�@C�p����@D�ߐ$"c@E���s�@F����@G�P6X6�@H��cC$�@I���
�,@J�+���@K�O���        ?IOY��?�+y��|?�n|m��?ú�q�.?ԲE��3�?�z��KT�?����UA?��fx��@ r���
'@
h��5P@g_ b|@���)@mУ�=@!���/*�@&����a�@,����Q@1��bޱ)@64�8�.@;b�����@@�����@De���8@H�Uo�i0@M�W3`� @Q����F2@T��?w�>@X������@\��]�@`��
~h_@c�k��*@f���\�@i���@m��i���@p�����@syT�@u��4ð2@x6��*C@{"pN���@~L���c@��Xi��P@�����@��ޤr֠@�͞�ٝm@�ZH�3�@�z�Ǫ|�@�hm�@�a�_d��@���j8��@�V��j�@������@���]�֐@�d�;/E@�@ �˕@�2�D�/@�:��*`�@�-�u/B�@�I����	@�r��!h@���H;�@�锽��1@�8��_�4@��Z�Yg�@���6���@�xm�&O        ? �U�4R?9!,$�	�?`�:@�~'?�S� �?�6���?�)��� w?Ħ�3�;�?�S	𺥬?��&��P?�GVJ�@'?C�a!@�Z�Fk�@6W�r�@*��͛@&� ���@.+y	�c@4󾶮�@9�Z��/�@@l�q%k@D^`�J�@H�s.z�%@M�{���@Q��U�/�@T�:�˦�@W�=��,%@[@*�cl@_�\"�@a�X/8�@c��~�m@f�����@h��$��9@kw�gN�{@n|�F��@p�f���$@r�-ƙ�@t��g�x�@v��B�\@xݯ��1�@{A�ֳ�@}Љ���(@�E��EEL@�����w@�B�b�]5@��+4[@��S�D�@�g�^�@�L	�	�@�G��NW@�X��Z�@�@�4�@�`�b<v@��$_�Z@��2QQ�$@���%�@�T�6P� @���G�*�@��_��@��HN|�@�
�bT��@��O��S�@�3O�e�e@�n	Ħ�@�Iw�,�        ?�e4ހ*@*m�ϓ�	@L���]@b��~֏�@r|�$'�@}�ڵ`I�@�I�8�%@���4@���EH@�;SÏ�@�Igm�X`@��(7��@���ON@��N�>�@�f�o@�r
'� �@���V��@������@�z8��)@�s`]�_�@�I'�S�0@���Pg�@â3o��O@�l�b��\@�L<4B=@�@����@�KT�M@�k�=�.@Ϣ�p���@�� eU��@�*Q�J4|@�h�� �@Գ���@�
}=�lq@�ou��@���o�V-@�euC�&�@���n��
@ݝ"@L
3@�TwzD@���P���@��h��E@�z��tk�@〺�-�9@�8
>F@�K$��N@���_�I@���V�@�KM�Z۲@�S �]@�鮋� �@�G� X\|@2.�@�Go��@��*���R@�h�w�@�S����@����@����i,@��l-z�@��E��@�p�p�<@�PL$�6_        ?1�����T?h�AK?�?�H�R?�/��8��?�����-�?���؍8?�x��q��?��u-o/G?�u�;U�?�+�M�ѫ?ߞw	?�i�<!d?�k�7��w?����_U�?�]z���1?���tQ?��Za��?�0��@��?��F^�!�@ ;�ek�@Ga~��@y�m��@���I.@	Xl�d%G@���'@ڮ'ս�@���I@�݆���@+�Fʿ�@��@�y��@�F#z��@�C�1Y0@�9e��+@�wv���@!���Ƽ@"Hn�U[�@#�:�ٚ�@$ȍ�aف@&���'y@'|y� Ȧ@(��Mr��@*gB~�@+�� ��@-�����@/4}|�L@0vj��2Q@1Z��q@2F���[@3:�>1o�@479�#�@5;����Z@6HIe�_�@7]�O��@8z�D!7@9���}@:͵�A�@<�	T5"@=D�E�@>�)��'�@?�yHrK@@���{��@AQ�
��        ?	E���L�?F�` W�?l:�6f�?����2s?��=�i?�jAf�(}?���$ ��?Ќ6<�+?�P��� -?�-�2Cjm?�2΋�J@�Ԫ@������@"al�{�@!��_��:@)�:�%@21�v��%@9)r1��@@�s��@Fc
���@M)n�v	�@R�`���E@W���:�@]��ڈA@b:�=�@f>���z@j�U�ӛ@p#ꘚ@s��v�@vs�6 �^@z8�b��@~f&��-@��4��&�@�N��8@�����@�ǕvӀ�@�e���@�=��n@�+�·5@�Q��b�@�+}+i��@�c�.��@��/�@�.��l�?@��uO��R@�8�3x9|@�����%�@�R�q�@���$�{�@�%,�p�@�����@�k���L@�"RV�R@��'0�@��RY�1�@��ջ?��@������@��C��@��D�5��@���
{@��?�îY@������@�ܾ���        ?W�0$�CT?��2��ֿ?�����J?к᰾b?���F�� ?�r_��?��;���@^g&@t��\"@��*;��@�:5Y��@"��i�"�@'� �C�@-�<�r�@2~fYѓ@6�:�C�@;��7��r@A���(@D� _�,@H�:��gh@M�"�e	�@Q�R4ow�@T��~�/@XK�-�&�@\^<��t�@`y���N@c���%@e���L<]@i!��u�@l�
ɶ��@p'�z�m@r=���9,@t�� �'@v�]�{@y����V@|�
���@�����l@��,���=@�]#&��@�Q��֙@�k�㏀ @���h���@�����)@��ţ�?@��/�h��@�+Ё�~�@����/Q@�fE>ZE@�*�|��@�2���@�
|��q@�'{�B�P@�dJ��4�@�����@�!D�,�{@�sV�qN@��Ώ��@�Pۮ�@��E�l!R@�}i�U�@�4UvJ��@��KY@���?�        ?�m�`��@H�1*@=�
B�@U8:RK8�@f�u�X�A@tm�3@���@~�@�	�G��@��
('
@��#^,@��(�@���=�@�dSn�	u@���ʬ@�P9�@�^�oa��@�	�뮟@���`��u@�UC���:@�J��'�@�v &�B@�mvU=@�=
�#��@�*��v�@�6�&.��@�b�4jM�@ʯL[�k�@�g����@Ϯ0;2@�1g4�j�@Ҟ=d�@�E�+�@ղG9�Q�@�[,�ד�@���.@���-��e@�����@���Ƴ@��fM���@�&�l�@���-4p@�z��z�@�`�@I��@���b��G@�31�:�@��mTǚ@�P �q>�@��9Ќ��@�����_@�IQ��~@�>\��b2@�>a�3�W@�I<��P�@�_�W@�լI�@����w�@���5�@�%��+�@�t@XLx@�ΆKb@�4�����@�����A z��s�        ?,�Ii�L�?e�6}��?�T���1?�`Y�I�?������?����։?�'���A?Ϙ��ʈ�?�Ql�w�?۝���?�X,�0p�?�G$ ��a?�[L�ٞ?�jh���?���=��?��� "�?��b�y�?�^�����?�/:����@���� �@��4��@u�v��I@	+��}�f@q��J�@JÔ<N�@]d�]$@6����@4l�.��@W��{�$@�+�]A�@���Z:@�/�aP@ ���m�l@"<S!�F@#�6p0��@%��t�@'F�;D�}@)(~��8O@+%�Y,�@-?/%\��@/u�+�@0�@�1��@2N�/�1@3i��:�@4��5ۖ@62Qe�@7���f�@9DN��@:�::�H@<�3�1@>x���k@@0�Bg|W@A0.x�}!@B;tGO�@CR�cw�?@Du��D��@E�x�Uz*@F����@H*+�l��@I��4�@J�֠��!@LQ%E�@M�2(�D�        ?t�� �T?I�ʯV�"?o8R�k�?��pۙ��?��p��	�?�����k?�Uyq��1?����?�/�7��?��i��?�A=�8?�Oކ��&@��]�@�3e��@礚S�z@"8����9@)du`�@0��Ff4�@64'9�@<�6�Ԁ^@B\%7&L&@G�-J@L�?Č�@Q�7Ċ�@UE9%���@Y��yo��@^NJ�¡@a׾TK��@d���XF3@h(y(ĴT@k��7���@o�LX0O@r�j��@tuU���@w��ѩ@y�=���@|��PSĴ@�W�W��@���]���@�}��ò�@�l{_�Y�@�z�_zb@��+�sit@���5@�c�C�@�y��G�@��!<��%@�>N�h^�@����X@�Kx/�@��X-��p@����P�@�o#o�m@�N%���@�B\[��@��6J$�@���;7nV@��m�=�@��U�r�@�.���#,@�o��T�q@���ӥ<@��X�H�        ?;A��[$X?r�S��Ea?�6�t?���5,�4?���YP7?̗bL�D�?�dth�L?��M�ZU?�S�j;M?�P����?��WR{�@���!�@jO��[@{�Zi@~�t<'@!����@'�v�7MI@/{�\3;@4'���b@9�*�nv�@@b�I���@D��X�5@Ic�G�'@OY_,r�@Rկ�0~|@V��j�c!@Z�Ą�z@_���V@b�vA���@e�?�N�6@h�9s�o�@l��RE��@p^��Xg@r�H���@ulo�!�@w�hQ�l�@z�����@}�x�$�@�v!T}�I@�?��O@�(�Ƕ��@�4���7@�a��n�@��K���@�(��.��@���\�$@�A�f�@���<�g@�8�
4
j@��D%��@�|�L��o@�;�/�G @���$&�@���%I�1@��e���@�}��lA@��i��X@���)_�J@���Gp�@����:@�9�p�C�@� ��@�Ϗڨ�Q        ?��Z�t@�j�U�t@2A���@H�25�j^@Y��r:@e�_�el@p��{U��@w�L9�@��{�`@����<��@�YȈ��c@�6�-
+@��v�#��@�D�;}�{@�P�*��@����͋�@�A�b)G�@�ّ�R�I@���},6@�� ר� @������@�����@���3KƗ@��7����@���C�JW@��Z� C@�[:dGǼ@���i��]@�M�� @�����=@�:R�~|�@�ςM<�@�y�Q��@�9Y�4��@��̐ԧ@��Z�[ʸ@���Ԑ�#@�Q�N�x@��r���@�@��O�@�n�Y��@ԩHO(i@��+9�#@�D��S�$@ئ��1
@��B���@ە�|�@�$6H=��@��/�d@�8�՝��@�E���o@��o�@���ǩi�@��;F��@��{����@��SYRj@�"�z���@�F�:,l@�u[%<3@@��\���@���S7j&@�>�+�%@O�~j        ?:s�o�?pM#_�n?�P�It_�?�v<����?��:;%?�f-N7܇?ȞmS��L?�KX�q�?�,�UN�~?��6W�1{?��~��?�G[*Jߥ?�3��yv~?��έ�̋?���3�?�B���
?��(�ĵ�?�SK�U@�8���@Z=�r�@�/B�@
'��6��@xMnV5�@�ԁ�@�@~,�WZ@�`�w�@ߔ�7_�@N��Q�@鏳;�f@������@ Ҥr��%@"d=���@$�Bk��@%�7m��W@'����@)�1��x�@+�����@-�8{A�@0
K�C�@19 �@2u���@3��*3NK@5�/P��@6���0@7���gH�@9�9b���@;�U��?@<��dLf@>���' @@'l��Sy@Aj� e@B>� ��@C�P}%@D'�P6#@E@C\�d@Fc�V�e�@G�QM@[@H���"@J
��|p+@KV��	�@L�d�X�@N��=�@Ou#gs�        >�����g?A$}^e}�?hR��ɳi?�{���6?�[���p�?�)B�!en?�e֠�1�?�Œ�=�\?��x����?�a�S�]?� �$�?�4�A@�Yܣ�@��ϩ�@W�R�] @ ��@
��@&���@.�E_T��@4��3N~e@:慡��@AK���@E�W�#>@Kf���@P�p�!�@T�Oі.@X�7\��@]�3���Z@a��!��&@dƄ`��@h8w^�J`@l�]�`�@p/��8�@ra}�\�@t�s�3@w�{D�@z`�a�@}o��gw@�X;;��@��=�J�@��]�Ѵ@��Up�@������@��K�K��@�+O���@�}y�@�u)�G�{@��@��@�\ԍ�@�k�-�$F@��<�#K�@�Y�G7�@��9]��@���u�RJ@�5��h@��K��J@��Ҵ�s@���f �@���{cP�@����M�@�ⅿ|@���H@�@�˞�@�Dc��zs        ?"���c?V�le�?w��e�xD?�7%�z��?���H�@.?���9�z?���G�*?�����B?�M�����?᪝6Zw�?�m~�.�??�+��)�@ ā3���@�T�C@��%�@��_+Y�@ �� /@&GV&L�#@-(kO�13@2������@7³M��@=��Ԇ4�@BLC_�@T@FL�7�
^@J�ڶ*@P^R�b�@R��}zc@VET�o_�@Y����@]�m�,@a3��!�@c��Y\T�@fG��V�H@i(.8+u@lEĵف@o� �by@q�G׷�@s��@�z@u�6B�S!@w�TO�@zB���! @|�rK��\@}��8g�@�-Ozj!@���=I@�MMma2r@� I9{�@�˚�!�Y@��hy�`@��o'��@�Ǜa���@��q-C��@�&�R��B@�^a<]�@��/V��@���ƙ��@�b?�l> @��ʘy��@�b����/@���s>��@�� h}@�kվ�V?@� 4oOl�        ?�mҽ(�@2���t@0�[�@E�]n�:�@U(&,���@a��'��g@j�\$�3�@r��v�J@x�U���@�&���-�@�V���$�@�-BY@�_~��M1@�#�-��M@�iC���@��k]qT@����>L@��4����@�	�>�@��wzρ]@����SZ@���4p�~@� �?�iT@�dN�-�@�[bit�M@�v����@���PO�@���w��@����t.o@�bļO�P@�!�fBmM@¨S*��@�ES
;��@���x�>|@��fy�A<@ɬq1��@˫�-�Z�@���J�fU@��=_��@�&,��+@�\����@ӡ�����@��.r���@�WU�k_�@��{�ypL@�I��\@��6����@�yO_ @�)ul���@���2�'D@��TCk�F@����@��J��@��{񠻄@��Xd��0@�䭕�|@������@�"�<Mw@�N���}�@ꃟ^�V@���(-@�4/kpf@�V/�S*�        ?L|�/�7?��x���?�3k��?� �V��?İ,�f�?��c����?ةz(�x�?��	�F?�t%�q�2?���:�?��b�	�T?��� f&3?��"G<� ?��j7�p@�&�6ѡ@�A���@ش��@9�'o��@�l���@q�	���@���>�\@�rSf�@o��sf1@ �$�H@ �՗w�@ ��v'��@"+�9ت@#��ͨK@%���Y�b@'��B�[�@)��t���@+��(��@.Q&i ��@0dn���@1���ëx@3A��a�@4�g��Ӊ@6"�q4ZS@7ϝ2��h@9�&p	��@;~6`$�A@=�^!vi
@?���PL@@�7@���@B-Oo!��@Ct?��+@D�p*X�p@F9F&���@G�6b�Sd@IJ��n�4@J��/fS�@L�Ԙ���@N�iR3�@P3�ٛ��@Q3p�>��@R>�)WcS@SU���@Tx~܁��@U�%f��@V�s�~F�@X'4V�]�@Yx,� I�@Z�%o~�        ?:��(�W�?{��n���?�M79�H?�l��Utk?ǎ����?�Uކ���?���+M�N?����#?�rS��?��aI@(An&�@w&g�D@�+��!�@g�p�9\@%S�[(6@+� ��I�@2 ��#+{@77��ͣB@=QP���@BD��]�@F}�Y�@K^�o���@P{^�՜�@S�<�:y@W;���@[<(Jd�@_�g��A�@bL��9�@d�|�=S@g��WG�@k*`UC�@n����2�@q6�ᢂ�@s>�<v��@um��y�z@wı*y0h@zD��R�u@|��K��@ư�Q�x@�e�V*�@�� 2�@�����0�@�{���!�@�`�\.�\@�`�e�@�{tn��@����S��@����g~2@��¡Lr�@�
�\+�y@�f�ʊq3@��n��o�@�Ts� ��@��,!!5@�����/A@�JHĺ%�@�_F!�d@�S��o�@� r�. e@�pmf��@�"��l��@�F��'�@�w��'F        ?&�A��\?\�o����?}�Ҝ='z?�;�bO?�5{���?��r�ʫD?�=���PF?� ��Tn?�첶=�0?�K�
B#?���@-�?��:{��@��� @���~��@�m��2@!?���D@'_��T�@/���å@4?�d���@9��<\T3@@o�iW��@D�g��@IS�^� �@N��9�U@R���-�@VhEw��<@Z��4,�r@_pH�:��@blћ�D#@evW���@h�wt��@l�V;%�@pjŕ|i�@r���~u@uL�B��m@x�:ޢ@{7Ó��)@~���)J�@�)�]��@�0uw��7@�e� ���@��{,v@�gՉ��F@�;�D e@�$��d�@��2��@���v��@�}\v�6M@����/��@��q��@�"����@��'
B�@���7�n�@�$����@���Ό�n@�V�p]C>@�=�b!@����Y��@�����B�@�3���@�E��yc@���=r�@��T#J?        ?�)&�:�@$`C�Qh�@D�Zs�|m@YU�i�<@g���&�@sM�8�@|^���@�!t�#�@�܊QfQ@�@����@�*p��
@����O@�]�@�	FU�!�@�����µ@�lh봤@�{X� \@��5��@�ho��+@��V$HF�@����߶{@���ݣ(@�m	&QjC@������@��%�e@�W^&�:�@���n��@Ç�7@�D��|�@�h��@��xМ�@����@�>-u�@σhY��@�����
@�9�R{#@Ӑ�0��@���~��Q@�~3��@��yW@��|��fX@ۑR�ua�@�uD�.Q@�t/��I�@��rN<�@����
Y@�Yr�M�@�F�f�m@�bJɃ]@��&��f;@�Q����@�̊�2��@�Y��(�@�����nP@�K@��@�:y�&;@�(�(�'X@� �KB�y@�#�(��c@�1/�!>@�H���s@�j�]�r@��-c�Cf        ?`���2�?��m�t?���
�t�?�sU�S��?��E?�YL�� ?�ɛD)7	?�h�4L]?����UI?���6���@��$c�@�B����@~v��w�@�|���$@s����@X��9��@p�߷�F@��vF��@ ��\�?@!���a�@#���jE@%�a��K@(,撕�@*y��y��@,��"��@/r��[�@1�B��@2y`�U�@3�B�$��@5��J�_�@7#O3@8����2�@:��%��@<~&�{�r@>o�@4w(@@:�(Rɷ@AHX���B@B`1���)@C���è�@D�m,��@E�ᕆ�@G(���l@Hur�^.�@I�zF�և@K-�nɂ�@L����@N>\9D�@O��&%#@P��<��
@QUj$�@R#�0�@R���l�j@S�o+}�@T� E�I@U�	��ȯ@VsY:B�2@W`9,U��@XRɍ�@YK��H&@ZI<���?@[M$;v&�@\V̊�\`@]f.⋕        ?7��3]�$?u�&IF��?�]�l
?�\CYDN<?Ĺ��E�s?�i�hjޣ?����)?����G?����u@�=<~С@�'��D@����Y�@"��rB�@*�ӿ�=^@2����'@9.'�b�@@��m0�B@E�:�@��@KO��}�@Q�5�K@T��V��@Y��z��x@^�:R ��@b=�\[�@e��'��@i0�	"��@mD�~���@p�C 3�@s_n�b�G@v�ö�@y��N�@|@��V>@��'�aW@���U7��@�����6�@��*U��U@�й���@�m��2ۼ@��OY�@���X~/�@�(d%���@����?z�@�/��@��y5�e�@�C��@��WC��@�����@�i2�s��@�9Ӧ�؆@�3!e�k@��Mҟ[@@��lP4�@���TP9�@�����@�>�@�-�@@�-�ʭy@�I����@�kGC�D@��;��iG@��Ե�	@��7��B@�4��!7�        ?S�Զ
^0?�aW:�?��eH�f�?���'�?ԏ�c˼�?�.'���?�TC��?��GӮ��?�z�r�@,�E��`@� GJi@]�;L@����QS@#+��bX�@)phk2�@0���{CK@5�w��'@;��[/��@A~H��ݫ@Eܵ�f�@K�G�Б@P����@S��+��@W��}k�@\o6$�@`��F�j�@c��?��@f��XF�@j+h�)-@m�a6\$@qR��M�@sU�=>��@uˤG07-@xu��b�@{U�q?��@~n�sz��@�ᢰz_�@���f �@�����@����6�y@��_u�}@���P@��Qy�e@�`3���@�|2��ڣ@��̊�/@������K@�#�� �_@��i�z�r@���6ǥ�@����_@���gry@��iӚ$L@���Ni .@�$�XI��@�^4�@���Ǭد@�����M@�iDuQ@��3D-@�pXk)��@���$4W@��WɌ�        @ ���G*@7H�ᝠ�@W�ng�@nX{�@}�A�Ա�@�P �D@�C�Le@�BN�$��@�Lm���@��k	�s�@��~5�P@�Z�%�6@��¨��@�����E@�����	�@�$Ó�2@ËH����@�Q՜W�@��u#���@˨����@ήY' �@���=��l@ҟ֜3��@�i6�z�W@�N,f�@�P�>�&<@�s*�B��@ܶ���@��{4!�@��(`1�@�*��;�@�uX��8@������@极��@�@���$e@����g�@����b�@�/?�M@�R����@��[���@�ͱ�r�=@��pw�w�@��/�,j@� �AJP�@�N3Xd@��/����@�t��@�	KTT&�@�X���@����=�@��$Ɂ�@�tJ2|qA q}��>3A,؏a�A�7xYw�A�����Av��S̡AB+�g�BA9 ��A���!GA�VC�A�*�eb�Aq_>��        ?C^NZ��?wU~�~�?�4�����?��7�d��?��ug��?�N��o?���_}?Ҭ]���?�˞�~�r?���ٔ\�?����a�?蓬����?��&0O?�̻��?���.t&=?�k���?�Kn��4@ H"�q8@���z��@:�kd͓@I|t��@;����@�<r��!@=,G@O8 BR@�9ؕ�@��NE9@�ǟE�@�Y��f�@ W;�))@"��R��@#Ҵx�p@%�=3(�@'�1����@*Ԃ)�@,xz���.@/�� (J@0�J䈯?@2Z�-<ٖ@3�Ф���@5��А��@7f<�D@9P-�{w%@;YxL��@=����@?�Ǳ���@A�NǸ@Bb�q̒�@C�Ce* @E%�1~��@F��:��@H3v�,$U@I���:�@K�<tW�@M_C���@OB�I8�@P��Gn��@Q�J�C�@R�V�P@Sԓ]#�D@T��ai�@V/��@Wn�~�t        ?+�����G?q��A�h?�;�I��$?�c�  �t?�kV.q��?����d]?߃����?茯�_�?�[/�F?���w�&p@�m̻�@
�ͻ���@�����@�J���3@!D��B�@&�9r���@.F��*�@3e\8�5�@8�'5cE�@>�LA��@C82T�@G�b�I@L�<:�U|@Q#�oo|@Tb&R�d@X		��K�@\�ӾX@`U5?��@b�+��^@e��Vns#@h�/i4P�@k��u�I@o�G��vr@q�����@s�1�	@vCʍ��@x��fԮu@{z�/|Ut@~d\���@��N��+@�n��Ts@�9>%�@�"Y5ve@�+{��@�U�$�݈@���\@�p��,P@���tl�@�5p%��P@������@�45+<� @��L���@��_�g�@�]��v`�@�F��+�@�IJ���K@�2�� �@�N��e��@�xz��S@��bD@����I��@�L�S_�c@������        >�w2�`I�?;v{��-G?b��)?�D��4 ?��e��?�L�e)��?����K}�?��Wԅ@�?���x5�t?��
4�=�?��F$@?�3��>�j@��o�@T}�ܵ�@�a�@ Ď��?@'"���@/6�Y@4�[���_@:�Ϫ3�@A�]��@E~���q@J��̗G@PI��~�@S�c��@W�4l|+�@[��-/�g@`J5!�@b�NՔ�@e�y(��@h�Ng�ڢ@lN"����@o�O�-�$@q���|!@s���< s@v1�q�#C@x��P*/ @z�֊70�@}�<{CA�@�!\Z�%~@�������@�5���C@��!�ef?@�,�}\X@��m��L�@�������@�h'���\@�K�ٓIU@�B����3@��Z��@��HK�e@�Ծ`��u@��[@�Lc@�2��g�.@�u�j��6@�Ɔ+�*@�&2g�Ar@��B}4@�X����@��:O@�Ee�p@�{�̐�d@�^k�+��        ?��yf�0@
�����@,>6X|ǆ@B���3�@R֦ED�t@`;��ɂ
@i/rc��@r+�C�@x��M�@�i�,�H@�#�:ߕ@�O�Ce��@�+yr���@����\@�i"�p�v@�������@�=�0i�@��ͽ�@���d��^@�!&�z1I@���J�,e@�`~�	@����M`�@��Y@& R@����7�\@����l�@��y�
Ĝ@���5�@@�e�_k�7@�e��63@ƍ��0b@�߶�"0@�^h8��@�
�Ӹ�=@�t[;�j@����Z��@Ӡ65��5@�_�Sq��@�<IJV@�7��g�Q@�Sk� J`@ݐB��e�@��$0.�@�8^�b7�@��t�@��Kئ�@�f2�=Q�@��9ˊ��@�`N�6�@�Ȧ�?�@�����@��Br搷@��sLc�,@��*Fs�@��1{�@�-���3K@�Y�|_@��y��@��diWV�@�%pN���@���Z���@�����@�^�5�s        ?E\��+�V?xǥ/t6F?�����I?��-�|�k?�n�95u?�p����?аaBW��?�G���F�?�	)b�??�'6?�:`Ű�^?�Hږ��F?�76���?�z͊��?���D%��@?��>�@��of�@�Gc�9�@�P��@��C��@��PYe@��PO��@�9��@�;��a@ ����@"�b�D�i@%I7o]��@'ʁ37�@*}6^���@-c��u@0>��ӯ@1�[���@3���Y�@5���*��@7�w!XL�@9�)�'�@;��)"��@>8�W���@@X��|��@A���bZ@C;+�� @Dp�=5�@E�8ϰ�@G�+�Se�@I*T�\�@J�t/%@L�]���@N�����@PI����L@QR�R��@RhlrKY@S�< �4@T��Add@U�����@W<<P�K@X�ۓYHP@Y����,�@[eT�@\�"�:�/@^n7LCXc@`=b��5@`��xʏ�@a��֏        ?/���-�?i2�����?�rv����?�g�Ý�?��v�R�?�/Z�Q�?���{K?��ԗ��?�t1{e�@ ~�Eyo�@
���@Oc@2�R�˳@ ����[@'��Z㣘@0�p�5x_@7�?��8@?�6���Y@E�/�n@Kw��J�Q@Q�+�N��@V�9�{�@[]��(E@`��vӧ@dD]��s�@hC��֠u@l�<@��@p��`m�@s��ܜ]�@v��y�,@z00o ��@}�k��H@���M�V@�!ؒ��*@�y���˵@����w�@��d^��@��R%�@�O�v��,@���PT�@���B��E@�}�ć
_@�l!3J�@�vX���J@���a(�H@�௩��>@�!*2d�@�aL)J��@��j;��@��mj�@��Ԕ���@�K&�5@��d����@�4:�_�@��ԯ'Q�@��)@ˏ�@�~ A$�@��J�L@���r�K_@������@��xC�;@�ʩt7:6@�䕊��@�&���V        ?&2��ú?\V��?�a�؉bL?�=�^�p�?�"���?��@�l?��ןp?���nK�?옍�q[�?���PH�@:�z��W@Q����@�E�}��@"=�>@@*J?<,d;@2r��c��@9F+<ϻX@@�S��I�@FB��KԼ@L� A���@R@���0@V�3^�.@\;M"�0&@a:8'�&�@d�A�@Ս@h�d���@m^M��%@q6P/�P@tr�Zэ@w�e�LP@zg�]��@~�.�-@����<�@���v�@�:��R@���R��@��V�v@��M�n��@�OÃd�@�1⾗�@�����.@�
��$$@��� :X)@�:[��$@�����@����9�+@�aEn�@�3EA��@�	�7��@�3��@� ʜ@,T@�	��@��ع��@�6���r�@�]&�ӆt@��N@H�@�͸ƻ�q@��Q�@�r*w[7 @�ٖg0o@�P��@��MYǹ@��}'+�V        ?�욺��@.Z٬�@8X%�;@NL%����@]{UC���@h��`ow�@r�?�UiP@zF����@����5��@��;�j�@�n�_�&�@�lS{B@���i��@�n67�@�7��˸|@��1s���@�7Q�fԯ@�0��!y@��:!/&�@��w@�u�@�a �.z�@�2���@�2 �!�@�~9`N�@����8��@ǹ��k��@ʮ�p��@��{ѥ1�@Ъ�h�I@҄QIFx�@Ԁ�Ҫ�@֟Z��}�@��H��@�G�m�.D@��o	�:@�A�+8@�Ä�+`@�)��߲�@����1@�`�_[l@���cR@��Zu��@��	u�A@�̐�s@��kݦ@���y	@�)�-#~@�Y�n���@�����`.@��Up{��@�=dq��G@���uy�@�^�@���_5c~@�7>���@��%��AIA E����A%�L�-A�$�+�A�yaK��A�?�&dA�]W��2A���m5        ?O9W���?��� ��?���	�8w?���X�?��ZҀ�?�9d���?�q���z0?����M?�X��?�����?�A���?���cpb?�z��~Y@��Hz�]@ �x���@	�B���@�[/F�@��פ��@6+�9T�@���O�@ez����@FdJuX�@Ye�f�@ ����T@"�h���@$f ��6�@&ZQ�,G,@(j�K�ȴ@*�c~��<@,��E�@/K ����@0�vw\��@2:I���s@3�hD6Y@5�c�V@6�5{{��@8��>��@9��(q�@;d
�W�@=!/^a@>�%S���@@e��W,�@A\1�R�@BZ��0�@Ca�"s�@Dp���h�@E����y%@F��[�� @G�����@I.�@J=C���$@K�
�Ց@Lˇ�nH@N��-Q�@O|����@Pq����@Q(B�"@Q��l���@R��񚥃@Sg�G�@T0�"��[@T���qr@U�g����        ?"jE5f?\jM�� �?}!��ޙ�?�B�j^?��DO@�?��IVx@�?ǟa�6��?֋Uy��f?��,k�?�ސ�t4�?���(h�@���-�}@'b�*�3@طzX�!@#7;��@*� �.��@2�h�3@7�{f�f�@?����@C�[�&�@H���̪�@N��L��@R��U��*@Vk~t�\�@Z�HȑZ@_���`O�@b�4gZ9�@e�~m�@i��R��@l�-!���@p�����Y@r���U�@upZ0V�@x>��=\�@{P�a�h @~��L���@�(a;��@�#��4�@�IJGd�@��mH�S?@�6R��@���,��@��-q��q@�e��I{@�ٟ�`�@��]��M�@��:c�E@��U���L@�ӎI���@���m�@�r�����@���@�K�qf��@��_�Gt@�$����@��+��@�F;�1�a@��.ߌ�@��W���@��vb�1@�n�& �@��]biH�@���O���        ?b�p?QA=�6�?r��4n=?�WߌO)�?��$��?��oj�g?�(B��p?�4�E��?�o/���/?��\`o?�|/��?��1�պ�@2�V�@y����D@���w�{@"*�e�*@)3���߲@1�`1�h@6�s;*L�@=��݃D�@B��P�t@G��݀�@M���wV@@RCH� �&@V&Qb)�@Z��d��@_��󫖄@b��>t�m@e�:�h@iA�hq@l�[����@pj���@r�?K�@@t�1���$@w���W�@zG,D%|@}1�\p�b@�&4T��n@���Pc�@�����vy@�b���^�@�T�?(�@�a�\���@��b�TL�@��(����@��S�F�@�X���UZ@�� F�@��TG�9@�w�u#/�@�����@��*���@�1�,h��@���OW\�@�����o@���0ǐ@�ȑ͒��@�ψUAc�@��$�
�@� �%���@�+����@�c�L��@��L�NH        ?���[��@��w%�4@6���t��@K�#� ۩@Z-mRg�?@e]0}R��@o���3#@v9:���@}�{=��^@�'Յ�e@��;�l4@��A}��#@��(�8/9@�b����0@�6h���.@�n(0�@�|{`J�@��[�m�@�QV�zCh@�P�/��@���\��s@���]<"@��cJW�@��nZ�ll@����R@�p��8@��GB�g@��8e�+@�9J��8@��R�ò@�Y�;��h@��! ��@��'�)�K@��#���o@��" @��@��֝��@�+VqX�@��F�*<2@��c�)V�@�G9^!�@ԟ���G@���3Yn@�B��C@�7*@ڝ�N��@�D'C>�&@����n'�@��N��0)@����@����pi@���g��@��.)�N�@��-W�SJ@��U`@��NlO@�O�r�7�@�9!q]@���\��@�qU�@�w�ߒf@��o�?�4@�%��$o@��9Y/�Y        ?W�t�:1�?�����T?� 7�k?�"�໌I?�^ӦP�?ˮ�8Y�?�C5灌�?��1]fp�?�e�?�D-��?푷�1�G?������?��Ռi��?��dW���?���{��@C�g�M@���@j`�|��@	Bm��~*@JH��5@�3v�W@y�M ��@M! ]P@>��n�@Pg+o\@���}"@��R�qX@Y�� �:@ �;9�C@!�g��@#d��X�p@$�lb��3@&��P�s�@(d0�_BY@*=I�d�D@,.= �H@.7Mc @0,]�%�@1Ib��Q�@2r���n@3�נ?t�@4녱Ǟ�@6:�����@7�Q���@9 ����@:v��E��@;�X�Wr@=�?�@@?)�'��@@j_��=U@AG{�t@B*�<T�@Cs�;��@DZ\��@E �m�@@F���3@G	i5�,@H����@I/���@�@JN�s���@KuEY��@L��MG�@Mڥ޶X�        ?%�YQ>F?d7F�:�?���!N�7?����?��o짊?�j���0�?���	��?ݱ^����?��Ԡ�8?�z)���@�q��8l@��rN��@�
YPkK@ E=k夋@'���CR@1�1��@7��*@@:����w@E����@L��0��@R~�>�cn@W�����@]�S��{@b_��U*�@f��p�@kZ���G@pp��<�$@s�=I(/]@w%���g@{$Kd�\@�҃��r@�G��c�@��Ӯ=@��G�!@�O�î@���g �@�b���@�z9bv��@��	�Rp�@�%n���R@��=��@�z4�6(@�2��0c�@���0WY@�a��X1@��F�@��qRnO�@�� ���@��`a�w�@��w�_@���p�@��,n�q@��b���@�'*F1�@�f��(��@�����%@� ��ǉ+@��k�f�0@���98@����$�z@�5�ͳ��@�ݲ���@�J ����        ?�*���B?D��8	Ƶ?g�4���9?��j�m�?��¸U��?���p�?�h�:P��?������h?�d���R?켨�^�?�Q�9|X�@��ڽ��@88�_)@u����@ (��7��@&�@]��@.�_��H-@4�X�W1@:��B�l�@AJ�/�r@E߰
�(@KH�N�w@P�O��qO@To,�Q�g@X��<F�H@]Qu���u@aP�~V͊@dHj��\}@g���I�]@k6(�6@o3�x@q��Ho@t$��=��@v���h�@yv��,@|n�_Q�j@�x1�x�@��c�eڱ@�SSoF@�B�J��T@�P�:p�@�X��<�@�ί��@�?�M�r@�iW�v#@��1,��H@�0���H�@��`n�O@�=զfut@���yx�l@��x����@�U���A�@�+P���O@��E5��@���$��X@��+���@����^H@����oAM@�ѯ�ф�@���L��@�/�����@�mA�:Z@���͊U        ?�F�>��@�,�Q�t@1�^[�@E7ߎ1E@T|��@`xM��#Y@h��E��@q`���DH@w_�k�ۤ@~\)��e�@�-�(��z@������V@���r��@�$$3�@�0�6�>�@��b���@� ���@������@���Mi�Q@��,Nԫ�@�E����@@��<c�
@����@��N�P�c@��Op�Ǜ@������@�]�`�V�@�K��e�@�\�6�@��̤YV�@���p�@�i	h&�@��1�@�q�}lN@�����@ń᧖�@�/w�I�7@���e�[@����	@̸PJ{=�@ο���D�@�o{���@ы}��/�@Ҵ�]�@��S��@�+���8{@�{����@��k��@�B��#k@ڻ%��H@�A��@�֒�!k�@�y�\�v�@���.ޛ@�u���E�@�]�!F\N@�L)D�@�B�+Ts@�A:ק�@�F�v�k@�T3Ϥ��@�i��2�@�ɼ6��