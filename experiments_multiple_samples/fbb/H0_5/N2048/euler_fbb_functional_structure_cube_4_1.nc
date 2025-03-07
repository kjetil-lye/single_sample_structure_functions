CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T101326        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
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
          <value>0.5</value>
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
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�*!��EP?�'2B}A�?�k��r��?܄�_��?�O���?��F���?����ʔ8@��{��z@
&=s~�b@�4a�M@��׵�1@:�d�>@4�<��@!Ӭn�<@$����@'��[��@+p-V��@/ �w��@1��m�|�@3�(��;@5����f@8,�\PQ@:��ʂX@=:�-0�&@?��$f�@Ae0ɥ�@B�ey@DnjK�q�@F�$��`@G����@Ix
*T�@KG#T�.�@M&��=�@O���	-@P�~��@Q��7�=@R�>$��a@S�W�D	a@T���+E�@V5�z(@WC>NF�@X�T�l0@Y�����@[�LjHJ@\i�6�ء@]���y@_0�o�N @`P���m @a����@a͎֋��@b� t�@cZ��<t�@d'6C�\m@d����@e�:6ʝ�@f���(ɣ@g�mɛ^�@hb7���@iG*P<�@j0H�3�@k�Ѳ@l��g�@mz��        ?V�{]��?����i?�Dx�8�?�t�ֳ�?ɖ �,Lm?խr�L�.?��}���?��z)@�?�.~L��?��+�#�:?���;��l@���@������@Y]��?�@�Ȍ� X@C"��Z@&" ~(e@s��Jd@!O+�A�@#���=/Z@&�gK_�8@)�}���@,ޫX�Z@05�Ed~ @2m�i�M@4$%:�u@6MMLT@8�?�r�@;2�hj@=�;gz�k@@"�� @A�*��Ih@C���| @D���M�@F-�ԁ�@Gڰ66$Q@I�/���F@Kf[�
L@ME4>���@O4��D)�@P���ͣ�@Q�IȁSC@R���*|Z@Sά�g�@T񯵌+@V�%��o@WSf�,@X���2�E@Y۸4-�p@[/Ԓρ@\�R!��@]����AW@_im��`�@`t*��H@a9K��@b2S~��@b����m�@c���@d�X���@ek)6�L@fT*Y�J�@gCr��U@h9��        ?d�m��V?��A�,�?�ό�]�9?�F�\��?Ӥ ?���|���?阐�'�k?�W'l?���d��@��,�@�0��@�q!d��@b:�*�a@G�"M�J@�6Re�@���6_�@"�;�\@%8� |8^@(�bs�m@,mEu�@0I#(�9�@2�x+T�@5�}?.@7��4�7@:��!��@=��z��@@��y�R@BfZ�ʑ�@DZ����\@FrC��@H����@K'w�L@M�/=�@P''8�XD@Q��E�s�@S�$�&@T��)�j@Ve�M՘@X-��N&�@Z8Xh��@\�i��6@^�A��@`�y�'�@a?�2�@bm�b��s@c���ED@d񃡔��@fG[��8�@g���4 @i���]@j��"v@l(1��@m�;"�%t@ol��]a@p�$밞�@quH�V!@r_͂��@sQ��:��@tKh����@uL���
�@vU�Z�Xp@wg ��y�@x�;�.#n        ?�{	��<�?�q6�@t� @+����,@96.� �@C�`��Y�@M5hK�U@T-�ܨ�x@Z��1�Wa@a�@���@eN3vl@jS;X6%@o:I�F��@ryo�5O@u��e�d�@x��'��
@|�1���1@�B�1�>`@�Yn���@��!DI�@��ۗ7��@�o�U�@�J4Ph@��}h��@���9�m�@�j�Hl�@��*A�@����}e@�o~o i_@�@zN#�K@�#�/2�@����-@�"�=��C@��(��5H@��lDV�@��0W:h@�}B�@�5X����@�r����@��޸
�n@�
�+��[@�eزg�@��5	�@�7�Z��@�����
@��4��@��TG$�@��v9��@�vH� @�I�h+"�@�!���8K@��@o,�@��CWo�@�Ŀrtǒ@�����4�@��"@���@����b�@��{v��@��hh/O�@���z���@������|@����^w@���H��        ?c��Tԇ�?�6�g�v?��l�,&�?��mX9�?ӥ6�H?�����?�wg?�?���RH�?�z�:;T?����g�@)�k�'@C�P�`@
˞y�i$@���'��@�� �M@~��$�@��?_a�@�����@�e��@!�I259@#�uv0�@%�W�?�`@(��o��@*��_��@- �qƙu@/�+B@1/���@2��q�:�@4O�i@5����@7L|����@8�*�F�T@:�jﺢH@<���l	@>dG���@@(q�7s@A%��²�@B*�I.�@C7���p@DK�#�:@Eg���L�@F��aj.6@G�2���@H�4M�y@J&]��@Kit���"@L����k�@N�3��@Od�e�y�@PdT%\�+@Q�$H��@Q��>��@R���{@SV��	�@TZ���@T��hj�@U�
M���@V�����@Wg��Z:�@XEb99��@Y'�D��@Z�zfK�@Z��H#�        ?P&�U5 A?��-�7on?��i����?��V�{Q�?��0]�?ь�â?�j��?�X]c$?�E	�?�?�G�\�?����^l�?�mw�O@5�Q߆@~��]��@�:*5Qm@+�����@k�ߘ�@�9TZ�@�K#L%@ F����@"�Z.i4@%h%�\*@(R_�<h�@+{�f�@.�	��7�@1G�5ʱ�@3?\����@5Z�I��@7�tg
��@9�~�C�5@<��Up�x@?2Z���@AĮ}�@B��P��@D9qӓ�@E���'�@Gu�g��@IE�E@K)�Z��m@M#P��w�@O2n?7+@P�����@@Q��6��b@R�9o�@T$z�|��@Uco�(@V��H� �@X
4\-@Yb����@Z���@\G�"+ @]����|@_Z�z�q@`{[��@aO^(�@b)}+���@c	�( �@c�@�{��@d�R@e�rD[@fɜ�`u@gɗ_�@h���f�        ?U*a��r?��Sj2&?��ɼ�Y?�.����?Ô�o}��?Л�'��G?��Y�+�??��y�	�+?���^�?�1|x<�?��m\���?�>��P@4tWͅ�@d�5��*@(�l�H@DӍ&��@HYՊ�Q@������@[LV��@s��,@!x�a�@#�π&cx@&��lfY(@){}�߁@,�m�X�h@/�o�Ko@1ȼ�[�@3����9N@5�1I��(@7���) @:MI7k�Q@<��_1�@?e�v4@Av${{w@B�����@D���P@E���@Gh��i��@I2��@K�!��T@M���T@O����@P�h�~I�@Q�`�g�:@R�g��^=@T	�P�< @UE���MV@V�]����@W�Dݝ�@Y>�*��T@Z��[E"@\Y���@]��!mn@_->V�@`c ~��@a5��h��@b ��X�@b�Oi��i@cЈy��Q@d���o(Z@e���.(�@f��Iv�r@g��*�lT        ?���!�@?�+�Ղ�}@�e���Q@�O��{@$�4ƻc�@0�b�@8�P���=@Ar��ф�@GB�V��P@M���c]@R����@V�ܛ�@[��Ha��@`S�ڼۦ@cF9O@f�8Y@iG_��_�@l�H)%֎@p/��/Cl@r 도[@t/��&O@v[�}p�d@x�X慕�@{/�@}��DdW@���v	@�|��r5@��sd���@�mI��Vg@��Oc]KW@��f���@�Gh���@�$���@��f��8@���7��3@�FN�?�)@�@�����@�A��@�@�J].��(@�Y��b@�pQ�QI}@����L@���,�@����b@��3�'@�Mxs��@��͖q��@�ٜ��)@�*�P�$@�A���6@��n?��@��)D��@�^�/O@���`S@�ٱ:���@��q
��@�e0��Ϭ@�0�j���@� �1޿�@�ԼMe@����s9�@��Z];�@�i�eG��        ?��Y�P1?���d�(?����Y)�?��^���?��޷��#?� ��o�g@so0�~@~ ��@l�ag�@l�_�@��Bl?@!�T*��I@%
�}#@(�z,&�@,�c�c@0����@2��h��@5ba���@8�Η��@:�Lp��@= U��@@nF���x@B�?P\�@C�P~m�@E�O\_�@Gfr���@IT*�A'Y@KU#�<�@Mh��R�@O�< \��@P����]@R	�5�x�@S8��RZ@Tq7&�N@U�
A�@V�d�A�:@XS[�a:@Y���c@[l2�:@\����a�@^��n9W@_����@`��-���@a]V2�@b/��*�@cQh���@c�t,��@d� zE'@e�eZq@f���>	�@g�͔��@h����� @i�\�y@j�ڍ8}�@k�;�0&m@l��j
�@m��$cK�@n���MA�@o��Q�5�@p�gVⰷ@q(6�@q��?�}@r^jm}z#        ?eQy<ӷ�?����?����
�?��m��!?�L�҆�?�M���f?�U��?�x� �?��y�3��@�߱o @��:=M�@�ڰ�X�@�Bۓ_�@��FQ��@�5︭�@��>F�*@"y����@%Е��t@(Jy��c�@+��AQ�@/��8��@1�;��@49PM� @6�יl&1@9@��g�@<K[�Q�@>�qz�c@A�B��'@B�Ory{�@DwY�o$@FO3Y�_�@H?�D�L@JG6��,�@Lg�ᰞ�@N��$�@Py�|�N�@Q�d�mn@R���m�@TA.�s@U���F̛@WMÇ�@X}�^E�@Z��8�@[���d�@]3��O�a@^�P�D.Z@`N��%�@a3nL�2@bu����@c�i��@d�*?�@eY�E/�@f�$ׂ�@g&�����@h=ǎ-E@i\����@j����A�@k����I@l��5Ɍ,@n��1Z�@oa��\o�@pU��`L@p�x��)        ?�{�$$?�\�U\�?�wHv�?�!0�T�R?���R?��h���?�bQ��'@iY��O@
��Y��@͈�k\@g�`BG@��@��*@ ���@"��U���@&32���@)�?���@-��A��@0�H�p{�@3Q��R^@5��L'��@8(�[�΂@:�����I@=�!���@@��u�6E@BE�A���@Dƍ�t@E��(��|@G���==@J�V�_@LI[HӬo@N�,-�7�@P�l���@Q�V���@Sxw��!@T}�W<�@U��"[?@Wl�TU�@X��*�@Z����up@\B1�&	�@]�@��@_��llV�@`�8�U�@aƂL'S@b�����@cɣ���@d׵u1�@e�A�)��@ge�0!@h56����@ie˃`w)@j�5ɽs@k��oe\@m,�Y�q~@n�C�4�@o����
T@p��H;@q[���@r@�}@r��ȇǀ@s����@tlbb��@u<�����        ?�7��}�-@�s��h@*�\�9)�@=n?`��@J8����@T��FPԉ@]�+p̦�@d"s���@j@���d@p�$o�u@tlB)��@x���!q@}J��d~@�)���A@��~��F@�Ȩ�nr8@��q3�oN@�2�a���@�Y����@�2�L[��@�%|G�@�0L�YǮ@�Tt��<P@��_k���@����ǣ�@�T����@��qG�Jd@�<���6@�����@��G�?I@�rO�3�@��q	�@�}Q-:� @�7�@���9��@�j�^~�&@�#+�@��e���n@��3m�rr@�ב�i]D@�Ѝ�բ�@��6g�t�@�֜h�9@���ڞ�5@����,�@�$�$w@�5xh���@�_ܐ�@�� ͹y�@�ȿN@�	)!@�(��#g�@���.n��@�|���@�-*�.@��s�@Ú	"�|I@�V��xAr@�p5G�@��Nr5��@ƥC�Z�)@�rL�� b@�Cf��        ?^Ѭ���?��$0�{f?�}KLM.?�G��~��?�)�A���?�V��4��?㘄	�m�?�]�fII�?�>j�3�?�|n"4�?�j��?�@"�$�@�����@	�2D��@k�
�@qH½�7@m�5�8@�*�E��@����@��mt@ �'Fe>@!�9����@#��t�L�@%�bE�@'¼>*�@)럲1S@,-�!���@.�P?�=Y@02��S�@1Ƣ1!�R@3�@4|�����@5�wUaI@7g�����@8�i��!@:���`�@<,�b�@=�hq̃�@?�ͨ=�@@�����@A���mq�@B���� @C����J�@D�RC�W@E�Mo!Ǉ@F�t}�]�@G���I;�@H�N��1@I��%�@K�d��@L.9�F�2@M^�哚I@N�K7mC�@O�B�A�@P���?M>@Q/����@Q֙��c�@R�6kQ�@S.�§1@Sߟ�h�u@T�u�j@UJe��u@Vs���        ?A��ֳi9?u�	#�$?�5�D�NS?��qY�h?�.s�5�?Ħ�J�E?�">	u�A?ׯJ�5Vc?��TӲ̅?�w|)��?�%i�f?���S�Ln?��0���?���	��@%�,���@�l���W@
$�om�L@����h@_��@�[�G�@> �yǹ@��
^ӟ@��7���@!�ϻ�Ys@$1Rx���@&����8@)Mi[01@,%��lT;@/2Y��&@1:X]*6�@2�P�ja@4�<���@6�o�!��@8�d���@;�H��@=^�O��@?�&��u@A0�"�@B����@C��n�@Em�x8@F��gP�"@H��!��p@JD�0�v�@L��NȐ@M�C�ǐ�@O�/��9@P��t�P#@Q��V���@R�g՚�R@T
�"���@U-핥!�@V[(��Hm@W��}$��@X�)w=�%@Z #�n��@[v����;@\�n�Q9@^B�έ@_�̷y��@`��_�$�@ab?}4xl@b-)�@p�        ?C`W��s?smèsH�?����YSB?�6S@�?�?`rU	�?�r���+1?��J;!?�,�>�]�?�|�F��?���lŞ?���pp�@?�n����?���}�_?���S�@ݦ�^�@ً գ@Y��U�\@2��.�|@��h��@%|'�@�̎�A�@KdK��@ ����[@"��,16@%S|\Z2�@'����\@*�$ݜ��@-��e��@0v�g@2+�\�V�@3�QQWE@5��!v�@7��VZa@:p�x�@<b��w�@>�E�q�;@@�坱Z~@A���oL�@CS�i�@D�����@F?�L��l@G͈]ޝm@Ij��O�@K���G�@L�|�-@N�g#x@P=����@Q3��D/@R1%����@S6wC��@TC����@UXm�o�}@Vu����@W�I쒀@X�7����@Y��/�@[3�O@\v�>#^l@]���(I?@_|��)�@`5�O��@`�1<əp@a�Jl�        ?���p5�?�
�1�̅?�}3^P��@�56�%@ c�n!@(��c^�@23��l��@9]���@@�sqZ�@E�	U�@@K5�h�\@P�E&-�@S�Ni��@W�Y�۽@[��v�Q@_�K�N#�@bE9��)Z@d����h@gm��zDa@jC�(t�@mCң�5@p8��<�@q��~zh+@s���H�#@u|��7�@wjZ�0��@ym�C�-@{�$f���@}����i@�j	��\@�-c���)@�g�͵~W@����@��9��2@�\����@�����s@�:�� ��@��_x]@�F�����@�����@�� cY2@�����@�r����@�TD��:�@�;9.{�@�'��8)�@�u�k�d@��(��@��h���@�
/Е�@�ԁ�@�%�d�@�8�p���@�QV�\�$@�o~>�@+@���:0@��(g��@�uN�F�@�< `�:@���U��3@�K/�ٙ�@��6֛��@���+s��        ?��A?�?�sٛj�?�\�HT��?�
A�-?�
�r��?����|:�?�<�`��@�yӕ�q@+\|�
�@S��E�@��
�Jx@7{���@`]�,��@"�}i1&@%��ke�@(��!*�@,w���.�@0&
h�}@21d�aU@4]�7���@6�¾�R@9%�T@;�4ɭ�a@>_�-�W�@@�̫0=E@BKZCQ@C�X�҄�@ED��;@F�	��+ @H���	�@J�s���@Lq�gk�.@NhƵ�>@P8��Y�@QF#�&K^@R\�̱�@S|�sH�@T������@U�����u@W�0�Ӊ@X\I��A@Y�ѩ�v�@[oϡ��@\lP�Y��@]۰�e�k@_U�>�a�@`m��˗�@a6"��@b����@b�f���@c��z�34@d�S��}�@e~�ɾ�X@fn�m_@gdD7o)�@ha\��7T@iesRܣ<@jp��
�F@k��F1&�@l�\�@m�G��o@n��8��@p
 u��        ?qxG�שX?�fuM W?�Թ��?�5�%G��?ݝ1:%9?��[��n?���\P?��T\/(�@ �v�*�@�Nu�@�Q/���@=p� 	@�9�XF@qjI6�@I�V*��@!�ڗD2�@$Đ����@'�iy�q)@+x�+���@/=��=�@1�ec̫@3Ѓ&��S@6 T�FY�@8��ϫ@;/%�_�@=�0�>;�@@k��@A�RE��@C��8@E@+�m�4@G�Vӆ�@H�;B��@J���Ve@L�Wo���@O���T�@P�D��_@Q�B`�76@S5��S>@TQ]��X@U������@W[��@Xu���SP@Y�s_$I@[���q�@]�Ne��@^�D�Ê@`?x���	@a$:v�@b��|��@c�x�m�@do���:@e&1l:@fXUD�@g)E�Bh@hH/� ��@ipV[I��@j���F�@k�j�Dlu@m"�!�5V@nr೒��@o͏-�a�@p����a@qR.�{^�        ?c��,�?��?�?)~?�F���I�?�S�ql�?�w�6�|?؂�{*�?����yr?�+S�>?��;j�?�4�r��@ n1h S@�R9��@
;�rRΆ@)ƓV'A@��g|�@�Ł%�@M�\OY@ {^*��@#8Y<��i@&<C�wrc@)������@-#Qg�Ǉ@0�ۃTI�@2���_�@4�@�3U@7[���@9����"@<ė���@?���]��@As��l�@C0���V@D���LO'@F�d����@H�J�|_K@J��M�<G@L�Qv��@O9��K�@P̱[Y;�@R
}�!v�@SV!���L@T����@V�6[8�@W���&�@YT5�dg@Z�\v���@\F�ԡ��@]��Hݬ�@_����N�@`�mTQD@a�Rb��D@b���S��@c�����@d���u��@e�ԥ!�t@f�3vV@g��l��@h�����@j%g����@kUV&B�@l�Љqz�@m��!��@o�L�@p0���.�        ?�p�8T�g@)�dR��@ )O��J@1��cZ��@?��D�}@H�жe7�@R"�R�v�@X�
΋��@`Q��y@d���U@i�w�~��@oI���	@r�I�v�@v%�aI�@y���TV�@}�U!.@�ᙳ�2;@�"K|@�@��:L�@��c���@���/w@��\.�U@�OKǓ�s@��<���@��"7���@�@��8@�b�P�I@�����L@��W���.@���5&@��Hfv��@���>��6@��Ck���@��#�/o@�
�3�K�@�E�[��:@����&�[@��qQKvy@�2q���:@�����o@�+Q@��@�{ �z@������Z@�E��P�e@��n�@��/,$q@��=�v�3@����B�w@��@Y�@�lfϾY@�_�"f�@�[5�G��@�^Wl�~�@�i�r1F@�}E�r��@��z��@��xs��@��|@�K�@�#ħ��V@�2E ,��@��~>���@�������@�0΄��(        ?f/T�VG�?������?���3$vc?�����?Ә-�(;C?� F�z��?����bI�?�F�[�?�G�)�m�?����l�@���8�s@K��@@
{�m�0@[�I���@S$mz�@@-���F@>�Z�3�@�֑u@e��h�@!]�!��@#U��e@%j�'�d@'�Z��y@)�DuNM$@,]�6�q@.��R���@0�q�_�@25��.@3���| 7@58�c�@6ң�>8@8~�����@:;�t%��@<
����@=���m@?�堟��@@��"H�@A��{π4@Ci}I��@D'*Pv��@EJ.�hi�@Fuff�[+@G��&;Ҟ@H�1��c@J'���n@Ksͽ�?@L�[�,�A@N!��tf�@O�t��@Pw��e��@Q0�բ�@Q���|8�@R����u�@Ss%�4��@T;�ف`v@U�����@U׾�&�@V�{��@W��9�C�@X^*1@Y<��&EU@Za����@[K����        ?<��'(;G?r�Bݤ��?�:̮�n?��X��3?��Ș�?���jd.}?σɲ̆'?�Y��V�?�{`F3�?�j:��?헅���L?�A��?� -�s�?���=�@G���c@�$�:g@
ZS��@%�(�6$@=�5P�@2
����@r}�"�r@��G@�n�j@"����@$V�{��D@&�=�@)pZ�*'S@,DL�ȣ�@/IK��,�@1@G��b@2��ߘ�$@4�`*�Et@6�T|6@8�+}�w7@:�\�ޣ@=$�a��@?s����@@�NM\�G@BB-����@C�g��@E9֎g�@F��o*R�@H�ށ�/@I��_Y0@KS�'V��@M	���@N���4c�@P]bU2@0@QT�wY�l@RU�K�v@S]��l�V@To�e��@U�E:@V����[�@W�]I��@YUba5@ZN܈@Q@[���s�]@\�R#���@^C�s�@_�+��R@`�[��G�@aE���%q        ?`�4�'Ѝ?��o'��?�%> �[6?�E.
S��?��JB?�=���%?�X�Ľg�?��W�V@?�6�?�H�)ě@ I��5@�
*0Y�@	\K#b<�@�0�Sff@��B�R�@���z�d@��pZ@_��@!]{����@#�$�u<@&��N��@)��J�rE@,�����w@0&I�u�@1��<�l@3�=$Y�@6ӊ@8P��!mY@:�4V\��@=2�l�{j@?��G.�O@AR��s�?@B�TAU�@DV�B\E@E��6ÿ@G�?�1%�@Iq+E'@KM�7�-o@M@VS@+[@OH}<���@P�c���@Q���k�@R�}�	w@T$���YZ@Ua��}��@V�U�h8@W��Ԗ��@Y_x��Q�@Z��4I�@\D�w��o@]��*Ղ�@_[
�_��@`|S�\��@aQd-��@b,��]}@c�mM��@c��J{�@d����&�@e�{;(�@f��bg@g�*I�wj@h�o��v@@i�ъ{�        ?�cH`m?��>��@<ĥ43a@iY�"I�@$�-�9@0pQI3�P@8�W���8@A%��[ �@F�?Ne�v@Mq��A-�@Rlm@)�x@V�[��>�@[�wI�@`��>��@b���ٶ�@e�V���@h�ypA#�@k�Mݚk@oq_y�@q�3&{�@s���`G�@u�T p�L@wŖI�qH@z����f@|r#n�K�@~�@��@�����w�@�&ĥ�-�@���q��@��<�>@����[��@�6p���h@���{�*y@���脆(@�d4�ǈ@�<��|k�@��n�Q�@�����
�@���ۡ�@���
�N@������@������@���o�@�	�:@�6*�!@�i�{2s�@�������@���U�@�-�����@�||�?�@�h�OB@�����@�Ǎ���@�{�S"�@�3�ܧ@���y^��@��W닋q@�l)͂�@�0�x@��#M �@��	��kp@����]"�@�]ޜt        ?�ȋ�!\z?�K�M�&?�*���-?ڕ�e��?��.vD�d?��Y��7�?�Z�/�@�� ��@�'i��@;p���@Q�X��@h��c�0@ᮬ'��@ ]�N�@"�q|���@%Ȍ��0_@(�s���$@+�%��[@/D�%*0@1c���f�@3:tDpy�@5&�����@7'����@9=6��\@;g'� �@=�>_n�@?�at~;�@A.§ҷ~@Bk�M��@@C��hm@E/�@��@F_�p�/"@G���4B@I4�w�{$@J���%�@L2�"���@M���E+@OY^�u��@P}�;�-�@QS���/[@R/_;�@S�#aV�@S�ǃ��@T�_P��}@U˭M�Q@V��=��W@W��IU@X��u&A@@Y�Dl�M@Z���2��@[�ɑ�.�@\��a`�f@]�#�}�V@^�b�{��@`D�;@`��{��@a%����@a�@I��?@bK>�MI@b�pke�@cx�HgIy@d�bY�@d�AB][        ?{	Ɍ��?���.NȰ?�E�8cd(?����C?�\��?�� * ?�{$4�N�@�l�	@	1Ğ!�@(sڝ�@1�u`�o@��f@8�@���Zi@!��R9zB@$���&z@'�q5��@+l�X�@/<zt���@1���j@3ڇJiI@60���
@8�����@;O�։dd@>� �PP@@�!����@Bu�6�@C����o�@Eq�t�X@G@�$� @I&̇}�@K"H@+�@M5��O�@O`���]@Pѭ%a�4@Q�tE��@S8w���@T~�̀�@U���A@W-��]@X�$4�6W@Z�^���@[�����@] ��rn�@^���7S@`27�ȑk@aYP�u�@a� ���@b�X�@c���T�@d��z�9q@e��%rV4@f�Јe��@g�Jep��@h�	JP"@i��b��@j�z"��x@l@� Z@m*r��rS@nV�f�:@o�5��W�@p`hf@�$@p���}@q�� Pj6        ?�q��ғ�?�>�\E�?�Y$'$��?�p&)1�?��Uq�?������@{��d�6@l�!-��@SM[#@RAп�@�X��R@ ]Hk��y@#�CXD@'�1��H@+֥�#\@09�oq�@2��㣰�@5|����@8u��Lal@;�SFU?U@?$��J�@AojX��@Cn��@E���X@G�ht��@JB�e�72@L�XJUm@O�d���@Q5��>o�@R����3�@TQ����@U�Ⱥ�@W�xB@Y���ħ@[� � {�@]��fod�@_�w�8H�@`�����@b�Z�@c4��~�@dnJ���?@e�a�5eg@gG�ғR@hada/u@i���ХY@k>����@l�t�&Cx@nLQ�/��@o�*~�u@@p�����@q�F���@r{�R&3\@s_��|&6@tJ^��&@u;i��[@v3)���@w1��-�@x7R���@yC�2�@zWo3k%s@{r�T�E@|����;�@}�����        ?��r���)@[.���@#ݜ�:5�@6׺��{@CӦ-���@OQ���o@V�Lw�ǂ@_
PmP:�@dLPn���@i��P��Q@o���c�$@s�`�@v�c�{�@z�K�K@~�u�@�s@��&�3�	@�݊h��(@�U��ὓ@��8ِ�@�������@��eA٢�@���T��@�Gіe@���'�@����B�G@�@����y@���l�h@��F��k@����qj�@���Y�C@�S��/��@�X�
�j�@�e=���@�x;O��@����D�w@��5M�@���~;:@��M&�@�8��?�7@�rG?�J@���h��;@�����E�@�A2{��@��R�E#�@�s`@�~@� ���@��w�N@����賾@�7r'�̱@�����@��"�B>T@�d*�#@�"D�\��@��G�f@��+"暎@�i�Ҫ=g@�0V3c @��F���@��\lP��@��C�rT�@�[�����@�+����@��',�        ?��b��*�?�=����?�t��/�?�q[M��l@;����@qކ	@/6��y�@��ѽӋ@$ ǈ6@)�T
��9@/��JFm@3g>Dy�*@77KH� @;`��B�@?�E�s@?@B`���=N@D�����@G�#��|@J�����@M�ָ�ZD@P�I*��@RM�^�b@T�͛��@V�?M�@W���I?@Z���I@\-��
M@^e$�4�@`XO���(@a�cέY@b���{�;@d���di@eS*�uv@f������@h���:[@iv�2ܱj@j��{r+@lk��0�@m�]��@o�gq#@p��5�At@qf�U���@r?�Լ�@s�4MV@t����@t��1E~!@uڱ$֌@vβ���@w��r"�@xƋ0e��@y�T���@z�R�D=�@{�8E��@|��?���@~`q-�J@+���o@�&����a@��)Я�@�Q�l���@��=K��U@��b��ƪ@�&Kɭ�@���cߔ        ?}F�\x?�٪�?Ȟ{��n�?�d-�i�"?��"�{�?�Q'�?���q�@$t���@
ݔ��@]��"bV@絍)8/@�e
f+@ vVȚ=@#��F���@'Z�2
@+WY��U@/�zaS@2;w�@4��7��@7�9�M%@:���Щ�@=�W~^�@@��])�@Bp)P��1@D`n�{l@Fm�e���@H�˗\X�@J�
�^>O@MCmі�!@O�g	k]@Q2�ػD@R�A�Ӻ�@S�a����@Uy��6�R@W�m�@X���r��@ZJEJ��+@\�p��@]����G@_����~�@`ʈ��R�@aȏ�#�@b�[��@c�<�@d�����@fƮ�qw@g@b\O�@hs	T呩@i�ێ6�J@j��p=�z@lB����@m��I�7_@n����O@p4�M�V�@p��6E@q�S��1�@ru�4���@s@�{Þ�@t�Pm�@t�;��@u�E7NU@v��|�@w��~jd�        ?��1�}&?�?��H?�U��M�?�h�P�?������@ ��yp_�@%R�)^�@��<�a@@��Q�+�@��䗆@!g�6��@%<:�!@){E���@.'�:d�@1��!M#@4l*O���@7q�G5�@:���a	@>7���Y@@�)���@C"�[q�@E(��w	f@Gs��b��@I�T�$��@L{F烳�@O:).�@Q��+l@R�9���=@T9P~}�K@U��j�\@W�w��@Y��]��@[�[
�@]�Yޒ�@_ۿ3(@a^�ǧe@b?8H]��@czr\?�'@d�&�]\@f��@gv`\z��@h��Us@j\1�I�m@kᵆ�*}@ms��J�3@o5�@ x@p^��k �@q:���Z�@r����n@s�uZ��@s�!�R�	@t�xI-�@u���@v��\�@w�t	�pW@y�1`@zybKO&@{:�2��@|`#��n�@}���4�@~�I�Q@��/F�@�����S;        ?�0Њ�'�@!���E@<,DV`'@N�ԇ���@[�"���S@e�J� ��@od�Q��@ut�y�,(@|��@�ԏ�?v@��f�'1@��}Ͼ��@��.!�ы@��1���@��T;xl�@�־Ȋ�S@�@���u@�����@���a�n@���kt'@� m��Η@�:6J�@��! �B@��%C�u�@�}갉�@��R�Q@�h��� @�φ8�cT@�B����@����?Z<@�L`z J�@���rw@��mL�i�@�3���S�@��
a@�Y�c"X0@�Bo���@�1F��@�&1ka�@�!E��\@�"����@�*C2��U@�8Zޛ�Z@�L�xV"!@�h'��@ʉ�����@˲GF�<@��I�g_�@��3�#a@�S&����@�J��\SG@�ﶎt�@ї�vѝ@�COr��@��N
9@ӣ�PC��@�X�(D`@���BY@��ŗ.59@֍R˓��@�P]!���@���x�i@���"        ?�����?�V�l���?Ԝ2	���?�⁵ӯ�?���-��@ S�T{��@�Q}�-�@W`@�nENEp@d�[p@!kd�@$��	�P�@(�����@-'w�[�@0���P�@3�씰S�@6\���w�@9X��_@<�S�M@?���eW@A���罓@C�����k@E�Yͥ��@G� �j1@I酃��@L4�Yv��@N��ɇ@P��ܤB�@Q��8S;�@S2�^}x@T�9�,�@V<��R[@W�-�S�@Ye`�@Z�'7�mV@\Y\�3KP@^�W�l)@_Ϛ>�R7@`�]f��@a���	�@b��8��@c�!ogw@d�i����@e�dv��@f��$�I@gߐk�u�@h��d@j �	�@kK�M�@l}�WTa@m����0�@n�H톁�@p�)���@p�a�C_b@qoρ�3@r�Zq��@r�lvv�@s���"P�@t=����@t�S7H�@u��yaI+@v5����@wGy�"�        ?iUB�Ӛ�?�2���4?��Ӵ+X�?�x�?6�?�0�D�uZ?�B��H�?�`�ZVk�?��T:T�l@ �B�3<�@�""��+@��Fj�@N�㖨@8%�2�#@��q�g�@���Q�@"HP�h�@%�t%v�@(^�	-7�@+��O�D@/�DmN.@2�y�@4d�$PyE@6�}D��@9~Ky�@<L�=s�h@?H�\���@A9��0@B�JA��@D�����@F�ӫ�P�@Hs�g�?)@J} �0L}@L���،}@N������@P����S@Q���@S/Ϻ�@TY��@U����{�@W�٥@X�E��/�@Z�u��@[���C@]<6�dӰ@^�}���@`OeR�@a2�.�@b?��@ @c3-z��@d�1N!T@e	��;��@f|�Λi@g#
�Ϲ�@h;w�>�^@i[����s@j�C��?^@k���#c@l퍈�`�@n.�E��@ow�8~�[@pd�T���@q(�Bg@qÑQ��0        ?����b?��m"�3?Íp*��?�}�&�-?�T\����?���0?�����0?�@u���@�Y��%@
����@�Q�C[b@�Z(��<@�U�=T@���U@!������@${	��w�@'��6��@+�萋t@.�ݯ-�@1J���X,@3a��8�@5����t@7��y��C@:yc�\�<@=����@?�5�+^~@Ai���-@B�O��O@D�a� �@F:�Ʌ��@G�|-��/@Ĩ2	@K�䂇��@M���zI�@O�o"@P���b@Q�$�@S�>{l@TI����0@U~-�d��@V�����@X+	.�@YW��<*�@Z�1�e(0@\�1�ؽ@]�r0.K�@_��<��@`Jt���@a*��@a�%%@b���<g0@c��6���@dq9�7�@eVP��Z@f@�rd��@g1)��4@h&��M@i"XV�Į@j#V�B,@k)��6X�@l6$��j@mG��\��@n_T*N        ?�Kr�@ڎ@O1�'~�@'툪
6�@:����>@H�?9ZT@S�zh�@[�$���6@b�n^y@h㨈d�@o����b@s�i�E�@w�GOO ;@|e �`O+@��H:1�u@�nqv��@�]C�m�@��t�BY�@���Di@�;�+��@�!�Ty@�$*E%ô@�B�x�@�}�j�='@��;����@�F�m��@@��E*^@�?����9@��kt�y-@�ߗ�H#@���S�hz@���=L@���Dĵ6@�\�a�.�@���l�@����u@��KC]�@���2˟�@������@���{go'@��ëv@��L9fg<@�͎S�@�䉮]�@�A-�V�@�&��WA�@�R�(�f@��"��~:@��$v�@��r _@�C�'(�@�H�G���@��VY�Y�@��V�ݸQ@�R�V��@�&��@�����@�}�J��@�=��謟@���.Ӓ@��՟,�<@Ǖ��&�\@�eRIŜI@�8�p_ځ        ?zJ�Ͳ}?���L�!}?ņ�����?�R�&��?�)@
�)?�+���?��t�Mx�@��Q0@��φ&|@EfvI�@�AM��@��(�k�@v<�5e@ 2�t	�@"���%�@%�a�|�B@(�榯�2@,)ξ�Z�@/��X7�@1�si=u@3�ɸ��@5ƿK�@7�5�� �@:E"��@<�8�)@?0�i�ܗ@@�r�e'�@BC����Z@C��ZZ�@E$e���b@F�ӗ��@H7����@@IԗIV�@K}׈2Z@M3��5x�@N�	[nC,@Pb�'��@QPG?:g@RD_	�@S>���g@T?�����@UFꁲ#@VT�c.��@Wit�Hn@X����{@Y�^Dm1@Z͵���@[��PQ�@]2: ���@^n�d@	;@_����@`}�u�U�@a&,AT��@a����`�@b�5��p@c3�'@"�@c�� !@d������@e`̀��@f!K[�"@f�!�Ҝ@g�<زn#@hv����v        ?`�c��s�?����Á�?��h�D�?��~�,?�2����?����g�?��~ٲ?�X�*3�?��/���?�<��h�@ �ׂ�U+@����@	o�{˞�@��<z�G@\HB֦n@�f3n�@`���c@r0Nj�@ ��&��@#d�B��@&�ś�@(���&@,��e�@/W(�\�Q@1s]c[��@3Y�}[<k@5_%b 4@7�D��F@9���� �@<.5\;I�@>�3�W��@@���m`@B��N��@C�2��<@E����@F�26i@HNN�2�@J	�g��@KՕ��m@M�u��#@O���^�@P��ɘ��@Qޢw��@R�ǐ�@Tc�0��@U7���M@Vh^ޓp�@W��v�%(@X�Ax�,@Z5w��ϓ@[���,Ӫ@\�Oa
�@^[�x�,@_�"Ua�P@`�<��[�@anyL�}@b8ɉk �@c/�UL�@cܯ�-��@d�M���h@e�$Z��@fy�N�b@gb-�{�        ?e��7��?�������?�]��_�O?���p�P?��<(��?۶�;�(?��f�'?���5���?�GghK��?���	�p@-�#%�A@�˥J?@
��'Z�@?�xy�@��k��@-7��2@=�J��@���xG]@"V �TB@%
���<@'�zd��+@+44Úf@.��?���@17�GNC@3="\��@5g�!;�@7��
,y@:137�ۈ@<Ѩw��@?�DM��v@AGy&i�4@B���1�/@D{�,��@F7I{�w@H	W��5�@I�zF��`@K��I�M@N�\F�@PQWQ�2@QC2��0�@Rt�2j-@S�K�'@T������@VW<��@W�w���@Y1eʷ�@Z�5��S�@\Cc��S@]�-`ٞ�@_���1�@`�K1� `@a�PIs�@bu9
0��@ch�H���@dc�~ �@ef}P`��@fp�d�
A@g��=�'�@h�Y��p�@i��f9Ơ@j�7n/�@l����@mQޙ"P<        ?�_ /��?���$0@ z��@+:4���,@8�W��I@C��p��!@L��>ّ4@S�Dy�+u@Z��ƈ�@`���nr�@d���M@iĉ�%�@m�*ף[�@q�M4@�i@t}���q�@w��W �U@z�H� o@~h�j)�0@�9܈/@�(�Z@�(��N��@�]Z�T�@����_@�k%�Z�@��h��W�@���޽V@�(�~K@�n�c5��@���Pn@�okF$b@��[U�@���"^@S@�O�[�̎@���ģ(@��E�+x@�O�)��@�?�t@�4ld���@�/����
@�1�Ѵ�@�9�Ρ+�@�H5\R�h@�\��0@�w���j�@��c�BL�@��/gVn@��]�K�@�#�˖&�@�^� ~@��i�~@�t*^�i@�` ��x@����3�@�s�I�o�@�$ß+[@��=����@��(��@�L[fC�@�
�[���@���'�-�@��C�=�e@�Z��*I�@�&y�lH        ?e�Ma5j�?�Q�g�V?�~��
n�?�Û��=?�B�Y�
m?�P�p��?��	0��?�7
:�c?��̀a�?�>���@x��"��@쒳eϾ@��~'�@,��=�@+�^�v@o�?lN@���+;�@�B�-�@!q�h!0�@#��|V�@%���#��@(wk��B@+w�nV]@-��K���@0n�.�؞@1�"�@C�@3�����@5\�L?�@7,NyF@9@�T@;~џI@=����$@?E�N�O@@�Q+M@A�+7�J@C"�Jt"@Dd���$"@E�H��@GIZ��M@Hr���,�@I�4p[q�@Kf�Q��@L�W���@N�k��{t@P���@P�
F�@Q���@R��� �2@S����@T�z�ӭ�@U�ê�Y@V���X@W�E}8,@XƯ`̭>@Y�V<��/@[RY8�@\)�A<�@]Y�C�5@^�:;��@_�~M��@`�Ȝ��	@a3E�UF!@a���l��        ?I�}z�W^?�,��9�?����b�i?��J܄O?���T��?���.?�E觼�?�Ղ�??�x՟+�?�'�/k?�-��e�}?���B��@�b�9@Cf�qVb@n# ��@'�xⴴ@y��M��@1�[>��@U�/9�@ uXE���@"��u�$@%��5��D@(�Ҥ���@,��_�@/�z���@1��n"�@3�R����@5���l��@8P1o�@:�~.�Bj@=�ıf��@@,�O�-@A��}=|@CEo�4��@D�fF���@F�[	�/@H��C��@J�����@L��w5&@N�z�|4�@P}:
��@Q���X@R�*z�~p@T*�b@U~�bPR�@V���eF@XQF�>B@Y��u��@[]��5�@\�ڪ?{z@^��Y��y@`.�vs��@av��j�@a��ZN�J@b�n�y@c��,��y@d���4̱@f�p�L�@g��ƣ@h5����@i\\�3˹@j�t�@k�B�k��        ?P?��l?�+�P�C?�m�-��?�`ێ
t�?�d4g��W?���Y}?�s	� ?6?�隽ސ=?��\�sP�?�7e��\�?��]&��?�6�@����\B@D�p^Y@��/�
#@�SA�s@P*���@'�6e@kԉe��@!�C��@#�}��a]@&yn�}��@)��%�x�@,�u��5U@0;m+r�@2*y�l�@4<��8+�@6tTtOG�@8�I��yu@;W���@>g�/�@@n]�8�P@A�O�f:~@C����@E2��p��@F����@H�c�K�@JüB���@L����I@N����@P�t�"p:@Q�'��0'@R�؅�0�@T=�iL�@U��}��@V�
��ۑ@X]έ0j�@Yٍ�6�@[cr��d@\��!m��@^�T�9ؤ@`+�:#1T@a����8@a�b�:��@b�n��@c�d�+y@d�V��C@e�I3�dq@f��1��2@hR]Y}@i/lF@U?@jV<�I�k@k��M�e�        ?������?��H�U�@jmF�V�@���A3<@$�ks���@0����v�@9#���@A�J��T1@G��j5@N}lH̼�@S+����@W����~�@\�z<�R@`��*���@c�~N��C@g26t{T�@j�&JS\@n����@qN3lef�@s~�)N�i@u��e�#@xT�l*�@z�Y�)@}Ɉ*��@�aBkB�
@��Ԇ�s@��c�}�.@�W�Č9�@�*�>]�t@�Z{مc@�@��S�@�*�q�'�@�W�翝�@���ݧ��@��Ytp!q@�4u�jt�@�y^\@+@��LҢ2`@�'���QZ@��V�9��@�Η3�@���`��@��2�6o@�� J K@�3t�	 @@�ü@��qʪB@�ݎk>�@��l�@���c��@��o%�5�@�ə��P�@�՛*0�.@����~@�ne���@�#j�|{�@�K�Yc�s@�z�G�X�@����4P@��Ԃ�f@�����@�A(�@��{�m�        ?��eP|?��1���?��U�y?�6��ɯ?�w�[�?���w\M�?���(E�r@��Lg��@�FX�@nf���*@�|*�@�(J�@ �,�>%�@#~1��|@&���IX�@*Y�L!@-��Hb��@0ǖ����@2�R�>�@4�_�f�D@7Eo즌�@9�*��@<)4�`@>�=f_�-@@�|��N@B(�I�@C�T����@E$+X��@F�����z@HV���c+@J��L��@K���?�@M��4�V�@O]�'W�@P���?��@Q�EJN�@R���z$�@S�����@T�;�u��@U������@V؎ՙ�@W�.S�t@Y h7�?@ZN-��u�@[�n�$�C@\� ���@]�!֬i�@_E{5���@`I�>$�@`�Z�G@a��Y$V9@bP�D�[@cV�Z�S@c��F<�@dt����@e1mga�@e�N��]<@f�6�C.�@gz q��@hB����D@i�
��b@i݇}�@j�;_wy�        ?h9	e�)?�ăᎻ?�.�K��w?����?���?�;8?��1Sf2�?�PI�W�?���B��?����`/�@~��-@	X�2��@p>
׆@)�Ŝ��@˽/��@Q-�s��@ n�+?�@"��Xau@%��.@(�i/c�@, ��j�@/����@@1����p@3��q��X@62��^?*@8�����@;5V���@=�w�:=<@@m�d�ƅ@A���l�@C�t����@EI�+"�6@G����@@H�͋�,@J�T�*:&@L�w�p�@Or(E��@P�Bn�+x@Q�x$�'9@S	|_��@TJr��o@U��^_@V��o��@XV|��@Y��>S�X@[G�3[�p@\ӽA�PO@^l����@`	�n�?@`�22w�@aĭ-��@b����I�@c�⇌�p@d�b
��i@e�N �˭@f��.�oE@g���=@h���Nd:@i�M?��@j�Ѭ�;�@l%O5��'@mY�~)�@n���^K@oۄ:y�x        ?e��ԽX?�¾H�W�?��*�v�?¶})�r�?��x{d��?����J\?��Ł,d]?�>��o?�"�8��p?�vU�#@^��y��@
�L�5@b���}�@?i�/�@�)H�0�@��%�x�@!��:}�P@$˪"g�@(H�&�p@,"iy�@0-��V��@2|���3@4�V+r��@7�'t�@:����@=�+���@@��@��|@BW��Â�@D>{�(@FCF˃v@Hf�`��@J�i��y@M	w�Am�@O��	��n@Q^�l@Rw���e@S��X:� @Um,��@WLd�wG@X���7�>@Z]kC��@\%��S�@]�b�QM@_� � 8R@`�]'��#@a�r�w@c
O7�,�@d"�2}%�@eDO��!;@fn^�m�~@g��q�Y@h�K_�t@j w��@kl2̿�.@l���R{O@n��2�@o���?Ǒ@px P��@q2��R�@q�\i���@r����^�@sz��b@tD�f�        ?��KO|��@|a���@�M��u@0S���S@=��Ő�@G�		H�~@Q>Z�$�N@W�U���[@_P�p@c����@hqZ-|@g@m��Z���@q���l��@t��Rq�=@xk�L`�@{���j�s@k,/�7=@��:Aѧ2@��]!��@� ��Z��@��ow:�@��)`%tW@���C�!%@�&~֓zM@�������@��,w@��&̶N�@�0��@��E=&�@�n�ؔ3@�+Y�E=X@���f�5@��B<~@�Z\3��Z@�T��*�@�U���n�@�^9	~I@�m���:@���G@����MH�@��N��@���c�@�%��,�@�^�Є@�����U�@���М�@�6D8���@�E�*�@���)�B@��T�?�@�ZZ��~@�)���@�͋���@��7�~�M@�N,���@�d��X@������@���	e��@�vVN���@�HGܖ��@�Jk.��@��P)p_|@��M�ڧ        ?s�}�6�x?�н��?��x�\�u?��R :��?��j��}?����$?@?�56�O�?�1����@ �e7ªS@N،m�\@
�����@(<|�\@W{�\Ӥ@�X�V��@�w&��@����@!���H�@#؈���(@&U�����@(�E/�܅@+ɒ�x��@.�w��@0�ʏ`i�@2�0w���@4T"��z@6%�3��@8�R��@:	���@<���"�@>Ew�cp@@B=\���@Al�����@B��fp�@C�?E3y@E/A"S�@F��Qyf@G���:�@IT�kҝ@J�����@LO���'@M�0D�2X@Ou]^2�@P�	xE(@Qb���@R>hT,Bb@Sb
v@T�Y��@T��3X(�@U�}�?�@V�\�� 7@Wҗӫ?�@X�FD�^]@Y��%9@Z�U�ׅ�@[��':*�@]�@^*�<|��@_Mh��0 @`:�ͨ=�@`ц~,@ak�[�?@bgܯ��@b�����        ?H&�\�g�?}�9`�"9?�?Ǩ��u?�皛6�Y?�`�s'?�2fR�\D?۸>��-�?���i[��?�ٱ���f?�8U�1�?�h�uA=@�0ޘ�`@�z=ˈ�@k��7��@�����i@F�o*�@�,S�@\.�<�@!ݠ�7na@$�',.>�@($N ���@+��nƓ�@/�F��@2W��f@4[��HR�@6�Tf�8@9����{@<��x��@?���h]@A�Z�Z��@C_�?w�@EM�oN�@G[a�@I�7���@K��)��@NKC�<)@PpU��p@Q�D�m�(@S<����@T�/?p��@VT��%��@W�/�J@Y�X��a5@[�����~@]rU;�=@_l��gZi@`��~�P@a�&�R��@b��[$�@dŦ��F@eGo��:�@f�'H@g��ʜ#@i"#�%@j��Џ�.@k�m�� @mb��N�@n����-@p8�<ɚ@q|��@q��T[�@r�!��@s�T�c�j        ?d��a��A?��)�S�T?�=&U�@�?�����G?Ч҇;vp?�A�T�/S?��gol?�b����?��oh�c?� ��z5d@ �����@�K#Sv'@	�s�@K]R�c�@��ﮤ@5�&�O[@	���p*@?���p@!l��@#����}@&�ֵcxi@)�����@,�F<�"@0�D�w@1�#-��@3��o95�@5�n���O@7�4H @:I���3@<�Ҏ�v@?>Z/Z@@��rIqp@BZ�U��@C�jA�@EX���
�@F�9pSж@H���L@JU�����@L";y���@N �9�h@O�6'�0@P���@R�T�Ch@S����R@T5�&E��@U\4�Ȕ@V��Z0�@W�js�^@Y.�E�@ZTuhe5t@[�M�|�:@]	�wƽ@^s�ҧo@_���@`���C��@au���s@b=��Dx�@c���l<@c��u;�@d��]�@e�����d@fyv��^�@gb�3Jb        ?�"I6���?�Z�\/�/@8�{F�n@"qşZ�3@0��Y�@;aA
��@C������@K[&4�@R�{�AA@W�J�O@\���i0@aY���@d�Ʉh�?@h]��tt�@lQ�����@pH��.7@r��t�@t����@w�wI�h@zL�7�@}23��@� x!�@��ݎ
��@�nw�W��@�5T�n�@�o:���@��b��@�	��Ԇ@�$�r�X�@�T�~t@��3f�@���tEB�@�12��P@�r�$��W@��&���@����[@�sWA�;�@���)s?�@�P����@�����@�S{=�$L@��j)�@��\��:@���m�K�@�e�,R&@�@,��9F@�b��@�B���4@���QZ��@��B@��@�ˍ��e�@���	��~@��H~�-�@����Ql�@���=��@��<@R�@���Җ�q@����&�@����p@��J%!}@�0�%ST�@�Ơ`�a$@�_J��Y        ?i
+��A?���l�?��]�c�?ƻ�V�i?�9#�0��?�O]k�/�?��n��?��C��.?��n����?�ӏo��_@C��fy�@�~�Uc�@D�`C�@��Yq�@�0ǔ�4@�����@�`�@D#�S�f@ |X��@"s|\yD@$�j+��]@&�`�m�@)��8lz@+z��@.n�t�$@0Xz|5�@1���<@30��@n�@4�m:?G�@6E��q#@7�F�s@9�#I�9@;X.����@='Vك��@?��8�@@y~�ɤ�@AwҐ��U@B}ٕ�p�@C��(�@D�Y�)ɡ@E�8� �@F�͈V@HœeM�@IIBK2�@J��6�!
@K΅��y@M�F:�@Nu��s[�@O����@P�7 X��@QW�R��@R�>v�@RեE�#�@S�@ǱG@Td�۩��@U2�����@V�M:�@V۟%|~@W���cU�@X���q@Yy��\�@ZbR�8�f@[O2tIu�        ?H��!N_?{Y�{1a?��dF��4?�jF��R?��$�H��?ɳ��u�?�K����?�-D+dn?�pIq�J?�a⢹D�?��4�u�?�]>2��@ 3d�o@i y��@�D�(�@��س@ӱ�&�6@)�EId@�6��6@�f��c�@ p�'��@"ųk�e@%K-G0|�@(�(dҙ@*��G��5@.�cf<@0�#	��#@2m5���+@4I����@6ADD�c@8R��O��@:r}�l�@<�eDF,�@?'�^��%@@�t^B}[@B-5��@Cs���(�@D���YR@FId2 G#@Gǧ�/�@IR�ﺍ@J�O;h@L�����@NC���F@PLׅ�:@P�y@'��@Qכ�_@R�̞�n�@S�'�Y��@T��dr�@U��<�̲@V�v�o^�@X��WMW@Y&���N6@ZQA]p�@[�dzrL�@\��G�V@^ ���eE@_L7��1J@`P�<iX@`�x2�B@a�:��{D@bhn�)�b        ?Y>��Ei�?��B�m�?�Q׽���?�v�-v?�b�[��2?����?��ޣ �?�>��K?��q�۵?���m��(?���αē?�����]�@���L@��o�ś@�IZmʣ@�O�\ @Y-=�K�@1h��@O��#i�@�o�V��@jN=a��@!5��L�@#^���@%���*�@(,x�@*��S @-�C�9:8@0We;��@1����X@3���Z�E@5m��mh6@7Q�`��@9PPn���@;i;��D@=�/�Q�r@?쉉��@A+ɧL�`@BoI=b-�@C�漥�_@E ��Ov@F��_�P@H��9@I���$�y@K2&~�&1@L��2��@N��@P.��H�@Qk�@R���my@S����@T�)��@U @��@V6�o���@WV��^y�@X��uԙ@Y�)��y@Z�Lۆ7�@\4P f@]�j� S�@^��=���@`!�8�@`ٴ��$�@a�����        ?�ǿ�7[??�q70@mI�3h	@���c@'72��>@2猆��@<�����@C��q���@I�Q��@P�°k@T�C�.|@Y#ԛ�}@^��x$i@a�	���b@d�i
�Y@g��y�]@k�֤�}@n� �N�@q)�LB�W@s&��o s@u?XY;��@wt,�pQ�@y�=����@|2���@~�F/�Rn@��4�,�i@�����@��G���P@� a����@�����1t@�'��Q��@�й���@��ޤ?@�M�$@� ��'�@���%o��@�x
��>@�v�����@�|Q:��K@��Ib��@�����D
@���+���@��	�Y;@�J(go�@�;X"�=/@�v@�\�l@��O R@��1��I@�Vo��YG@�X���@�	ဏze@��B}�d[@�x�(�,�@�6?os��@�����4@����"��@�����@�U��st@�(,�
z@���X|4�@���7&�q@��&�D�+@������:        ?����ݙ?�J����?̏]x��<?��Q��?�/f��?��I��t0?�V����L@g�n�$@g�dQ�@���:3@��_@ZD@�Be[�@����6�@"���d)#@%�-��?&@(��%���@,2����@/վ��7�@1� �Ц=@3�~I�c@6k��<@8W��f�@:���'�@=M)��Q@?���@Ad�\�@B�(Կ@Df����@F<����@G�ݯ�p�@IlǴU�@K;�a(��@M��ۈ@Oyj�j�@P��ZX�(@Q���ߎ�@R�~�!A@S�t�w�f@T��'��k@V��H`@W7 l\�@Xp�jz9@Y��0NTQ@Z���o�@\J��]!�@]���~�d@_�6��P@`3�#���@`�ok�@a�|؜��@ba��3k�@c"Ԙ��*@c�	��Q@d����@ey^���@fGx�I*�@g��23@g��6'@hœ��@i��t@j�;�x�@ka�Bp2�@lG6fǎ        ?o*Uw�I?�2�~�d�?����	�?�g����?���C��B?���"�I?�;bh�?�� !?�x��oO@8т��3@��X���@7�MMh�@���}��@����@��栋@H_�'@ �cu�@#"�1Xȳ@%�)�'@)
H�p�@,z`�Ch@0����@2�YQ`^@4,�3�V+@6v����@8�hl�@;�I�p7@>NUKI@@��'_je@B0�t�H@C״ET�0@E���Dza@Gk���@IX]:���@K]�4@Mz�Z,2�@O��=x�@P�?��L�@R2U���@Sq��%`n@T��08E0@Vm���@Wx�R��@X籄�k�@Zcc�J�d@[���GQ@]~�+L@_q���@`eO�u@aA }xj@b#Z��
@c�8�@c���V�n@d�O
@e�)C�@f�ҲF�@g�N@�@i��Ձ�@j%t.@kEZV��@ll`ə�@m�Kk�@nϫ��q        ?u]���F!?�ƀ6�?���zì�?���c_�?�zIEw�?��^��?�-��-?�����;?@ k��e�*@B� �5@
�`�s#�@�Am�=�@,�:x�D@1�SO@��F*Q@ Ι^c�@#��*���@&�A�?@)�a �@-Y�K�@0��0^x�@2��f�҃@4�?t�2�@7`�Ӂ/�@9�q�
�w@<�-�s�@?�]�v�@Aw�yq�@C'w�h0�@D�A�h@V@F�ne���@H�h��
@J�&0z@M$d�q9�@Ov)�j��@P�DEl�@R7t���@S�9�+ @T폀8��@V^�?�8@W�z�.5@Ym_�|$�@[rP�d@\�ڈh@^u��ng�@`!|��@a:�c@bCY���@cH;_��@d	ZjE�@e��f�	@f-��2Y3@gL�l��@hsd��{@i���f�@j���˽@l�bk[�@mb M�Ĭ@n��ʞxo@p(Q�@p����w@qlJn���@r&s2"�        ?�;�_�֊@	�=�5�_@$���	�@6X�0�e�@C�N�G;@N�h�I�@V���@]�U���T@cz���)�@h�n��@n ����l@r"/}��@ux�
�c�@y ��@|����@���n���@���z��@���s4k@��w�dF@�&�8?A~@���R�@��q��z�@�uިg��@��j��_@��2�1e�@���;�_@�{����H@�tt�-��@��0_=	@��:��i@�q�C�ծ@��_"]@���P5@�E�l�@�Ui+|?�@��NH{{�@��]�*�@�q\`7�@�����@�dg���d@���2f�@��J5�X@��Y&�@�@�dŵ8r@�>0L�Y@�o��F�@��W�|Op@�澬�,@�Ҁ{��z@���8N@���m��m@������@�� ��@��C��_�@��h�u#`@��}D���@�À��R@��v�z�@��c5��E@���[��@����>�@��~:{�!@�/\}�+�        ?p�~���?����˄?�?�n�� ?����?݋L�j��?���g2�_?�#Kq�?�H��H��@ {�]o@� �8�@	�i�G	v@��p��z@�)���"@#�\�)@U�B��@��p� �@!�l�b*@#��ˣ�@&��ι��@)V��P @,L�P�M�@/pzP"O@1`ە��W@3 FG���@4��j�+G@6��U.�v@8�v�^)@;�^S�@=8�q��@?������@@�q�p�@B2�W5�@C}�w9�J@D��[���@F8R��[@G�,撼�@I$k�qH@J���(�@LB'�EfM@M�R� 2@O��c�C@P�+�䞴@Q��i���@Rs��k�R@Sdv��u@TZ�Q�j@UX<��J@V[����@We�;T�@Xv%	6n@Y��LP�@Z�K��U�@[��tS:E@\���a@^(A4��@_^�>M��@`N2;Fv@`�ߝ&b�@a���H�@b=k����@b�;'�J�@c�sT:Q@dK#B�        ?o��փ�?�6Mx<�?�����?ί��%ʻ?�@O�?��jS�9?��F���?�6�hQ@ F�l�d@A�5<e�@��l@��x;�g@�mY9/�@ߜ6��7@�B��$@!q��))@$X�o�@'�*�N�@*��x2�M@.ŖْU�@1mx]�C-@3�W���5@5����v(@8��	��@;A~���@>';���@@�) c@B@ثP�@C��d� @E�09f�@G�|���@I�9�G@K��-~@N�`V�o@P9� ��@Qpӿ]� @R�*�hz�@T��{
;@Ue,�C�x@V��{?/@XI|	U�@Y�>jI�@[bL��@]-����@^��;H��@`5��u�@a:ݵ��@b&gL�@b��p5��@c�z�@d�m�^
@e�EZq@�@gF��[@h�͜R@i5����@jX�aX]@k���P@l��"���@m���mC*@o1�  �.@p=y��)@p��~�K�@q��ͅi�        ?`FN?�f��w�?�?�:?�?�1�[�?н5(T�?�]a�F�?���syx�?�����?�Ѣ���?�������@��H�\@�4p �S@"*jM�o@��'_ݠ@D���@8�m�@��Eű1@!6�����@#��b@&�?���@)�,�#}@-F���@0w���S�@2nb�XF�@4��!H*@6�q�u��@9-����@;��܅S�@>p(V��@@��.LfM@B,�II�@C�#�x�D@Ez��u�@GC�"�@I#��eE@K/���<@M/?M��@OZ���*�@P����9@Q�=�:+@S;�*�$@T�]�@U�-<�<@W@5�&Z@X�}��yM@Z0�Ȥ�@[����"J@]UdCV@^�����@`Wލ �@a8�?tu@b Ap~k@c��iE?@dzB�>@e P��$@f��?>i@g̩AtX@hK�G�@i7��}H@jW#H"��@k}�2q6�@l� ���0@m���H�        ?��lm�J?�G���@@�%�@$�xA��7@3��$T@>�I0��I@F�P���@O��H���@U���
@[ ���h@`�40���@dǑ:�@i ĶSP�@m�]U�V@q]�����@t ��H6�@w�����@zU-��P�@}ǹx	��@����FO�@��BT]@��s�G@��H��Ɗ@�>�7�
@����R�@�2x�_�@�l���ͽ@���:��@�@���@��߂@��@�R��Nt�@���I@��/���@�c����@�2��M-@�#w%��@����,@��d�!Y@��3���@��'�w��@���-��@��G\_��@��k�n�@�C#l�@�T��s�@��@�ֵ0�@�#��N	@�v�5� @��Qt�/@����ŉ�@�O�m��@�p�/}�@���9|�c@����*@�H��3(w@��5�W@��ρME4@������z@�|��6�@�R�c��@�,ȵ��@�
����z        ?\�$T3t�?��g���?��aI{�?�,��af�?ʆ��=:?���:j?�NN�{W?��]&��?��ǓRh?����+ھ?�/��!?��x5���@���G�@9��@
ї^�@Hz���C@b�x�)@�!��P	@T�9��@n
<p�@��y�A@��,	ؿ@!	쉬�@"��+�k@$uOP��@&I�q�%�@(3�WJ�@*3��I�@,G�8�S@.r3GJ�@0YR��o�@1��ŷ(�@2�0�_@3����@5Jd�6q
@6�[Ϧ��@8 ^[�@9x��@�e@:�ηJl�@<���o@>��'b@?�w���	@@�v�3��@A��/��@Bv�E���@Cbv�Fog@DU���(@EN��@FOA��{�@GV��!�@He�)73�@I|[�u@J��E'�$@K�|�G-�@L��/��@N��L	@OZ�u:?w@PN�ڍO�@P�2��!@Q� RK�V@RKn���@R���\��@S�5Ev�)        ?5Q�X���?jQS��?��:��H:?�ȼ�Me�?�J�.�?��EL�"�?�-Srcq�?�(�f8#?۹T\���?�H��-}?���F(�b?��Ir��?��q@�?��Ţm�@h�N��@���F�I@	�DK�@�j	[�@�$P��@���I�@��r�{@b��̐_@@V̪,@!��Ғ�@#����@&gB�hv@) �踤4@+�����@.�����@0�Z��@2��6j�@4aZE��O@6?i۵W�@87�����@:JĠ�F�@<y.]"@>�{�j�@@�%^L�@A�(�o@C'���n_@D����w@E�7��@GvrL���@I�{��@J���! @LV/�@,@Nœ�;�@OꚞF0�@P�m�6a/@Q�S��@R����3@S��ŋ@U��T�@V&]��=@WM��?u�@X}���,�@Y�UDXЛ@Z��MA�@\El�v�@]�>�fj�@^�Q#���@`/ٟ�97@`�<lP��        ?Dx����?sw��/m	?��<����?�����~?����[bS?�&n^)�:?�s�m�]=?ֱ�z�?�M��h?�����?�K��q�?��M�Qc�?�̓�D�?���,?@�����$@fCs�D@&c�%�@{��KP@�3عs]@%�Cn�n@�?��`�@�R�vbi@ �v�6�@#EQ�B��@%���uh@(�F�"�@+{���v�@.��?ި�@1e��=@2����A�@4¬�4n�@6�,���@8�sv�@;F�M��@=�(�1#�@@ >��@Aw�,��@B�'K�Z@DY�N%�8@E�)��B@G�-�R��@I1)9��&@J�KiR�@Lż���@N���z�@PR^��@QW��i]�@Rfܒ�l@@S�/��@T���}!@U�(���@WN�$}@XD�PP9\@Y�Cٲ @Z�>T@\C�e�z[@]�WH�j@_#���d�@`R1_BY�@aJ�N[@a�0i�7�@b����.@c������        ?�_L�_�/?ِ J`n?�l�W�@
sv[�@��1z8.@$k��4�@.��=ߍ8@5eM�x��@<����.@Bxv 5_@G11 54�@L{���[�@Q,����z@Te(�fI@W�]oX@[���5hs@_��Kd�@a�5g0oX@dA�v��@f�n��g9@i/�3S�A@k����w�@n�����@p̾uLp�@rV��U�@s�3X�a@u���Q�	@w^��y�@y0�~+�@{?�\-�@}��w�0@���h@��oX�"�@��ID[@���Mb�@�g�T�H@�@�u�@���(�@��Y�]ֱ@�/AM�1�@���Oǅ�@� J��@��u��?�@���4�@�S�\��@�%�;��@���̓��@��Ap�v@��;�Ţ�@�������@���L#u@�����-|@����'~@��Q��@����Mh�@�����λ@��|��@��{����@�&2Ρ�B@�W1퉏	@�G�O��@��}!�f@��*��
X        ?�0F�#4^?Č->�[?�N�09?��oyrP?�,�7>@Y�h�l�@����`
@�d@�@?Ȟ�r�@#�B�d�-@(m���&@-������@1����h@4��aI�?@7�2����@;�ꔢ@?O���ŋ@A�{G2��@C�tː��@F� @D�@HzB�:C!@J���\J�@M��?��@P0 �-|�@Q�+IVE!@S�	C�y@T�BC���@VN��Lb@W�}7X7�@Y�QP���@[���Ps�@]d:�n��@_PG{�E@`��T�p�@a�^�W֭@b��m̐j@c�����g@d��w<�@f��L�{@g<�1[ @hqͶ�f�@i�� ��>@j�F�j��@lA�<���@m��u�n@n�z�ʌ?@p-��[�@p��>W@q�tߞ�(@r_��*v�@s#��}�@s�#d��@t�Σϩ&@u�x�4�@vZǃ��@w1���=o@x-Tx�@x�c��+�@yϘt���@z���2�Z@{���cF�@|�t7�JY@}�$&T̙        ?�b	����?��b���?��N�cՖ?�5�N8�?� P�?����ӥ�@ ���o��@��ʄ��@mV��:n@�4��;�@�����@��*0��@"��Ig`�@&A^�/�@*K�	�4@.��IŒe@1�
C�H@4[��U@7#נq��@:�3���@=E�R0�%@@N�0�_@B=�WD�@C�����@E��e�X@G��%1n@J+{�C@L?ٟRƌ@N�m�w�@P{ !���@Q���7�@S��4�+@T_�A�e0@UŐ_z�@W8��:�@X���EL@ZH�����@[����@]������@_Nzfx�k@`��Q��@ay���,@boA���@cl�Q�}@dqh��@e}���;@f�����@g���2&\@h���I϶@i�(Pa�@k0���9@lj���p@m�����@n��t	�/@p!�FLR�@p�ט��@q{�2=��@r-�t�.@r��.Q�@s�Ƀ
@tY�I���@u��Hx�@u��a��+        ?���F)�?�����?�6ܖ\7t?᪷�OI9?����?�
�Y�v&@U2�	��@	^B��@�_2�Q�@��g��3@3����@ ���x�@#���U��@'�6L�F@+��a@0%Up���@2���T,K@5/̕"�@8d��@;�aXT�@>D��Q/L@@��DaV@B���S�@D�����@F�>`L
�@H�=Cߞ@K60�R@M��{�'�@P9�~�@Qj��^@R���ĭ@TB���h@U�mf��@WYͅ���@X�"���@Z�����O@\tL[��?@^H���o@`�]	?�@a��Zp@b�~8@c"��@d7�7�Rh@eVs����@f~y��;�@g����E4@h�����S@j/.�@k}$}�@lԧ	x^!@n5�n��@o�-��\�@p�	�۝@qH��W�b@rӆh��@rӎ͹R2@s���'\@tph�@�3@uEo����@v��V�@v��`^%@wީ,�))@x�$J�R        ?�B/f�@!(,8�	'@:����w@L�}9:`@Y?"�Y��@c�)�hU�@l{�k �@s*�=I$@x�[�Z@<_�3�@�8YF�gT@�/`D-9
@����X%�@��B:@��(=�@�P�b8,6@�0a�(p�@�<�	$bq@�u�:lw�@��4�V}@��r���m@��[p���@��˞��!@���>���@��� ��@�����@�)gh�@��U��e @��^�F��@�?�J�7V@��j�7�@��K�֜�@�GZ#�]:@�����F#@�)�~W�@���b��z@�5lx~@�ʣ���@�5$�?C@�
8c�|�@�䚉3��@��U�X p@és͓��@ē��$�J@Ń�3���@�yS�D�G@�t�XF�@�tPI��\@�y��8 v@ʄ�w+�v@˔��Y��@̪i,�f%@��?�U|@����@��M���@К	(���@�1�Mc9@���;��@�h����y@����Kf@ө�ʾV@�M�>vK@���&���        ?s�3��L?��)Xl��?�Σ�a�i?�W�9ْj?�i�ޮ?�,W&r�6?�Lm<�?����O@�m)��@
}L�`��@��Ey��@P70�@vr�wǊ@��J9�@!Cڄ�@#��z �@&�Ӿ��@)�~0��f@-Ai��V@0q
��Fl@2_y�$4@4k����@6��CƢ@8�['� @;H&��@=�۩�}�@@=�u[D@A���51<@C|�4��@D��`Z,�@F5#qx�9@Gݡڴ�@I�l�3��@Kb�BR @M?N�(�@O-��̓@P��	�A0@Q����y`@R��Ĩ�@S�?���@T��硦@V �@WW���r@X���o��@Y�kW%�@[;M @\�d��uv@^�w��v@_z�ڼ��@`}�!�=@aB$MX�@b�G�5�@b���2O@c�R��P@d�����@ep��d��@fY���@gGee.s�@h;���D�@i6�&��@j8
G��@k?���s�@lM�;1O�        ?W#���?��S�~�?�[���
?���C��?͹��Jů?�$�N-�K?�r%?�=�Z�?��Z�w?�.{��@���@��`p'@
����,@���Sݽ@�t��@�S"t@X�r@ j$Tb@#,��17@%��F)F@(�t���@,W~f��E@/��Ρ�@1�9�Y@4r �� @6S�W�0x@8����#�@;UU�#�@>�x���@@�=�Z�D@B/��@C���vH�@Em;��@G@:I4T@I+�槠V@K/���J@MM7&�sZ@O�S}��	@P��D���@R ��^o@Sd��$"�@T�A}��Z@V �F`I@W�y��,�@Y�Kũ@Z��@H@\(�j���@]�>}��@_���6M�@`�0�X�@a�����@b�`l�K-@c��P�O@d��J_�@e�>^��@f�T��@g�'s��@h�n�H�R@j��_�@kT�1���@l��5@m�aV��6@o(9���        ?Q
x��?�$���'�?���g�?�_����?�-���L?�������?���y5?���z�?���6Ӓ?��`�V!D?��m����?�De�-a@d��_�@	<�ն�T@@��%�@\ٓ�@��=��@XW�:�o@ �oUb@"Ńn�V@%�3�״@(�K�˓�@,?����@/�2�W�@1��z�n@3� ���a@6��@8Y�ʃ6�@:����@=4�q�� @?���2\,@A=�r�K@B��>n@D�[�>M@E�/#w�6@G(��oĲ@H�H(]@Jt��1@L0K�SfO@M���?`@O������@P�QKW@Q�����j@R�k��H@S��&<�4@U(�m�@V0$�|��@WY��@X��]ߤT@Y�@]G�C@[�?Xn@\Z�����@]�H��U@_�K�@`>��!�@`��t���@a�Xn�p�@b~�-2�@cI�+�@d=G�@d��K�@e�NHC�@f�P��K�        ?�'U�~JT?�+s���,@Y>��i�@#�ȕ��@2\k@3��@=�#�d�d@E�p���a@NU����@T!2�u�@Yӑ;Px~@`#1�
mR@c�eًAQ@g�})�@l*����{@pP����@s���(@u����	t@y&o���@|N J�[@���k@���	@����	�@�����*w@�4�:@�fU��G@��
㯜 @�q��m%O@�ъ�<!@�( �@��	͚�B@���6d?@�%&-��"@�Ӵ��9@��w�A'�@�d�TW)I@�GFc�@����@�!	���@�-J߭0@�B��g%@�atw��@���"��@��o�8@U@���/�XK@�<k�?�@�������@��G�s?@�H�KL��@���وe�@�����@��.h��@��5�^�@�l����@�?E�G�@���N�@��ðW�@�ڮ���@�ň���@���V@��.9G2w@���QH@��nO���@��K)E�        ?�*$�1�?��2��3}?ž�9�@>?�;zbD?��	�j��?�lMy#)U?�v^t[M@����{a@!�̬@����~@V�A�@Oҹ�m@��~SMu@rXg��.@"M�����@%&��_@(�C�g�@+;,wZ:@.��ɼ��@1�&ORQ@2��G��T@4�D��>@7 �V�@9)E�Y@;j8�¼�@=±���@@E���@A\��_�@B��B�@DmCm�@Em�͇�w@F�h�7�@H_7��/@I�\Ր��@K���6@M&NFo��@N�^��g�@PJ�i���@Q01�TH@R]��@SP��gZ@T	.k|�c@U
�Q@VM�^5@W!�c��@X9�UaE@YW�'8��@Z~�1�&L@[�~�q��@\�a��9@^#�y���@_km{�@`]�ɩ&@a	�y��@a�m��[�@boPS塔@c(���z2@c��w8@d��FY�@en@@N�@f8���@g'	�@gۺ��        ?a�Y�9�?�{�N�J4?��(R�u�?�lq��y�?�:��w�?�SIiU�}?�g��(~?����	?�С*��?�{V�W�@�](I��@@��[��@����@�zkW��@.�L'!@ll��@Gtm���@ ��	? a@#���9u@%�,�1+R@)���V@,�4�'@0�a/a�@2{~��v@4<2�'�@6��Z�@8�j��?�@;����`@>g2��8�@@��2D��@B=�֏��@C���R[@E��.�`@Gr�Qn��@I[�YiB}@K[�2��@Msa���@O�r�,�q@P��#t�4@R"�	

~@S^t(��@T��I��"@U�(ލ�@W_�r�c@X����S@ZO ��˰@[��b$�@]y�n=�@_&,hx@`q��@aW�$�o@bE*�9]@c;��@d:F-i��@eAv״h6@fQ;��#�@gi��o�o@h���x�@i�A��	@j�+ϲ�=@l$+�<��@miduQ@n�E�]9        ?g�\�?�嬳�B?�����?�F�o�=?���ޡ�?�ؼ�:�?�N^:W?�p+�	?��ۢ��?��s�|�@fv'�W@	�ـ�`@�Tj��V@d��96@SeuD'@�P�I��@ Q�G�W@#�#I��@&&ճ��@)I�I�@,؆�Kx�@0Y�6���@2n��eEs@4���OJ}@7:'��@9��mW�@<Z�PA��@?@M+0�@A)pJҚ@Bȍ��F@D	�C�@FLՂ�6@H2ha��@J0!�V8@LFp����@Nu��ÜA@P_m�@Q�'R��@R�>T�u@TA��-�@Ux{~	�%@V�E�ϥC@XZ��+!@Y�����@[z{��@]!��l�@^����!�@`Q O�Y�@a=ݎ�Pw@b3J�h�@c1�� ��@d8�L���@eI�~�@fc���+@g����q@h�(��@i��y@k.�^	7@l{�~#;@m��D��@o5C�\%]@pQq�T�@q����        ?Ѐ{�Z��?��
��Z@����@*�ϲ*��@8Fj��@C_�x_Ϳ@L^� H�@S�ֽ�"�@Y�ț��@`t8As@dp�GP�@h�S���@m��?�N.@q�AX��@t\�����@wp�ë��@z�A��B@~>���@��X�/�@���(/�@��-v)@�6�u6�@�xv�@�����@�`{��s�@�|Z�o��@�՗�ƥr@�;�]Db�@�����M2@�0h�Au9@����G��@�Z�����@�<
�H@�����,�@����j�@�*��?-l@�"�t)r@�����@��"�w@��r�@�+*�Ӹ@�B���@�a0P�@��<�2�@�������@��R��By@�1�޺b�@�|J�$)�@��L�Ks�@��Xm\@�ʰ�o@��h��W@�A,Nd��@��"y@�����15@��1_�#@�k/Al2�@�Bq���@�эMW@� O�c��@����Gd�@�Ҧ���@�Ã{�D        ?W(��Q��?��I�9#�?�&�l�w?����?ŀo��?ѺW92?ڢ�4[��?�>���?�&�|1�?�Eȥ�c?�y��.w�?�0�ųs?�my�}?�@@�0�h@@��|�@�r��e
@b�4X	@.���@P!�b@��O��@�7
Ae?@������@7�o�M@;֔l@ �Ļ��@"����W�@$$>+�@%ЯI�A�@'�����@)[.���@+8�S��@-&��A�@/$�l�@0�o��:@1�VX�?`@2�W�B�@3ݘm���@5���j�@61x�E@7f�|G�@8�=���@9�(ݛK�@;2Z��@<����#@=�HC���@?>�*u��@@S;6��@A
��O(@A�Z/�@B�����@CE����Q@DSR�,�@Dԡ�NՔ@E����,@Frl��
5@GF��@H4�ꬫ@H�0E���@I�ݧ&�>@J�6����@K�7��I@L��q|�@M~. 
�        ?=)�4��?r��L��?��^��?�Pd�%?�WF���?�@FM�=?�_�+�3q?�v���?�c&�Y�?�Ȝ��"?���;r?�j��.F?��Uƽ�<@ ��9�@��P�Z@�����@�Z�!@��CL�@� QJa@l��1�@��k"@��z��*@![Fo5y @#�݂�^�@&\�e&�@(� B^��@+��oM\�@.��\d@0�zE�#o@2�eof�R@4ux��@6dg<w�=@8o�`��@:���+�E@<�-��@?DZ�h�L@@�c��u@B6�<}@C�ǨX@E��c�@F��6H�@H%]dip@I�JI��@K�6�䄬@MP� @O.�x���@P��&d�@Q�
[�@R�0�d��@S�^�쩶@TԻ)W��@U�g!"0�@W4�\�9@Xt� @Y�[���@@[L�t�@\s���u@]ݣ>���@_S5[И�@`i�BÃ@a/�f��@a�N
���@b�v�^�Y        ?D�5�ȣ?pC��uyq?��z��?�$���?�L���?��;���?�(.u�+?�43�8�G?�%�ěG�?�@��Օ?�Bk��?�c�h�"?�N?S��?��r��?��M-��M@>��ў�@0k_�BJ@����7�@Q�Ȫ)U@!�͊�@/Q*��@�����@Mb���@ �����@"���L��@%B�_{�@'ұ�xJ?@*�&�S@�@-�eh_�@0RD,��_@1��/���@3�r��-@5����%@7�i�@9�xj��@;�`4p�@>2�q�Ӫ@@O�n�mI@A��6,ג@B�L:��*@DMr��r@E��//*�@GE�.ˢ@H��f��Q@J�Ә'�@L8'�\�U@N5��V@O�X�b�@P����}@Q���O@R��BL�<@T%�w��@UZ��Ź@VF�`�N�@Ww�1*�@X�w"��D@Y��הh@[J"Xڼ@\���j�@^�s�`r@_}'��w|@`|�Q��:@a@ץ���        ?��~�Й?Թ�a?�&�{��@���'t�@c�;�aE@ ��G���@)7Z�xJ@1�ܯX$e@7�E����@>��Hs�@CN�/��@G���J�@L�U�D�,@Q	��K@T �w�~�@W9����@Z�b�@^s�[�;�@a:�~��@c]�� )@e���U~�@h���u@j��%��@m3�f��z@o��Or�Z@qp�����@r�9��@t���L)@v'n�$.�@w����v�@y�*�D�@{eԸ�@}AG~)M&@+��0A@��H���@���ܮ	@�����B�@��Ę?@���Dbi@�犎?��@��7d[�@�8l��@�j����@��jW��@������@�(3�F<@�t7���Q@�Ʈ|9$�@����� �@�?�_.E�@��ί�2\@��^����@�c[�Sj�@� ȃ��
@�ᦟa��@���R�@�m��74@�8��@^�@�0[��]@�����&�@����r@��L�o@
@�a��|�        ?�&O���?��h&�D)?�c��0��?�d�'i�?���١#?����?�^�U�u�@�0��L�@���8_-@i`d��@r�5��9@���$�@����s@ ���E�@#&CI��@%�VwK�`@).��@�@,@�p�@/�����[@1�W��@3��_��@5������@7�I&`�d@9�5�A�@<+����@>�`�P*-@@���M9�@AӪ�vC@C+�Ԭ�t@D���@F�bGv�@Gg�ud@I	����@J��B�.M@LD��=�@M�-���@O�}��P@P�PE1��@Q���$@R��0q�@S�!���I@T��Y}��@U��>��@V���إ@W�]�{/@X˞�H�c@Y�{M��@[I;,��@\<^/[�@]n��dL@^���"�@_�5����@`�qS�@a<��[{@a� ��0�@b��Z)�@cB�[}��@c�붼U@d���l�l@ef�Pv�@f#���6�@f���̡@g��[Y�        ?e�z���?��n�&Q?��/Mi��?�p��Z?����;R�?�#(%��?��i�ɿ?���@�!?��ז>)>?��;�O��@��D%@��<C@�*�@m��J`@�&P��@�y��@�Zh��@ ���$�@#)�wb�@%����#�@(��AN�.@,,��#u@/����-@1���))�@3��GvI�@5�
�o�@8E �v+�@:���˹o@=`Y�v��@@@�*�@A�s�@C�,r"@D����}@F|,�@HLa��@J3,'�@L1��c@NFn`=g@P:�6��@Q]6��r@R�);k��@S�1��zq@U��)�@Vl��3@W�)�¨@YG�7�@Z�2ԥ�o@\]�8�
@]�v��@_�����@`�U�T�@a���P@b���7�@c�u���@d��	h@@e��4�1@f�7Y�@g�L�ˁ<@h���v�b@jt��@k:? V6�@lt,�f�@m��_��        ?i��a&?��<I�m�?����?�?��&W��?�Fji���?�$�֞�?�$��2�?��~�?�mI�g�?��(_n@H��-@��f��@
�����@Sw�L�c@�_���@D���ݺ@XAW��@�. �@"d� Xw�@%���@(
/w��@+=^,X�U@.��k04@16��`�@38T�el@5^�E�f6@7��F�Ȱ@:^f�i@<�A��@?W��7�@A6��c:@B�o��)�@Dc���Z�@F���e�@G�֗'m�@I�c� ,�@K�ŷ��@M�e\�~@P XN��@Q!;&7|@RN�yz�@S�����e@T�ܢS�@V!(��(�@W��I�~�@X��6
e�@Zk�nX$�@[�|@Ư�@]����@@_4�Ԉ7�@`u4�d�?@aW�~l��@bB%>�{@c4u�Z��@d.ڢ ��@e1u��Q�@f<hXv�@gO�3�3�@hk�p�[t@i�����@j��l�@k��֑�@m4*ѝ�"        ?�Z%�@?��\��@z��&��@,j-��ق@9��-u��@DE�I�|�@Mq��p�@T"����@ZZ� `@`����L@d��y7�@hֲ�$q>@m{�R�0�@q@�^�@s�rr��@vҜ�(��@y���E'�@}"�NONs@�I2>:|@��e੾@� 2�l�f@��cp@�={�'L@�D��A��@��a9M��@��f��S4@�����"�@��} �@�D�\ZM9@������@�
�@�~��Y@���d��@����6�@�ļ}:@���n��@�p
 �"&@��³��@�wL8!�@�_�)'�@�M���=t@�B��@�<8k�1|@�<r���-@�B�Ù&�@�O\q,(S@�b!GW9@�{���<@��T^�W�@���]�K@��Et�Fg@��[�kn@�*nK���@��{�M}�@�k��`b�@�{��g@�����G@�eO�5/�@�P��y6@�ƛ+�}%@�|6�o)�@�5*w��@��zdZ�        ?�W?a��i?��'��e?������?����H�3?���S��i@��oU@���>@1��@�S����@!�Ca�I@%�4V0�@*��RK?@0 �^L@2�1���@69E��@9]6�5R<@<��Wkz@@g%�^@BqYFϟ�@D��Mv:@F�˱[69@IJy�]�@K�ڹ4n�@NyT0�1@P�!@U�@R�IMg]@S�nwX�@U+U��L�@Vϔ��@X�I�ky"@ZI���A@\����t@^V?�@_�X�@aoӐd<@ben!�\@c%��'��@dC��G3@ejj���@f�e�<��@g���[O"@i�<�S@jY{`��@k��V#@m���Cb@ngl!A_c@o���$g@p��?���@qb�wБ@r% �2D@r�P�Tt@s��!@t�<軬@u\�*q[�@v6�W�5@w�7��@w�� )5@x�܀6i�@y�[ET�"@z�i6�@{�I� ��@|��M�3@}���T��        ?j /�
ӳ?���ZDc?�sQD`h�?��z�]>?�����3?�����կ?��֖q�3?�k�=|)`@H�ۍe@��-�.@%r�Q|@Ip=� @��Ծ�W@^��!�>@ g��|�@#pRo��@&Ϻ�Z@*��j��@.��.p��@1�N���+@3��Tix�@6�&ܖ�@9�~�5�@<�Wi�8J@?�v�90�@A�T��VR@C�����@E�]�/� @G�𔩇�@I�I����@L`(ا$�@N�5�zF�@P�|6��@R-n
**�@S�V��;@U.�o��E@V�I�@�@XxF�6H@Z8&��W@\
�I�N�@]�}�V9@_�l�f��@`��h�W@b�^��@c���L�@dAY��*�@ely��V�@f��c��@g��e$w@i&{%@�S@jwD2 �+@k�u�Ɩ�@m5H�r@n�RH��@p�I�@p��ؓWM@q��2@r\$CT��@s+6�vG@s�D�X�a@t�P�N@u�W�g�@v�U*��        ?�ё�Y"�?��X�I�?�q�$���?�K+�j�~?�-���>?��%�?�L��:'�@ �x�9�@C�V���@Q(s�L@'G���W@�c_G�k@!u쟃(�@$�@�'�@(�_����@-"�/�@0�"p0%�@3~$}@6I_�q@9O�ze�y@<����]�@@��9�"@A�7f�fH@C�B��@F'B,�@HeOu�Og@J�G� Y@Mj!��@P��x��@Q����͗@S>|&�@T���Zx@VM��&�@X{/�'X@Y�dI4@[����@]��w��@_���C�@a0���<@b/�>3�~@c]�#R�@d��i���@eܺ�t�@g-R�,�6@h�l�"��@i��:��@kd��mt�@l��P�3z@no7���@pw!ƍW@pՓ�w��@q�	���@r��l�[$@srN��	)@t^?0'��@uP��_@vJ���a@wI��	N�@xP�Վ�(@y^u�i@zs<��z�@{�;���@|���x�q        ?�;�_�g�@�rsI@0уg�@B�؟�7z@P�:5�o=@Z6�_�UT@cW��}-@j%<����@q5����U@u�ص��@{H�F4� @���@9�=@�����@�y��[ (@�\,%��@���]��@��$a�@�g2�Ђ@�����&�@���y��x@�t�j��@�p]�x@�I��Ѹ@��+\��@���1��@�q#��@�@�PI;7@�C%���@�I�.��@�d�$`~�@�I����@�kzs�@����|�=@�̀2�i@���$|@�V�u_`�@��YFi��@�	���/@�rr?_��@���Z���@�a\�^�X@��n��n@�<Ő�@�	/p^@��b�x6T@²��f��@Î�W�@�p-��@�VsH�D@�A��A[q@�1�`1��@�'D�h��@�!�KL�@� �)�Z�@�%tU�Ԙ@�/m圉@�=��~�@�Q�!&9�@�kT�Y�@�D�R��@������K@�k���9w@������        ?r�d��?���|��?�(yz��E?�E=?��0yL8?�aM��M�?��8�Ps�?�������@{���@ ΆlZ�@��D��@���@2p��J@�<��@!���v@�@$f�z;N@'wN�B@*��b�]�@.N��!f�@1g�r@3i��@56��O@7}a ���@9���81�@<m��<@?z�*8@@�`hYgI@Bi��I2Q@C���5�
@E�P�E]�@G6RG*�"@H���i�@J��F�@L���<�V@N��j�t�@PL�2{�o@QW�C	�]@RlJ���@S�q�p0M@T�Q��@U��|`��@W�+���@XS���6]@Y���۱@Z�*�j/�@\B���$@]�dh��@_	�@�@`<�Ͷ� @`�QCB��@a�	~jG�@b{Љ2]%@cC����@d����^@d�^ɍW:@e�3��
@f��2o@ge�Zt��@hD1�mW^@i&E���@j�&�@j�����@k���        ?T����?��iRp?��x~��?���Q�d�?˾%.S�?�]u��^�?���~�,�?���� NK?��Ӓ�?��8��2?��-��#T@�R\�@k���k@��s�դ@�N���@��sn@mARFv�@�	V�k�@!@��Ձ@#�j��@&�C`l4�@)���D��@-(PyW�@0caN��W@2UܭK�)@4l��k@6�ŀ�^@9����@;�{
@�'@>P�8��#@@�7�{V@B gC@C�����@Ergr'��@G>���׬@I#��ĉA@K �D@�@M7?��.�@Of���B@P�1����@R	�4�s@SH�f]S@T��	.��@U��R��j@WX�H�@X�� $|@ZU�����@[�]��@]�T�:�u@_B�1uq@`�tT;r�@ak ��:@bZ�d�N@cRq�M�@dP�����@eV]52�@fcv��8@gw�r���@h��RN�@i����t@jᄐ�y@l�-��4@mM��        ?|6<�M�g?���mЎ?Ɗ����?ڬ�S��?�a^1f��?�[w�@ �%�zd@΢
A6@~�1��@[�+k�@�EC�'@ ;�ia@#�4ϗ%�@(
7�Y��@,��M���@0�b�g@3�1�r:	@6�"���@:���p�@=��)&@@�$�~;@B������@E>����@G�����D@JKL�qB�@MIG�@P���:@Q��YV��@S?GK�b@U0�+�F@V�-,�]�@X���L�@Z�o��\@][��UL@_R����t@`�i�Y`�@bn8��@cl�kk��@d�rǜ~@f<vť@g��#�h@iKV���1@j�lD7�Z@l��B��2@n]���@p~�a
�@q�|�n@r�y���@s_;}��@t�5@��@u$ٕ���@vA��E.@wh!�@�N@x�k�;�@y��9q@{���@|\�h�@}�r�q�B@���½@�;��8~�@��l�^�{@��
n�@�t�F�,c        ?���� ?��gIC@"�wř�@.��ɽ@<�!ᣃ@GNy����@QYϒ�@@X?R.@`-�3@d�(�R3j@j#����*@p	Q4�S@sR�gH�a@v�i�hi�@z�)-�@*8��]E@��>^t��@�_Kq�C@����@���r0@��.r"@����(@�����@��a?J/L@�aw�l6@�Yn ̓M@�i[�x�`@��d=���@�ѿ vJ�@�\b�*@�N\�̾:@��"��MO@���8{�7@�G$�J@�����@�/iE��@���,L�Z@�Mdr��@��+��є@���	}�3@�.!R��V@��μ�p@��	���@��y��@��ˢ��@�ߣK���@��%P���@��2�&p�@��Η̈́S@��j��@���X@�<�{��$@�_��ue�@���V�˟@��l���,@��]$�=@��;�X��@�1D�j��@�Ҵ{9p@�vyP[P�@��9b��@������@�oL� 2�        ?��G��o?�`��d�?ԓE�Ue?��j?����
U@ |$��v-@ ~�@�Ā6Y@�n �D@���2��@!a�$`�@%*��)&@)U�.d�@-��4l�L@1h�}�@4�3��T@6������@9�����@=.��0v@@Lb����@BB����@C��/tx�@E�gm�X�@H% �r�@J5��A�c@Lv.���$@N�hq��@P��5Y@,@Q�&��C�@S-�_G@T�� ܽ@U�?�,@@WZ��A'@X���<&_@ZY���l@[�tgi"@]���^�@_(��}��@`l2�Ev@aI���@b+5��"@cn9i�$@c���8}�@d��v �@e�\<��@f���@g�Սb9�@h��N��@i��a@j��Ŧ�@lݶ���@m)�h@nFC����@ohV���@pG��A2�@pݴ���3@qv@0���@rV"�!A@r����F�@sO,�-�x@s��FP��@t�IA_*@u?8g�c�        ?q�At_`�?��E5� �?�L�d�D?�3c+�[?ߋ���}�?�l.���Y?��;��+?�C��Վ;@��bЯ@�X�2�@��.�W@����;@Vv��qc@zs|z�.@
�T�sz@!�CNs��@$>����B@'43%�f@*hL��C@-����G�@0�U��}@2��&��@4�A��@7>�L�^@9��>��@<O����]@?��o8@A;��@B�1���@D8� ��@E���,ܥ@G�����i@I�P6wx�@K����DQ@M�>�+F@P1� �@Q'3if�@RY����@S�<1�@T�<��`@V?B��n�@W�!�'Ӭ@Yx[3U�@Z�pl��W@\,0d�]�@]��g��s@_u����@`������@a{�c�6�@bfȢ[T?@cX�l�0�@dR9�m�@eR�ZG(�@fY�˶Lk@gh�K>�@h~&+���@i������@j��*j9^@k���B@m�����@nT��:�@o����@pnA��C        ?��],iX�?��j%��V?�6s����?��,l�6�?拞;�~t?�p3�T�?��ټ�-@�%��	@�}��L�@|,W@2�}��@��?�@>��D�@"&Z���@%a1���q@) �O��@,�W��=@0���\�@2��h���@5�_>�=@8@(#W�@;,��Cr�@>L�(�-)@@�eĂ�@B����t�@Dy��U@@Fx�_��@H�y�ɚ@J�`��-5@M(ep*!@O��$�� @Q�M%L@Ry��'��@S�+�ĩ�@Ue�K��@V�5�2xd@X������@ZH3��u@\tܭ�@]�FNݺC@_Ɠ��"@`�;�'�@a����@b��=�lR@d�oa\�@e(��RF0@fR�+'{@g�o¿U�@h�ǧ�@jN�@kQ�0·@l��ϒ=�@n�x��p@ol�LSl�@pn_���@q*��g�_@q�<�6�@r�$P��P@sya�SY8@tF����@u�W�@u�~tO�W@v�|g�l        ?�-A�l�@��ir/@,ao!(�L@?e��[�@L7-���@VS����@`?z�Fp@fK��9�@mO���^G@r����@w �����@|���`�@�Ő��H�@��|f��@��Tt�x(@�f��E|@�"K��S@� �X�@�b�yN�@�Hg?�0@���B��R@�}�@��hBH@�.��3�@���2|$�@�c�� X]@���N>�@�e�6�K�@��ܼ]_�@��yQf4@�L&k�X@� �Χ�@��]<��U@������@���:E�B@��	m�m�@��|Mj�@���e>�^@���XR}�@���.��@�����@���ĽhW@��7�1�@�9�#��@�b_~��@��k�+Ux@�îІ@��.:[�B@����bd@��}4�2@�b�XC��@�	fE?��@²Ǥ �c@�^ǀ�u@�iي�!@ľ���2�@�r��4CW@�)XCF@��T��@Ǟ�J�<@�]~Ru��@���3@���}�-        ?d��<l�W?��8W�O	?��BOJ�e?Ì�-%?�" ӈ�?�`�9rG�?��W�G?�:�q��?�<��1?��8V���@ �M׻�@��7K��@h>�(l�@�l�E:@�*2�#@�z�Z�@0�/�6@��i-�@K��@.���]�@ �c<@"���V��@$d�	�I]@&V�(=�@(_F]�f.@*}�"��@,��@�7�@.��ja�@0���M�@1�t6q�@30���h�@4�gЃK�@5�B����@7G�MG�@8����@:;JƘ�f@;��D#�@=^�e��r@?��O��@@Y�I=��@A81�ef@B��__Q@C���@C�;&EQ@D����r@E��
�	�@F�n�sD@G�R��_@I��Y��@J'f5�@KE�ֆ �@Ljs�ȷ@M����d�@N��L��@O�����@P��Y=�@Q?����@Q�� @R�����@S7��oG@S�,�Ub�@T��)5#@UL��E        ?:�:Ĵ1?p�O?��?�C��l�H?��CS漘?�tnL��?�L�+��?ήŁ(`N?����d�?��w���?���UUI?�F�d%.?���04?���DZW�@ a���@�=���i@:1C�@8^�$Q@o[���@����{@#9��'K@�a���@ .�W@"���,�@% 0~�>�@'�:B�
@*�rR��@.9z���@0�����@2�K&x2�@4�O��`�@6�����@9+'��0�@;��HK�@>"��2�D@@j����w@A�3G{�@CWLt@D��i΄�@F�)���@HPL���Z@J"�[��.@L?mqg�@N
��f@P���@Q&8��E@RH~7n&�@Sv�B\�N@T�|r�ȋ@U��9��$@WL���f�@X�d*�*@ZR�;RG@[�}�f�6@]�%@^��*�y�@`,>RM�@aȋ5n�@a�"���@b�R>���@c�Zg�$�@d�>�U5@e�=�@f���'�X        ?]'�����?�S��h�=?��:���?����̡p?ʣ���#?�J��;Y
?���o�\?�Y7{۵h?�pޏ?��(���?�-F���@�
�@�({��@
���ޣ@� ����@��}H@E�|��@�+�@��~��@!0�Ef�.@#��E@��@&0©a�@(�S���@,���<�@/>'�.S@1X�e>	�@3/�=���@5#��Z�@75L��>�@9ee4���@;�[��l�@>"�o���@@XiK��q@A��j]��@C�r�@D��q�"@Fի{�@G��'�TS@IZ��g�@K�gܗ@L�e0p�@N��t�@PV��y}@QVjS���@R_,�*�@Sp{^L�@T��}4��@U�Y����@V����@@X�n(@YP���@Z����M�@[��8�@]F-0�o�@^�?�h�@`�7�Q�@`�cT�@a�'d��@bO�E�@c��D�J@c�,�҈�@d��x�,�@e� ���=        ?��\X�sS?�Ggv@ <=�8f@��b�Ϳ@!�+m�:@,�vz�UR@5W.!�0@=�<gP��@C�^��@�@I)���c�@OU`8�\@S����w@V՜��V`@Z�O��@_Wg����@bjA��@d�M1��@gU��@j=p�( X@mRa2\3�@pJg{q5�@rXeK�@s�␘I�@u���R�@w���F@y�|�{��@{�	"O�@~"���)�@�9f⸡�@�k�qTm@�� ���@���XU@�C7"��@����}%�@��ڊ�@�|�h�˘@�����}@���b��@�<|��@��0��՚@�� ��@��޳��z@�u�>���@�^��I��@�M��wJ&@�B���[C@�>D��n@�?uK;�=@�G����@�T�e��@�i	��	*@��B�R@�����$e@��)OU@���+��#@��^UE@���ʠ�@�P����@��B���Z@��y�Ehv@�?�Y�_�@��٧?NE@���נ�        ?n�H���?�N*I���?��e�J�?��ॎ�?۟lhm��?�FB�(Y�?�k^��9�?����_U�?���հ@7���#r@�-ާ *@$�T�c@gD=c��@�R��`�@�g>��@��
�P@o�#��@!�,m<G�@$ǥ�~�@&a��p*@(�u��&@+��K4@.B4+m�@0��&�]@2����@3��n3@5R��3�-@7
��CY2@8Ӿk�@:�f�ګ�@<�ʙI�@>�!���]@@Tց�ߗ@AfYh�(e@B�<E.)�@C�����@DӝK�@FOR�F�@GLʽ��@H�#���%@I�m8�~@KL���`@L� F��@N)���@O�<��r2@P��i7"�@Q`�I��@R.��{@Sus@S�c�PR@T��;7-�@U��H�:@V�9��
@Wo�S�7@Xa a:� @YXZ!�@ZT7f0�@[Uz^��@\[�O뷓@]g6ļ�a@^w����@_���
�@`Sg*)�        ?Fh~KY��?zvr�[5?����I�?�?��V�?�� �?ɓ��]2?�u�=?ݹ��0~?���Ó}�?�Ï��F?���*�5?�[�7��G?��\X+a@,*AoM@��w*@k��_�@��>?��@�Q�	@�U4�@n@<V�D@�j�mZ�@"(�t��(@$�	�Ϡ@'t�v��@*p�`s�@-�j��5�@0�j�ï2@2n'}��@4lE:_F�@6��2^c�@8��l�0�@;9b��*�@=���C<@@=D3@Zw@A�kn�4�@C+F�M��@D�!� �@Fi=?qy�@H&�}��i@I���o@K�'��,�@M�;é�@O�kQxq�@Q	�@�Rl@R'��P�j@SP!ʣ�$@T�6M�<@U��}ׇ@W	f��@X\�Y]jO@Y���,?@[#e?:�@\�/�ƹ@^����@_��~l/@`��! �@ak>W�@bA�E��@c���e(@d /��@d��d|x@e�k�t@f̏b��        ?`�{�?��qŶ�?�p�?X�v?���h�?̋�����?��U����?�.��?��Xb/�&?�ɽ��?����a?�d�S4ze@+��}y@����+@��p,O#@k���|@�P�6ߕ@d����@u�U(��@ w�w��W@"��(Z�}@%���.��@(}}~��@+�F0�o�@/G�(�@1TZh8�@3H[�G��@5_3���y@7����w_@9�h��կ@<~��OQ@?*�棖@@�-:U��@B}ItHN�@D$.쀼@E�1�(_�@Gu��,��@II�����@K3���؂@M5ȸ�@OM~���@P���z�#@QⷪsQ@S�c�o@TO@�ro�@U�0R�=�@V��N�q�@XPlr	24@Y�(o[�4@[=D����@\��yd��@^`�wjGy@`�gB�@`��� �`@a����`�@b��푻@c���e@d��Z��.@e���.�@f��ZN @g� �}@h�+��"S@i�p���@k�a&�{        ?��ց��?�ڣ)�G6@	���!c0@����\/@+T�$�^K@6t���@@:�fN�@Fr����z@M��_2o�@R�4�U@W�p��@\����@a̩"�@d%��&<@gsyeX�U@kMƥBL@n�赙v�@qu�*k@s�i}[��@u����@x`�
lR@z�),�J�@}�B�h�@�<�T�=U@���>� @�C��N�0@��:��@��/�ˍ@�K;y4@�P͙0�@�����3�@��[�Ⱥ@��Ó�7@��Ecח@�Q�?U�@�3O�y@�Y�����@��ko%�i@�¿X��@��,�@�Rg�#A@���G�B�@�	;�Xn�@�s|#B�@�簘V��@�2��)@��Ƿ�>@��0��
@��^,��]@�a�x��@�9�BPy@�Ck�@���L��&@��4��?�@���)�L�@��a�`F�@���w�@����S@��<: ��@���{տ�@���7���@���/���@��9�~        ?�x �R�?�f�;�$?�����gD?��r��?��-��P�@�ZU���@|
�F�8@~����@�bu��a@ 2)Q;"�@$2�0GQ@(5�*#�A@,�����@0�� ��@3��0a�@6w+�H�l@9��},��@<�-���[@@,�ZW�@B�8m�@C�jW n�@Fe��@H:�XL�@J��p�b@L�f��$,@Oa�ݔ{�@P�IC�v@RW����@S�ND`*@U2��R�4@V�""ֱ�@XD����@Y��a<[�@[���St�@]E6ϖ\�@_x�z�@`o�'TO�@a`ŘJ��@bX��Y�@cW��y_�@d]���@@ek�V'@f���P@g���5�@h��j��m@i�����@k1��Ө@lV�f��@m�����	@n���kg6@p��f�	@pĽY���@qt��Z�h@r(����@r�hVN#�@s�<?B��@t\W���@u a�&@u����@v�{�h@w�"7k�@xX#u0��@y02cG�        ?~\�/Ƃ�?���F��?���F��?�Oi�v=�?����`9?��m��J�@��@�@k�� "
@A���W�@�7�Z@F�v+��@ $"�u�.@#|��5��@'/B�Z�5@+> +�1R@/��Îh�@2<9�L�@4ӃF@7��nP��@:�����0@=��0�q@@��z�	@Bc�!T�#@DL��@FQ����@Hs-n��=@J� c��@M	 ���@O�wk�@Qw�WC�@Rou_tY@S�k&�-@UY�\�L�@V���]@X��p���@Z3���@[�(��%@]Ô��x@_�<(�D@`���3�@a�M��@b�Q�5Ul@c�8��@e
<{�S@f0�@�@g_�c��@h�SOb-g@i��b�"�@k#���-�@lx���Gg@m�����@o?{�<Q@pY�	D�@q�@��@q�D0�:w@r�;]�Q@sr~	"ΰ@tF�b+Q@u��CR@u�a���@v�*l���@w�h1�:�@x����        ?�2'�#��?��Oܳt�?����Nb?�%:B[g?��Cn��?�CL���4@w��#A�@	��o�\@��U��@�^��^}@E/vMo@ �a|sc@$P���e�@(C�pK��@,�t��o@0�*!C;@3g�
�:�@6O�[m@9u�j$ue@<�u���@@CVE�n@B9o�<Z@DQ�Ԓ�'@F�kF��@H�BUbA�@KrrK�0@N$~)	9@Px��f�@Q�����v@S�7�}��@U3/<�fI@V�qN )�@Xȏd�@Z��X �@\��"�M�@^�m߲�@`�)&���@a�]��i@b��@d(��-�@exsn+@f��M��_@hAڝ+�@i�+�p@kE/a��@l�::�Ԙ@n��nogQ@p��A@qa۳�@q��M�@r��x��@s�w��T@t�s҇0-@u��Bi�@w�	���@x%޿��z@yN!y^�d@zk|�~@{��U3k;@|�f�;I{@~J?%��S@�l�F57@���z[�        ?�4�X�e@�ݤ!z@7	De8�@IZE���@V�BM��F@a��t�f@iws�(1@qQY��@v���@|z���ď@����@f�@�Oa�@�	u�jf�@�G���@������@�^m�.@���Gz��@��abl�d@����8��@�����G@��t��t@��	Q�7G@��0U@�v���@�ni%�~@�yq��'�@���n�@����zj@��M
���@��V��N%@��V���@�-W���@�wH��@����i@�(�=I@���m��@��m���@�y��f�@��7j��@���~F)�@���k�C8@�a7�'�u@�6�g��@�)��٨@���ڪ�@�թ�:�@ſž�@Ư1o�X@ǣ��[�Y@Ȟ"5�V�@ɝ�Yj�\@ʢ���TX@˭=	�@̽@�8/@���=�K6@�����~@�uE�m�@К�͖��@�0�
*��@��ֻo��@�e��'f�@�Q
�@ӥjI���        ?s�ᜃx?���$t)?�+��}6?��.��?�[�1oFi?�hLM�o?�5^ ��@ ʅŦH
@C�X@�>�f�o@�A���@��.Č?@�<��7@�'��U�@!��}��@$�ӏX&@'�}�%�@*��f+�@-�קN@0����d@2��(��z@4��u~@6�����@8�ZZ�W@:�p]��r@=?��e�X@?�����@A�ъ�N@Bp�G�j�@C�T����@E?�x�uh@F�,uS��@HF�5��l@I�`��@K�{�ne@M<��C@O T�/@Pi���a!@QZ���@RR��1��@SR�ʧe�@TZif�H@Ui�(r9@V�3�u�@W����9(@Xđ�(�@Y�M���G@['ͩ�4�@\em��@]�D��R@^�N�ɟ�@`&��Ok@`ԇ�_�C@a��lu��@b=,y��\@b�j�S�K@c��� �0@dw�fX�@e>��E@f`M���@f�˷�@g�\���@h��D[K        ?a�u�x�?����>�?��N��-?�6=��*e?�����4?��Hc�?�[fK7�6?�������?�i# ��@Q��8b�@��ґ@ߢ4���@��D	PF@��/S@QI�N�)@ �Y�@"ε4�gr@%ìf�Y@(�;�F��@,z�H\j@0yC�E@2&o ���@4R���x@6�CA͒:@9!u��gH@;��V,@>�x0h@@�V���@BZ�qk@D@��W*@E�R��҇@G���F�m@I��lK@K�91.�@M�����7@PWl�d�@Q5�9Vma@Rs���@S���$@U����@V�l�@Xl+]�@Y�.k7��@[*����@\��T-�@^�� ��Q@`5T?N��@a'�q�Q@b#a�
��@c(��k02@d7ԱA�p@eP�Q|T@fs� �
�@g���~�@h׳����@j��l�@kd�-gt@l�u��H@n���l�@o���brw@p��Ϛ@qA8o�rJ@r��	        ?WWM6cԠ?���d��?��R�s~�?�P���y�?�S�
L??��IL  ?�c���?��o�D\?�J-���?�3��H�?����B��?�����d@� Ps�J@�5�]c@�<�4�@�L�i�v@�Nb�<@��k�F�@~:䰊�@~8X�@!lu��\=@#Ȭwq�@&Tϸ�|�@)?��@,���@/$y�A;@1>#�l�@3-�ݩ�@4�"l��0@6��V��u@9!���K@;@⥵�@=���֥�@@�v��@AY���[�@B�K/�k@D(.;l�@E�}��@G<����@H�tr�)@J���=_V@Lb�	�,@N=�F_4@PC�A#4@Q��[@R!'<=�@S4�U�)�@TRK_@@UyV�$@V��}�@W�:#�@Y)%����@Zw���@[ЦK,`]@]3�p'	@^�"��c}@`;Ē@`͵+g�0@a�?���@b`/�	@c1�]J�@d{{�@(@d�� ���        ?ŝ���h"?��x�T�@��oτ@(wD%��@6�z'��&@B7�K&��@JԢ��I�@R���H@X��+�7@_SL��,@cw�37E�@g��M�q�@lG�&�@p������@sROc?�@v18�Z�8@y>�?�4@|z�G�3l@�2���1@���?���@����p��@��ޕ"@��B7�%�@��8���@� �b�@�pV���@�q�qs@���"=@���nl@�g����*@��~LBIV@�L�"�V�@���=g�~@�fϲj@�3���@��D�;/@�t��:A@��q�p�t@���u&\@�?���@�y�@*M(@�{P�f��@��4�@��ӿs�@���M�*@���m� �@��J*7@��5�g@�NϷ�$@��_�4@�̼cD]@�in���@��.w.�@�`����@���낾@��Ȣ�:@�|�TA�@�8�bơ�@��n���@��!��A�@����j�t@�O����A@�y�\�        ?c���@t?��^�<!�?�K1���|?��UL8��?ј�$�?ܜP�\��?�AW.+h?��W�\0�?��1�?�e|�N<_?��>��!@t��@>�@e����@�c��+[@4�꣈V@�.1�b@{DP064@i�k �@��$4@�h}��@!3�`��@#^����@%):�J�@'}�1�@)L� Ww`@+�����@-��<ܙ@0<���T�@1�Y�%��@2���-@4O���L�@5��*���@7NK}xt@8�eֳ֘@:�����@<:�d���@=� .�s�@?�����@@�	��;�@A��RG�@Bջ�v'"@C���@D�� ���@F���<@G1�"Ġ�@H^���@I��P��@J�@�4��@L(�5@Md��j5@N���6��@P��A��@P���srf@Qy�fe@R6T����@R��꧜�@S��z�-@T���_��@UQ~B/��@V"��vTE@V���q�@WЦ���@X���#�^        ?R4��i�?��*��x?��_�;??��E��Y�?��m0�?И����?�e��B�?�O�Pȿ[?�HT-�ht?��S@1?��?~/F�?����@��>⁚@�t��n�@
@����@�伂+@�m\f��@��Q��@���b�@Ѱ��3@!$��F"�@#�/����@&><&�p@)�sU�@,9�Ire6@/�}` ,@1�����@3{���@5�C�4�@7�j��j>@9�@EO��@<h��|/K@>��F�@@ז��̐@BDo��8\@C��i?�@EU�~�_�@F�,R(�@H���� @J��>��@L_�t@�@NS��ɻ�@P-�)Qђ@Q<��O@RT��%ƻ@Swz��yJ@T����@U��#>@W���Q@@Xm"@~N�@YŉӒ�@@[(�#��)@\�Z�`�@^�C!-�@_��_<��@`���(�y@a`A�J\�@b3s�V@cR�5��@c���!�G@d�4�4F�@e�Go݉@f�$�q	�        ?H>c,��?v���ߛ�?�N�I�5�?��g�ص?�-gdxc�?Ļ(zp?�C��+k�?�����
�?��ƾC�V?��yO�cj?�1+��?�sc�<v.?��ih�?�����:�@�(�'�6@��kl�@
���p�-@�Eڤ�@��I@��(�;@	?�}2�@�䒰@ P-���@"t�s���@$���@'@1v�@)�JZ���@,�ۯ~Mv@/ǣ���L@1?`mX@33�G�@4���8�'@6�9�F�@8���E�@:�-���@=1i�%@?~���$L@@�����@B5.��r@C��T#{2@D��(V-j@FJ�v1a�@G��"v@IH8��WK@J�ǩ��@L}TW4�U@N,�EL\@O��K���@Pۅ˄��@Q���H>@R�V�r�@S���^q@T�t��.@U�a1d2@V��D���@W�_l��@Y���@Z7ۢ��@[fO��f@\�����v@]��X�~�@_U� W@`4>���        ?��B��_?�]/��@ �Ϳy�M@�>���@"0��h�@-t�U�}@5�u�p @>J��Ly,@D%o��c@I�o�&�@P�͟@S�`]r[L@W���Ǫ@[��5��@`U�&��@b���i%�@e����@h����Aq@k��{�@o	��=y�@qJ#�of�@s)�=^D�@u$�8g�@w8�M��@yh�5�ú@{�uv��@~�e��U@�M����@��R5�t@���zxΆ@�c��v2�@��[���@�cU����@���(�e@���GS�_@�PJj�,@�^�Yw@��+�)^~@���;&@��h# � @���ѵ!�@�䋛r�O@��.�U�k@����-@�.�R�$@�W��/�@����%R�@��w�3��@�c�~-@�KC'>@���RZ�@�����@���r�1�@�^��I�@�����i@��9����@����])	@�Tè۪�@���I��@��	9�M@��$�l�@��ޠej@�[5!d�        ?q%�#.�?�K�V��j?�l�$�?�B/���?ܺ�rS�?�#��>�?�F�YE?��=|�؛?�l� .�@$sI�4c@	"���@����q@j�r�,@�\�ZIG@j��+ON@["~8�@ ��[��@#:L��@%{6㇞@(�?��^@*�z�N�V@-�:8�"�@0VEl(�@1��ʼS<@3�����@5Z���J@70���0@9��4�@;���2@=3<ɩ� @?_�p(K�@@��PzB@A�n��v@C5�f@Dx�B�e@E�~lߵ?@G ~<��@H�"G�l@I�� ���@Kt�WIt�@L��x>!�@N��1{@P���"@P��s@Q�C��*�@R����@S������@T�#��Q�@U}�/:�4@Vy&r��.@W{"�"@X�6���5@Y��Rm�@Z�G���@[�1�2��@\�f���@^	�p�Z�@_7���pC@`6)�/�@`ӣ,@e}@atg.��@bz"\s�@b��{��5        ?PhV ��'?���s}�d?��tX�F?�oaƯ\H?��;C�?��cl9?ڃ��_$�?ジ����?�qb���?�udEi?�������?��s�2]*@�D�@��TWq�@�E�z�@��'Y#�@0��[e@H����@�^�S�j@!��BQ@$��5�@'ǿ#%�@+�ѣ��@.�z�(O@1Lճ��@3e����}@5�:�{@8��*F�@:�(�@=[����@@!� ]@A�1��Bb@CI�Yf�@D��ZR�@F�擗�@H����3@J���6�@L�֎�)�@N��*�@�@P����@Q�֊���@S
H1w�@TT.P�G@U�g��}c@W��@X�O���s@Z Z�"@[�D��Wu@]%ՂF<�@^��@
\{@`@�w�@a"7���@b
=b��>@b�r$��@c����@d�?�.��@e��,JU@f�"m��l@h��Щ�@i,�q���@jOU�횏@ky���{�@l�r��p�        ?\(d\-�?��0��j?�?d�,
x?��{��Q?�W�Vx;?҂�DZ�l?�|�I�?���v�)?�f���G?�1���%�?�p��Q�J?���?���@N`��h@V�x��{@
�}�?�@�����@�.���@U��@�-���@�	́@ �6�@�{@#H�;��(@%�F?��-@(������@+�E�V@.�	Ǯ�@1 <���@2���~��@4�����@7����@9==���@;�����@>ߠ�5@@W[T��@A�\g�@C)f#ߘ@D�|�%^7@FC�adR�@G���NFI@I��E_!@Kw�iq�s@MZfY���@OP͢�@P���#^h@Q�YC}�@Rׄ����@S�n�%��@U,H#ٷ�@Vg=\?>@W�t7�w<@X��c@Z\/�жU@[��!��y@]9q�(@^��oU�@`#Lh�M@`�D�
�%@a���;FX@b��6ƨ@cx���T@d]=�p @eH ��,@f9*G���        ?�6���z7?�^0��@	�c��-�@�^oc�.@+f hv�<@6KȦj�@@O��r�@F��Ą�@M�v��ɨ@S5^�b�E@W�K���@]3�$���@a~k�WM�@d�͋u6�@he�>s�@kĶ�P�@o�N��gX@q����-�@t=,�'��@v��aV��@y)�r�/S@{��w�F�@~� E�@�ͩ�`�@�[cz�@���n���@���n$
�@�w��� �@�Sh�%�@�Chg�/�@�G�֛&@�`��7`@��&TQM@��w T�@�\�9Ww@�J�lb@��/Ȧ��@��8yP�B@�/�F@��� ���@��]��[�@�t��o#@��d��@��޲M�@�����0@�`q���9@�7��p/@���X�@���`LI�@���Zt��@��Q��s{@��@|��B@���_o�@��� Lk�@������@��φ��7@��<"��@��=��2@���"���@�"ȉ��@�!ґ#@��c���@�N�1l�        ?bIQ&�2 ?� �^��?��J^�w?�H��?��&3fD�?��z��?��aؚ�?�0����?��Al��?���]@��i���@�u���5@	�-�Gu@�I���@�SZ�@���2��@��,�@w��%�g@����^@!o�;�U�@#v���_+@%��{��@'�b��+@*E8�__�@,Ȇ^��@/k}��U�@1#(�� @2���$o�@4	��C1@5���p @7=k��(�@8敖�]b@:�d�`!@<����Ӳ@>i�5V��@@/�x0�@A1��[�}@B<���@@CO�,HR�@DkT���i@E�K�,E�@F������@G��[��o@I.q7�>v@Jt�(6h{@K��xV�Q@M�6	Ԇ@N|>/go�@O�W�+{i@P�uL\�j@Qhk�Ԟt@R)}��]@R͜�@S��9�g�@T��`�@UUɵ5a�@V*�~7H@W�r{w@W���)@X�����9@Y�ڶQ��@Z�0�w@[}]��8        ?E�%���?{�����?���Y[�?����"�#?�Y�妬?�����?��HlK��?��(N��?�dJ"�T?�z�U�i?��ͬn�?��8�M�+@ #���@�_�W��@[����B@V��
��@yD)VzZ@��s4�S@q��5@�r��@ ];�]@"_���h�@$�)M��K@'���)~�@*�g.�f�@-�OPE&w@0�����t@2NX���@49/�~�@6C����.@8mЏ8��@:��&�n)@=$��2�1@?����@A1��	@B�[�v@D(:X��@E�L�3[@GF ��m�@H��{P�@J�	��@L���`��@N��~L�@PFv��3@QQ?�<��@Rf�)wN�@S�4��ɐ@T�?��%@U����=_@W$B���@Xn�'�&@Y�wg�@[$��9	^@\�%�]@^	)�	.@_���l?@`���w�@a\��D� @b1��Yo@c��$�@c쨄E��@d���ʮ@e����h        ?I�����?w��K'�E?�w�vE��?�G�zE?��#�/�J?�CE:�ȭ?�{���?��B�*�#?�@vj;?�{ń'Ax?����?��t~X?�	����@ �w�1@��z@��j���@A�N���@�:jP�j@}��8�/@���4S@}�i��@���@@ ��lf��@#��@%y�G��@(�D��$@*�eC�@-�ȉ�(�@0h7/�xK@2����I@3���
�@5���G��@7��n���@9ȧ�Ŧ�@;���[F�@>Pf���@@`�kl��@A��`L��@C y!GW�@Dh/�Ŭ@E�"崃�@Gh��eJi@I�-�%@J��&��@Lf��+D@N3dt�a@P��z�@Q ����@Ri,��@SMi�$@TZBJ@U:��%H�@V`RC��@W�m�~%�@X��.x+@Z
V�J�'@[VP
��c@\�����@^��h�@_uW�tO@`t|�4ؼ@a3Xk
�Y@a�B�p        ?�k.�m=?�߾�}@ ����L�@�^l=+@"\���=�@.���M�@6ebN�~A@?R�vO@D��U�M@J�j��@P��� �q@T�[����@X햼�þ@]���5�@aP��c�@d��/i@g��w$`@j/���e@m�hB�_@p�y����@r�k�@t�¶�@v��V�J@x�S0N@{G���@}��qF@�,��{�@��Y5��X@����#�J@�ieܴ@��'�U=@��H���@�.���(@��>�$5(@��I��@��L>�@�3M����@�-�0��@�0hu�@�:��%�@�M&�h�@�g�(E�@���yU&@���^r��@�税r��@�"�m6�i@�f+��v@���i�@�?w��O@�`�!�@�a�d�|@�m�D�=@�Л3�f�@��vd}�=@�M�����@��7;�@���o~gb@��(#�UG@�t)4G&@�FՑ�ĕ@�4��q�@��L�禵@��".��i