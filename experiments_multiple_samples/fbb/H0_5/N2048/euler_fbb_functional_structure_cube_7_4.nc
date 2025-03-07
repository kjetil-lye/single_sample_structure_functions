CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T105316        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @               ?�bd�}��?���C�~�@}�XI
�@'��i@4Ơ�$�'@@�X?�B�@H*!gx�@P�ox��@V6t�ޏ@\��X��V@a�b��@f � %
@j���dF@o�ͮB��@r�V%"P@us�:��d@x��m��)@|�,�vO@����@��
�ʓ@���*M�@��~:�@��N��@�tm=of�@�㷕H(@�l�,�u@�p8k��@�e�Zol@���a�@�E1奲�@����@�T5V�@��@�BM�@���_eG@�;߱��@��8��@�XfZK�@�<�ڣ!Z@�%��A�\@�dY�a�@�V�iU @�����.C@��'�b�@��׹!֮@���ױ7e@��G��)@��7�0�@��#��@�)�-�@�>�]`k @�Wv3/pV@�s���c�@�I���[@���6I�Q@�m��0 S@��(~��@��P1��@�.>r�X@������@�`���0@��¢T�z@����g�R@�3�M�        ?A�i@J?x�4Q��?��5�?�n�TĞ?��Ъm%�?�td����?�A��{h�?�-��Mc?ߔ]�I�S?��ӫٜ�?�)�U��?�u�?a?�v�{ԕ?���9�e�?�! ��@_�n���@AϺ��j@h.v�Q@
�D�;��@�t�o�@K�4�O@x@Q���@ϐ?��@SY�:@��A�@�� 9!@ �RU�@"&�]*�@#�ck��$@%̕�_V@'���@)�>�T}@,;�ȖY�@.�;�	�]@0��j�
�@1���4)�@3q�IUCC@4���)�@6����1@8[ȼͤ^@:2c�P�@<%�f@>5u�{V�@@2����@A[+e]�@B�:MS�'@Cᱻ�@EAh4�w@F�(+ew@H=���@I��N�@K�1K4�@M[�����@O?+u��H@P���Y1@Q���K�@R�?���@S�E���@UC�1<@V_�O��a@W�����m@Y���@Z��5&|        ?�����Ң?�B�=�?�Y���Z?�/�Qz@�P���H@Y����M@}���J@ Y�#��@$��:�x�@*N�b��@/�����@2ֳ�<�@6
�Qå@9�<�v@=-��o�T@@�����@B�9�Tv�@D�ب�x@F��b@I.�&A܄@K���	��@N�x��@PS׬�PX@Q��z{�@S^���@T~�H���@U��s�9;@W����N2@Y��Ҍ@Z�p ��@\�?�G��@^K�D*��@`e>q��@a[���@b�]��@cX)�HH@d9�w"c�@e`�~v�R@f��~��@gՒm���@i#�5��K@j�3�C_#@k�a$sx@mc[���@n�ܽ��@p@���z�@q�3n�Z@q�|W@r�m@��U@s��O��/@t�B��zc@u��T(@v�3}�@w��%�m@x��I��@y�R���@{�fՅb@|:q���@}p��h�@~�p�3@�_�/�o@���6��@�N�Qύ        @[zfef@�j�b'!�@�-��a�@�43#D@����@�;��� �@�'8�5�.@���q�=�@������p@�g���u7@�?�
��@�|z�Ӵ�@�9o��A2đ��A�(|�nSA��fH�?A	�d�;,�A�,�~/�A��.��A��*��A���YMA�|�P�iA���g+A�vԣ-'A�0���A p���A "R���.A!L���<�A"~��}��A#�/�P^�A$��BV6�A&?�:�!A'��찀�A(�ϑ�A*:wl��~A+�`)s4A,��ä:�A.g=�D4�A/��l�2A0��>Fj�A1az�ҖA2�	�!IA2���4�}A3���A4i�;s�A51SLY2A5�#^i��A6�9��1A7��J��A8d�[��tA96n�Q�A:	�U3�A:�Ab��A;�>,A��A<��W��>A=i' |CIA>E��h�A?"x����A@ �x�EA@p�3�wNA@��Y��?AASg�7MAAŜ���        ?A�6F�?z�LJ{_�?������?�l�U�?��WR�D[?�;�K��?�����7?����v'?�]��oE?�R�7BaL?�m��z�e@j�?�	�@`��PR@8oK��x@�Ie�@�X�%�8@�]�@ *C�X#n@#��}�@&dh@*�C�+@.��%��@13
\V�@3���6��@6�Y!�@8��-�@;��n���@>� �V��@@�9b�!�@B�{��@Da�ׄC�@F*\�ca@Hڔ�	B@I��,K@K�6�@Mꇶ8!@P �~J��@Q'��9d@R/�o;T@SS,���@Ttŵ��@U���(@V�h���=@X;��x!@Y�h>γ@Z�}�WK@\SdS9Z@]�>w-f�@_D$��K@`f�g��I@a0�'�@@b _pE�5@bջ�~u@c��z>�@d��X]�@ex��Lt@fdTu��@gVl�nP;@hN[T��@iL%�6��@jOКVV_@kY`@<�*@lh��0��        ?d����?ZGh��n?�#\�a?��W��j?�����/�?��7��<?Ǉ�e=�?��YYkG?ٸg����?����T�?��K;�?Qi�@?��S$��?�d��M4?��&�%�@8r��"�@مs�ff@	��ת�@nE)і@�/+��@q�N��\@o��@��	U:�@=f�;D�@!Y��
@#$���@%j�Χ�@'�-��t@*��yVO@-u��Ҙ�@0M0����@2 �d�K@3ר���@5ӰHMV�@7�oA�Z�@:A%�w�@<�ƫ�@?R�Ȝ�@A�d���@B�Ȯ9�$@D��]�@E��1 @Gu��^�@IJ1�ee�@K8�$�"�@MD}��-�@Oo�NK%�@P���]�!@R��/7S@Sf�uy|@TǪl��<@V<�p>�;@W�Ԍ�A@Y_w�J�@[3�^-�@\ǻ�]�k@^���s:7@`8�@���@a/�&6�4@b.�����@c6Lλ��@dF�@��@e`?���        ?1��d��p?h�M��7R?�j�:Q/2?��q��?��cr�]?��B]h�u?��Օ�M?ОMx�I?���60�?�EQ��?�{�m_�%?�d��V�x?��h�<<�?���N�=�?�m�l�zU?�Ӧ�X�?��K��?�B��(@�8Fe�j@�qP_?@��Ǆ�@�ul,�)@"+uN�A@���`U�@T8�x�@e�����@��Z�x�@����a@!��/v�=@$3�j�I@&��!���@)�����S@,�����E@/��5*T�@1�so�q�@3���ڰ@5�L!���@8��
Hz@:zHx�x�@=���y0@?�n��.�@Ag֎��@B��O/w@D�.Q���@Fk���Wc@HLN��}h@JIU��@Lc:���	@N�+k���@Pz��,PB@Q�ѻ��@ScU��M@Tf��i@U��_��@W``���@X�zB`=�@Z���3G�@\lh��y�@^Ek�tV@`Hķ�H@a4��A�@b+�}���@cF4.�:J        ?Ե�ҿ��@����u@44m`��@M&��
�@_V�m�y@l5�> �@v�/)h�@�ۜ.�\@���e0��@�o�na@�#H�a7@�,��3q@�1�("�@��/J��e@���ihˣ@�V	!�j@�ٌ�A�=@��$�t�@�u{\��@���~DԊ@Þ{z�\�@Ƹ-�^@�f�5�}@ͳ�S�[�@�Ƿ��C�@��kc©6@���y� 8@�4�����@و�ؠ�@����@@�l/=���@�} ���A@��&jA��@�& �]�@䇡<��u@��� y @�eg{=��@���n��@�g��*�@���&6@�C�H+@�3��g�@�q?g�4�@�N-�ߨ4@�1$\@��c�@�	Q���@���m@��!)��r@���~h�@�7�(@����V�@�)����@�D��d&a@�e˒�۳@���A��@�����@��|��(LA �c�
�A4��4RA�YoBA/���vA)F�!��        ?_�D��?�:�+�Zm?�kO1�,�?�?ڃ#�?�ڇ2F��?�9;�\�?� �5x�?��/��Yi@�Z4�B�@-�EHU@
����@ȁ��n�@a�#.Go@R�'���@�YE@!!!�9��@#���'��@&O��tr@),�R��@,7aI���@/ps��@1k��@�@36�[<ee@5�k�@7n;ȸ`@9#�S��@;L�_}�@=�] L�U@?�����V@A1�D)*@B|xH)@C԰2`�E@E<6h��.@F����j@H8�'�ָ@I�p��@Ksx=�2@M'��Y�@N���4@P_�1Y�@QP�3�_�@RI3��@SI(�@TO�9{L�@U^ԑ�R@Vs� �@W��$J�@X��ny�@Y�w��A�@[ G�@\Ck0���@]�Ë{��@^��p�+@`	�K~��@`�fP�n�@a`��kK�@bG$�@b�f%g�@c|窱Y@d7��}�@d�ן��A@e�/�'�@f{�� t@        ?1�+ ��?Q��LNF?y�8�{o�?���E�?�k7&��0?�meե��?��:��?��GN��?�|�En�?�u�뭳�?�K�^>�P?���-�2?�3����?�5��-�?�9���`u@4�6$ �@zW+�J@��s��@�i  ٙ@.�#���@1�)[�/@�	�Q�@!��T�@$��
��@'��V�!5@+{���h�@/� �SM@2q��r�@5<��~+�@8\�^ۄ@;�Ϝ��@?�q�v��@A�*�5�2@DZ��O9V@F��p[e@I̔]د�@L��I@P$���@Q���r@S��%��@V�N�KJ@Xa��d��@Z�RP��@]ve+�c0@`!����+@a��Q���@c5�@u�@d�_,*@f�*�By@h�R"�k�@j��?o��@l�����@n�Ϝ��`@p�0��"�@q�qC��v@s7�n��@t����*�@vc4?q@w��z�#@y,�;���@z�����X@|��0\��@~k�#3`k        ??^	w��?z��DR?��MT�?�!�69Pr?�T���?�v죘(O?�Gy��m?���x:?��%���L?������D?��"|�ň@�F�>�@�5���@
����]�@	+2M@@ޣ����@d"���@6ϩ �@��d��@>���@ /b�*.�@!�vB��@#��j�r@%�نg�9@(�����@*S���F@,�*����@/n7��^�@1˔��"@2�-aފ4@4<�>��@5�G��@7��Z�vD@9�����8@;�����@>�ܾ�@@7;{�l�@A{��@B�Hٝ�@DD��_@EˋA!=@Gk��-T�@I&2�]U�@J�9%��@L���@N����]@P�-��z)@Q��2*V@R��@T)��L|@U{vV��@V�q�,�R@XO��H�@Y�X�g,@[g���F@]3y�z@^�PՊ��@`HTH�s@a6�7�	)@b.��&@c04��@d;���-@eP�9��        ?�P�n��@ r��<J@B�8�Df�@Z��-x@k�!�M"�@x[kU��g@����6�@�}� l9�@��<brX@�w[Jp�w@��F�x3�@��!�L�@���d�@��mL���@�*̪'��@�Ȩ�_�%@���2�v@����U�L@��NG�@�c�ԍٷ@����X'�@�<��E@ŏ���@ǻ�&M�@��a@�h"���@�豺���@��7��\�@�!(���a@ӎ��9�p@�@�� @֚R�V߾@�9A�4:c@��Z�}[4@۪�5�m@�}�)��E@�b�sƖ�@ଊ��{@ᰘظ�@@�pU�5@���Kr�!@��(�y��@��5�G�@�GI�d�@�~��m@龩���@�, �t�@�X:�Y�@����u^@�k�؄@�?�И�1@��!Du)B@����s@�|X@�_@�De���x@�ӭC�@��]�n5�@��46���@����y�@�qC�lv@�TW���@�;�-�@�'G�$pP        ?3�_�Xy?pR�����?���rc�[?��@R�a?�k��?ɿ/p���?���&=K?ܘt�:��?�Q�#��?�J�o�~?`��?�Zѻ�h?�Uzf��o?��A���@ :�K��@��gJ�@�p�S�@��K�o@�C&���@Sz<`@T��-@4��n@+0v7$@8����@]͑�9�@�q�9@���#�@ *��+X@!k�Hf��@"�3:t��@$�2T{�@%u}M	K@&�z��L@(c��ʡG@)�·VA�@+�iK���@-'���g:@.�J.�,�@0J���@10��-c@2	^ڕk@3v�z�@4
�$��@5��l��@6E`z_�@7%J�Dx@8<����@9[�v�ٔ@:��<�?@;��3���@<�2n>c@>)&�9�@?r$Tv��@@b�=�J@A���>@A����}@Bx��Ӹ�@C4B�a@C�ZZJ�@D�����@E�ǸQ@FOm�[�@G!+S$-i        ?j�?a%�`��W?����?�wL;;�?�r�����?�7�-궺?����?Ղ����?��e��T?�k�69?�>�x�z?�b�(��1?�"2�?�D�~�?�pD���o?��|��m?���q&%�@y�,0��@���ć�@���~�{@k�]K:@	|6���@Ӈ��-@g��6#@�b;�&@�yCK@�،[�@��`��@�բ_��@�\��|�@T>j(�M@ {,��+@!�nZ,~�@#n)��
A@%���PU@&�5jc
%@(�@-,_�@*�Aq�$@-����@/�q��h!@1�s�@2��t��@4Box��@5���UC@7�q�z�@9kg�:0W@;zO.��@=�	����@@��x��@AI�f��@B�a��@D���@E������@G=��OV@H���^	@J���E�@Lǡ�Mo@Nٺ��Y@P�
1��@Q���s�5@R�R��Q�@T,&� �>@U��v)        ?���8�?AK�Wh�?c�\��-�?z���'pS?�Mnu?�hKV՜?����}�?�p����?�+�:�?�`>��u?�uL�?�Ȩ�F�C?���L�?�՝/�tk?�JY�☔?Ӭ?�\_X?ר%���?�Yi���?��:�'7�?�-�JO?����f?�n��ETc?��B�\C�?��u4�8�?�N�?�S��V?���sX�@�RC�I@��1�!�@	&�N�?@�\��]Q@��]��O@]��Q@�z�\��@��S�$@5�� 
@ꅺ�;o@!��Be@$7z9�@&���C�@)C1|���@,^�/B@/*�Mz�@1:�a6�3@2��ʌ.]@4���y�@6�h9�@9��`<�@;d�ƀ�z@=ڕ/D�@@<N��@A�<"@C�'�s@D�^e(�@FQ����|@H5X)�@I���ҽV@K�\D��@M�g���@P	*�_!@Q+ǎ�n�@R]~�@S�uP<�        ?�t=�`<?�sC�N�@aG�}�t@6W�4�S@G�k
�@�@T�;��j@`Hvq/��@g3���@o.˰�5�@t4!ܽ�@y4�F�{@~����@��n&���@�T��&v@��4��@����&U@�E��J-@���i��W@�B�ʟ�@�����`@�����w@���Q'q@�Ǒ<��@��k�X� @�f� ʈ�@�/Sd�#@����,@��`S���@���U��@��4s�hT@��r'�B@�]@�9�$1L@�`�ѭ@��ˎ��@��=�{��@��ni8@�O�p�?@����s��@��B��;@�e��x��@��U�J3#@�Q%���@�k��F@�2� ͕P@���M7��@�ъ6XJ@è��[��@Ć?K�@�i���@�RN�UB@�A�(E�@�8(\�@�5�Y�@�8����@�B��v�@�SП�& @�k72N^@Έ����@Ϭ�Ț@�k3n!Q@��=?@ѝG���        ?ST���Z?��� ��?�Y�Nj�?�w��w?�cub!TM?��yύ=�?���R3J?�R����@ �����@�/����@+�"�D@����%�@�b�`�@v�dw�@U��+�@}	�d�@!�@�I�@$Q���d@&Н��@)slO7�@,:��yAU@/&��B9@1o��$�@2�b����@4gd#>@6)v�(��@7��#�b�@9�lZk�@;��
��@=＿��o@@7-�׮@A!��7�y@BD�?� p@Cp��OY@D�oG"x�@E�D���@G-�����@H��.H�@I�IC��@K@�j�{@L��(�@N*hL�@O���z�@P��3(��@Qk,dK[�@R=+���@S�ru\S@S�r�@T�2���@U�m���@V�cŚ
@@W�*����@X�ܰl$f@Y�����@Z�r,�?@[��u�	j@\��&�@]�'E�&@^�އs@�@`�ʶ�@`�qg-U�@a>�.���@aܫ���        ?Z9@�A0l?�+�C�x�?���G��?�P����?�$�y��?��m8�+@ 6P-�@�(�� �@��S���@�*�"@��6�D�@صoV/@!�[ C��@$��%e�p@'���CN@+aT|��z@.��m&@1e�2��@3i��@5��d�!@7��?���@:(߹^��@<����w�@?S+�R?�@A��`G@B��:�Ľ@D�b���@E�$"���@G��	��@If5����@K^���@MsdgJ�@O����t@P�J��S�@R7�
�1�@S��M�@T�����@VR��0t@W��Q-�@Yn���@[��l��@\ۧH���@^��fkB@`O2��^�@aP��Ǆ�@b]3:ZQ@cuv�I��@d����܂@eɓ$���@g��t @hN��@i��];@k8;�y�@lu�w��^@m�S�>R.@o|���)L@p�[*6�@q]kz�Q�@r7��$�@sg�8�@t�8g� @t�w��@u�Ez��        ?&+�u�Ƚ?b`.N��J?���b?�4�W�0�?�NA�.�?��t}A?�5}�iX?�ק)3�?�{_ٌHi?���L#�?�64]z�?�/p�&U*?�_0��}N?�0}��?�[M����?��d?��sk.�?�:W���?���^s�6@�3�(�@@�^����@�Rd��@��֚�@o��@��u���@jY�xa�@TM���@�uK`Y@�D��@!��z ��@#�����@&
Bt�@(�c���@+o�Up~0@.�&�O�@0�E��d@2�	B���@4�)w�0�@6���'g�@9�,��4@;��ܐŔ@>+����@@�)���>@B	r+��@C�	����@EnR(��@GN�@C��@IOM����@Kq�1d��@M����@P�XD�@QV�[:7E@R��iW�@T3��_@U���+�@W5�����@X�U��{2@Z�did��@\v!�~�,@^a�y���@`2�L�@a>�;{��@bV�΅#        ?��CE��@(sր<<@L��lq)@c�� �f@s����@��
��@��;r�݀@�9�f�=@�e�r�N�@�c Sg1^@���r	��@�����@��C��P�@���*�{@�w��@�ZFmx�@�kD]
�J@�������@��a�;Z@�ًX���@þK���@Ź�=�7<@�� �0s@��j�q��@�5�p��L@΍�{,�@�}��;�@����O}@���[�@�g[ǽ�@��%Ȩ�@�<Y�'��@ط��Xď@�>�<W�@��'�7<�@�n���[�@��U���@�e��B�.@�E��u@�+z�N�@��8��@�r��@� ;�P�@��ξ�Q�@�f�@��c�@�DeO.@�6�6�%�@�V;�N�@�|�Mqr@���#Ȏ\@��'-�K�@��c%�@�R�m@�W���;(@��r@�*�@�c�@�o�@���@�����@��Ҁ���@�Z��).@�"�7w�        ?B���I?~wBi�	?��\k5�v?�)l=�O8?Ȅ�Zor�?��t@D��?߂��_�T?��0w&?�[_�R?��K��G?�?��O�Z?�)�ߓ�f@ ���@�R�.�@�[d�1m@	ꊫ��4@]��O�@�8��d@l���@q��.h@�n׉  @��t0�@�q}�@�'��en@ �E�@!c<�mG�@"�z���Y@$;f�n��@%��1�6�@'T�2G@(��@*��Z� �@,��vQ+@.c���-
@0-+�1@12�8��U@2C���^@3_����@4��:�7@5���c��@6�͙�� @8A~\Y�+@9�����@:��P���@<e0MƸ]@=ަT�O!@?d��J�@@{���@AK_�u��@B!�&<��@B�`��U@Cᷓ$Y�@D˫R�*�@E�H�M�@F���fx�@G���k��@H�Ω��h@I��1�@J�#��P�@K�ں<�@Mǭ:�@N<���@On)x+�        >�?}2+�$?���G�?@(O/�6S?X���=�U?lsREӒi?{��l�?����[�?��왼?�}	T�ɏ?�Ը�l�?���
uH[?�~�C�KY?�$��?��"�-�?�E� t��?�k$/��?Λ<����?��m���?�aZnUD?܌l� ��?�Nc_�-�?��h	�M?�����%?��`��?���?�Л�^�w?�w>�2�?����<�@ �h[>�@i�ݡj@|�J��@	�T��l@���8	@ )5	�@�+<\��@St"��@a\��1@ŔQ��I@ C�Q�l@"V��X��@$����q@'#�<��@)�y'�@,�,��WM@0�%���@1����C@3�#�u��@5�Q0�@8?�,JR+@:�C���@=a�\��{@@_@>S�@A��e��V@CNL�z@E�ى@F�06�F@H��CB�l@Kj9��@MW����@O��PH@�@Q#&��I�@RzO<WP@@S�^��E�        ?<@r�dn?v����dD?�zo5�@?��<Zl?�yJ�W?�P9�'��?���s/�?ߦ§,�U?��T��+?���@�?�_����x?�ƀ�'i	?�{ a��?��x8���?��A��6@O��S^@���d�@���ȁ@
���<י@8��M@�'�Gm�@��Y�@g���@ i0z�@痘�@'��e%�@ �5W��{@"���b4@%9�7�@�@'�i�U@*���}@-�f�W~�@0���� @2��u@4Ϲ���@74� ���@9�l�L@<�:��Z@?�gmǐ@A����p7@C���d1T@E�)��@G��08ZP@J�G�{D@L���Y�/@OgB78 0@Q*�˘��@R��^<Ϡ@Tiɺ�(@V3��(�@Xo�h1�@Z"� ���@\J����@^��1���@`��A��+@a�w�4@c)3e�3@d��U�a+@f#���\@g� `F
@izV���@kJ�b/uN@m5�t�b�        ?Չd�B�@<�g�Y,@5:=P��;@L�]��W@]�Kv@hl\~��@rY���@y��Z�/�@��CY���@�q�Y�<;@�v��ώ�@��5i��@��SB�M@��6r@�g&;Y�@����D@�[�X�M�@�V4���@�j����@��9y�@��m�G+@�G�P�d�@�ɭ���@�4|1"c�@��P9��@�����@������@�} ���@��x���7@�k3��P@�6�%��@�qK�h�@��3E3�@���0�b@��*���\@�ɷ�Ýf@��s���=@�6Zhe�`@ƀ:���@��ɡ���@�9�`�@ʨ��~@�$5˝��@ͫ�^�*@�?�Xx<@�p2t�Q(@�F�h�@�$.,zc>@��ڬj@��|�0��@�㞸Q�@��o�N@���K���@��8F��@��>��c@������@�ĕ
�*@�8f,΄@�`�r@ގ�.t8�@���sd�@��L �j@�#[��.i        ?_-��?��0I-�?�9���?״�;?�_*��MT?�r�7��?�e�$\@����B@r|kc��@���ma@����@�*JP�j@��0�c6@"�����@%���
;@(�\��~�@,7��yK@/ĉ��d�@1�~��\�@3�I�m�@5Ñ�s0s@7�\!���@:$��.J�@<x�6��@>䎯���@@�W�X@B�'WC@C[v~o�>@D�+j�@F2���	�@G��,۩@I9��!I�@J�L��C@Lpxo��@N�����@O�{8�n�@P·�c��@Q�Y���@R�4dѓ@S���@T��N�7@U��Qޣ
@V�̭���@W�����@X�|o@Y�J�C2@Z�� ��@\�����@]D��(�(@^v���l@_�L���u@`u[S��@a#VLh�@a���9��@bc֖�9Y@c�7&r�@c�h�և@dl��R�@e <��^�@e�14��@f��צ��@gID>}@hM8rX        ?L�Q?�Y�D#_q?�"�r�?�?�!]�)�?��f�?�%�ɼ,�?�^��� ?���ճ@�ׄ
�@�_i@�tZ�r@h�=�@V�N��@b�c@v����@!��6��}@$6Vvp~@&�~׋ݷ@)�!�sG�@,�L�Q@0�t���@1�W�0�@3���1�=@5��K�@8�^4J@:[#��l@<�.L�S@?|��1��@A&�l�@B�`���@D;U��	�@E�J����@G���]@I�;��@K��N�Z@M� "��@O�L6��(@Q}��@RD�wŤ�@S����ޣ@Tݧ��Z@VA�>��{@W��ԳP@Y;H:B�#@Zѱ7އ@\y��[�@^3���@_���>�@`�po�I�@a�g����@b��<�@c��6D�@e^��@f/����V@g[�w��@h�����"@i��zQ��@k"��G�@l|m,t*	@m�����@oS�-�q@pi�r��@q.l�g��        ?*-,5M0?j�{�Z�?��w�Ѹ�?��Y�N�?��6��?Ŋ�a+[i?����
��?�L�x�:?�$l�>i?�����q�?����I?񃨲-\�?�ks�G�?��2��g?�����ֵ@�.n׎o@�q3���@�Q;ۢ{@<;��`@�U��}�@j@ɥ�?@�&�8��@���@�@V���+�@�<>c@�6���f@ �s=�@"3_�Q� @$r�h�@%�p�F��@(�~\@*Js���@,��EH?�@/I�h�Z�@1�E1_@2��"ފ�@4��+@5�J}T��@7����b@9��
���@;�O�Z	�@=����b@@)Q2�N@An��;@BɹVV@D:w�fs�@E�Hʢ6@GaX�3��@I�\D@J�#ap^�@L�#q곅@N����w�@P}��F�@Q�_Ng�@R�g�i@TaZ̥@UNtb�Q�@V���@��@X
�21�@Y��m�H@[�4�~�@\��3@^P�.��        ?�uԓKP@.�nH�@R.����@h�t[�Ym@x���s�@��y�E�@���zU�@�OЍ8W@��q�p�@����4.@�����@��%��+�@�I��kV@�M�4t�@��2I�Z@��je�1@��[� T�@�-���@�*�t��@�>?�;X@�gz�i|�@ɥ�ލ�Z@��B�ǯ1@�a���w-@�o�Ղ�y@Ѹ����@�����&@�kxdغl@�����Q=@�H֛�@�ǠU4@�Q'�7KI@��j}�Ӏ@݄`�/<�@�.D�&@�q%�3@�P����@�5d�ʻ_@��1�@����S@��;�@��s�f��@��r��0�@�bƕb@�ZD:"@� b��X@�75���@�S�4�V@�vbaÖ�@�İi.�@��nB5%@������@��
�ef@�Z�*(@�`�n�@�����y@���P�K@�Y�ǉ�@�Ѷ�@�� 1��w@�i��%IT@�	Ԓp@��p�A��        ?p�%��)�?�k��6��?�U�Wa?�_��4t?�K�bN��@ AYv�@���w'S@W��bP�@9G43��@�[�%�@"����O@&� |���@+�ۆt�m@0?G>��J@2�sEw��@5�/@�z�@8㚧ˡH@<%�1�@?��|Ȃ@A���pz�@C�Y,��3@E~_1�w
@G��r��@I���~�H@K�T	 @NS�l�@P`E�t@Q��S?�f@R�R�4��@TE�<�N|@U�?��*I@WC��@X��zX'Z@Zg>�c�@[�
��Q@]/|�pg�@^΋�wn*@`;�CP@a�=<�@a��P�@b�8X� (@c������@d�:]�m/@e����wK@f��=A@g����<R@h�&W`�@i����@j�-���@k��b�a@l����@m�8,c`@o�(1�@p0a�I@p����'@qE���r@q�aV1�6@r�~�}@s$�H�d�@sʃ'E�@ts9[���@u���Z�@u�~J�w        ?P�\cJ��?�O~��?����,l??����a?މ�W��K?�2:'9?�/mi%A�?����@�;S�;@	�v�@���|�@��Fk-@X��~@�y)�h�@"E�վ>@%��B�z@)J�B�.O@-d�M�@0��WE�J@3ow�y@6"|�ꏹ@9�T�U�@<<"�n�@?�*t�c�@A��)@C�ew%�z@E��A0J@G��s���@JY�D^�@L����O�@O�k��9@Q9��?�@R�8h�	�@TY�!'��@V@$�B@W��d�4@Y��:h�@[�^���@]�v���@`��>Y@a@'�k*@b���7ě@cӌ�7 @e9ŉ8��@f�ì�C@hF'���@i� L�I@k�� �X�@m����F�@o��0b-�@pб +v>@q�̦�g�@s�i�C�@tQ����@u�z�|W�@v�]���@xg���@y��GI@{x���@}/��'@~м�F�@�L�Q��@�:+�ɯ�        ?K}Z�`?�Z�dh�?� 7��V�?�aN\M	?�4��7�?���#�?� "Q�n/?�p�o+�?�q���?�]^03��?�\s<��?��ٻ�t1?���b"j@���.��@�^�KI@:Z�xBi@���� @QaR"(@V]���f@���+	@���wZ@{��S��@�YM��@ ���m @"y�aE@$���T_@&�����@)yƞ`�@+��ˎP�@.^)t��"@0����X@25�<��@3�}���@5��V"j@7���m�@9��B�Ս@;�<��1@>����@@<�R��@A�c�V��@B��<@EQ@Dbw��`@E�0�C2(@G�+RMޛ@IX�
�Z@K3j��:@M*�Ta@O=���E@P�����@Q�J��d�@SZ����@Tc���N�@U��2wD�@W.s�*�@X�����@ZGg�+�@[�O��ĳ@]�`t��~@_����p@`��2�(@a�KY�*@b�/ʷ�<@c��IO��        @��Y�2�@?c>-��@a{��ձ@w�P(@��	$��@����y@��W�d)�@�#�L�S@�ё�n��@�2`)>�@�l�?�+@��@���@�+� �	@�Ur]��@�I*��_�@�oo�RT�@����g@�O9[z�;@уj��t@�v����@Հ��fG�@סH�9��@��B1�z�@�%TLn@ވQmJ|�@����<�@�ǭ(8��@�׶�j@�u�[y�)@�ܢ�ґ�@�M�γE�@�ȫ�ϷW@�M���z@����@�t#}�y@�M]��.@�_�q��@�9�΢p{@��ZJĵ@��u�|>@���:4O@��(y5��@��:=�I�@���HJ�@���"�@���C*�@��6h7փ@��q�Z.@���Q_�5@�ϲ8��@�������@��գlA Y�iEA ����_�A;R�{�A�d}�;�ApϳQ��A_`�3$A��m-AY(���A8Ȇ	�A��If+A^%��q�        ?U�@���?�D�.��8?�A�'?�]�ֺ��?�F{W�|G?��O{�?�q_��?����?�cަsҚ@ Q?��@aI��Pw@�Rx<@��#��!@�����>@����4�@�Zg��a@�ȪhT@��	�y,@!NV��a�@#YɈ��;@%���NcB@'���n@*,���H�@,��=Az�@/L��Od@1Ʃ�kz@2rs�K�@3��� @5|�ҾD@7���@8�P�j@:����u@<\��Er@>B��)[�@@��f@A$�=oF�@B4ђ�3�@CN��U�G@Dq���X@E�j�k�@Fҧ�%k+@H"�Y��@IR�`-Κ@J�r��1@K�K@MD� ��@N��+w�@O��u�\�@P��ml`@Qc�d�4@R�2Jz@R�1�4A�@S�Zq�_�@TD�:�ӕ@U�S��H@U�`�-'�@V���@WM�'6:H@Xw����@X��N��W@Y�5(@Z���^4@[j���{        >퀋��e?)�Pp?N���A�`?e��Rd��?w[k`~?���[h�D?���o<?�dR}a �?��l�?�1�Z�oO?����R�?��-��?��TŐ��?�)�@��l?�C5��G�?�+B���?��9���?��	Qi��?��XN��?۠����~?����2@�?�f6�	�?�'m��vm?�+��{<?�v����?�e�JB��?�=uE�U?�f�ej�X?�����?��@
�|�@��@V�/\�@��ơ�@	�4?|@��@
�
�@�}թ7�@٭��PY@����&@d�H�O@���t*�@���}@ s׵��D@"$r�:@#�9p�p�@&µ�[�@(5�{��@*�d���@-<�e�w@0�j{4J@1�M�B?@3I��M�@5o�vps@7�K���@9<΁�I@;��Ӿ׵@>
sȐ�M@@\we$5�@A�`6]	@CY[���@E���d@F�m�kS�@H���۩�        ?0���)��?g�� �?�C1��f?���%�~�?�r^0�
x?�
��c_�?�Gd��?�+d� �?�b���e?��-)��?�ݔ�G��?��܎E��?�5.�q�?�� ĺ�?��,��i@ yQ*vp^@�7���@�V�U@�4��@�@����8@���w@����!@_gzŪ�@��
�|�@"5��eB@$ӝ!�y@'���d�@*Ҍ��@.9�UmI@0��H��@2�=�2@5
���5@7f^׍Ed@9�5��>@<�7i�<E@?W4A�i4@A-	g^@B�Pщ@D{9zo�@FI��@H2�<���@J7�z��@LYvp+��@N���hS@P{y*��,@Q�<!�we@S�)$�	@Tq2���@U颍��@WwN�&n�@Y�7&G�@Zش�+@\�A��Y/@^�o�=�@`[�L��@auF�Ǉ�@b�O+g@cܺ��(@e+Ԇ�S�@f��|�K@h@}�!@i�tZ"�@k"����        ?�?� ��@`��0@:6߮y�@QW�{��@aR��д�@m-��"@v jzͩ@~����t=@�}��~g@@�2�R@�B���?�@�����H�@�y����@����o<@�؈&���@�9�W.#f@��q_p�@�<į���@��2Ni�$@��%.\��@���y�#�@�lEF�@@�
��
hL@��UIFq@�~��s
@�U�l��@�@�I�%`@�@S!�Z@�U��z9@�@��5	x@�bb���c@c�0�@��[b���@��	��@�j(�7�@�΁��@�@���@���&;��@�Mv�35�@����[�@ό��@ОTH�@�{����I@�^��`3Y@�F	�:�@�1��<+�@� ��@�����<@�
+�*@�P��
@���ϳ�@� a�J�@�X��%�@�R� �@����:%@�/�o�V3@�J���L@�6�k|K@�˩�ྗ@�d�w�NE@�]�"�@�N��@�J��
��        ?T�� ��?�gW~���?��-�s`?ȋ��8?���D �?��و�2?���T�k?��]^z�?��d�NA�@��
�dr@�	p�M@
��6zf�@�rS�<@����:K@�(��E@�]�W�M@$��@��r�G@!�3�f.@#�L���@%~���{�@'�2�r�7@)�L0m�U@+̔Cy,�@.wRE.�@0'��-��@1S�)�iA@2��K���@3�γ�C@5_Tn
�@6J���T@7��S|��@8��w;�@:K���f�@;�食��@=F��(@>��/�@?�
�a@@�R���@A~����@BC�BF4�@C"�߭[@C�"A&�H@D��r�u�@E{�j��@FS��0��@G/�A�h@H��׼�@H�����@I�R�7��@JϮ1��@K�.���@L��0)@M��1��@N� �)p�@Oʉ!��@Pl�d�Y�@P�3ΎP�@Q�D��k
@R�S��@R��L�$@S3��:ß@S�2NgR        ?6%o[?Q�ԯ�E�?t-[L6�?���zf�?�.��y?����P�+?�1;����?�m��Tg'?��v��2�?��C/�P�?�0��_�"?�#˺3�j?��O����?��H��c�?׉h�s�\?ۤ�E��D?�4̍�ed?����:�^?�E��� ?��L/�??�V5�
�?������i?��eN?��zE��?��B�^P�@ �Ċ��o@���R�@���9,�@
��dt�+@��#��}@�N��@�k�K/�@��<�v@���@�E �R�@!|n�!��@#��#v;@&m��!>~@)LH��|@,uw�S��@/��0.@1ߜ3gtP@3�(J��?@6>��̵�@8��W�@;t���f�@>j�y��@@�\���l@B���$��@Dv��zG�@F�Ɩ�M@H��i�@K%�l�:@M���5A�@PCÚ�h@Q�6�Sm�@Sa�ά�@U�)�C@V��9�n�@X�2!���@[�33�@]L�	$�@_�����        ?Q��=��?��~&H�)?�y��ğ�?×[�i?ӗG�V�?��_�5љ?�['�L?����?�u��?��'�cA@�]��A/@��$��@\�6g�@�j��S@�g=�@����L@���4��@�	�
C�@A(�!��@!sN�E�@#`Ǌ�Ȫ@%jBۄ�T@'��U�@)�'����@,1��ؕG@.��Ӑ)�@0�4�iN@2���d�@3p�b�^_@4�9ܦ��@6z���@8"$.�@9��s��@;�huR�,@=���.v@?w�1�x@@-p�@A�R���@B����4@D ��L�@EY��ߠ@F�т�M@G�����@IXgF>y�@J�Ԫ�n@LJ0z$@@M��A�ֆ@Oyi,���@P��,v�@Qt��s?@R]z#)@SN�?�r@TI�^�@ULI9"5�@VX�r�L@Wn*�y�I@X����h@Y�n�^�@Z�U ؚ�@\"ੁ��@]h*ˇ�@^�L����@`2�xh        ?��Ev�@&���N{@IYx�4�@`��x���@p]��Y@{\`�p��@��\?}�@�����(@����d@�G;���@�=_M@�8�^��@���ڎ?�@�Vj�z�@�A�˖�@��$,躄@��ש!�@�(Q-��3@����+�@�����@��V#���@�,J�j:@��H�=�@�S����@ÿW��"@�3E��7@Ʈ����@�1�nd��@ɻ���@�L}��@�����i@�z���D@��cP�@���<S�N@ѻM��e@ҔR��V�@�o�Hx	7@�M�ֲO@�.B}�9@�F��q@�����@��iO�@���H��@ٹlb���@ګ`����@۠痺��@ܚ2ʏ�n@ݗo(�c@ޘăSߗ@ߞU��@�T�l @��G:%C�@�d����@��Lء�T@�~'X\��@�3�1��@�eZ2@N@�4��cl@���e��c@�c)�}r3@��20�4�@���V��@�6\!��        ?I�S��U?�FtV�?��߳B�?��y�A ?�t=��<\?�:z�#?�C��MG~?�)K���@ H� hp�@c E(�@� X�Q�@�=�n@:s�R9�@�0�=�@�3�;ж@c0X��@[q��Ik@x�#���@!_듸�_@#i� ��@$��#ꯇ@&�l�Oq@(�J0�@+5f��@-��NF�@0����@1a�'�z@2���B@4FB#�@5���6�;@7x�uB�@9/PFE^�@:�l�o�@<�w��
@>ɴCV@@h1�\�@Au�)��@B�����}@C��>��@D�O�S�@FU;κT@GY�V,��@H���.+@Jq����@KkR\@L�{d�X@Nd_͉m@O�v���>@P��#��@Q�O"�@R�s����@Sp�L���@Ta�i�7�@UZ�8��@V[o�}@Wd?��@Xt��dĥ@Y��ont1@Z�9+��@[��/��@\��q%�S@^*pH���@__S�G��        ?J��G�y?�c�	��?�Y�'�?̄���+?�n���?��]��b�?�y��S,?�(�l�?�l�a�@��\;Y�@[�F��@	^J�M\@�A�D�9@�P@r����.@��@e"ߚ�@�ǉ��@����@ �c��=@!iC|)�P@"Ƹ��@$/C��_@%���5@'2=,@(��1A�@*�O��e�@,{����@.��?���@0`u�T�@1����M3@2�\n��@4Q�	�Dy@5��k:��@7��G@9Qc��g@;?~8�@=Q��m(@?�����*@@�Y|��D@B7ۻs�@C��IG<B@D��(S]@F���*�@H�wJ<@I�ɂr2�@K�/*��@Mh�V?N@O]�*��@P����v@QǤ%��.@R�Lz�Β@T;'�@UN䭀U�@V���n�u@W�<���@YU����_@Z�:�*r=@\O�^�4S@]��v��@_��7xQ@`�iw�[<@a|�\�>        ?�"����?S���A?w�,�|��?������?���_��?�8�C�#?�5`�4&�?�y1��%?��(����?�Y��5��?���d<?���ʴ��?ސXYQ|?⁭G�?�3́y�?�p5}�1?�PJAeZ�?�v���ѝ?��}}A�?�m�=���?��jN�Y^@Wu�x_@0a;��@v.	زt@6��Cr�@��/ˬ@2l����@��A�X@ Y�[9@�-W��@�t���@"�"o�@$� ���@'_�{��@*wlwOj�@-�c*g7@0Ӄ�8�@2�F+Q�@5(���@7���v��@:S;�B�@=?�q��@@5l/�<t@A��F��@C��q�@E��c&p'@G�mW��8@J4�UlA@L������@OU@'�@Q�|*�@R�U�(��@T?�ƹ$@V �,�Y@W�'M��@Y�8�{̦@\��F@^Un�N@`e�Ӕ}@a�����@c�R�uN@d���1@f;T��fL        ?����7�@-I�/8r�@RE�)'�@h�~�g\@xL��t��@��#C3%@�#�B�>F@�����7w@����@s@������
@�B��,j<@�.?n��7@�<�W��@�k̵�@�����{@����	�@�g�Fp#u@�IOI�C�@�@�	h�@�O�P�N�@�y�i��@��^ 8�U@�$����7@���d�5@�*�O��@Ñ��8H|@�
C-���@Ɣ�����@�0��&z@�ݜ5eo(@˛� �|@�hp��)C@�Eq�� �@И�|Z� @і�pht�@Ҝ)�oe�@өj��Q@Ծ�\��E@��^�G��@�*R��@�3�1H�]@�n���8@ڵ��o/M@�
79�J�@�mW[��@�ନ3�@�2�cK�@���H� M@�������@�&��@�mCi�@�~$y��@�p��7�@�j��8X@�k���W�@�s�Wy�U@�u��_@�9튊�@�gB2�c@�փV2��@��BW�@�*ܙ�n�@�.B�q��        ?Q��L�q?�8�V2w?���O?�.?Ƒ�'IW?��O���,?��`��-?��rT�9?�����?�t�[��%?�)�L7�"@N�&��@e��+o@��
�h�@S�X�@�.8A�@�j)'$@�b�ܽ@��bR��@���s�@!+)�A�@"��g15�@$ڵ�j\@&�`���@(�_�*�9@+.	���@-L#���@/����?�@1�,�6@2RH�H�@3�|���@5�DmL5@6ydw�w@7��e���@9�y��d�@;%*�X#�@<�0uG��@>����8@@-Aמ�!@A�'8B@BV���@CuRs��@DDo��:@E�����@F2�ݤ@GNX� ��@HqZB�@I��]q�@J�WN:-�@L.h(�@MF)�u]U@N�>���@O�`�vN@P�Dt?;@QFZ=�Sg@Q��C`�@R�P�o�@Se�&g��@T!�݃d�@T�r�D��@U���~�@Vk�Rcc@W6<�(@X'E���        ?¬h���?E	Ne���?g���_Jb?<oq�I?����į=?�\��`K?��pK�K?�p��ܷ?��$��?�@�֗�?�i�{�l?�����{�?�w�~�(?�o �?�SRc��?�=�o�?�}��x�,?�ڮh�?�̮C�#�?�mi����?���_\?��iQ0�?����O�?�#w��ϟ?�"o���?�;��?�c��0�S?�J�7�?��Tf�!@u�D�@e��t@��1y|9@��q-��@ez��U@�t�
�@|[��q@{�e[u�@��NOT�@���G�@!ʑ�4�@$�� ֠@&T��i(@)1���d�@,#Ъ&�7@/Y��oh@1k��]̇@3P����@5^O!7@7��D��@9��K�"@<�),]@?T��7i�@A'`����@B�lA�7�@Ds���X@FEz����@H5��)��@JE4���W@Lu!k�@@N�G����@P��29��@Q��,Ɋ�@SD��i        ?S���?MC�p?p�����?�S��㲮?��ZC�L?�'K^\��?�<,1-��?��C�bS?���A��?�-,6;�?� sBr�?̆�ۿ?�k���6?��1`�?�&�.�^�?��4:ׄ�?�:��U?�r�{��?�C�z��?�N�z�n�?�v��qw�?��9�?�O��J�?���꼗?�i6/m�@ ����=�@h��r�	@=~{�@	p0`�@���|@���u��@�·=JK@l���@M���@�O H#w@��x��@!��4	>@#�)���@&@y��,3@(�%�X@+��c%+$@/Q��H@1|)@���@3}��I�1@5�N�=��@80, w@:��`lh�@=���f�@@[^�x�@B����@C��25�@E�ç{�k@H7Ы�@JsMC�i�@MD��Q�@Oĉ���J@Q`Y��ڿ@R���e@T�v�`g�@V��-�4<@X��&�@Z�c�U@]g��        ?�s@>����@0,��#>@D�����@TCc�(�p@`���#n�@h����@qf�~���@w��X�@}}?���r@�R�8�S@�D(B��@��Y��5@�8M���@�Y=�;F@�ȧ|�R>@����U�K@��`'�Ko@�ӝ���5@��V[�@�[-h,@�5.^�6�@�&^!]��@�/A��1N@�P��b��@���m��V@���"<#P@���� �@��	j|l�@�I��u��@��|E�f@�*W,3�@��Ǩ���@�QU�@� rQ2�@���D�@������@�@G7^�@�>�����@�F�X�=@�X��3d@�t���@ś/�J��@�ˉ��$�@���0@�J���^�@ʙX��+�@��Az0<�@�U[��ۑ@�­�ᙇ@����@��
c�C@Ѥ��m&@�o\��4�@�?����@�p7h@��I�M&@��Z�2�@ֵ�-�p�@נ<?:z@ؐ.Z'�@مAh[�*@��{t-�        ?XԨ��FZ?�6���t?�#QF��?���w�?�qڒE�?��՟�G�?���V�@ ��_Ѧ�@;����@][��=@.����@�P�f@E�����@,{>I�@ &�x���@"R�W�kr@$��K7��@&�6����@)u�w��@,���
&@.��7��@0��;W�@2)��{j@3��5Y7�@5)1���a@6��:�C[@8X�'��,@:�8@;���>��@=|��<j @?L:T�V@@�/V�@A��,��@B����@C�^� m@D��L�A�@E��+|@F�X�Y@G���E�@H̸ʫ�S@I꯻�;�@Kg��@L4�X���@M`���+�@N�k�)'@OƐ��Z@P��j��@Q;�r��@Q��v;X�@RdYK�k@S
i9�Ȱ@S��W�e�@T]ɑ�۲@U5�6�@U�.�.%@Vm��D}@W"���Ӫ@Wڕ��8n@X��r"�@YQ��9�m@Z�G�#�@Z��Ϙ�@[�hS�        ?R{�Ɓ�k?�Jf��?���4���?У|�S�?����1�?��e�!P�?���%u)�?�U�e�1@o�ik}@�@ZZ@�3	���@��+�ء@1��lg @%��f�I@�$�uJ!@!���dyC@$NnS��/@';]j;�X@*uybAG@.�%��S@0��z�@@3S
�ւ@5x���%�@8�ïM@:���+@=�X��1t@@�Vq#@Bo�˱�#@Dd~x`!�@F�2v�j@H�"3<ɫ@KA�-(�@M�7��l@Pa��
@Q�pY�F�@S����Þ@US!؀�-@W6���@Y<G��]@[eU��@]�P��!�@`�x�#@ae�%aF�@b�u��l�@dJK7��@e���E�@g�!
٭X@i\�J���@kE��k>@mM`Y$��@ou�����@p�+�U^�@r�%��O@sb�@�@t�$�T��@v6�e.��@w�{���@yc`ޅ�v@{G����@|�5��F@~ܒP�<@�qى�`�@��+wV�        ?	�ZU}�C?I���b�<?m�Rm�?��+J8?�+��B�?�&�1�I%?�J�қZo?��r���?�������?����{??���e��?�į�?�?�W�R� ?�l�n�D�?�;|]>�?��lx�:�?�:�)�/�?�1ݫ�*?�}�U��?�J��H�?�4�ө�+?����=?�@3�!��?�r��tԅ@��峪@-��l@דX6@
A"�^�@�a6�V�@���5�@檼h"J@1�x�s@�G�k#@d-Qԡ@R��.�@ >�T@!�Y[f��@#�S~?��@%ŗk?��@'��:�,#@**����@,�!���@/1y1cӑ@0��fǝj@2s��ߒ�@4:�e�K@5��C�A�@7q	
��@9O��v�D@;J���L�@=c/���@?��.���@@�'c���@B5��^@C��,�W@D�ۓ��@FR���.@G���:��@Il�q�m@KA�NX@L�$��@N�GěD@PD4��)�        ?�\z�s�@7)C����@Z5mE�ގ@p�VU�*@�%�-�x{@�m���V@��E�	��@���̡@����6�@����M4@���ۂ�@�Ņa}X�@�]�/
<q@���?s��@���1i�-@�������@���.���@��'��@��b�@�0�6���@����|C�@�Ê��b"@ȥ��ų|@ʘ��
�@̝#Ŀ�@β����j@�l���@щ����@Ү��@����g�&@����?-@�Q��D+�@י׼9�]@���n�@�Buʔ]@ۢ�9��@�
�H"@�zᴊ�.@��n�n�@�ϣ,�2@�|;��R�@�C~)tj{@����@�ݠ���@䰖�@�%@凑c"��@�b�/m�3@�B����@�%�����@�<��^@��R�-�,@����7q9@��L����@���X'@��L�؛@��Pr�@����/:"@��gl�@�*�+@���숅@�;��@[@�ҫQB�@�l��K        ?U��w%/�?�m���A�?�.�e˔�?�9�egK?�#��F�?�@��W�?�*��h��?�߲�`w?���,B��@�����@ڬ5��@h@a��@>�=J�@���ec&@��_�@�B�2Cy@ ���{��@"�b���@%D�0@'���2b@*��B�0@,�/!{|@/�
�y��@1\�ז@2�Mc�K@4��"���@6G�z�p@8w؃�-@9���W@;��!a�h@=��~6
?@?ġ��@@�+Ǽ~5@A�'�X�E@C�Δ`@D3����@EX����@F��z��@G�vC��@H��!Y@J)��4\@Kk�4�!�@L�}�'�@N E�e��@OR��o@PTv�g�@QSib�@Q�����@Re@*���@S0;�0@S�T+��@T���V��@UEϩy@V�8�0�@V��1;%�@W���h��@XE�:�E@Y	<a�wo@Y���j�@Z���a��@[`*��)@\+q�< @\����8�        ? �g�Sk6?a�����?�t���?������?��p�Vu?�4��к?�d ՠr?�*��?�D%�m��?��;}M?�{���t�?�;�5�5�?�6�Q�B?�9�HFQ?�~Fg��?��*�΋`?��O�n?ꉯ�ż?��!�$?�S�l�?�`'�T�?�
P��?��2T��'?�������?��)�e@h@ ī�PH@�c���@A� ܒ�@���5i@
�	hab'@V���O�@��¦@/��S��@��`,	�@0ʨ�3�@��O�@_\��ce@ ��	�8�@"�C���L@%,���g�@'�x
�(�@*B-���@-.^���t@01.����@1�Kd��@3�s�f�@5�H�Yx�@83��oA�@:����B�@=Q���@@u�*�@A��~D�@CO'}�p�@E����@G-F{d@I��;@K?"����@M�eJ�&i@P�EO��@QW���@R���	�@T6��!'�@Uƀ�!�        ?1]"��8�?jd"�8>�?�{���ˎ?�F����?�7F�۱?�i�>�V�?�.-�4G	?բ��2]�?�M� ↺?���;�>?�{���?�3�6ܗ?����P�?�E%vN�?�dg�?��^%@ ȐZG�@6���8@�ۤʻ9@��ch�@�����@)��þ�@c�9M�@V��p@�@p!�-��@�[ѓ��@�h9z.@�}?T�T@�+[@rD@!A<@"�(���@$���!�l@&a�A�@(R�޹�@*c���SW@,���إ�@.�@aH#�@0����@2�z���@3u8���@4����'_@6�-��W�@8@0ͷ��@:�z,�@;�LN]��@=�i�fj$@@���@A5��.ߜ@Bkz#ky@C�yr� >@E��k.�@F~�|�oO@H�r��.@I���D;@KT�����@M!^��:@O�9z�=@P��x2@Q�av���@R����Z�@SܨfȞ�@U"GQ��@Vc_V���        ?�J��>�@7�6C�@:o�ִ@Q`�XC@axij"��@m�#*�|@v��j�{]@������@�q���g�@��~�N!�@�BJ�O�@��W"
�@�-g5�@����a0�@�7�{&�J@�Ȟ"�Gw@��A�V��@�j��tt�@�|�~��@����:�@��P���@�X�*�@�6)����@�)�R��h@�3?�C�@�R=��_@����f_a@��2���@�&��[@�P,R3d7@Ò�G�J�@�ޫ�͓@�3d�UU@ǐ�sK��@��M�{�@�ciR2d�@��l���@�T�> �6@�ؙ�%�@�1�2q�@����n`i@�����@Җ�Ŏ�5@�j �W'�@�@���l@��u�e@��x��@�ٛU{�@׾:�Ϡ@ئNա"�@ّ�t��h@ڀ�@ta�@�r�IMA@�hB9�t@�`��*�@�\@<�9,@�[ S#�@�.��;@�+K��@�5�p���@��D���@�C���R,@��j��        ?E�\���?����/2?���e��?�|!����?ո� R0?�3�@C
?�)/ t�<?��c9��V?��A��a@�ɚ�˨@��G��@�e `�U@��E��@a�9�@�3�X�@!u~@!>$s���@#�̔%��@&-C�@(�S���7@+��w�C|@.��
@0�b����@2����@4X��ݻ(@6)1^rE�@8��FE@:|��@<��#@>6ސ|�@@6�FƏ`@A]�K�-@B�w�)�@C̣�Խ@E7��?@FiC�z��@G��O���@I3ĂG@J�:�0K)@L,*��@M��(�~%@ORR}-�@P{/$b��@QR�q�>[@R/��>�A@S�1A@S��u-�@T���	@U�(��L�@V���R@W�<D2@X�v�Vq@Y��)�:@Z�ŕ`d@\�1kO @]#@[N�D@^E�?,��@_n�pr�@`NK0:�@`臵!�J@a���%@b%��qT�@b�{�)<        ??|��K�B?��&�Ѿ?�*���?�!��v��?�F�U#T#?��'_�?�d�m�?��ú��@o^�4p�@���[6@HD�q@���d�@&$�%J@���]�@��]�ܙ@ tQb[�@"�g{\F�@%+���|5@'ŷԶ�X@*���72@-x(ޱx�@0H�&��@1��\�H@3��l7n�@5t����@7\��g�@9]��+�@;v�.��@=�c�#$@?�q#0�&@A2t$��@Bwӌ�]@C��57�@E/^X$�@F��[*$*@H,Gp�g�@I�^L~�@Kt�!�@M6��:K@O�.��@P~��̈Q@Q���ڕ@R���"c@S�*����@T�16�6�@Vּ��3@W\药G�@X�C�ǅ�@Z ��ѫ�@[��=��h@]-H��~@^��@`Dڐ|)�@a,���A@b��~��@c���@d'Z:�\@e>s�k�@fb���XZ@g�Q�T�@h���C1q@j"�ս�@k���        ?B����?��
*:3?�{����?Ņ��>�?�i���+$?蛯��e?��|��@ ?~�� @��&@@tP��@
�T:;[@�|~�@"44��,�@&�i-��5@+������@0�-�7�@3��w��@7g�z�y@;L�L�@?�|Bn��@B#�!N��@D��\/�@G}����@J���.@MσВ�@P��N�@R��
�7�@T�YY9�@V����(@YL蘐�@[�73�Q@^�9����@`�p!~��@bN졍R�@c�̄�,-@e�6�ϭ�@g�J��ߴ@il'MC@kn��< �@m��K�Z@o�����-@q��ϱ�@r58��@sr����@t���*@v*�@wo�dX�@xڈ�s�L@zPda�@{����@}Z��|�+@~��7�@�F�K�?�@�Z��i@��7�wT@��H�[��@��@��)@��!�@����B�<@�{ҙA0@�r�(���@�n���U@�p���@        ?���W��@&�"�@O�3g���@he�y@z���@�CQ��~�@�B��a=@�O�d@�*۲�7�@��=�� @������U@��4��0@��s,���@�#(�7�@�{����T@�9�mL_@��ғ���@�љ�O��@��KܰG�@�=�;���@�YR�gH@�(0��ď@�#��!]@��^��A@���R��@�+72A(�@�]��Eo�@ߤg:��%@�����o�@�7R3��@�y,�!�@��2�.�Z@�P9��k@�{f(�Wk@��J�? @�X�m���@���Ai�@�[�7���@��]%p'@�A�?�z
@���`��@��Z�>�@��#�c�@��$T@􀿪l��@�f���y-@�P�$���@�>�!,.�@�0����@�&�����@� ���XS@�x{>�X@� N�9@�&-6�i@�0?ǟ@�>qCt�A (�(�$A �&��6�A@D9�6A�l"��A`���sjA��C^>�A� �>�j        ?#���p6?bM��>9?��ݦ�h?��?q{�?�5���u�?�O\<�1�?ːt_�9?�*p��6?��ʚ���?�K��ۃ1?�M>�ft�?��}�2H�?�z�x�l?��G%I�R?��Ų&�?��]�7S@ �iy�(^@��8�@k�w���@6��d�@
���ŷ�@�=���@����@@^��eQ@/�����@?ȅ��@!�i�O@A���8�@}	��h@ӰZ���@ �Ԋ�x�@!�b�.@#>�r@$���%7@&XJ
@'��[U�z@)N3ă�@*�NB��@,d��-@.�A��@/�����@0މ�«�@1фD�H@2��7�@3�袍	h@4�ϼ@5����@7,#�};@8#�x+�@9Mb�@:�Hg��@;��ȋ�@<�mB�)@>K1��M�@?�I�@@�)��4@A48�,�$@A�����@B�pώ/J@Cl��@D35��@D��z��l@Eι��Q>        ?6���Kȅ?p�݃?��?����Ү?�M���?��õ��?ͭ���K?�"�3�?��QAD��?�5�9��?�L��?�Ƶ��1n?���)�Q�?�����Y?�\=�f@��*B� @f��*��@b��.�@
�X$(z�@<�J���@I�`�@<�uS@����X>@0N^$��@
@��@ "3&@ ����	�@"�J�#,@$�J�3m�@&��.p�g@)3CeH�d@+����ʧ@.���Y@0�����@2uq����@4;�"H�@6%���{@86Lt
@:ol��d@<�����@?c��@Aq:1�@B�#%\S@D O$�G1@E�FY �@G�c�)@I�e���@K���$��@M��tyv@P�U�d�@QB�5�.�@R���u	@S��{�?@UdM��#�@V�{$Kx�@X�&��S�@ZA�4��@\ٻ�e@]�]�P��@_�[�խ@a �\݊�@b�M�e@c=�X%؝@dq�\N�        ?HʈLmw�?~)��?���G?�������?�J4)���?ٺi�HZS?��Wi�?�|-L��?��:Nީ?���
�i@�v�/k�@�o���@
�&�T��@�}���@�r,߶�@�O�Ţ@bk{6T�@[�6�@ ���p��@"�q�U��@%����.@'���@*b�?Q@-] "sd@0I�����@2V(g;@3���D�@5�����(@8o{K�|@:TYg��@<����}�@?j�s�P@A@t�8@B��9o��@D2a��l@E����:X@G��A�&�@I������@K�?E�{@M�z����@O��G�z@Q/�&��@Rqr^�(	@Sďq��@U)��ub@V�WcG@X.���@Y�ӎ;@[�S��@]R����@_7�Of[�@`�>�v��@a���!@b��4I@c���8�@e"ſt�!@fj�0��@g��U��@i,�ʲ�@j�\��@l8�jd�$@m�-ۧ<T@o�s*��        ?�#�<5�	@�X��(@5�F;�:T@OU��XH�@`�g��A@m�(x*�8@w��N{�o@�1>��~@��j2{��@���MR$@�m�Xm�]@����Js�@��U��)E@�j2��@����U@�*j5��\@��c��]@�(���h@��Vòr@��q���@�BC!�t@�����F@�	�c�-�@��i�@�^��*@�JLu�@¡�����@�6�HU�@�޼b*�@ǙK�D�@�fè�fb@�GA���A@�:�����@�A���
@Ю/@��B@��EG,�@��H>�v@�Gea�0@�FI��@օM����@��MX\�@�!>��њ@�~��K0@������@�UM=�x�@�ϟA�]`@�)����@�����#@��d�@⍩�e^c@�c0���@�>HC7g�@���#�@������@���7@��,^c��@���j�)0@��Y�zcA@��+��G|@��\��@��ڽo^@�͞��9@�ڨ��        ?BY���q?�QW�'�?��&dG�7?�I_-;?�x��3?��n�sA5?�#WŖ�?�DE$��)?��>��X@ 	yG�ln@/�Ls�+@�,2i�A@�"u�\@��S��@���?<@���|�@��$~��@k�Zv��@!��|��@"��T^@$��[]@&�X[D�@(��1s�@+%
Ah��@-\�����@/��8T��@1o��y�@2:ۊ<��@3�W�9�F@4��4��@64D^�,�@7�2o�+@9'e{��@:�#I�Ɲ@<bF��@>c+�o@?�[�Ӆ�@@�x��-@A�Ny�E@B����R@D
|$͐y@E/���^c@Fb�Ш@G�s�wu@H��Q���@JT J$��@K�s|���@M@4%�@N�2�MY @P4����@Q
Aܭ1�@Q稕��@R�Mk9�@S����@T�I32"@U�r.T�@V���&�n@W�{R�@X��^�6�@Z.
Μ�@[8È3�@\l�'vX@]�Ng��        ?��e��\?`ȿ�R�?��G' �?���}���?�r�B��3?�����?�u�J��?��8$�?�~�&O�f?���#_�?� ;�?��\v�?�n$�;?�����T?�r��*?�M�2��7?�"�4?��o�� �?��Ʈ$:�?����?�����_?��b���]@#К�
@��}�o�@�.ˠ\M@
Ɂ���@P�X��@��&�b@;��ɐ0@�}Nq��@�@�/W�n@�^���b@ ���\@"_oH�g�@$KT�%�@&^���@(�q�U�@+�G���@-��蒫@04�F���@1�I�s)@3O0S���@5��mD@6ۉ�Ȁ|@8�* /�@:�SD���@=e����@?l�\q�w@@����K@BB*�g@C�4��/#@E0��@F���|�@HD�u���@I�
'�-�@K�{%�p@M�cE{�@O����@P⩠��@Q�NQ
�@S#��e�@TX�n�Z        ?;���;?V�9d�?{�2<��?����K?��
w�6?��SP���?�*�9G"�?��I��M?җ�ӆ	N?ٕ�<�Ū?�?��@�?�J�$4F?�Y!9�?��G�:>?�I��e�?�Pn>w۸@ ����X%@�D���U@�[���D@�Oš~�@7E�@��s](4@�V*X�@ο^:"�@;`'�� @�+ʼ�-@!��1�}@$%�8#@&w�2~�@(��<"^@+�P����@.ip�s�@0��ųzb@2J��x�c@3�����i@5®em�@7��I���@9�9�Y�n@;�
���@>�d	iT@@3�iK@Au�JG�@B�����@D6ЇIN@E�����p@GPĵ�@II����@J�����@L�ف�Hf@N�M�-O@Po�_:V�@Q�^�8��@Rƍ^9�Y@T�Fq@Uft��3@V�&��)@XV�bb�@Y���~@[��v%�@]f`u$�w@_G7����@`�*��@a�j��6B        ?�`�Z�p@"zϠ��@GN��@�@`r�|��@p�8��@}�BP�h@��z�iD@���z�@��ߊ��x@�m= ^@�b
����@��h��@����ʴ@�sJ�@��"�Z��@����lY@�@�u��@��ʤ���@��3^{@��ep(R@�2����@�m ��Q�@�ƆP@�$��z@ćN����@��ь�Z-@�_Ҽ���@��M|7~�@�^<����@��{q���@͑����n@�C�%�h@Ѓ����0@�oM*��6@�e,�o�1@�e�bwU@�rZ��@Ջh�@ֱ���@�����{�@�'6�rF<@�xĬ��@����S�@�K�=�@�ζ�%�a@�1��s��@��d�@�Ꭸ��@����0 t@�̍��@��,@�\�@�����@����޹@��[���@���R@�3w��X�@�kS��1`@����w@���9�5�@�#"t�Bs@���j?}@��B�        ?U�OKe"�?�^�Y�K?��\���?�w#+M��?��Є�?������?�I��5?���8ɶ?��	�	f@wXl��*@�j�E7l@�-��ez@���@m�5�#@5E'Mέ@�tZO@7��"@<Ǔi�@!9�@"U@"�ȹ�G�@$�F�#S�@&P�ZWF�@(?�'@)����@+Ȍ^�P@-�o��aY@/�-�\�L@0�1|x��@1����J@2͊^;:�@3�� �@4��t���@5����@7�N�o�@8��}֡@98T�z:@:Z	�Q�@;��Q�@<��m���@=�W=��@?�V�ۗ@@+���"�@@Κfp!)@At�oY�&@B'L:D	@B�G�ޔ�@C|'uȏ@D0��"��@D�p��G@E����@Fg� �T�@G,��	�@G���x@H�$��l@I�� �U@Jo�x�U�@KK�	��R@L,��M#@M��nw�@M�D���:@N춢4'@O�3:�q@Pms�A��        ?�"���?`�%�D@?��Y�G6?��� �?���j��?��.*��?�J�-��?�2X�V�?є*���?��X�i�+?��+V?�抨(�>?��Hx�<$?�A&�1��?�K��f�?��LW?��H�IE?�z濑|b?��'�'N@B�3�@�lV�@�9i@
���� @�?F9�@oV �:O@�3�9��@�J�_�@{���T�@�]f�?�@ '��z�&@" 8b�@$LRpdz@&�c�hR@)S+�f>@,7�@/`;���@1h�W(@3Ey�w�@5GL�?m+@7n0o���@9�R���@<+� ���@>�|t,i�@@��`�9H@B3T7^�~@C��|��7@EUY��Ͼ@G*��@H�d	Ŭ�@J�%�Ǉ�@L��<��@N�L�/@Pq1��f}@Q�/f
�z@R�\��n�@T�R @Uck!��@V����@XC"��@Y��á��@[q�:�@](�8#@^���:�Q        ?D��W�X?~�X��i?����	�N?�b���w?Ʃ���4?�Sʌ	f�?ݎ���l?���G-8?�fz[���?�p:e6�?�s�R�?�#���d@Ӥyr��@�"He�@	�c�8@����O�@j�ӆ@9�t��y@�oK_@���c�|@ �ޤ�$@#y���q@%�%9��	@(� r��@,;�3d�@/�ݯ��#@1��@4�c��|@6j��Dl@8�̣#��@;�g���@>z�$8@@��}�2�@BhP09d�@D%��2X@E�z)���@G��*�9@JCG�\@LE�	�WU@N�� X��@P�����+@Q�����@SG�ڪ,B@T��hc�@VQy���~@W���֖�@Y��~�@[���=A�@]s�14�W@_z����m@`Νe��@a�S;��@cJ6ey@d\U��I@e�Pi(@gL��O@h��P�P-@j
���@k��)�@mX�ҩ�@o ��H@pը-$@q{2}D��        ?����E@ �C�(X@C3t/�^@X����@ho]�D�@tl�B@}��P�y@�Z��վV@����w|�@��rhz�k@�M"T��@�5�k�f@@�Z�E݌Q@�\P:�N�@��6Sc �@�����@�|�r&��@�n���@���sH��@�U�����@���.�@�s��"@��Z
D�@�[
�1��@������g@�\�U��q@��oӪO�@�ug���@�	�5�r�@��bV�R�@�!6�a�@��p�I�@��b��.P@ P��@�z���@�XV�q�y@�9'�cx�@�[=:�e@�$ͫn�@��y}Na@��Y�-��@��<}�́@�̣Q��r@���F��R@�� �N�B@��t�|ҩ@��a����@����R��@Ѕ����@���e��@ѧ<��@�<��I�@��.��Լ@�q4�;�c@������@Գ��@�Z���@�>-��9@ֳ�Jsf�@�fVD:�j@����@��"5VE @ٗ����        ?8F2C�=�?w�K�:(?����z�?�K����?�-�z�?�=�g�h3?آY����?�[A[ʼ�?�8��ub ?�����x�?�y��f?��o*\4Y?�m0��H@ 6��i@�i��@�*[Ѽ,@	�u�.@|S�QZ@�^'p�@bؿ@gWf@I���3�@�-@@�%!��@�̇���@ (�qe�@!��VR��@#�TawV@$�֟@��@&1%h�@'�XC�C�@)�ÿ S�@+`�l�@-;�7Φ�@/(N�
\=@0�<O�b@1����R�@2���3��@3�L�uk@4�r;#@6B�}V@7Nq&x��@8�b�uF�@9�q�h��@;62��ư@<�-*�:@>�w�oR@?�O�>>�@@�qlS>M@AWݕ�X{@B+���@C�ҹ�@C�%Z�-J@D�4P��@E�[�Q��@F���J�S@G�/:�dS@H�쪤��@I��2}�?@J���+@K�Ry��@M͌e�u@N9�J�=�        ?<�\�P?K�G�{`�?s8/��M/?����4;?�Zxzly?��K��?��g�M�x?��yEQ[?�e�BUн?�4���&?����q�?�)\��	 ?����?��(7�?�s�MX?�܈�Y�?�kl#�`�?�9�~�[�?�c-���V?���s�^?��?�7'@8�H�<@�B��<A@��)��@	ī� r�@V|����@����G�@��!'
@cv)��@'�5�m@9���>@�,����@!0�d ��@#BeZ�pV@%��u�� @(K��
@*�a��!@-�	���K@0~	|aQ�@2A�f�@4+�����@6=��q@8z�2���@:�����@=~���@@%��@A�T��@CAJ���@D�dG�-�@F���*@H�����@J�!���@M��2Y@O����5r@Qrk-<@R\�;x��@S�u�I�@UM�>'��@V�.=?�@X�#�i�@Zk
���@\T2.� �@^Y�c�s4        ?n#��]�?Ay�P�Q?e���ڗ?�'�`4J?�Ɏ,�g?�x�ι�c?�]�M��-?�'E��?���?��[���?�?��6�?�S��U?����='�?�f�K��?�G'�/?�+W��?��Ɨ�?����{r�?���mzb�@ =�����@���T�@e)�_�,@�7	���@XBc�r�@��n�@9^0��g@���@���w:�@ �6YaG@#4j�A��@%�����Y@(�.��C�@+����L$@/�6l�@1Yo���Z@3Yǟƅ�@5�����@7��0�@:~v;!�@=O��� �@@0w���@@Aێh�0,@C��\�g�@E���?�@G��G�4@J��+��@L�,+J\$@OG�ù�X@Q��w$�@R��^jK�@TU �
5�@V ����@X��0�,@Z׽Ut�@\C!�N3@^�1��@`��.F��@aʥ�ȵ@c&Iw�]\@d���l%@fS�r?@g�[���@iM�@IY        ?�Lﶁ��@B8a�?@)�q���v@A�e���@R$�W�ۨ@_�@Ч@g�C�X@pީ0�ߜ@v����E�@}z_��=@�����;;@���u�>h@��f&�e@�e38@�@�@�Uz@�[m��f`@����}&l@�Y6��p@���a|8@��\�^e@���O�U@�E���$@��p=�@�j�d�T@�4�K�@��`�.@��o{~�@�=�r�!�@��H7���@�������@��H*�B�@�}h��)@�}�eN�@��'���U@�۾�In@��F�aa@�b���@�L��)?@ń����t@����H�@���4�@�b͠�@ʿt�#�@�& ��a�@͗_�ӄ@���3�@�M�!��@�	J6_�@��k�´D@ҿO��3K@Ӝ���i�@ԁ~�D@�m}��@�_�U�Z�@�Y�U���@�[E���@�c�� Ǻ@�s���7�@ۊ`��@ܨ.e �~@���m���@���>���@���?ٖ        ?ic�'�;?�Y���?��2ƍ��?ޢK�k5�?��\��Kv?�T7�[�=@�,I@~Z�޹�@-��۹8@�H�M��@>o��+0@#/�4�Z]@'�s("�@+g��G�@0|%�@2�A,���@57����n@8Jtt�@;!�c�@>]� ��@@�����@B�3����@D�i[�(�@F���d6@H�����C@J�Y!�\@M9! ���@O��t��E@Q�6�� @R_��\�@S����@U!^��&@V��3�F�@X�J��@Y�Zb���@[A�I�F@\�$~
b9@^�w�u�Y@`2E���@a]}��@b	IA;@b��ۜ�F@c����C@d�u����@f�a,��@g����>@h-h�㌈@iKf�`��@jqd|Ju@k�����-@l��!��@n�-��@o\@cc�@pW�I+�@q�k�O@q�1�`�@rp�f�F @s.6�F��@s�%s�؈@t�I_	<�@u����R@vX�9��l@w/��W�        ?X�VC�W�?�A�%��?�����?�����?���D�:?�o�K�?� ��-@��ǔ�@�PZ?@8�jVV=@Mc�@�}f��Z@�CJ4��@����@!�ʈ[��@$.ߦ�n�@&���j�@)�bFo@,�TD�n@0,�.~�@2��rl@4!p�*��@6_Ӹ��e@8͆O��c@;j�W�!�@>7�O�l�@@�DK�F@B,�d��@CԹ*�A}@E��<J�1@G`:]��@ICu��0�@K;j�b;@MI��&).@OpW@Q�@P�ɰ;�@R�Bt!@SE�,[�@T��4K��@U��}��@WY���@X���Tb�@ZS+�7�@[��S���@]n"$:�@_ ��E.�@`I��0��@a7� ��@a�Zʆ�z@b��t%�@c\O�鱧@d8�ȏ�@d�4�"��@e�V����@fL�۲�}@g
�6}�@g�(����@h�V�@ia<�{g�@j8N���[@k��=T`@l7���	@m���tS        ?�l�ҽ�?�ZsL��?���7�?�g�͌�@k�XK�Q@���^K@$��u�vm@-m��ME?@3�
z �m@9�h���@@���W�@C�K��ha@Gh�$�V�@K���K��@O�u�eI@RE�����@T�7�7�?@WF����t@Y�I��q@\�sh/�@_�A�R}�@aMk��<@b�D�\-�@doo0X�\@f�ˊ��@g�+��@i}�c>�p@kE�R7�@m�Wq(�@n��*.@pq���>�@qm�1��x@rp)��b�@sx�aR̼@t����m@u����@v�����@w����i�@y��$�6@z2�����@{h7q��1@|�bqR@}�-�@[u@0�Ӗ�@�@��G@��>%�pB@���]@w@�N���؊@�tv3�@��eC�kp@�� ���@�H��,�@�3���+@��3�T@��3v获@��`�rz~@�|�Pʭ|@�ff��eU@�U�W��@�KM���@�F�.�@�E�n��@�J����        @�` 
�@Y!���@}�0�f�@��Y�+l�@�p~NT@�����@�B�g��@�N x��@�WVY�@� Ї+�<@��hw��@���iU@�IA��y@�m���q@��y;c��@�T���@���a��i@�ʔ2�@�q���@�+�ř�@�!���@�6��>@���<^�W@�s�uPD@�%��ے@��Q#G�r@����e�@��P�>�9@�h��jA �3\08�A�%>%�A�JD#��A��n[�Aɑ~!A��6�K�A�c_�5>A")��0A	K��EL�A
{l�P�sA�}�?JA��w��A*���=ApY�'�A]�U6cnAh�8ßA�VȨ'SAa؍���AD�pEA��zk��A�k�6�AK�Q�fAR� A��W̑"A�nx�vA�m�6�ArZ�Ò�A\�R]�ANؿ��AG�r*J�AGu6d��AM5��^AX�܈�A 4�����        ?K]IzMi?��'�3W?�c�߁�P?�J�b�I?�s�39?�;�v(�U?�s�NZ�?��%-�?�AR_Y��?�����?��J��|�?����э?������@C�H��@�'��T@�p�\��@
����d@�!��@]��/h@B=s�V�@ S%tb�@�"��@-�7�&[@[�+�;@�!5�*4@.H���@ �#�TH*@"�"�wI@#e�Ą!@$̄��`.@&A���|:@'�T���Z@)W���@*�̚�l�@,��q���@.mzWÞ�@0��$b�@1� �A�@2	Z]�c@3	�t&��@4���@5�B�x@64C5�
@7Oy��$�@8qdk���@9��N'�C@:�q��/@;�����%@=9$W��P@>{�@?�G�Z�@@��:��&@A2��j�@A�fԈ�`@B��i���@C@)_4k@C���@D�q�T3@EaS�B�M@Fd�,t�@F�����@G���|,b@HXD�Cv{        ?�$W��?B���)�?e�D��_0?|۪���?�s��{:?��Ɖ��@?��B�gO�?�>�$e�?������?����m��?��I�t�~?����WH�?�1q=�n?ǰ�!��?�/+y��Z?�����k�?��<��f?��@��?��6�u�=?�E^���w?��>���?����?�8���8/?�A,��?����B{�?��,田�@��{�0@��1ߺi@
K{tNF@%��Y4@�oJo~�@K�qu5n@-U�1_�@����	 @!�D���@$�����`@(!z ӡ@+��𺬐@0V�Z1@2��1�v@5>,��@8M�CY@;��V���@?���f߸@A�;{��
@DG�Hlk1@F���4�@I��*�@M����@PD�wE��@R3�Ԫ�s@TR�џ�@V��oC�@Y,��"+g@[��8�@^�ꞈM�@a�A��@b�{
�X�@dÌjng@f�Y41<X@i	�r �@kl]*���@m��Ņ��        ?&��?brxXwQ?�afk��.?�p�ǎ�?����zT?����Ih?��t���?�b��ep�?�^� �^-?�ߣ�F�2?��W�mɮ?�ND�(�?� �6���?������?�\��E`?���ܩ��?����?�@�̻2�?�3<4?𴶬��?�,�*n�?��@�T�?� ��؁�?��o����@ P]P�@��4Y��@�&�W=@��~�@
��t��@Դ�� @�vk�� @�M�T@��#��@����q@�3��@0���B�@{Ҝ"�@!QA[,�@"˭�L<@$���w��@&���?�@(���0�@*��N��@-E�+�w>@/�1���@1I
�Mˈ@2�u{�/]@4O]3���@5�p	���@7�{�Dʡ@9�[`���@;����e@=��D�;@@��CN
@AO�&�@B�z��:N@D �I�ݰ@Ez�@���@GdXJm�@H����m�@Jw2�̢�@LT�Nʨ@NN8�7��        ?�0 ��`�@-�݌w@;�$T�"�@Q$ �2-6@_�B��7�@i�X�[@q��

@w�ffs�@~F�|�@��8�@�W�B3�@�Kh��s[@�{0O��M@�tvk�bi@���\���@�E�䥦�@���~@��-c�@�����^�@��I��@��c<��,@�K���}�@�%n�0�*@�`���@���|s�@�=�dFv�@�t��ˎ@�a�9���@��Z:*`@��;��@�(v��CB@��+�5@���bYzb@�{�(�C�@�QPxbI@����8^�@�~�1I�Y@�U,��_W@���Z�4@��$\�s@«� �@��b^)>�@��d��kG@���
�>@�5®i/x@�n����@ɰ(�j0]@������@�L;�@ͦ�׺�x@��ʹZ?@�9��R,@��v�-�@ѯ.�([�@�o��M�T@�3��N�@���D�N3@��t�q�@՗D|5]�@�kV���@�Cꈥ��@�!>:��@���L��        ?p��Q˞�?���qO?ťou\WZ?ې���?��^��־?�&2��[@ xJW�"�@��=uh�@F��@6!�@�s���@Z�15ˉ@ �*Y�@#���b}@&�Y.)��@)�Z���@,�C�C�G@0(�C�|@1�T��]@3�1��w@5��l"6f@7�"��@9���2o@;�A���@=�6�Bu�@@Rs�@A+0"S#5@BP��KE@C}�[�@D���r2�@E���|@G/;�e�T@H|}X�n�@I��ܖ5@K:��}(~@L��g��@N2�cPf@O�0�\�@P��s��@Q�v��;�@Re��]�K@SG��&{@T.�ds�'@U��2d@V	�i���@V�A���@W����@X�?5�m@Y쫯�pM@Z�z�X�@[���@\��wOe@]�8��@_>kQ�@`��t@`���E�@a���@a��I/�<@b#p��e@b�yt��P@c3�,d�@c��m�L?@dF \_R        ?���oT�?G
6�ٶ�?jܗ%�?��[��z?�v}-Hgd?�'+s�?�"!�XZ?���A��?�����?��B�mp?�o݁�B"?��@�?�J�a���?�nO��/�?�B

C6�?���k���?�/~�k V?�S�#Ӈ?�8c��Z?������?� �� �?�'`���?��a�/?��,��?���R?�?� %@���'/@����@�C�z@H��<'@E7|6�@��O��@K����@����g@���xw�@;m)�@ g�|�Va@"]��\@$��(��@&�|=?�@)fd�k�$@,.+�@/4yo���@1>�D�&�@3�����@4��[)Ĩ@7���@9F��0��@;�y�psU@>G�7s�J@@��
���@B�Ż9�@C�G�Bk@EO����@G!#��@I$�[h�@K!dZ��F@MSG!�j@O�4����@Q�Y^�@R`z��f�@S���)$�@U;�5F�        ?K�.�S?�o�fQ�?��Ǘl�i?��#I��?�~�hn�?ҿ�����?��%�d]?���DR?��1͎LU?���g�F?�D�Oky?���i1?�����@h<x�@@0{=���@.*��t�@
c.fʤo@�z6�@� A�&@�͡��@�K���@��L@tR9��@�3	d@¨���W@ �#��c�@"hsת��@$�s!�@%�L�'@'�z��@)�tpb��@+�U/xڌ@.FX�v��@0^卵~�@1��Z0�x@3����@4�_�/�@6+��*�Y@7�$Sv�@9���x@;�.sF�@=�rp��L@?��(E��@@����i�@B*�z��
@Cm�<f�@D��	��@F(ݹ
CQ@G�����@I3�c�@J�QU�1l@L���k�@N`�W���@P#���5�@Q!���<@R+��[m]@SA<0)�@Ta���@U�~s���@V���,��@X
��|�@YZ�~��$@Z��=cST        ?�˗/��@-^�J�[�@N$ŵ|@c%��p��@r�]u���@~q=�)ۉ@�|1h�5�@��vs�۶@�>��+��@��?Q���@�V�ڿ�@��9и�{@�(g���@��+7[��@��W\�@������@���:�@�����<�@�;C�4�~@���ڔ�4@��9�h4^@�w&T�Ƀ@���h���@�Գ�]Z'@�/���@Ēi��p�@��Ԋ�e@�ta9!��@��KN���@�{�1�@��)�@ͭ���x�@�X�}��@Љ^.M@�n�,���@�]�Fr"@�V
+0ܒ@�X����@�c?D��@�v��y�@ג%H�-@ش�@�W�@��u�,�@��<{��@�ER|P@݁��A�b@��tE�@�8�D
@���9BJ@�V[OB�@��X��&@⯗�t'@�_Ԥ~`N@�J2w��@���š\�@�}��x�@�6|eSΟ@��V�`�@�+ل�I@�l�UZ\M@�-��e@��5�WE@괢��=i        ?3�e�I��?pG��Z� ?���v�?��]�nz?����lJ�?Ɣ� D�V?���PQ�?��t�p^?����=�?�eZ��7?�G���?��m��f?�,!�O>)?�B |$c�?����w0?�����v?����06&@�/���@����q�@,ʼ� �@�E�V�@
�Ԝ���@�_3��@*�xa@�6Y'F�@!ѭ��t@�w�p�@i��R��@- B{�@dC��@�V@iO@��T�'@ E�`�@!,�-��@"W��L�@#�$I
�@$�s�(@&0��*��@'���Ș�@)��;Ch@*�ty@,'P�Z��@-ʬ�P�@/}5����@0����p�@1�,��m@2x|Y�X@3pNͥ�;@4ofj�E@5u|AsU�@6�G��@7����@8��x;E@@9�uuv�@:�뉖�@<Vp>'�@=P� ��:@>�N��q�@?����*@@�����@A*qis5�@A�ug.�@B7�I�        >�0\�S#?>�����?c��"+$?|�M�=A"?��Ʉ=P�?�Ags��|?���,�U?��(N��?���g�.?�YJ�L?�;�|�W?�l{�@\?��2�*�?�%!�J�?ס��g�?���>y�?ᢹwu��?�[L7���?�)܀�A?���ND�K?�]�qp�}?�Ƅ�.�l?���X]�w?�"��w@�����@n?�p@�"S�/�@*aC���@���#4@���e:i@&զ��x@ΏKa��@�K3�}@���@ 5�t���@"}��Fv@$2����2@&u�ɼ�@(����	@+������@.px���[@0ĤH9�W@2o���y@4:�B/s@6(HO��P@89d<D@:p��3�@<�*|� �@?Un05��@Aԏ�~�@BsQW�E�@C�v��@E�'GC
@GQGN�@I#Cճ�@K�Z��@M��$p�@O@���K@P��"��@Q�R7���@S8:���@T�^ (=@U�ȇo        ?�oX�?EX6h�?g|%�ss?����~?��L&oV?�&��YG?���zr?��ڱ>;?�%����?����fR�?�+��,��?��.��"?�kj~�U?���*$�?��"j`�?��pa��?ߝ��b�?�-�����?�"�s��?��@1�	�?��Wy�9?�Ƣ|�?�.�'��,?�;��Xv�?��K�G��@�S�gq�@���@��"�G@��e�8'@n�ܨ�@�P/LG@y� ʘ�@r��(�`@��&��@n����@!�e�Ca@$ *)j@&z�rC\�@)4v�xJ�@,1�%�K@/w �Ƌ@1�q-�$�@3u�@5�<߽�@7۟�B�@:TfmȤ\@<��e��@?݆���t@AyN�}e@C Eu��@D�����@F�'6S�@H�m��R @J��=~'r@M6�"(��@O�ߞ��@Q;NY�{@RsQ�s�@S���)@Ud�ӎ�@V�i��^@X����i@Zq*%U�        ?�`���X?� ���@��z�@4/�_���@D8���u@P�5Og~�@Y\��?�@a�����@g*����,@mV���+s@r
��ro�@u�����@y��]B��@}���pn�@�$���95@��+�;a�@��ˁ\�@��}��P@�^�*�@�u�b|��@�ʩu�@�o���4�@�*��ߍ@��o�%�@�����@��Ȯ=�(@�,�w�@�=1(e,@�G��Gd@������@���.���@�-�,c"@��d��lT@� ���@��[{�Q�@�0��3�@��~�;�@�����ʹ@��b�@%@��t��@��9d�1�@��ih�3@��_��@�+����c@�^�?�1�@���v�@g@��8�\�@@�:}��-L@��*��@�����1@�s5�&3�@��o�ni@���� �@�}2KC�*@�Fpe��@�����d@��0&��@ĺ�,���@ŕ/��I:@�t�i�P@�W�@��@�@���
�@�.{�        ?^T"�~-F?���&�`?�W��	�%?��|W�?�'�LM�?���j͠?�a랷U@7Q �x�@qB�Q�@�����r@bI(Գ@YTô�<@�l����@B_UC��@"��0��@$����J�@'fϟLQ�@*>����@-2�Ack�@0 ��۾�@1���]�.@3U�4�N@5��@6����Z�@8�_�go�@:i��1@<[�z��@>`��]�@@=����u@AUpռ��@Bx5JI�F@C���aIm@D�鍹��@F"���@Gr(,TI@H�P<��@J1@�t�@K��(Y�@Mm�?B�@N�rL�@P�:|y@P��3|�t@Q���1�@R� l-�@S]���&@T:�Ƶ�@U�f�A@Vg� ��@V�c��*�@W��ze@X�1�o$@Y�eR��B@Z��� �L@[ŀ}<R[@\�����@]�<L��@^�ھ��@`/G�@`�F�&�o@a,>t���@a�)����@bb&YO�@c<Q�h        >�u�ĸ�?Gm3��??r�6��wu?��[���?��խ���?�\�f��?��b���?ƈ��ԅ?ϛ�s�d�?��9��?�/�F��?����j?��Q�~e?�l&���?�m���<?�
7�v%g?�:��OG?��j�/�?�㿙��@ �ɤ�4T@O�4�@3���1�@	q���U@�u)!y@�Ybr�;@�g�HB�@N�\��@�*?�-@"�!1�@�.cۑ@!Rd��@#+��	y�@%m���@'�aIh@*�����@-�qP.M�@0ip�&"�@2.���G�@4]n�O@65��4��@8}y��.@:�ܳ�S@=�	��_a@@E�O��	@A֙�ƅb@C�%Fg@EX��ˌ@GM�+d}�@Ig�n-�y@K�$�u@N9��� @PRL 5%D@Q��ȯ��@S(�8�@T���8��@V]�"��o@X&��K@Y��	�	�@[�� �@^ �����@`�/A@a>eQ��-@bt7_        ?y'�SV�?�pQ�.�(?�Qچ]�`?�A�b�G@7S��DJ@	�R��@�{
�@"<]*-@(�y��3�@0�����@4=�^S�@8�"%��@>lFjy^@A���燯@D���N�z@H9�/&d@K����5@O� �UZ�@Q��V"@T�8l
'@Vmo�]��@X�Y�+ @[��%�^@^��
�n@`ų��@bc}YL�d@d�Q2@�@e�/�2 @g�g ��@i��[���@k�,2�r@n4���&@pG-p-��@q�\?�.@r�G�6@t)N��c)@u�zU��	@w!�Vm=@x��<y9�@z:C��@{��ҲYT@}�)&�@z���%@��Z��C@��2�@G�@��4��3@��(U���@��o�%�@���ʥ�@��E�@�L�9;W�@���?ڄz@����<�@����@�x�>��n@����{��@�%�����@�⁗���@������@�l�4c@�96�MZ@���~I�@����z        ?�s� \$@3G�7��@Vc���`_@n���,@��[�@�>��O�@���h��{@�.��n�@�i�ue�@��ȶ:1@�ˋ|Pt�@���ΚQ@�4	�B��@�N�u�E@�gs�wv@�-�<���@�q�[�@�ѹԑ`w@�L�Ox��@���*z@͍�E} �@�)�_�S@љ		+��@���xQ@Ԡi��D�@�:6e�O�@��ˣ`d(@ٝ�Zd�1@�h���m@�Ea�v��@�41;���@���=��@᥌�`ސ@�B6�@��]���@�)���@�7�[�S@�w�z�Q@��
!I�x@�Ѱ	rG@�|GeYx�@�ꏚ�@�d����@��wHب@��p�b@�</FIZ@�c�W:O�@�@ޅM@�"��]��@�����@��9v�@��Uh�K@��k��\@���L8 @��1m�@�w�	�@�<'$��~@�cZ2+�@��9�5ʳ@���@ە�A ��R�ϽA+��!vA�j�e��        ?^��k?��?����l�R?�]��>?�/����?�dw�U�A?�7*�� @3��+@	�6P�|@��mw��@�dh��@s.��@ t�v&�?@#�A�<�@'%�y@@*��5H��@.��v�%�@1[�;3�@3���CJ<@5�M��]�@82.�W�@:� �ux@=Hw�p�z@?�W_��@Ad5�J��@B��+.�@DX\F���@E��	��@G���^ž@I(QJ��@J�R���n@L��qa��@No�~�n@P&���` @QR��X�@R�l���@S�^	b@T'W�Z�@U94 V��@VRLe7�`@Wr�_�@X���>�@Y�)$}�h@[t�7@\@�Ңa�@]�w.@^׷ȘR�@`�ř$@`�iF�r@a}N�%X!@b6��}��@b���u�@c�2]߽?@d~F���@eI�%ng"@f�hz�@f�m�"@g�A��s@h�bYӅ@i�ĵRUo@jkc9 @kU;��'~@lCT�j�2@m5���y�        ?97��,?�Ohv�_�?�x_�u!?�w�S\<{?� �����?��X��[�?�m�HR?�
�Qc?�7=��;v?��2\&�?��+��@]_س%@>��A�@
�	�}�e@U�u��@N �5M�@6{f@iR�e@�,��(@�Њ��k@"
(� �!@$c=�o�@&�Q����@)��Jx�@,�5=��@0+!�l �@2	a�U!5@4���r�@6M\:n@8����>@;Z"r��@>3���ĩ@@�P��@BNB�x\�@D;�Ln�@F�J��X@Hl��`@JOÚY�@L�e�� @O4�����@P�vǫ��@R`*n�[@S����@U~�@��@W0�Il�@X��q�	�@Z�#�|@\��,��Q@^�4 ���@`��D�_@a��Z!1s@b�H��>@d���K@e\�9-t�@f��Y�@hFTx�@iu!����@j�Y�3�N@lh����o@m��S@o�hP�}@p�4,:O�@qkK�ŵ        ?:�
_Q�?s���?�zD��:?�C��\�?�',l�n?͵���1�?��+;�#�?�^�q+��?���y�?�6�W�&?��m���?�K���2?��\U*#?���q�Q@��9�̈@�,<��@	�FL@����7�@U;Etl@�u;Ӓ�@�n	��@h�{��@+B|
�@&o>���@ /%p��@!�%�W:@#ɷ��@%��{4�@'�6���@*JI<���@,�-�kg-@/vR�Br�@1*V1���@2��h���@4Y��� �@6����x@8.Ί@:	v�Du�@<6&�4�I@>���0	@@���	e�@A�t1�_�@CG����@Dέ,d�@Fo� ��A@H-mMNw@J��$�p@L�ψM@N���^@P/�Y���@Qb)d�4�@R�yF�k�@T��@u@Ut�1X6�@V�'��A@X����@ZW�I�2e@\,z�'� @^:	�@`�z�V@a+����@bQ�,0�@c�R��#        ?��R���@+ʐ���<@Q���Z
@g��B��@w�}.��X@�L[�@+@��YF�{@�m�֟	@�lRjy@�!��o @�wcؤ�x@�3��>�@�*B�5@����`m@��S
]S�@��ݸ� @�O���ف@��2D(b@����	�F@ì�q��@ű��=�@�͡d�0�@���&?�V@�H�����@Χ
/%?f@Ѝ��İ@�ґ,(@�"4���@�|�V�<U@���� @�Q;@�@�˖e�@�P�-t5b@��T��@�z��SUi@�œ��d@�g�L��@�E�"4�@�'����?@�� ��@���3F@�����?@��)�*@��W���z@�E�%@��Zqg�@��6�V�@�%pM9�d@�E({Z�@�k��LS4@Q?�@��m�ō�@��@���`@�&�
_�@��@G �o@�uA}�v@�!��m�(@��rc-@�"EŒ@�>��@��	���q@��8ݿTs@��S�i        ?5b�f��L?q5oq#[?�݈#A"?������?�����F?��e��9�?�F�Ӆ�?ێ�<��?��ԗ?�1B�̰?�n���W?�`��E�?�u���
�?��x�-	�?�&���@�n�v@he���P@(�$��@	�g�u}�@���"�@	]�# D@����>@g3D��\@2):��@�@ۿ9@ (]�@\���@͋�V@C�Ny�@ ����c�@!��*��@#a�TX�@$W��1��@%�y=LY\@&�����@(Fo�}�@)�W.I�@+č�B@,��Ǎ
�@.
ؕa|L@/�Q�6@0�y�M�d@1_͋��@21��4��@3�AV�@3�S�u@4������@5��b���@6�����^@7v2�!K�@8fj4>�N@9[���@:V�Y���@;XEJR�\@<aGXJ�@=r�8y@>�a�0��@?��~TK@@m��@A�?cC@A�4�`��@BEw�a\�@B�q�)�        >Њ�BS-?J^QH�?>��'�?W��u� ?iC�*�?v�^V�P?�lO\��|?���@r�?����L�?�*�Z�?�vb@/�?�̤�^2?��A^��t?��>\>
�?����i�w?]\�s?��Q���?ΰ��`�?�w%	�r�?�|^��?ތ���3S?��j���?�:�g`+?�U_��%?�)��`&�?��͎>?���,���?�gQ-�q@d�U��@y��1�C@�{��1�@��vw@=��u�^@����@�'eB�@ڛ:ma�@q�Q�3@ :_�L��@"v���w�@$�d��1Q@'��z���@*ǿ�~@.-lZ\8@0��ūL@3ӊ�c.@5V��>=@7�N
]�,@:�ԇJ�@=���X�@@�W�Wg�@B^i���O@D_�0^��@F�T
�R�@H�J���@K��-m@NK�����@P�~��ܲ@RD?_�#@S���v�@U������@W���r�@Y�����'@\(�g�I        ?0/�u��?h� �<�?��^Da?�!��f�?��zM��?��`��x�?����2?҅&�U�?����6�?�ȴ���?�<	B5bb?��)�p��?������!?��[���E?� �Ґ��?�~��ȼ�?�Y@��IX@ LT�r�@�®���@4uM�@-#�'�@сFӻ@}eK���@�m���@}��a�@G]�/��@��۬��@7G�9@�Kv»�@�'��K&@!����@#Z�2dY�@%9껙<�@'<t�|�@)dOM��a@+��L�!�@.,A�� �@0he��}@1�Ɏ�'@3S���9�@4�.\s�@6����=�@8y� ��@:kb+���@<}5$�83@>���d6@@����ǿ@A�G�F��@C{	Y��@D{�ߣ��@E�Z(ϑ@G��5�۴@I>73Dhc@K	B���@L���[	@N�	*C��@P�K�zi@Q�6b)T@R�,6�@T2��y�@U��P��@V��WB�@Xpx��        ?��k�w3?��@6��<@����@3]���J@D���@QZ/.`E@Z�N9_}�@b�(�&��@i����h@pn�(�:�@t�j{��@y��F�@}�WP��@��r�4c@�ePac�T@�eù��@�����ѕ@���UfK@��uj�@��++�<�@��H�vq�@��x� �m@���迃@��i,�.@�[w�O@�j�z"��@�쨒R��@�/Kh装@�}�4�@���l��F@�>w벁]@��W�Ø}@�0�/if�@��X���@�T^+�@������@������L@��5����@���8t@�~�{�G�@�mi\�I�@�a/{Z��@�Zh+/0@�X
'���@�Z�-��@�b�5�3�@�o�*W�@��e#�P'@���^�(]@������@�ҫ��R�@������D@��#��w@���A��@�NN�&�@������@M��o@�M�@B�@��VT@ļ>���@�z��"T�@�>H�`l�@�-�{        ?t'��89?�$Í�?���J�?��57�N?�W��3?����M@ː�yR@K�L��@e�t�@�5�y�@0}��k@"��A���@%�w��E�@(�j"^�@,_Ř%��@/�%����@1�E?ɿn@3���K�@5g��>G�@7H�V��@9.�Mp#�@;��@=9��2@>��9Y�@@s�L�f�@Am5�	��@Bf�g�@C`|��{�@DZZ���@EU%籫@FQ�-e�@GQ#���j@HU����[@I`}��*�@Jt]3�@K�w��GH@L�>'�S@N��:q@Ok�*��@Ps��B��@Q?p��å@R�� H8@R�v����@S�zak�@T����@U�]����@V��&@W�@��]@X�\1�@Zy�H`"@[l|5\�@\3��K	@]P
��m�@^ndRc@_�3���@`Wh�?
@`�����@aw���^@b���[T@b�a��C@c$,�S@c����1�@d;����        ?YS��k?M��^�p?u�����?�$lD���?�M�B�Z�?���(���?�q��u��?�ڑ�Q��?̰["���?�۟��C?��X���Q?�ɷ�r�c?�)c\��,?�׈)���?��G��?��9B�$?��p��?����� ?�+�c+�?������?���?��@7ԇq@�Y��	�@t�C���@
wjr��@�{v���@�X(g��@�KM�@�|�;N!@��?8�@s|D�� @�c�w@�����[@!}<)�@"�t�|l@$o4�#�x@&YQ�W_�@(i@����@*�G��@-���@/��{�@10��v% @2��q+=@4K"�f8@6����@7�ǋp�@9޳�2@<u�Y@>KG+��1@@_?�=�@A��qu�@Cv�VS�@D���NET@F-��4VE@G�����@I� ��W@K���%@M�:��D@O܏/@Qs�*�	@RPP��Z@S����D@T��g8I        ?�}
-�-?�Ω�o<?���~�5?���&�@E,r�@���K@*	H�Y�@�[�z��@!�d��sK@%�(�C@)/U^<M@,�~��@0c�����@2Y*ңa@4Z:��x{@6g����@8�-����@:��hΆ@<�*QR�#@?7 ��3@@̾�+Y@B	���@CQ\�}nU@D��x�nA@F	bҦ��@Gz�P���@H��@R@J��8��k@L4��d�w@M�y�Ј�@O˯�]��@P��*X @Q�n���@SN9k@TP2^���@U�P#	�;@W@2��@X��:��@ZC��z�@\�f��@]�����{@_���(A�@a�jߵ�@b.���&@cX�n��@d�0�hL@e��+�2�@g ��<��@h|��|�@i�d2M?@kX�(�-@l����@ngVᬜ�@o��׮�q@p�Z�(��@q��w$�5@r��6�J@s`@L�@�@tB�ۈ�@u'����@v
�q�@v����@w���b        @^`���@R������@s���m�@�]���0@��H{A��@��vħ?�@��K�;��@�FWB��@�����¥@�J$�wr�@�"?ʪ��@�??K��L@�v�uу)@���yf@�#*\�@�HW���@����W�@��(pP>]@֋p��@�R���@@���<�@��&F��@ݴ�|�(@߂���3@����m�@�w��@�xH]�Y�@�`<�&@�H��%4=@�1�-��@�S�4.L@�Z���O@� ���ZT@��y5.�?@��+	�w5@���f\�@�-bR��!@�`xE#-@��\��@���\��@�¯HQ�@��ꇃ9@�Y�TUU@�1D�?2�@��%0kn@��}1��E@����	�@���9��	@���C˨@��d�:��@��k��9@��m`{��@���̻&L@��t?�@��uTs@��uL��@����֡�A L=@��A ���l=�AL�J<nA�>(��AJ����AA�Z��ܧ        ?m�Τz�?�Ʃof�S?�$K"L�:?���[F$?�I��~?��u����@WƎ
�!@
#� ���@�!sN!@���@�`\Ź�@!��e��@%Obk��h@)3yI��/@-a��X�v@0�cl;�@3KE�m@5�Wٸ.@8qw�_�<@;8�ٲ�@>"}Cl�8@@����X@B0Y�y�@CڅT�@E�_!�'�@Gc��W�@IC?�X�;@K4z��^@M7����{@OM��@P�\F�(w@Q�[H��F@R����(@T,�{c��@Ue�c���@V�Xs52Q@W�*aO=o@YF�^�@Z�ݖ<e�@\�޳Z}@]w�R���@^�o���@`84+��@`�@��"�@a�⋫K$@b�Laz�@cg�����@d?qo��@e���@e�D��@f�w���@gˏ*+@h��s�@i�=B���@j���٢@k�?<^�@l�&u]�@m��g,��@n��C`�@o�\[��@pi��	a@p���e�@q�g�w�        ?'���$�?lFR�FV�?��v7,B�?��-��?��|�CqO?ʗB���?�J �?���Ʈ�G?�F2O�?�?�3�?����6?�>/�l�\?��`�4@ �r���@��ML}�@/�*@	H|���@���M��@B��V@?���$@]��d1R@�T,��@��7��&@���/D@2��+@ �e�6}�@"-�w@#��jĦ@%B��Ģ{@'���l@(�����Z@*ݞ���@,��{�\@/%K�"�@0���x��@1�_��@3A��Y�@4� �V@6N����@7��R�@9A�K�_�@:��Ƒ�H@<ӎaB��@>�w<|\�@@h�p$\@A}G�r�1@B���,�@C�)�Gm@E)���@Fg'm@G�j��E@I<���vw@J�����@LYe{���@N���'@Oţ��9@P�? �Ur@Q�A��!�@R�Gw�u@S״Ԃ�@T�䢒0�@V&���P@WS�F9�S        ?�!r8ո8?���hת?���waiq@6��'@�@!�y��(�@.�s�m@7�d��e�@@�]����@F�s��@M��(o�@RrQ��<@Vt���"@Z��ۗv@_a����c@b"8��t�@d�c�J�V@gi4��EG@j<��]]W@m.��lu@pϿV�@q�,?�@s]�UjA�@u{nh@vد�RD@x�E�V��@z�<v��C@|��S?=v@~���'^�@�MM�ʶ@�^�t+ �@�xƗ�6}@��>���@�ƌ���X@���_�f@�8�*��R@��-��q�@�рx�8�@�,�}�"�@��Ӑ9��@�N�ށ@�~��Ȫ�@���2�VN@�Kj�@�����@��k�r@�ȥJ�2@���N=�y@����:z=@�z���5@�l�b��;@�dt��@�bo}�@�f�){@�p�-��^@��i�֡�@��T
ey@����Ao9@�ْsv��@��s�q)@��.D�@���p �@�VB�+@��P}�?        @�g)�T@K�~��c�@p�*~=/�@�Y
�+4@�nP;f��@�c��c��@��1�#��@�	^�u9�@�V�j�@�B���6�@ʽ7��@�^X���?@Ӝ.|��@�7�ı�@�� �9@ޥ|���@�\�b�!(@�}�8�N@嵖~��3@���h1A@�g���V�@���fĕ�@�s
؃��@�E[(�n@�k�I?@��N]�G@�I&�at�@��d&K�}@�O��]�@����DZT@��M]��@�'/K�@����%��A J�F/�0A-͌��AV�X+�A��K�A��]L�A�@���A졨�G�A�<:�	�A�� �A	J��A
�#�A.�$ԉAL��h�Anܲ�T�A�O�oAĹ����A{�3�?A0�T�A�1����AX���A�c��A��x��AN���̹A�,P=7uA��6E�pA\��)AV���Aȹ�/eA����C�A?Sh�1�        ?AX_�׫?�_�(�p?������m?�6�>�֝?��?���?�2�!	�?�QM�?�Y�4C?�����?�nٙr4-?��x}㢄@.|�Cn@���@
��5@��UB@��o�v@G�����@�{(�s@�D�@3Z�,�@ H�)L>�@"��Z@#�V �
@%���`��@(�K��@*Ou�_@,���Cg"@/%���N@0����-@2F+Fa�	@3�cQ��7@5IZSh�'@6�f|�i@8�q��@:m���@<O(_�2@>D�O'>�@@&�㯵�@A4���@BK\�e;$@Cj�	F�X@D�!��#g@E���ȃ@F�� �@H:lWm�@I�t1���@J�`���@L0� �@M�F;A�0@O��q��@P>��%uE@Q o����@Q��?pH@R����t�@Sg�5Pc�@T@�ѱc�@U0�e�
@V�fc@V�"�B�@W�|�#�@X����M@Y��L�'�@Z����        ?+��P��d?r�s8��?��v	]@�?�\'��99?��R�D��?Ү���Ҍ?݋j1��u?�;.\t?��x�1�?���P��?���%BW�@ d5��\�@���W\�@	a'�7,D@|{��q@�4<@ʛj}��@Q{��vj@ E����#@#E��H@&�@Si5@*�[�X�S@.��rq}@1���ž@4�B�=hy@7�G9�O
@;��[-@>�6�v!@Af��@C�49p�@E�mha*P@Hvn���@K-&v�~@N��5�N@P�:Ѵ+�@R9|���@S��j@U�K�T@W����D@Y��}�.@[�T����@^6~
�@`KcJND@a��E��~@b���@d4L���@e��=���@gت�Ha@h�X�(�@jP�".��@l��3�@m�)�V@o�kQ�Su@p˭,���@q�[�=��@r�'��E@s�}�5!�@u� 6�@vL���@w�@w�gD@x�J�'1@z1"
7C @{�3J̒'        ?�\9��?S(�y�g?v�(q{�.?����O?��5S��?�VD{S`F?�d�����?�F�7|[?�o|?��T����?��uo���?�z�8ɰ?�R*Y���?��L��D?�N��Z{?�Tq��2?��C�aj?����@��@��_�p|@y�\d@
��z��-@�0{Z��@̭!�!`@�5_��@�O�y�@�ۢ�B9@!�uI�@#v�|��@&!�٨ܒ@)	����@,1	���z@/��e�t�@1�Px\O@3�4���@5��c�[@7�Tw��&@:Q�s}Ώ@<��7�@?���ȇd@A1Sw���@B�! 'dM@DK41^M@E�
�'v�@G��k��@I��H�@K��m�<j@M��U��+@O���<@Qc��c@RF��tJ@S�2�tF@Tݥ�z�@VA�s��@W�X\A�@Y>��~�~@Z�3��@\��[M�@^Dzg
�w@`���@a (�b�"@a��_� �@c�\z�@d*f��        ?��#�j_�@0LN�@5Q���!/@N����@_iw��Y:@k\��@@u<��
l�@~���y�@���Ԫ��@��%\�}@�O�XӦ@�*�K��@�}s�K�]@�O���Su@�š.�&@���}rl@�����@����_
@�K�
{s@���%�eG@��?~���@���N�N%@�"܇B�@�k�L ��@�Ҳ5߄�@�X�d��@��Q�X�@���j@�\dy�@��zw�^�@Ɔ����@�;Aۃ��@��-�@��q�l@��ُ��@������@���U�@��a ]i@�9Ԓ;�@�eK`�E@ՙ�f���@��,c��
@�?~Z�@�k�=@��i�Hô@�#���;�@ݍլ�Z@����35@�=��PF�@�!��Q�@��va��@�)��@�jeUY	�@�CH���@�!�$^/�@�M��}@��x>ZU@��dju�1@��	9��@��^)06$@��]�I�@��	�@��ly7",        ?;'hk?x�n�y?�\ƞ���?�=�.	i/?��<�O��?�F q���?�ug?�9?s���?��2�Pk?��l���?�-Rha@ ��d��@*�ye�@����@�K���@/k����@���<\7@|GH�@��@�� uz�@�~?_~�@ `hz7b@"���_@#�^Å�@%�ʫ�@'��ֽ�@)��T]��@+�hv�@-̅�
�@0F,)�B@117�U 1@2gMr6?@3��I�@4��xV7@6N�d�}@7� ��}@9%j���@:�>LL@<-�8�p�@=�OȔ=&@?g�c=�@@���b��@Aiv�#[w@BM]Q�1M@C7�,��@D&�Po@E���:@F*y��@G�˗@H7���N@I%��+q�@J5
'�yY@KIb�p��@Lb�)*�@M�U֕�y@N������@O�B6N�@P{��=7l@Q>!�@@Q�۲��@RUD�[�F@R�*[�W�@S��Oo        ?#w�\��w?kI��:�?�ui�Օ�?�^����?�_���c�?�j��*&?�u)��a4?ݟ���)?�DM{��?ꝡ��?�����|b?�ByHt?��T$�:
?���"s)c@i��n�@����@	X��7@sw��	�@�Y�'@�.�2��@���D�@θ>mv�@zn9�x�@ �0�M�g@#�(�)n@%��W�M@(|˧��@+�iM�,U@/���@1|u��J@3����@5��x@8�����n@;OW�!6@>a/
�@@�>>�@B��(6�@D��0��@F�$�%�@I"���i@K�\7��@NX�}zD@P�*��}�@R/��C��@S�Dt�W�@U��S�:@W���a��@Y����\@[ƥx���@^�Sh��@`C!Xݯ@a���5@b��`>v�@dZi��94@e��s�%@gr`�D�@imw�4�@j،�f5@l��X�@n�?��`@pHp!+T@qS��U@rk��Ƥ        ?B�x?}X����?��WXJ�?�x�L\�?�"���\?��`Rh��?⩾���E?�R@��F?�������?�06)�>�?���Y7�@�c���@~��@�蹴@�mH���@�L��47@�Z�s>@o����@zrBV@�T�B�@���o@ �� +�?@"?UWz#�@$	w�A@%��!3�@'�{�L0�@*�B4#@,HČ��@.�QL�@0��m&F@1����{�@3Gt~�jL@4���	@6M��D @7�@�N@9�w��@;".Wf@=jnVI- @?o
'�@@��R�g@A㝗H�e@C���_�@DFU�4��@E��(q��@F�'�R$�@HFC���y@I��Г˨@K<�K�� @Lχ3���@Nr�:�v@Pz �%�@P�"B��I@Q�V�M9@R� j�b@S���:M@T�(���@U��x�@W g�@X,���@Y[s�``�@Z�r5���@[�=W���@]*E�δ        ?�%�]��@0!��:�@4��lή�@M�]!��@_鶚��:@l1-T��@v�m7��@������@�e��[�@��OhX@�c��b9F@�F�@��K�d��@��c�}�@���p��@�.I��@�rY*�@�N᾽P@�4��&�@�H��c�<@����@���yN@@�߾��i�@��M�Y@�
�����@�@�ң�x@��Wb�3R@�v_U?m@��ۈ��C@�����KH@�D`����@ŝl��=@� �cN��@�nl�H@�擌,?@�iJ�_��@���i�t�@Ύ����@��9�Y@��P�}�A@��:�B@ҬZ{�j@Ӓ���Q�@�}���5#@�n"_`>@�c$��3@�\�L/5@�[Wz!�@�]ݶ��1@�d��f�K@�p:=6�@��1���@ݒ�s�I�@ީ�F��@���O�@�p�m�@���G�@���Z@�*b�V]�@��p�w�@�`���;�@���A�@�xI9        ?Yp�yE�?�a�)�f?���~�i}?��k�4�?�m�gn?�3��kԔ?����n0?����w�@�4'���@
��иI@�6`�@-�g��l@��z~ޏ@>�[��@K3<ٮ@!���1�@#*�gg@%[{�Ļ�@'���ok@)��x��@,hl�39}@.懨��@@0��� 0�@2
�q�V@3a�C$�@4�Q�0�-@6)�QN�h@7�u�/�S@9J�]f@:�P�H{�@<?y��sR@=��W�@?��Mh"8@@��au�@A�u!pf'@B�t�R��@C��M��@D�B�E�@F$�Ms@GO�Y���@H���D@J<[:x@K}�b[�@Ms��Zf@N�m�.�K@P3{����@Q�RI��@RASn��@S���B@TG�\ً@U E���@V;`d�#@W`odOL@X�P�=k@Y��@6�@[	�x��D@\Uv���@]�ج�x@_��U95@`6�>�K|@`� �ű�@a�_�B�@bh�<��        ?6)	H��?w�`dX0?�i�"ӭ?����l>?��>f<?�lm��n?�"֢Ia?�a[(�6?�d_-.�?�4֞$O?�g-)r?���6S��?�^��#?�:�PJ?����X�@ �j��H�@H��j�f@2�:�<�@	j�,}@����a�@o:e<�@�LkRdf@�e2a��@�x��"C@tMW��c@�|�c�@ ���1@"�
��@$�${���@'.���@)��/s�0@,�{�o@/�2�'��@1�3q�'+@3}���W@5����P@7���l�C@:hߧO�D@=&��u�@@Aޥj�@A��j�v�@CpiH�@EU|KI�@G`׼/�@I����@K���G�@N~N�7@P��0�v�@RB�_��@S�xC��I@UQ����@Wqe�;�@Y͈#�@[%���@];���R�@_�9k�@`����H�@bJ�10U�@c�Mr���@e�\,�@f�:�l�@hC�AT5N@i���J�L        >�a�2oX? ��ʟ�N?B�Ѐo:?XPS���?h~V�:?t%��Ȏ�?~�d�*�?���,"��?��%�q;n?��T��)�?�X�f��?�E�"���?��t�+L?�L�W��?��g��5?��?���?�$�>��9?�I19}�?�.��h'�?��p3aGZ?�v�`�I�?Ҍ��t�?�s�j{1v?�
��Ϡ?�,d�v%?�A�6��?�ΰM�4�?��բT?���hR`?�dw����?�]��D�?��k�_�Q?�s�� ��@ Px�@���Pr�@4�@!8�[�@,k@�tt@�j����@1����@C!	�� @�hB���@�?�}@�?ͽwd@�(�G^r@ `n��@"�Vu� @#��(h�S@%��v�B@(t��@*p��Gn_@,�����@/�k8@1>���v@2ǌ�A/@4j�.2�]@6)7�:;�@8�RX��@9����L@<*��@>O�ZA�@@T�5��@A����Y�        ?����Cw@(�\^T��@Kd�} @ayG �@p�7}j=6@z�:g�@��H%���@���gK�@�b�dt��@�ƥ���@���	9S@��
n�{z@�����t�@�i�q�*�@�m��K�@������@�ڠ0k��@� *��u@��P��i@���M�@��^��T�@�u�1#�@�j;�v��@�i���^@�t�BA��@�E�K��*@�W.�,{�@�o��!֡@Ðh��'�@ĺ����@��ȩ߻�@�1O_H@Ȁ�
I��@��B��1@�N���#|@�Л�!t�@�f�p��@�I,Яt@���8b%@��b9��@���5�H@��(�z�@��wr�@�M���@�Ctt��C@؅��=�@�ם��Rz@�8IT��M@ܧ���@�&#�}�@߳�LM@�3�i�&@�|��@�X,�H��@�;tEO@�%�6�5�@��v;�|@��)�ȡ@�{P�	�@�eb��@�%*M��@�9�\T�@�T��T�        ?�#�4!�?S �.���?x�lp7�?����qr?�:�t?���?����q�t?â@�@K?�ox\*?�����?��.|U ?��;���?�§�|��?�n�p5�?鸆��?�iDZu?��6�G�R?���4�ۇ?��;����?�6w���w?���A�6@kv��_�@���xC�@�ߒ��@)�PS�@
�PF�?@^� Xu@��tp�@����.�@+ux�U�@ԗ�.��@��e@j�Q��@YE��R@`u�y��@��k*@ ]�v/��@!�̻8��@"�&Xt�@$�|Í�@%U�Y� b@&�e�1@("~I%@)�E̘g@+&'-T�@,�CX�z�@.b��ϱ�@0(�%�M@0���<��@1Ӡ��A8@2���S��@3��T�@4�o���@5���؛G@6��:��@7����6;@8���!��@9��= _�@:�fS}Q�@;�&k�(�@= ��7�@>���/�@?3+=d�T        >�酜̤�?<gCѮ�E?b���y=?{���QM?���]@�Q?�%�ߌ�?����?�ӭ'Z�Z?��^��LD?�>���?���a(�?�5�	�Z?˚A��ls?��1�Vs'?Ԑ�Ry�F?��*�M�o?ݝ��r�?���d��?�Ϊ=�4<?�yԧd�?�q���?��V��?�c�8�c?�jdT ��?�����S?���E� s@ �i ^Z�@G�KO
@�=�}Uj@�f�UԒ@�Z5���@yI�r�@���S�@�Md��H@�Sb�@�*�#@j#kC�@ncWL��@ ��$֧@"��˸Y�@$�h����@&�r!��!@(�"V�x�@+T��i@-�� �@0`�V�@1�r3�n@3��В@59�D@7C9h�@9
z��@;"��Bם@=]H;KMO@?���C��@Aa%dX�@Bt)�e�@C���_@EZG~�;�@F�-���@H�M]�_@JVU��G@L-�����@N�2���        >�;���|?*i�a�(�?P�3+�S?h{���|p?zx�Rs?��$��*u?�q��E�?�]WC��B?�#ϖ�X?�s�A?��ɹ?���jY�?������?�@!q��?�6����?�|b�6�?���r�(�?߳��mw?���y0��?���v[�@?�yu��o?����X]?�M �4�?�=	(�Uz@ �W���F@JQ��*t@��r�@a��-W@������@^��HW@q�Y�(@޿����@�yIR�@ �n��x.@#@�`v�@%ʔ{Ñ�@(�G��*�@+��Z\�t@.�9v�<�@13 ���@3qAʐ@5*���5�@7`*~g�j@9�IrI��@<C�}��@>�W+sW@@�WԻ�@Bl��C�@D��}��@E�ԣ��%@G��B`�!@IlV��<@Kk Y�&�@M��'S�@O��ԡe�@Q���|@R<�N��@S�,]�d@T��u�Y@V>!,8��@W���ώ�@Y9�М�@ZЄ{��        ?�'9��~?�{�D%E@
�����@#��۬�3@4�Y�O@Bx��0@Mg�iM3@Ux�_#�@\�*+�@c��	�@hu�P�o@n��7[#�@r�~1x�@v�B�^@z��'4�@Ǔ��VP@���9�� @�j儹�@��g���@���@6J�@��泽1@����VC@����E�q@��R⫁@�2���&@����� �@� ��g��@�ȫښ�@�I� 趜@��fxkѱ@�I~��]@��>*!�9@����@�V(��!u@�+��̱x@�EL�t�@�uķ� @���� �@��}��v@��HGI�B@��Gԡ<�@�����@�Ov��̄@������c@��.��@�5Q�V��@��ؓ�-�@����:��@�oi<�o�@���ma�z@��h:�DE@�{�?`7[@�D���%�@�j��Z]@�޴L��@Į�Gs.?@�<��l�@�O�)��r@���Ȑ�@��$<:i�@ȹ� {@ɅcY�@�O�[в