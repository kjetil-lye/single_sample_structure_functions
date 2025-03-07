CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T115244        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?Rk��*h3?�����O~?���}p?��q$��?Ĕ��|�-?з�z�S�?��k�@'?�CYH?������?�Ϸ��<?�?�u�?����
J�?�m�<�O}@ PڝA�@+�3+7�@LI��@	��}��@b���l@�{���5@϶Z5!>@�'�er@��CU܍@!�L�b�@��pS@�6J��@!s�IѐX@#'��J@$�H$9�|@&����@(�*ծ��@*�J��V@,�!���1@.�c���@0�W�7(}@1ͻ��@3 �I@4d7�LI@5�m��j@72��p��@8���ʵ@:9��'< @;ҝ^n�@=z�-�\@?02�#��@@z���$�@Ad��0�@BW�ϺT@CQtR,��@DT�x��@E_D���@Fs���@G�{{Y.@H��lB;*@I�k����@K��x_�@L^^�e�@M��3b)�@Ov�,v@P4q���@P��<�"@Q�c�{��@Rp��ƕ�@S<OP���        ?+R[W?b�6��D�?�4�y�X?��@��پ?�I\��?�6��5�z?�C�;s�?ԄU�!�b?�tcC�?�V��8?��.�}��?�&�^a�f@�����@]j0�*t@$���-�@, �w@!����J@@'.�?�h@@-���pc@2�͡��@7!�55??@<^a�tU@A2JltX9@D���Cy@H�A@LՅu�.@P���LA�@Sz�Q�P@Vc���$@Y��R�r@\����N�@`Y��.�B@bW��@dx.^��@f�f��dl@i'L���@k�h�I1�@nkF��q{@p�7���@r$2�_ER@s��խ�A@uaY6�@w���=B@x�2R@z�p����@|κ	�2e@~�D�z/@��E;�q@��C�b-@����*@�����@�6���l�@��lc��@��}1B�@�3�|��@���H���@�Ҋ�,�@��s�k�@�' =���@�`�B��@�4;�24�@��3��H@�����uP        ?2ѿ���?gmR.H�?�k�J�gB?���l���?�`7�PA�?��I�I�?�Rι�?�[��*4�?��8��'?�`�N!n?����J�@�ʛSz�@��@���k�@�G�;�@%�q&��%@,��t�R@2��OM/@8Y#/b:@>��&R��@C>����@G�aY@L�Mաg�@Qa�4���@T����@Xz@��@\�� �`2@`�݈~q�@c7��u@f5�H��@i���S@lg�{��a@p B|�I@q�ʌ_J@t�7{�t@vCl��@x�L�@{4�@F�@}쥕֒@�h;u��@���E�
�@���2���@�H��P�y@�=9&�@�V�	,�@��w�@�&�+���@�a`�e��@��0��ـ@�9ȇW�@�_/U$
�@��wްX>@�}4��@�����@� s�L��@��E�� �@�e�Q��@�"��5@��|0>f�@��~�D@��d�Q�@��*?�<�@���b�K        ?�g�ժ�B@�+j�@%�����@:Cm�a,�@H��4U@T/����@]�S���8@d��X*��@k�� �@q��#�+@v���w�^@{���N6w@��[N�"@@�?p�@��V��5�@��2��@@���Z��@�g�o�Af@�
����@�ܵ2o��@��P�X/@�E�ۡm�@��� @��
v$�@���U��r@�(�vfM�@������N@��&��@��K�#PX@��biBB@�Y�@���Dr{a@��l�U?4@��%��9�@�m�6���@�uRã2@��m��@��B8a@��k��@�SA:�@Û�u���@��{z�@�U?mv�
@��U�)bW@�D���wU@��Ӿ���@�j%,���@������@��}Ϡ�@��P�F@ѩT�6*I@ҖS���@Ӊ~��)@Ԃ���@ՂNsW�@ֈ�WЛ@הS+߫g@ا$�D�.@�����}@��W���@�	).Y	@�8n��DA@�od��r'        ?G����m?��1�:?���.��?������?�h�ί�?ʃ&��u�?ӄ��F�t?����N��?��vo$?��,9��?�1�DN�?�"�G��?�v��)��?�!y�'?��><@ �L��@VZݩ��@�O� �"@Gb� �f@	�tu@�h�9+@�&�S�K@�M�4@2@6��M��@��^��@�n�R��@ʂ�A@Ք�d߫@�bU�*�@6ÁLN+@ �Uɯ��@"ަa@#I2�du@$�Ih�L�@&�����@'~��s�@)%#�X�@*�1@��@,L�ԁ�4@.��zQ@/��� @0���ڔ�@1�⺇�@2��h�W@4?��@5#�5-A@6O��/��@7�4
W/@8ʚ��E@:���@;u���@<�2U��]@>O�l"ʨ@?�k$�}@@��
��3@Ay��D��@BLc��>@C%d���@D��D$@D��|��@Eל/2�@F�na�T@G�`��         ?.ZS�K�?g,3��R�?������?��J��.7?�8�R��?��{��V?�0���?���tw�?�n�
�ȡ?�Q��+q?��na��@MJ�/�@�o*)@h�?;�@@z�G1$�@!��7�@'�m0�@-���a�@2���f>@7(X9Tj'@<^!}�!@A)G�<�@D�U�b1@HQ� ��@L��\	�@P�V<Ȇ@S.R�z�f@V q�.�@Y<��~@\lFlw�d@`��VR@a���l�@dؿS*1@fU84jY�@h��$f@kR�$^L@n�ц@p}�s�Ϟ@r	To�|P@s�CO�@ufYo�/�@w8��s�@y#r	6s)@{'+�6�@}DE�F�-@{/���@��+�}�g@�V�r�@�_��p�@���Q�h@����d@�}Z�J��@��,�cs&@����U�v@�14�@�ł��x�@�}c?�u�@��rs'-@��#?�D�@���܌�@�}��4@��4~*@���(�<�        ?%�)��_?Y�c��Ɇ?{h�J�<i?��Q�1h?��2\A^?�����
�?�`J1\us?�˔�7 �?�
U�?���|�g?����1�<@ ����@*R��@5;�8'�@�s�8@}��/�1@#D�_k��@(�Y`�3�@/22"�+@3d���Z�@7���L�@<Ҷp�w�@ADk�_Q�@DzY{Wub@H$��c�@L�{(�@P2i�ŏi@R���i@U2.X��@@Xؼ'��@[Ǆ7�@^d!ږ��@`���+&�@b��;c@d����j@g!՛o�@ii7���@k�oF��=@n��|�@p��� *X@r�;!@s�쭈\8@uR�jy�@w
sVu@x�fĮ�#@z̵�JM@|І�z�@~�h���@���� M�@��[$@p�@��)F���@�3��SV�@��D�*]@��1��t@�S��r`@��Y�1��@�^2s�jA@���5a�@���	'�@�1�<Y��@�8�܅�@��ok�@�����\        ?�[��?�?���C�ͭ@x�Ժ�A@2k�/��@Ah���w!@Lg$�D�@U3�`@]M@�'fy@cs�����@h�|^�W�@o 鰘=@s o���D@v���Bvd@z�i����@[�����@���pN&@���il�X@�cs#E^c@�NH9�}@�f-Z�Ȉ@�VR�=;_@�,+yu?@��o��B@�ϧ/�9,@��X��u@��Û�X�@�+���=@�m�OP@�w��c-�@���#�@���~Ta@�x����X@��J���@�u����Q@������@���Vi�@�z���%p@�O_Y���@��<Wj@��� Fc@�*f4f��@�Ch����@�i:�< 3@��F��L�@����@��@�+p7��0@��y��@����K1_@�l4��@���ij�@����.�@��7X̯6@�p�^�@�Qv[��H@�9|���@�(�Ke�@�ue�1@�o��F�@�"���@�/c�4:E@�CZ˼��@�^���+�@ˁ4LR        ?]ww�;�^?�p�K���?�[{���c?�Jd��?��%"�?��Qen�?�ftN�J?ތ�r.�?���C�y?�[�([�)?�c�5W��?�S����?�ƭJ?�Ԓ���?�F�;�}@|��È@����/%@��7�@
��A�\�@�$a���@��MS�#@|+0�d@u7c�@�z}���@Š�l�?@G��A@���8@ ����@!x�N�@"鱐;9�@$lr@�&z@&�$�ڢ@'�hH��@)dj�<K�@+3RF&�@-�넍�@/�}b�r@0�f�G�@1�� V��@2��1�.Z@3�*<��V@5e�Es@6W��U��@7�[���@8�.)�}S@:],ui@;�
���@=F�yt��@>��_��i@@0�P�G�@A g�$��@A֥$�Ou@B�Y���Z@C��8���@D������@EqK�t��@Fh����@Gg�R���@Hm���=@Iz�_��3@J��N��X@K�񀳓*@L����?        ?dxA!�)q?�ɉ٫?��+6�?�ilQO?����;9?�N0�7.?��-��[?�Zy�B�6?�w�8l@�O�I�@�@����@pǊ�<n@�}���$@#��-�D\@*g]i��S@1}d=F@6�
 ��}@=K�2��{@B�9��^@G3���5y@L��V^��@Q��{A��@U(� �P�@YS�� �D@^	�3�g/@a���3@d�(�yO@g���ʨ@knrL��@oW�I�@q˕6���@t��L��@v����@�@y=�zO��@|QF(�@$+�Jѓ@�1J��	}@��g�+�@��,s��@���M��@����$@�߻ZX�@�%]��M@���J�|�@��j��r@�W6�q��@��'�c�b@�,]S@��jFZY@�F�5�@��Є��@�������@�{1��@�@�^�
?�@����6h�@���:M��@��R���@���1�@�	'y�г@�<���y{@�{���L@�����u�@�Äf�S        ?;��Z�t?pq�]sK�?����4?�!g3Z�L?��pL?��R?�<w�?�vVt2V�?���$y�?�ʧ���?��
v��
@!�(��a@A��~��@�0����@���S
�@<����@#�ն�`d@)J�g��@/�=U��@3�l&��U@8[Ox�W�@=��z5j@A��JT�%@D��e��@H�fxT�@L��Ҹؕ@P��aڱ @R�j��y@U��{�ʎ@XW���*�@[Y33���@^�����>@`�y�G@b�\A(�@d��Da�[@f�.��d@hݒ���,@k:�&��@mu�TC�@o��v��@qB�G�@r���wyH@t���Lz@u��y�r@wZ��ؔ@x�8mI	�@zQ�  <@|	��@}�GW>�@��V*x @��v�a&@�ԺGߝ@�ݕJzD@��h���@�	 -"��@�+��F�i@�W8�E�@��I��~@��F�#�@�����@�[�	�>�@��)Z@�8��        ?��\&��l@o�?��/@26�]�W�@D,�@s�M@R6�*�|@\|�8?�@d���]��@lM��Ԍ@r��f��7@w���U��@}Z��v��@�ۺ�՟d@�a�h�j@�@��Cq�@�:jT@� 4�@����'~@�MQ;��@�=���@�g�����@��/GP�@��L��r@����tR#@��8��c�@��7)LA�@�F��g@�����\�@�^�iݞ�@�Ԋ���@��dY���@�n��@��t�8U@�Z��n�@��[��@��c�=9�@����3�@��d���@���Cͮ@��'���@���8��P@�
Do~h@�M��x`@ƜX�*J�@��(�=h�@�`����@���\-�@�XT��@��Ӡ�dD@τ� �!@З��0[q@�s�>p�@�V��@�Aa�R�@�2����@�+NG*�W@�+m;�!�@�2�'��@�A�V~g @�X[�n��@�vXrc�@ۛ�a&�@���3;6@���D&        ?B<bz�?t���ʰ?�|@��_?��S��0?� ��<�u?�X4�4�V?�L���?��ڰ��O?����)@?݃?ﳉ�?�0V�?�%���]?�G���"?���NW�?�_B��*?�.�T�?�K��a�*@ }H�=�@����@����.�@	+�+#�@�2r��@F�8?��@dj�&�i@�����A@7���i�@��ؓ@�s]�/q@ i�a@!�K�~+�@#����[�@%�$��@'�H
M5|@)�����e@,Ű��-@.��[��N@0��b��@1�6��,@3EA�[i�@4����@6;�ыo@7�y�X@9g�}if�@;ǭ���@<�jJk��@>���{Z�@@%fO��@A�T!�@A��
�,�@B�y�t@C��O��}@Dޯ܏7@E��+8@F�Vg`�@G߯��֟@H��Ǐ@I�X�J�@J�8�:�@L*��{@M��x�@N%]�77�@O7-=8q�@P%���^        ?	�\-c�?G)f"���?p�x�D�?����g�?�i��]?� 	�?ƒҪ X�?�3�/[f�?⎁A�Q�?��� g?�Ɠ06@3���'@
�k_"�@�J�1ޜ@ʽ���@!Uو�q@&Ӟz���@-���'�@2�B�c��@7�8�`@=�mɪ-@A�93~S�@E|IїK�@I��)���@N~��iZ\@Q�G�^6@T�}��@X>��+�@[�)�m۶@_��f(lY@b(f׎�\@d�(�o
�@g#���ý@i�9Wrg@l��o�I2@p4�g��@q�(�V�@s�C^�e�@u���Ǽ�@w���b&�@zg�WO@|u�g��T@~�R+��g@����1�E@�=�9dy�@���>o��@�Iph�bm@����]@��'ڰ�@�q�J;n@�S�nrI@�J�粲L@�,�(٦@�=�|���@�Zm�|�N@���=���@���$���@��l��@�A��q-�@����PA@���.d�@�l�]��@�� ��        ?%Ojʰ�Y?Y��<5�~?zK4�E�0?���Z�_?��;��f�?�� �\��?ƁH��[?Ե�_��{?�	�_i5?�艦�H�?�� �1@O�gb�@
�勂�@�ݭ,@{l��@!��afx@'ٺ��(@/f��U�@3����W@9�r��@?�ګ@CNb�@Gx�$s�@K�7�.�@Pr�b�x@S\�ķp@@V�����o@Z3����.@^(t���@a>��
S�@c��f�7X@f*Tkh�@h�'�Q�@k� -��@o���(�@q?�f�o�@s�6@t�*QP�@wj>faq@y/H6�Q�@{u0G�K@}ٔ 
љ@�.vJ��@�ڕ��A@��7d--@�R�Z��4@��ـ^�@�g�2��@�]�|�@��V�w�@���i�4@�_-1@�$�Q���@�"�!�DW@�*p��3@�;iH��p@�U����@�z.|cF�@��C�LD@��X'�@�"���	�@�oXJ�@��$z��        ?�I��_0+?��4@�'js��@$eIl��@3��<��5@@^�����@H۶����@Q����E@X_x���@_�|:��s@dD\����@ir�m+@ouE�"Z@s2���x@w-��6�
@{��)�'�@�u>;�@�d��.?@����6�@�j-!9��@��02@��s�X@�)|�$J�@� &��@� �H,��@��9�|�g@���1ع�@�������@���f��@�H΢�v\@�״'�C,@����#�@�~��<P@�J�b��@��� ���@����N.@�rz�/��@�T��#��@�J�[�;@�R�A��>@�lˢŮ�@�KG�
��@�gg�5կ@�>�m�@ò4��4�@��2{�r�@���f@�D��C@�z �|��@ɱ�Bk�@���n�|r@�"�c��@�Y���u\@ΐFe�9�@��^�\a�@�|L�/B�@�σm�@Ѭ���@�Aᚢ�%@��%.�K�@�h�2�~�@��kQ���@Ԉ*��J9        ?��@`13?�x��B[c?�=nZ��?��"+��?�q1<5ۿ?���5P@ |_Ye�@`��@F��p:@��i|�@k����v@:����@M�Ar�H@ Q�?�@"�O���@%��Jd�@'�u-R�@*?�?���@-
q����@/��*�kK@1�����@3�\��@4��S;�@6oPlI�I@85q�n�w@:�>�	r@;�x� �@=�OI@?���G��@A���_@B(�� G8@CM���B�@D~2F�%@E���Ï~@G>��=@HT�V�8@I�d=���@K %�s�v@L���[@N����@O���N�5@P���=@Qwg;��@RQ	���@S0�*�@TE��.@Uj���@U�,�K@V��5�@W�Fe(@X�8�@ @Y�R�\u@[�	@�@\(�w%��@]H~���@^nr�@O|@_���]�@`f���6i@a��U��@a��S�,]@bG_ �0�@b�ԚZ9@c��[�P�        ?W���1?��6�e��?��p��?����V�?��wL��	?��S�D�
?䗣Ǖ�$?�-o͹�$?�}�MW-@ =]��J@	И5��=@DĻy�@�>*�@ ��T���@&W$�KRW@-2���@2���"@7���p�M@=�H�?g@B�+	��@F�h��a@K��<�@P��9�@S�s���@W[s>#@[+h�@_^�-x��@b� �l�@d���@g���z��@j����@n�����@p�YG�@r�F+=Ɉ@t�$g�x@w5�=�p�@y����q�@|1�8��@~�/�&�@���P��@�p�?
H@�� _@���%:R7@���l�j}@�s0���@�n����@���h�\�@��6F�@��L�Y�K@�)��S�@�f ��IY@��L<ȗ�@��y�4@�i��|�@�ۥ��U@�[t�w�g@�閦��@��YCY��@�2|�$@�v�N�I@�[����@�H�@�E@�>>ɫEF        ?\��.LS?��c�w�?����?�L���d�?ͧ!��`?س9Օ��?��S��?��?[p"?���A��?�=����@�yW@�>Ҫ�q@flL»@h2J�@��65@!��ʟ�@&�FWF@+ya@!:�@0㵽Ӵf@4���l�T@8�.M���@=�Y� ~`@AsT����@Dv��/I�@GϨ���@K�a����@O�s8)I@R�-��u@Tm�]Ե@WݒU�@Y�m�X�@\��ӌ�-@` 펳�@a�v�w'@c˝��W@e��.	{#@g���ks�@jP㧑�@l�q�9b�@og�B�@qd���@r� G��@t!̩��@u��y�(@w�_�`|M@yZs��Y@{GԘT�{@}Na>_s@m�tT��@���Ǐ�j@���r�@�6 : �@�{���h@���~nQ@�2�1�@��^^+(�@�%)p�0^@��nE�_-@�Us构�@�|�R�@�b����~@�KD4��@�;��#        @=Z��@?�_re&@Y@	6��@j�,5$��@wy��8o@�v	��B@��VNL�<@�KQ���@�V���@����p7�@�f�r3�@�|��1М@�(����@���[�@�*�U��/@�jw�5�6@��z*�>�@�S�U�@��1D�@�̛�ק@������@�lx�[Y�@�!�w�2@Ŀj�%�@Ɔղ��@�b��E�@�Ti�F��@�[�L�)u@�z1̷.@�Xۗ�-@�T��@ҳ_�a�@�����v\@�C���H@֠��_\@��|��@م+F, @��4���@ܢ�\�b�@�GC�T�@������E@����2+@@���4�n@�b?�*@��@䢹1��\@奐6��@�}��CQ@���67��@������@����y��@����m@�M�)�W�@���
�@��E�T�Y@�5��HG@��)�@�TN3]��@���	T�@�����@�l� LF@�'��I�N@��3l��        ?H�̤�z?zy�_�F?���뀹?�s.��#>?����Nf?��)���?�<z��#A?ְ]���?�E���?�VƸ�8?�p�Q�k?���m;��?�J	<ʩ?�w��@?�2z���?�H/�P@ �,GK��@I�nJ"�@�I~�~@��G���@͐���@h�uk@Qn���R@8C�Mv_@B�"�߽@rV���@Ʌr�0�@Jb#?'@�'�R��@ ��|�N@"lc���@$	��;0�@%�b6\@'�IFo�Y@)����	
@+���z�@-��D��@0 n���@15�S�$@2{��@3Ҿ��L@5<�]�U@6��i� �@8H2#9�>@9��#��@;��?d	@=j��"@?GV�	��@@�[���$@A�/�a�@B�A����@Cêw�&�@D��'33@F����Z@GH��y�@H�p[ɮ.@I�ذ�v�@K.��� @L�Pq���@M���׻�@Ou�Zg+�@P|���u@QC��ܴf        ?!��h]?=��i��?dJ��\?�£�]��?��u��5?��$`��<?��}K�ݣ?ί�)��v?۲��!X,?����?���L�B�?�\�a���@܌�s@�X���|@�%��@+P3x�@$)��PL@*mG�Q(�@1m��x�@5�+~�JH@:�Y�f�>@@��b=@DO+u*@H�2qB@MU��ͮ�@Qd�ч�@Tw�@W��@[�D10�@` @�U0:@bZ�*�,@d��f!��@g�޸�� @j��P��W@nP鿠L�@q��y�@sZ��G�@u2���@w�`l��@zʖaɓ@|�: $|@�����@�p��sf@�R<�l@��v;�@��� �t�@�ѝ���	@��Z��.~@�8����@��;hWN�@�u�9�@�eb$l1@���T��{@�A�	�V�@��;t_��@�g	Z6)@��n��@��w�b#@��½�+.@���ݶb�@�ɒ%���@��n�Ր�@��� H�        ?8'��_y9?jC�Nd�f?�647L�K?�C�a�h�?�����&?�s��64�?�����CY?���&?�;�p�,S?�"�Y�7?�Aj�^�c?���Կ`y@f����@
�2�5YP@�54L@ðR�L�@�:3g@�@#���Q3E@)+g>{�e@/}���A@3z�Y�@7�Ҷ&�@<��;,�@A`���V�@D��;�X @H��.�.�@L�㶱�N@P�4��-�@Su��@&@Vm��\�@Y��F��@]O���@`�����@b��%{�U@eLM�@g� {�P�@jZf-g�@mFQ��@p3��6�@q�#���*@s�XU�/@u���H��@w�ߗhm�@y�(sڧ�@{��]F�@~:�8���@�Y��̞@���	Gʡ@��D��W@�h0IuK�@�����n@�k2"�@�{{E��@���� b@�g3��@�0}�Y,�@�H1(3@����`�@��K*@��RI,l@�	�M[~]@�y�*E@�=rKHo        ?ʻ�e�e�?���$�G�@P{��@.�r�7�>@=
F��@G�{P7E@Q�t��lZ@X{5ߟ�@`Kd�"@d����Tk@j?���:@p�+�9+@sl\m)@w��_�@{5=�&T@���ױ�@�Yq\v8�@�����T@�����@�U��v�	@��@��h@�aC�3� @�z�C �{@��=[s�@�7z���@��WZ"�@����g�/@�j���H8@����@��u$��@�Ŧc���@��)�m��@� ���z�@�U�l�Xz@�я�)�y@��&�H�@�"�-�@�����@�3���Bh@��:F��@��i�8ub@�~��9@�r�A8|�@����b��@�T:x�[�@�u
�\��@£  M6@��J~�0�@�'!#O�@�}��mk�@��p�v^@�Uu|*��@��i,@!@�g�	���@�e@��@϶�	
��@к�Ce�u@Ѣb��@Ғ!�s�@ӊ5��S@Ԋ���u@Փ��j:�@֥�x�]        ?e��f o�?�d��g�?��_|p?���QN��?�I'B���?Ӕ2u�eg?��^�x?��'���?裼��4�?�}��W?�C�Ɩ=?��f�Jk?�]��V��@ 	|g�޷@��s�y�@\'Y\R@YO�=)@���jY@�O�@d]P�|�@fV0��@��%���@�d��R@T��L�@����V@�A!��@!`�z���@"��k��@$�9�B�{@&l�c^��@(N����V@*K3N>��@,c�b��@.�Q����@0vf�/@1���� �@2��B~�@4R-��;@5�g:Kz[@77���@8ĭxL��@:c�&�K@<:�	&�@=��Ņx@?�:��J�@@����r@A��GZ�$@B�hB�u�@C��)�0@E	�r;�@F1�DfJ�@Gd?}��@H�d��N1@I�c��@K<dFV�z@L����@N����@Ox�N�#�@P|i��lF@QB8�K�@R�
�9�@R� &ִ�@S�8�,�        ?+'��]�S?cJ����?��}�N?�wvz�+?���y9
>?�I�=r�
?νr�)�?٥j�~M?�g�K��?�B$-��?�-�}�xo@ ��V��@y�M��{@�	!�N@��Pl�L@����@"��Ӎ�@'��	Q�@-�>W�!]@2UC�*2@6k���@;�!�J�@@7[���@C6�F�W@F��D��@JH���M�@Nb�Όxm@Qp��� t@S����-W@V�hs
nr@Yo�F��@\��{�b@_ڛ�Wb@a���ټ�@c�tU�dB@e�W�P��@g�����@i�?��p�@l_Tv@n��I�`@p�ߵV@r$>�P=@s��^�@u��Q��@v�V�}~@x_�j@z��h�S@{�<7,@}��|���@����v@�� .�\@��f[)q@�#�x�+2@�O��q@��gqS͑@��th�ѹ@��.�@�z��@��s�o��@�a����@��`#7̝@���oc@��T��        ?��G�[?O�DH�E?p��xKqU?�';X~o?�����?�\l]�*?��RƜ�?ҽ��]�?��*C:�?�sN��^?��ʁ�UQ@ ���|�6@A��+-�@@
W��@�N[v��@ $0^�G�@%^�.���@+ū���1@1��-DX�@6\���@;�W~�B|@A�Ϲy�@D����V@H�h�P�@M��ez�@Q�yr�^c@T�ςZ�@X��mj�@[����j@`�OO@bi���$r@d�0	G�@g��g]@j�yU �@n+��@g/@p�B/&Z;@r�ꓼ��@t��"�R@w%\[e2�@y���8�@|��D{�@~�?�n�@�ء>ｼ@�`Φ@� /5U%�@���D3zl@���X�@�q����@�uϿϗ^@������@���&��q@����f�@�M��
�@���8�@��\\Fk�@�W]��f�@��L�7J�@�W~��j�@��F�N�@���3��~@�Tߌъ�@����KY@���W�Ҝ        ?�#�}�J�@6�E�F@(�_�*�@;{Θ|@@H�bވ9�@S��<�@\uY��)@c���t�T@i��6g2@p��Gq��@t�Q��@yU�5��@~�-SB@�{d�@�LS�Ӷ�@�̂�/��@��^��'@�o�5tke@��.ߛ��@�G�`���@�	��W�@�
Gg7�@�L��@��B ���@�����v�@��ڼ��@�$A�:K@�x�ĕd@������@��?��y3@�Ϧ�Q18@�Y�%4�B@��O��:�@����:G~@�������@�}��@����`��@���8 |@��t��ζ@�-r�Q�@�n���K�@ÿ��4@� �QO�@ƒ�{@���w1�@ɪV��W�@�P�Lt��@��*���@�ӆF��;@�X���^�@�Q����@�S�̬@�`S�p�@�w�`c�H@ՙ���o�@�ƚ�DlV@���h��@�BϦ~f!@ڒm��P@�� A���@�U�1꡵@������@�%(��z�        ?Pb4A.�?��Wg���?�6���??��!���?ͭq��0d?�x�u�?�N&�do?�'���?�!l�}O?����%b?��峕}
@y�1��@�lDh�N@���<R\@�!;��@�N��Im@��F�!`@r�z#�z@�=�Dl@�eG�@ n��3�P@"xfٕ��@$�����@'���,@)���I�@,B9DK @/!L<�gt@1��!'@2�����@4g��y@635�9�@8p����@:����@<&SD��@>Sm��mA@@L޲Rݟ@A|�s�8E@B��W���@D����@E[��ꇀ@F��`8W�@H3�S@_j@I�M��L@KE'����@L����BT@N���J@P'��G@Q�XHC:@Q�U�]:u@R�;�(�@S���w�O@U {a8''@V/x�@W/?с@XTVb�@�@Y��)B�*@Z��#��@[�*!��@]F��%��@^���/m@_���C�@`�JGN�@ag=�x�p        ?Aeᱲ��?|�62 2�?���正�?�5�7̷B?�Ic'�DJ?���'o�?�.��x�?��ѭ/�?�s\nլ?���L!&N?������@S_��B@��3�@e�b�ٵ@�x��ϫ@ ��Q���@%,����@*�'�R��@0���N�@4jse��@8�6/��j@=ԗ�]�@A�=�?�=@D�5�^��@H�Ѡ��s@Lx���ޟ@Pi����C@R͟��:f@Uie����@X?`���@[Q���t@^����?^@a4���@ch|}��@e�{�n@g;qAD��@i�*�L�@l�u�sb@n��kK�-@p�c� �V@r&����Q@s�`Jl�@uN�UƠr@wȊN��@x̉'��@z����#@|����B�@~�+��2�@�lL�nVm@��Â�/9@���g;4�@���/֤ @�6s5�%�@���"HM!@����@�Y�jꔮ@���n,l@�b����@���N�OB@���q�P�@�����6@��g�!��@��Wi�`        ?2:�ہ33?ghu��?�h2��?�>&F��?�'�2PV?���j&$?�j�`��5?ۥ���F?�F,�<?����{�?�E��
@N@�es<��@<��@��IH�s@/�	3�@$��+(d�@+�����@1�(<H��@6��i�F@<)e�J@AN����@D��ލ��@I&�-���@M�o��X�@Q|@2��@TT&G�+�@Wpf���@Z�b�AΑ@^{{��o@a6����@cTm�bB�@e�*��JU@h��w*�@j����"}@mO�Ib��@p8�y:@q����;@s?s4m@t�`���@v�-[7h3@x�W���+@z�_�N�@|��	~Z�@~�V~{@��~A�/@��wDO�@���0�&b@�E���>@����[
�@��<���@�~ �p@��2�@��{�%
^@�D�@��X@��
H!�@�e�I^�@�UE��@�N����@�Q�J�n�@�_��3TV@�w��e�;@����,@��W��9�        ?�[� �u@?��Җ�@7[؝99�@L�֔T}�@[�"���0@f�<��ab@q���@w�
Uuk�@���I�d@�C�k	UY@�O-j?�@��3#�D�@���C�n�@��?
�@��V��9@�� �STc@��!��@�p<(� @����O@��ܞd��@���8y�]@�����@� {w?q�@��\d�=@��'H{@��K��b�@�E�ۿ@�Eq�n��@���m=�@��?�<`@�`TǶ�0@¾3���@�+���@ũ�P�u@�8��F�@�؛�&@ʊr}���@�N��Y�@�%�aA�@�N��;@���L@@�.L��@�%H�S�9@�DB
��@�nlԔ��@֤Ġ}@��p6��@�37~&Ϯ@ڍD'7V\@��	����@�gϖ�K@����4�@�;�0i/@�	�ꅔK@�ި��f@⺉;hx�@�er-u-@�E+�;8@�x-�#�@�pY@�ox�Z4@�uL��Z@�!!�/:        ?K��l���?~����	?��5���H?��Ù�hI?����ײb?�gO۵*?�x0�o�(?���:��?�4�T�\?�ZpEk�?�,_`L�?�"�j�?�Ӳ��H�?�2UjHe?��k b1�?�
gu�C�@ �E���@?g��$-@����!@�>�Y@����@ke�6�r@����@��Wc(@�,��u@�2����@@Vb�q@��t�u@�����@!0<Zs(1@"�h�q@$P����@&
,�k@'˕,7)1@)�R��~�@+��0��@-���tf@/�"���@1��L�@2F���@3�xY@4�'4z�@6#�~I�F@7���y�@8�y��x%@:v��)ފ@<�=�U@=��>A+�@?@�R��(@@y�<��A@AZXs�	1@BAYì��@C/�0P@D#dnD��@E���b@F �!�4@G)w$��@H9�ҡ��@IQ3��@Jp��9@K��w��@L�؟yDA@M�1W�        ?n�S�R?I)e��)?m��I�ڳ?����??�,�%��l?�8�k��?���5��?�!pއ�?ׁ�c��?�l65��?����L@?��]�(�@a����@��Epk!@v-��r�@��I�5@��_eE@% �T0@+"�j�/@1Dj�(̘@5��S<�1@:�u���@@xc�z�"@C�44�*@HIehE@L��?;�@P�9R4�Z@S�!�m1@W�R|9@Z�c�9R@^���#�@a��7���@d��Ϟ�@f������@i���@ �@l��ObG@ps����@q� s��@s�c��-@u�?ֹ�P@x9��n�@z�6�*8�@}(� �?@�Yf�@�Y����@����7�F@�n�I��@��b���@�����@��W~{�i@��zpA�@����u�@��㗒"@�� �&@�	X�	@�5�����@�m�@�|6@��a�S�@�\eT�@�`A*	�G@��)��(�@�A	 
MA@��-���        ?s�K*Kk?H=+!�c�?j�Ϣ`sG?�#Er��Y?�N�2�w?���(�zc?��2Y�0?�����?ښn��?�RU�7�?�ܾ�7��?�pq/bX*@U�<7c�@4�GU@f\�9�/@�&��>�@"����e�@(F���j@/<��=&@3�!��@8�%`e0@>���N�9@B�!y���@F��R
�+@J�DS@�@P Er�0�@RԀ��)�@U��s�W@Y�^E��@]_2!@`�o����@c!�k8�@e�僼�=@h_!jG&@kM�m��:@nr�4#E�@p瘺B�@r�����@t��A3N�@v�)R8n�@x� �"(V@z�V�@�i@}L7�x�z@������@�(��� @�� =�@������C@�X��a��@�ڰ!'�@�kX�|N@�
�P��@���?�@�u��e�@�Adi�@��*l�h@��?�x&<@���Y�@���K�R@���-QV@��L�v@��O% |@��2�[�@����G        ?�¦��~?�S�yE@���C@)��l�E�@7�G\W�t@C~�i�L@MU���t@TG꨹_�@[{�a� @ayR�ð@e�@�v@k��8*�@pk�Ӆ�j@s�ka�r@wF�"��@{N�ml��@�?g�.@�]���@��|q�@�N��i%@�U����@��
r�G@�__�mL@�u#���@��:�T޳@� �W���@���\$��@��^O�'�@�<q��й@���T}[*@�~����f@�F֣ F�@�*�F)�@�)G��{�@�E_'/e�@��C��@����U�@�&��䱄@�q���1D@���%���@�8p��Z@��r��\�@�?dۮ~�@���>�@��e�$��@�G�l�!�@��v��@�{�SBE�@�t�~�V�@�v$,]f@À;�R@Ē�8�@ŮX�\�5@��ne7xV@��AG�b<@�4���b@�sW�<�F@˺�����@�:U~�@�d�[\b�@���KX�@КJ�2��@�U�uY�'        ?J9���e?z��J�?��ֻ��?��N��?�!^�&[?��8g�?�-�5���?՜(�P`?ܟ�!g��?�Q��׺s?��^:��F?��C��>L?�a¸?��sAR�?�#�e���?�ѥ��&\?�ղY
��@�����@�^1i�@�a��=�@	R��1=�@N���d�@�����@v���%�@I3���@9��.(@F��4��@r�q	@��`
@$�Û��@ V|-�,�@!�[� ��@#G:�[�@$��Ε�0@&`!1��@'�M�A�@)D��V� @*���(.h@,�e`�E@.�(f��u@0K�-#J�@1M
�w@2W�J1�@3k�?�@4�={��@5�"6B�@6���m��@8����@9^3����@:���	A�@<�lB
�@=d,��j�@>�qe���@@"f<�I�@@�%/�v�@A��&բ@Bp�VU�@C?��(�@D�y��@D�L�@E�G�O�@F��^��@G� jd��        ?W[9���7?��G��|�?��Yw�/�?�j�^8�?�bz��,?�<�gA�?�L�t��:?�Z5�[�?�XX9N�L?���sU)U@��`��@�����@]��S@* �]�l@���F1@!�N���@&�K��S�@,d���m�@1���)�'@5���ɀ�@:r��i@?�u����@C��,@F��Ӡ2#@J�@�GEZ@O��l�W@R/9���@T�7�F@W�n�@��@[04i2k@^�Šr�?@af�����@c��Y�%@eޙ�·V@h]��~�Q@k
�]Z�9@m�Jũ~@py�"�
�@r��e1�@sЃ���@u�n�p�@w��L޻�@y����@{�����d@}�X-�@�iU�X@�O���ٿ@��pIu�~@���� �@�;���@���5�@�q_��@�����Pf@�"���1�@���)��
@�^�Rβ@�E
��|@�� ��f@�ȐN��=@�����@��J���@����1�@����	z        ?-A�I�u?`vr����?����Z�?��:�W?����`N�?�'|԰?Ŋ�1��*?�,g��W?�d "�܏?��%��?�`T?ׅ?��RhT@^W��}@	����@�fGA@���\�=@Y�����@$V����;@)����8�@0ZK�ʘH@4PcRj�a@8��Z��@>=a��a=@B&���@E����N@Im��C�@M���Go@Q:Tr�^@S���@V��r��U@Y�o�N@] � �@`^�btE@bM���Q@d_��P�@f�In���@h��K @kg���M@n݉"9�@pdke���@q�$���@s^E��̠@t���s T@v�d�R:@x`��c�@z2&vj��@|ݗ�l�@~�Tz@����s�@�ttyO�@�7���,~@�[�܎�@���Y��@��C���@����q�@�XW�%�#@��k��U�@�>�ĭg@��!���D@�g<�a@��d�^|�@���qR|@�k�c��-        ?�y����@�v?N�B@,���"�@@��m::�@O���*k@Y�	m��@b���x�@j:��Cx@qX&�m`@v#H�C�@{x�y�@��]h'y@��F�Mp@�V��;9i@�s�L��@�#��J�%@���§�5@�ڬ���@��"�@�G��[��@�#���-5@�/�G��@�5)�,@��\��3�@���5Xb�@��p���&@�� ���@�����s�@���7��.@�L{5�ٓ@�ݡ��@�#�H��@@�x�*���@�ݠ\��@�R9��%8@���_º@�k����!@��9��@��Qk���@���2��V@�0���l@�#X�D�`@���o�@� ���@�+M\3t@�>C����@�Y��Y'0@�}���(@Ȫ@�
@��ʯ��@�Qu���@�e��@Ͷ��c�@��`�w@�9�3>�~@��h�4�@Ѫ����@�h_c�%@�*��|�@��/��@Թ�&��@Յ�]@�TK���E        ?o��i���?� !l�!w?����?�G�d�N�?��K���n?���j��?�����ޘ?�V8����@���YRa@���f��@<^�y�@V4�1T~@�gMy
@�F6��q@]��D�d@!k�]P@#�(��4@&����P�@)�SiCF@-CT�c1@0z��Ǖ@2x��P%=@4�`����@6�uB��@9[�p�ά@;��W�c�@>�Q2D�@@�o�H�@Bm��"Z�@D�A>@Eׅ���@G�v~�,�@I���&t�@K��+ u�@M�3��y@P|��C@QNY�U@R��r��@S�3�G@UY��gp�@V����b�@X`^h�l@Y� �(��@[��D�I�@]]>i�@_$���@`}�	 ]@ap���[@bk��q�1@co*�C�@dz�1>��@e�/����@f�ց$�@gи�B�@h��Hh�8@j2�����@ko_�)�@l��
��@n Q�O@oTo%Y��@pX%f۬�@q	����t@q��w�        ?gۘ�\�a?��x��e?�����?΅�����?݅J�8D�?���"�?�=��?��ə���@������@����>@K���%~@�< 6U�@ �\���\@%xfm�û@+4pW�D@1.�1K�@5�S�<@9���"�x@?�P
@B�LL��@E���'�@I׻s!Y�@N�ْr6@Qj�	�̻@Tmj(�@V�Ift�@Y�eX��@]<�AI�@`j�zYM@bZY5ϋ@dmުo��@f�{�l��@iT���@k���N @nE�b~�e@p��M���@r�"��z@s��0�E@up��
�@wAz��@y-��:�@{5�㦵
@}Z���4�@�#xt�@� 4��(@�Ab�0@��
9�:@����4�&@�i����@��V��#@��J�|�b@�1��K(@��ʦ@]�@��\�L��@�S��`��@�P�!5�@�X�m?V�@�k��/@�����0@��6 ȟ@��Dc3f@�)i��F@�v��Z��        ?yf�b�6?�SP{fJe?�HS)��?��=� �?�Tڙ�?����}?�̵?��;��ĵ@��� �@hX���@T�j��@���@!a$�D=@&���ks@-�>�pd@3����@8!0Y@=�Ç��J@B^HMG��@F>ҿe�@J���F��@Or
zr�@Ra���dI@UFqN�u@Xd`L#��@[�@��@_Id��@a����q@c�Ϩ�W@e�9�qt9@g�t미@jVSH�%@l��ԫM@o:�
�@p��v�@r.�:�:�@s�u���L@u��w)p@v���==@x;����@y���ݦ@{��Pn@}h.����@B?�rm@���A��@���8�p@��?^:/@��˪@��
3�@��Ȍ�@��@�I�ұ@�@��&m>@��/�ȯ@�.���t@���ܘ�3@�K��Ͽ@�>��]Oq@�@��X�@�Τ���@��WC�2@�z�g@�\BN"u        @ �%�+@Ba��Y@`NOJ��@r�d%���@�8�r�o@�S����@���^A�|@�p��H@���ЖD@�i�ј�&@�����,$@�¾���@��^sf��@�}P@	��@�P�;|@�v�RN,/@��>��p@�b���h @��r�U'�@ɿ8�c�@̴�*�Ŵ@��@��S�@њ�:�,@�`D���
@�@�H��@�;�l���@�Q�g!B�@ۃe��[.@��;��`�@��O@�b�K��@�R�}�@��!1@�$�Ѷ@�!,O~u@���a|n�@�{���A@�L��,�@�7�M�'�@���e@�+�̿��@�D�����@�h X݀�@��@��D�@�˭T�@�>��D@�S���@�����&H@�x�p�@�f�z���@�Նb`�@�N[9-/�A h����qA.��n�sA��`�A���2�A��N���AxLV-BAV��n�A9iw��A ��ڙ�A&B\��A��k��        ?Dj�jt-?w�\�;?�zA��U?��6�$�?�'R����?��d��*�?����΍?���t?ܒ�Z�s�?��&O�?��:蝸{?��/;�L?�P�|�h�?�** /.U?�} ���?�P�^0^@T#o�=�@D��wj@{�p8��@���"��@���?�@��<@X�m�V@i��=m�@⤔�f$@�,�"}�@D��@ ��П�R@"����@#�V��@%T��"�g@'���Hb@(��v��@*����&�@,mV�mD�@.QB��Mt@0 !!Z��@16=,&@2 b��@3(���t�@48J��@5Nx��6@6k��G�@7�:��O,@8��%�_`@9��v�4L@;4:Od>@<}
3���@=��r�@?-��j@@J�|��d@A����+@A�Y�\e@B��J��@CY�AD�@D/{�1�@E�Br@E��K �@F��<?�X@G�9���{@Hح���@I�'�9@J�%���C        ?[i��|?P��M���?s�&�b�?��dR:v?�+&��+�?��[X�e?�Hxs�i?ӨB��?�G�����?��6@�?���JF�@��L���@
���,�2@*
2Y)�@�,-��/@"��N�j@(�f�cRt@0y�d@5_��R�9@;Mt��gk@A0�ZZ�%@E]C�'��@J<�wGK@O�U�Xd@S)�SR�@V��.�:|@Z�����@_�ε���@bb���gj@e>���v-@hd�g�s.@k�'�)��@o���zۅ@q���p��@t�L�E@vpp�(�m@x��[�b@{��7@~��w��@������V@����Z<�@�C&�`��@���A:@�G=��@���[�@�,zu�y@�c���ǲ@�YC;���@������\@��s�rT�@���]ۖ@�k1i��@�ˎ3	�&@�6�%���@��6,�@�+�Y)@����nQ@�HCޒ+@���d#�v@��I�Z�@���&�h5@�x[�x�@�X]�%?�        ?$�E=�?YHG	y�?yǅ�x�e?��ă#%6?���qX� ?������?��a]�D?О~ ��?�*���5?�`��%�?�k���q?��/��-�@a���a@u"��h�@�Y�G�@�����@ ��4�o@%�J�� �@+�����L@1�&�g��@5�LY:@:��	�J@@#9��H�@CT�ț�@F��AT2@J�xP-}2@Oz�4��@R:��;E@T�)6k��@W��`��@[?&�րb@^���l@aOf\ZO�@c^@��=;@e���{@g햿�p�@jo];^.B@m�iS��@o�牍�@qq~ �	@sa��@t��68��@vaN���@x/���M�@zZ֎��@|	�=%C�@~��]8�@�n�=�@�6>[�Yi@�[u!�jm@��\Jó@��-�F�@�	�\D��@�X�/0�n@��E}���@�LNxL@����k1@���ɕ�h@���[=[�@��y�%@��Ye�\\@��'��@�}_WQA        ?��ul��+@ �ﵸ	 @�T��@33�;��@BLWI=�@N@@�F�@V��$�@`*oZ�@e�T�4�@l�ɛ�@rT�|��@v��y:�l@|=���q@�&�z$>M@�����~@��凳@����%�c@��v2*X�@�ζo
�@��Ue՘�@�qR���@�L�/�9@�DD����@��"F2@���@��/M�t�@��2}�@���h��@���кX�@��Aϥ�@�`^r�t@�0��f�@��Ƶ@�����e�@��x�8�@������T@���]��@�V��+@� ��y@�8ݜ�p�@�W�̶�a@�}�j7+@ƫm8N\@����@�!4H�ѫ@�j�Ɵ��@˾���@���)�@ΈڕϠ�@� Q3o��@����(�@ь���J,@�]�v��@�7<��{@�˸��@���3��@��l��`@��M&��@���]PZ@�w% �_@�-]�e�@�U>s��@܇�tR�        ?_��!�?��KY<�?�X{�7.?��W�F\?� ��P�B?���V.R+?ވ�a�j�?�M�e�?���Ԗ?����]�?�3�J���?�0�~�t@ G�z���@G4x��@�x΄@
!+{���@��k�s�@�!���@S����@����7@Hǒ��1@ ��P0�@��Ԗ�@ w���ľ@"��xJY@#�M�Kea@%�S�?��@'l$�[/�@)b^�)�Y@+p���@-�����@/�
�/�V@1,(�9�@2UC�.��@3��@4�٨9@6Y�
��@7͌Jk@9P+t���@:�2�3&�@<��R�/@>6$��@?��n�H�@@�
�ż�@A�?3ˎ@B�,�nZ@C�>��@D�R\ ��@E�F3��k@Gq���k@HHe8�U@I���Z@Jt߰�@L�����@Ml�.dT@N�GJ���@P$&��
@P�j;+I,@Q��T5�@Rw���@SJ��@T$4��@U�pN        ?���O?Rb��l��?v		=��?��k
e?��-�L�?�Ĥ�G?�>�:�X?׊d�X��?�����?�AV��?�����I�@p>�~]h@�/��v�@<U1�t�@QTl�0@#�� ���@*ӥ��@0Ғľ��@5\��t'�@:������@@qZ��k�@C��e��@H�&��\@L��Y��@P�%e1 �@S��d��@V��$��@Y�� ��@]tq����@`��&��@b�9���@d�:��5�@g5��V˟@i��h�&�@l9�<�*$@nꍬ�H@p��`�&�@rSRf��R@s�J['@uj��Ȧ@w<�@�@x���ө@zt1���@|<b(�*G@~�F��@��s�ю@���U��@��ʆ��@�����@� ;��ӯ@��b�8�@�+�S �@�LU����@�s�>��@���Ėx�@��.�y�@�F@�Lq@�]De��q@��cR`@� �G�<@��}�6�@�d|e�	�@�����        ??B��s�?p']�n�?�H�8*�?���	�*?�܂	�>6?ě�K���?�IH��?���j?�<*���?�2Vߋ�i?��ϟo�@�����@��a��@���>�@{����@ ��#��@%����>@+�ـT�T@1b���j�@5�zs��@:CF��b�@?��jp�@B��<kl@FZ�;��U@J,p#���@Na�}�.�@Q~jҍ'�@S����B-@V��/�Y�@Y�-���@\�E���@`�N�0�@a�@�9|*@c�V���@e�����@g�v��RD@i�plGj�@l(�Di�@n�j��@p�ܹ�s@@q��?�0@s%����@t�.�> @u��FW�@w}�et|�@y	���@z���A@|N��[@~�C�:o@���t@��OX�]M@����?@��g�\a@���Bn�"@���|@��.PLS@��&�c��@��\�-A@�7χ_�@�j�K',@����n�@����F�@�;~ #��        ?ܚ�g�,@�����@'��CO�@;�$-!�@Il�� �@Tj�O�Q@^�W�@d����F8@knj����@q����:@u��� @z�,, �;@� �a��@��m��br@�*�81�@��E)��@��}
�F|@��ٶ;��@��"U-@��O��b$@�7"���@���EvF�@��$C��@���F�?@�-��$��@��R�_x@�����l�@���J��@��3��bR@����H�@�g�Z��@�jx$�W@��0�c�@�Y02��@�j(�^��@���f��~@�c��EJ�@��§;�x@���h�h	@�U}���@�����*@���$+�-@��ܱNO�@��.QV!@���a-�@����B�@�(&͖O@�N��#� @��D�O�@ȼV�V�@����u_@�Y�&�[`@̼Pj�mv@�,�����@ϫ+�#��@Л�-F:D@�i=q.'v@�=qPF�@@�c?_}]@����2I�@��5A���@��ÁDX@�Ƌ�Y�        ?3}P!e�r?f5��u��?���\}?������?�	c�ق?�׈<!�?�{��\r�?�;�u'?�� ����?�l+\n?؆�It4�?�Mc�@u?�c��Ji?���x��?��5� as?�`M�Ř?��=å�?�7�(��^?�yfE�J?�'�w}?�} �8>>@ ��n@wW�")�@�CVՄ@��ߗ@	4��]@��(���@J$Ô�e@�G���@h��ð@��	��@S��|�@J�@��v��@���G@��`sCY@�����@ ��n��X@!�V±@@#���J�@$^��^��@%��m��@'%^���@(�AvE@*.-����@+̋����@-|�;�|R@/?$>d�@0��V�@1}�����@2{*���@3�3Ǭ	<@4��p�@5��{k��@6���5@8;����@9<:ܦ~@:���U4�@;Ёyih@=+��S:�@>�9�7]�@@d�(��@@�Ġ�4�        >�Y�N=��?6^X �е?^T�e���?z�D+�j?�R�S��?�n�Z5�?�\5��E?�`�ؒ�?�O��U?��P.��?��.�?R?�������?��G�3�@\z���@[�@�@���@�����@"; @'�hװ�@.:���@2����@7�\b�@<�@'�}1@A���	Ɏ@Egk�N@I����@M�]�,��@Q_�n� d@T8��� @Wa6�Q�@Zܩ��}�@^���
f�@am�C߂
@c�q_@f'Pp��@h͜s�\�@k����Q@n�Rv0�P@p�r��@r���l[@t��pH�@v��2�*@x�x��0�@z��`F�@}x��+`@fe	�ju@��V�#@�DNa��H@��>||�I@�K!�>@����\��@�L^�-Y@���Ld�@�c�3x�!@�Q�(�@��-Y���@�c��0�@�Y��t�P@�Xp�2�n@�_lC}5�@�n�)�e�@��e_T+@��
_�g�        ?$��HN�{?W��Y/5�?x��<"�?���n�?�3)�U�?���R�{�?������(?����?����m}�?��q�Wz?����B2M?���ES�?�?�)���@���@�ap/J@����O�@y&��pY@!��j��@&����e�@-	��R0p@2�9��@6A����@;����7@@E���Ef@C_&�(�U@F��?�@J�*�I�>@N��@�6@Qֽ���,@Te�5	�@W,D��W@Z+��ڊ"@]dS��-<@`k�x���@bBF��EK@d6u��/@fHE��sn@hwց���@j�@�ixC@m0�7�j7@o��9@q0ƽ���@r�� ��@t�ٵ�@u�<|��@w�6]>@x�d��&@zhaT�I@|(,P�~�@}��v_@��Ո�@��+%;Y�@�䵢�ɾ@���_od@��ZЁ?j@��"Q��@�=��P@�iv)Ͻ@����R�@��&&&$V@�&ǀ5��@�y)���H@��z��u�        ?��{2}r�?�n(!�b�@��)�x@A�����@(�,�;��@5����v@@5�8�O@F��z&T@O>nC2C@Tw�,1:�@Z4짱�@`E>�[*�@c�ʃ}�L@h�/<T@l�3z�]�@q��:un@s�W��_�@w14�c��@zď-n^@~�����D@�~�3��@��*t�d@�]@! @�����]@�����@�;�-_��@�Q@Z� �@�"�iOD@�o�u*�@�!Nɒ�2@�O�c*�*@���.oYz@�<�?K@�M��!�7@������@���\�@���;��@�3q'��@��hC�@�\�Dj|8@�
-�1@��F! #�@�֫�"T@�hW���@�oe	��S@���*޾@�����
@�Õ���G@���&�M@�3�|pg@�|]]�ޤ@�Ѯ�"C-@�3^�rY@���XV��@��f�@@��Ҽ�w+@��&U�@�p=|r#A@�I����@�*z~?:@����@���a�@�� b�9�        ?l+8���?�����A�?����'L_?Ə�w�?�|��=?���<H?��?
(�?�0��Ai?��_`$?�_U�?�Ǻ>@
o�b�@�77̄@	L-��@j��� @�j��@W����@��?��@���j�@���xL@�R��%@!ȁWZ@"�,rМ@$���@&�K^��@(�ci~W�@+�y�@-i(��J@/�X�{�j@1.��pK@2��W�*�@3�>c�b@5P�kyZ�@6�'�!@8\D�4�+@9��Gr�@;�	�i�6@=^��R'�@?(�@�V�@@��{8�n@Au=�R�@BqA��j}@Cut�`q@D��D���@E���W[L@F��d �T@G�-� P�@I)F/@J7�&�l�@Kv6u�@L����J@NE�� @Od"�\�~@Pb1�ᭁ@Q}<W%�@Q����@R��4q!@SLR�O@TH�~n@T�s	x�@U��+(Ɇ@Vy�䰼@WO��u��        ?N��*�?T��_BD�?ySj�R�?���j��?��fn.�?��]�c�?�^�,װ�?�\�k���?��c-)׵?�Y���?��9V�?�5 ��Ҝ@��.��_@��g@����!@F/��C@!���x�@&6�Ӕl@+��:��L@1�+W�S@5�UA�e�@:~_a^�;@@
�o-�@C;�D�V�@F���
{@J�~��q�@O|S[��@REi���@UN8��@XP��B�@[q<��A@_R=�R^@az�D�P@c�J�WG�@e�u�4Z@h:�zq�@j�����@m~ۏECt@p.j��%�@q���]@sH�V���@t�Z�t@v�[|�ޭ@x�\8�N�@zpq$
�@|lz�kb�@~|T��')@�O� ���@�kio2k@���b�s@��I�%�`@����(_'@�9*��@��1��#�@�ؑ����@�6Ej�g@��O/xW@��f�@������@�g�e��@��Ҵ���@����@�g+9��q        ?W[E)�n�?��n}d�8?���W[?� ��� ?ˊ>�'T�?�A6�V�?��<��	�?�{�n.�?��z�"�@�����@	b��	�F@�X�@�����@ ���8@%��2�@@,in�\��@24rpqn@7 H�@<���{j@A�1�@E���#�@Jx�҈@O >_�$�@Rs�N���@U��7Ed@YV =���@]_¨�@`��,��@c_;����@f�pχ�@h��_�0@l)&�m�@o���qɉ@q��R{Ƽ@s�C����@uƃ�zF�@xw5)�@z};�s�i@}�a�<�@����;@�^��B�1@��ۊUQ�@��$�z�R@�C|��bE@����O@���;�d�@��]_��@�uS@�&�T�6G@�O�@�^@��=S�Z@��%�+�7@��z;�@�|�~ڷ�@��i�M@�k�D�3@��K!��@���p�O�@�F��D��@�ves^�@����P�@��wlV�r@�ѐ�}T{        ?�/�',��@�@H|5@8ĳJ��@K��"c�@X=;+N�3@c4�
<�@lj
Y�"@sa���K@y����2@�p�.@��@����a�@�'{2�@�I8��F�@��� �<�@�����@���t��@�@?�|�3@�'�3�:�@�\t�+�@��1έ)5@�O��l�@�����l@�e��f�@��G�S@���%�q@���c0�@�r�����@�q���@��F*K @��,�D1i@��� G@�FD�O��@�����m@��	�Qv�@�MӘ�H@�èS3�a@�J �,�@��e4؞�@ʆ�nK�@�=b`�N]@�r��U�@��;�%��@�����w@�ߗ� ,�@��c}d@��tT׷�@��!{�@�.��@�Y!��@؍�k^�@��G.y�H@���gl@�f׀��@��*$�G@�)`n�|@�L��	W@�
/�n��@�̜Vr2�@�5|��@�a�z�S@�3"<��V@�
��f�@��p��"�        ?Q�� ��?���T��?���Q�T�?�*���?� .����?�����0?�̬�F��?�+���\?�!q�y|?�4��d5?��CG�?�m��	?�i�*�8�?��L�<�@ I�kg@��3�@��I?�@�n1F}�@�����@�#����@��T��@�.�\�i@���ޙ�@/E�bz�@�T��T�@J��,�e@ ��<@!��/���@#��
�@$��'G�@&�Q[F�@([��E�z@*J��H+@,Q\��m�@.p���
@0TpY�ze@1}��Yr(@2�$�(��@3�2��*�@5I��bp*@6�W�X��@8��&�@9�t3q��@;;=ؾT@<���n`�@>U�{�|@@G�%b�@@��S>�@A̗�Y�@B��'
"~@C��(��@D���$l�@E�A��q@F�L��^@G֠߷��@H����@J>sL�@KCqΈ�@Lw�1m�p@M�%�XS�@N��*�V�@P"�&.G@P�ɗbMl        ?9�N��?q�j'
J?�~i�bu?�̗*u��?�%���?�
K��?�XG�5�?�P)��`?�,�.�9�?����H�!?�{Lv��:@����~b@FX�6�@��ںS@��	���@ h�
)[�@%=v��}�@+X��@13�w@5"���i@9��@��@?~�(>Y@B��3�@F���Rs@J�"e#��@OJMu���@R8��) �@U�aVb�@X=pZQ�@[�I�[a�@_����/@a�7�1�3@d0�$x@f���z@i����@k�SB?�O@n��q�ޕ@q?%l�@r�>#�|0@t�e<jx�@v�$P}]0@x��U�i�@z�چ��v@|�b���M@T�^U@�����mG@�3��3�@��f,�;@��[wO@�n��ǡ1@��N�C@���\�T�@�*㝍��@��\�P��@���'��@�3:�6�'@� vಔ@����@�� ��@����uU@�S����@�)�w0��@�@j苨        ?Mή�S?��V|(?�d���?�Q^wMr?�n���?��2��x�?�{ړ*D/?�7�we}?�XG�?�s.�w@ ~���@��ܙ7#@�����@�~ҙ��@��p\�@[�M��@#�A9�@'� |���@-#��D�@1����<D@5j9��"�@9�u��P@>i�]�G@A��@ev@D��k��@HU>M	�4@L�1���@PZ��@Rga��a@T�Q}�wj@W�di{D@Z��DBR�@]�^�CId@`�%ˌ��@bq�6Y��@dk��9H@f�r"�E)@h�z�$z@k,��Ҋ�@m��2c�.@p3CX��@q�ۧM�@s�ʋv@t��+��@v\k_�vf@x�5%	H@y��l�4@{�V���@}��Y�@�g9��Q@�#�m�@�>�����@�q��I�?@���^��E@���#�?@�Y�}넺@��+�wI@�8��8Ǉ@��K��k@�P���P[@���z�E@�Q�b6�x@�2'at        ?�M�FP�@67���@+��M� @AagAu�@P�9~w˼@[�����@d��	c(Z@mu��و�@s�Pw�O�@y� a@����@�����@�Ȫ��џ@�3�.t�@����t�a@��VP<Y@�净��s@��w���m@���~J@���yw@������@��Q��@��8	���@����:�@��S��(@����n4@����@��9�W@�V�l�R�@��xJS�L@�roe�}@����ϩ@����m��@��g ��@��!K��@��6�<��@�`�J���@�y)��U~@�_+4@����]W@�	�^vl%@�R3[=�z@Ǧwd�A@��Rcd@�st<�܇@��dq���@�q�!��@�ᙈ3@�Qd!�@�'\k���@���P �@��QU�@�ы5��@���$_��@ջ?���@ֺ��g�[@����{�@��$t �v@��U��`@�Y|x"9@�*O�|̰@�XT�jD�@ގ��#�        ?q�)��g-?�P	?C�?���p)��?ӕ"EO�?��^�|�=?�ǩ�	K'?�fI��?�$ތ�9�@B
��/�@��/Te@�0��@��>�@n�3�@��><Ol@��G�@!�ȏt�@$w��D�@'=�)�@*4;��h@-Z�^0nF@0X���ˡ@2
��9@3���@5���E�@7�µ�@:(��� �@<s���G@>� e��@@�?�P-@B@oщ@Ct$��=@D�o-�JP@F}�&�Ĳ@H��u�^@I�\���@K�T�.-+@Mv�St�r@Oe,�=�v@P�Wjp= @Q�o O�@RЮ ���@S���?��@U��W^�@V?/O�:@Wt�{��@X����^@Y��H�u@[C���j@\�S1�,�@]��E�@_S�vk�!@`]�}��W@aU=�O�@a���6��@b���0]@cN�p��@dW��@d������@e��@ɥ�@ft4�H,�@gE� "�@h����"@h��&�        ?I��U��$?�����!K?����?�k/ѹ�?�@�uV�!?�Z
.�?׉��쪃?�v��5>?�dJ�,��?�_�"`?�B��M�@i�#��@����R@���`�@��*��;@ZΘY~�@!� <�0@&kF��r`@,4���@1�i?��@5���s��@:_f躧�@?�N�F/�@C� �@F��J猈@J��pg@O|僝�@RW��d�@U=���}*@Xt�n7�@\a%}�@_�NQX@b�_Wh@dn���@f�����@i� hsh�@l����;{@o���_.�@q�DQ���@s�) O�U@u{�g"�@w���݀�@y�󋆏i@|1���;@~��\ H�@��M���A@���8�c@��&� G@�+&��@����!0,@�v����@�@�J1�@�2�ǥ,@�,F}:@���K@�C��I@�3�`y�A@�V��|��@��
��m@@��Ʀ�c�@���Of�@�J%.y��@���; �        ?@�\��?p��=�?��aX>�?�&œI,?��Ig��?º3���?�v��Y̴?�!��HA,?�YG�".f?����1'�?������?����yj@���l�@��ڤ��@�8)��@-�]���@ Py�ȩ@$Ҳ;N��@*6֚�Ǘ@0J}�D%@4ߪ߁@8P��(@=A�s��@Ao�0�T<@D���<@H-;���@L'���@PI���;�@R�b��@UiƄQ�E@XZ��oC�@[�����@_�y���@ak�\���@cwn�⬐@e��H�<@h	��Xk@j��s�3{@mJ8�F@p���,�@q��s�uQ@sD�c�/@t��$�2�@v�n�Cz@x�]���@z���F�@|�?��-@1
-�0@��dX�u�@�UNDBY@�L����@��*��+N@�WE�`b@��.R���@���B��@��A#���@�<�)��)@���~��@����po�@�����@���ѷ{�@�������@��S�G(        ?�6�]g��@)�v�p�@GT�*ÿ|@[@�8v!o@i'=��I@t,Û�@}��4���@�b�FN�@��UCT6F@�!d�y�E@�E �G��@�ے�t�.@��]L\�@�1&���O@�)��Ъ�@�]g�@���di�@�vK>�}u@��Q7��@�����@�����Z@�<ž�q�@��2���@�5nT�K�@��ux7��@�Z�,{@���$��(@�io�n^�@��E]p�@��1��@ɤ�/��@˒8�JW@͗�UL9�@ϵ���@���.�	@��;}1U@�O����Z@Ԏ,�"i@�׎B��9@�+��N��@؊��]\�@��p��@�e� �6�@��~	o��@�e�a1�@��X���@��k�뾬@�l��8�@�b�S�@�7����w@���J�c@������@��
�*�I@�����@�2�]2^@�sU5ΙH@�\5A�U�@�G�Y\�5@�6��NuV@�(-B��c@�o�@��!�/@��v���        ?8H"�A@�?o�"�&?���>i�?���
��?�C%s\?�M*%Ә?Ƌ!�5��?Ϛ�X�:?�# j�f�?�L ]� �?�'���~J?���?�Q��?�\Ď��`?����J��?���NA��?������u?�fu��x?���N�@��:1�a@���,��@���*@q�/��@)T[>�@�o��Ƕ@g����@���/;@�q"Cq1@l)g��@L����E@I$���@b����W@���)�|@��5�'�@!4�?�e!@"�u��9@#�|���@%Oy-o��@&�
�>�R@(g�(1g@*�����@+�O�v��@-�F��hp@/�-5�"@0�=	/�@1��D��p@2��VeJ�@4�/V��@5;�Op@6v�n��@7�@�,@9�9���@:t,[��@;�PR�{7@=`5��\@>���@@BQ��=@A��e<@A��s��@@B�.�C�@C�)��@D��<F�(@E�8P"�g        ?&YsH� ?`�H�k�T?�M7��c?��g�QJ?��8G7a?�7�D��?ɴM�I
?�,	�1�!?�Qq:-8�?�*���?�u\u5�@ �3�k�i@]��.0@>�~��z@��o�[@  ��}i�@%c.'�@+�f�J@1Ԋ�J�@6{��:We@;�t��@A&�����@D��y�|@H�J���@M���@�@Qk
21g0@TPE
��@W��8�j@Z��:�@^�e�Sj@avL.G��@c�ݞ�X�@f*�%��@h�(�T[�@k`΃;YN@nKX��|@p�r�K@rVYcݠ@t�70�@u蓍`z�@w����\@y�F��8@|]��r@~A1�aP�@�M	+�@��Q�	�@��U�&�@�%�`���@��o��G�@���rː!@����I@�s=%n@���	�c�@�`z��a�@� 6s)^�@�xR�s@�hs��H@�aR��[@�b�ɜ�@�m��w��@��A���U@��l�p@��?��a        ?.�E��?J����?l�q	(B?����GC	?�;Y&z?��c��nW?�8�̈p?�Ǉ�)��?�R�?���?�{�iÓ?�{m9��?����]	�?�}����@��r@�~'ٍ@\{F*sC@ �q�@!�y��H@&u�|��}@,FV6�H&@1�C���^@5}[!�!X@:_���@?%��ez@BwOs��@E���q�@IJ�IH@MBy�Ւi@P�V�o^@S1�5�Ĕ@U��6��@X��(gVm@[�t��t@^�3݄e@a>	�c�9@c#�>��@e)�s�W�@gS�_��@i�Άk�@l���Y�@n�!Z��@p���5$�@r&�3���@s���ҏ�@uJ^��;q@v�P���@x�g��O@z�=�x@|�nG'L�@~��:��M@�g2�T�C@��8mҿ@��/y��n@��k� �@�6=L��Z@���:jx�@���[;7@�bm�ǰ@���d��t@�tE�/�@�5�)��@����H�h@���\˒j        ?��c�T?����
��@ v��@,F�g�@; �b�@F3��� �@P�ш2@W�%5�@^��#Ѹ�@c��(��x@h�wF��@n/Ex3�t@r(���'@u�,Ba�<@y?E���@}J���@���״�)@�8���9@���_�@��'��<�@��J��(@��%V1�@��!U�@���z�s�@���lw��@��׆T��@����\��@�@,Q�<�@����G�@�$T a�@��o~V]�@���� @�\ι�@��+k6@�ҏ����@��΄t�_@��3GŪ�@���=�@������@��%��@�8ͦ
�@�?��Yj(@��O�`ϋ@�Օ�ϔZ@�7�H)�@��,X�@�)�z@���n��=@�[	o�j@�̸��@�g��q�@�Q��0�a@�D��1@�@�
̔T@�F3�3�f@�T�;h�@�m&��.�@Ǐ#��F@Ȼ��L@���+	w@�1d�E�e@�|"|�	I@��b��?        ?k!غ�6�?��d�.?��a���q?ƫ�m�8?ԩ�	�7!?�r�m�`?������?�x�R��?����5��?��N��Nq@SD��@�cm�@�'��9@0&U��"@�ʝ�2g@�-�E?�@9�H�I�@�X�@(�Y-~@_ ׼}@!_Oq<�@##���^�@$����@&�C ��A@(�'�;@+ߡ�@-8�$��8@/~P�Ph@0��KƮ@2%�z@3iVꦈ@4���ES@6�%
�@7t��3��@8�(,w�@:]G�]��@;��\)��@=q��!6@?yV��@@YO�v�q@A2�6��@B��q;@B�n��n@C����[@D�ϙ�#�@E�}�ǐf@F���@Ġ�C�@H�0���@I����@K9�u�@L*�G�,@MTW�@%{@N�G���@O�onzUf@P~e-�f@Q!��k.j@Qȁ��?@Rr�$ /@S ��ho@Sҫ[
�@T��Ϯ_@UA=�        ?E��+e�?{�8�&8�?��P�5�?��-g6�j?�"<���?�e�X�vL?ۃ}�f��?��}��v�?��T��?�<6;n|@U��!@	���a@�2��@o�;��@ B۫rrp@%B��g@+Yހ���@1UN�v��@5�T�ު�@:�*�9g=@@W���@C�Մ�@G���C_e@Lz�7�>@P�8���5@SJ��"�@Va�W'/-@Y���33@]���|��@`��`�@c�8�@eO���Y@hLS�@j�pQa��@m�MV�`@p�����@rM�۪�@t��g�@vtVH�!@xT�1~@z7O2z�f@|uQd�@~�-�J@����s��@��HP_�@�;\�;�@�����B@���P�@��_֏��@���<@��\ks2)@�1�}_�@�ؑ��w�@����Ѧ@��v9e~@��P�@��@�n��Q�:@�\$zbǭ@�N�7�@�F�,�@�Bn���@�C��W�@�J%!�y�        ?B#s���Z?pb�h�xt?�]C=��/?�`�!���?��)<�j�?��r���?�X3��Aw?������?�ݦ5a?�������?�7�Okv@ ��5�@3t&���@۪�C��@� ��<�@�nQ�5@$'0�$�@)��"���@0�]��&@4��Ԓ�f@9�n��X{@?%�+�'@B̗�vC�@FwxH"�@J���X,�@OAR�ϼ@R8���w�@Ux���@XMv�x7E@[�i�߃@_��u$p@a�#��?\@dP�/7�	@f�H�Oy�@i�S�ȶ7@l���<Y@o�6FͲ)@q�tY?��@s��}�@u�$ַN�@w������@zd���Y@|�+f�&@<�z`)@��2SDl@��!�Z@�o�י�@��v~Fc@���c�C}@�kX\�X@�c��@�uw%�Ck@����Z^M@���(vs@�(��b��@�jF��A@���g�/@�d�-�@�����b�@�	v ���@���X�i@�:��A�@��h7���        ?񬚜�6@�6��a@:����.@Nu胑r@[� ��@f#m��@p�^��@vOS�`@}┸��@�oeiS@��Y���@��9�@�t��X��@�Qp]���@�f��s��@���+L�z@�;Ra�@�}{!r@�x���k@���G�t�@����-�q@��U�@�{�D��@�w#���@�QE���_@����$'@��riv�@����@�T8�T�@����34@�Y8|�t�@��K��#@��̟/�@�����|�@�<��l�@�2���@�/� �zy@�4o���/@�@n�]��@�S��+�5@�n޳w�G@ǑoȠ@Ȼ��6��@����G�@�(����@�j��a@͵n3�%@��&	d@�2��G9@��#)h_�@ќ�*��@�Wv�9��@�M^��@�۞8��@Ԥo��M3@�qʕ�*@�C��Ą�@�G{3t�@���^��.@��z!]��@ٺ9��k�@ڣѰ��=@ےRV�\t        ?G�W���d?x(�^2\R?���Lע?�M�?<ϰ?����c�)?�8M\_x?̂�Me�?��d ,��?�p�H�/?�� &
?�Su���i?�+�o��^?����?�ė&Q��?�1�E��?���nR2?���<�S�@ �B�A��@=����@����-/@w�(�G@e^[��@�グ�W@�[�8@ɳ���@���)EC@Ϻ\�H@�p�@b�x��@���3�@ E�(�Z@!�D��C@#(ܥ#@$�ֿ�Pu@&]}J���@(�k�@)����@+�����?@-íA��@/��Y�o"@0���C@2eɲ�@3A��fP@4t�3�=�@5���׌@6�M����@8N����@9�-�]�@;���Y�@<���i8z@>"}��@?�q��L�@@��wc�@Ab�k��?@B7���t@C�S��@C����d@D����j@Eǐ/[f�@F�h�`�q@G�h�NF�@H����O|@I�N� �        ?/�G��wY?h�X�\j5?�'T{2��?��^K�v?���# �?��	��?�'�a�kH?�9�^g�D?�r[�j�>?��5> �%?���Ɖ�>@ G����@�(��@[f?3@"� �_@���(�@"/�D���@'N\���\@-qޢ���@2[��%�@6��'@;��i�b�@@����@C�8��B1@G��`�F@K��en@P#�֓4�@R��/uE@U���}@X�^�ܹ@\&���@_�{s��&@a�%��0�@d$0;��@f�0�"�_@ik���@k�};��@n�`�Vʹ@p�0 �_<@r�c��@tJU�@��@v#p]�R@xϑik�@z$�~A`2@|M�]Ӡ@~�O��#�@�y,$�t%@���>B@�^lSv@�].'���@��k�$�@�;۴��m@���f�@�@�Sd5�@��{7��>@���T��@�a4�� @��cRty@��8Fyv:@�wbN��@�q��N�P@�s���2�@�|�@�V        ?-e7(��7?\�0�z'?z�#��c�?���e��
?������?������?�Cl�V��?�*�%O�?�RѾ�D�?�!ki��?�>��mh�?����@�%X�z@
�'�[33@�V��g@�8v$�@ �"�ڝ6@%�����i@+��Z&�#@1o�Q�m`@5�Sgv݀@:�!���@@%R>�U@Cd��gT!@G$a�@K6}k7q�@O֛JFw@R|��x�4@UR�W��@Xp�����@[�ϸg y@_�C����@a���4@c����V@fK����4@h�q\v��@k{�y���@nV�F�	D@p�Y�`o-@rL���5@t ��
ڸ@u�u�8;@w�g��@y��7�'@{ư^`]R@}�o�n��@��W�1�@�P� ��1@���[��@�����=@�1��N��@��h �c�@�0�<_$@��*Y+�@�'H|�R@����)u7@�S9E)l@��6e@��'�#@��]�:@��
�m'�@����Yv�@��cc|�;        ?�/4�X��?�G��B�P@:�ġ�@1� �µ�@@����@K�Q���@T�.��9@]�vb��@c_�A�\�@h�`.���@o]�0�(@sF?�c=@wI���^@{�pe|�\@�U.LrEw@��
~@�f�v�7@�L��Mӈ@�������@�d����T@���C;j@��U� 9@�Z�k�8�@�	K�^_@���1S@�SXE�-@�����@�����\�@���ל�@��*�.�<@���Z��@�
���Q@�n64"�@�}�W��0@������@�<�����@����$@�@(�f@��I�AA;@�����@�F����@��i��@����W�
@�u�A5ٔ@�x��WV�@U�iFP@ÛJ��@ĺߠ��g@��6�_I+@�t1ZR�@�T����@ɜH�oH@��B@�7N@�J�c�;@ͲR-h��@�$��2�@�Q<�B��@�Ȋ/	i@��"���Q@Ұe܃!@ӆ�t� @�c22�)@�E�`��         ?d�X�$^?��5�j�?����nO?�gfh~$�?�ꀵHIK?ޭ<��	?���:���?�_W��q?�%���?�8�2��@�>��@�����@	.S�16�@�Ȅ�j�@���N��@H���tA@J?F$��@����@�b��T�@ א0=�@"�,G̾�@$�}�@'(k�@)kI�Րh@+�U���@.iDJN��@0���R�u@1�tn�@3c�qXi@4�,Zq�@6z���<�@8���gX@9�d���@;�DX.��@=f�]q9r@?J}��nV@@�ȓZ��@A�7�+a@B�~�5��@C�0=z��@D�x�[7[@F��@I�@GAN�@H'#8�@I�STt@K��H@L~"<�@M뽪_�@Of�~.98@Pw���b@QC�p4�@R
���>@R�,�K�@S�J1��m@T��M#@U��-�@V���,��@W�@UF̭@X�N�q@Y�sD�R_@Z�{K&��@\9��E@]J�e��        ?/�x�*�?e|{:��?��@�En?�̚X��?��?�N��?Ѯ:����?��*jT�[?�Ax��\�?�f�n�b�@��hK{�@;!z�7@IUz_b@ _.�]@%�X�U6@,7G8e*@2�9��|@6�4���S@;�Uf@@���-U@Dk��7,Q@HK��Xv@L� �~�i@P�����S@Sk:��"@Va:9_.�@Y��&���@]3��٘A@`���z�Y@b���ZK�@d��D��@gp��~�@j�=0x�@l�:�� =@p	�ԁM@q���k9@srR�P{@uQb�ǔE@wM��_��@yh'���+@{��s�1@}�e��@�7���΄@���o�}�@���R	@�IV�T��@��
�Clp@�Q5���@���c�@��E ���@�Y3��`@�'�:3�@�K����@��點�@���>�;@�G�?@��f=I@�)�6��@�H
/6T�@�nw �Y@��L��x@��{p��X@��h���@�Q�T�j        ?Iբ��)?y�.���?��IB�?�n℻|�?�p�Z]�O?���-��C?خ�����?�s���?��XH
?�w�ka@�S(:'@	��Ĺ�@��;��.@�F�F�_@ �����Y@%߲6��@,^J��8�@2��'��@6���C@<N�r�j3@A_zsi��@E���(�@IZ-�`�\@N1ffD�@Qө�dE@T��+M@XK'��7�@\���@`��ަ�@bc����@d�^�9�.@g�*d�r�@j� !�(@m�R�e@p��Cv��@rX�H�\�@tJ��|@v]�y���@x��g�8@z�j���G@}e�Z3|@�����.@�e�P�$@�ۚ�l�@�e&�N�@��nTa�@��e�s�@�{%h�g@�W/�!�O@�H���m@�P����@�����@��P<r�:@������%@�*ҷ�O$@�i{dɶ@��m)��@�
8�t��@�m�w�@�ݲ�/��@�Z���;t@���u<*1@�|,/м#        ?�
5�E�@=aܬ�@2Yr%f�@EM8p��5@S���
�Y@`6}��`@h j�5�@p��0"d�@vmgj�@|[wL8@����]�@��׿�@��5��C@�ж'зv@�>�z�_@��d���@��dY @�>���`m@��LI�_�@�F)�ym�@�G!���@�f�=��@���A~ @�z<'@�}�Z4�@�v��5�@����U�@�UCR��@��%�@�\�8:qJ@��خ냋@�����b@�]b<��@�'��i�p@��n�A�@����{�"@���3�@���|ʁh@�Z� d@�#��t\�@�FV�}�@�r����@ǩ�W��@��?46��@�8��b|�@˒ඟ�@�����@�m)�|@��O�,��@��|��2@ђ򌐴@�l�㽭�@�Oi���@�:�>�u�@�/#e��@�,�	�@�3�>n�@�B�٤Q$@�[����@�~��&l�@۫�8v @��T���@�!���?        ?t�0�+�p?��;n?�����G?П�5�cs?�8�m�?�-����?��]&zhx?��+cb	@ t
(T1@M�u��@
��KW�@�k�H��@����$@,}�@d¥�@ �����@#A	�U�G@&${!Gs�@)G���M�@,�����M@0*��`i@2 -o�z@499`|�p@6u�
w��@8�6�d 0@;]ɏS�I@>
��L�@@oTgyQ@A�z�	0@C�K�=��@E(Tv�@F� �
�j@H�;��a+@J�(��@L�ak���@N�\0K�]@Py����@Q�.�3�`@R�)���V@T��4@U[�Hb$@V���0�@X�T>�@Y�V��G+@[�{�@\��ZM�Y@^A@,�@_�.�ޘ>@`Ӡ���@a�����z@b��b���@c��eIE�@d��P�,w@e�:�hB@f���OE�@g�]��D@h�O�ώ�@iגe�w�@j�3��@l(G�>`@m[�PUW@n�*���B@o�0��i        ?!m��?T��V%�?u%��?���F"��?� ��XK?������?���c�?�	 WZ?�Lm�T�s?�pһg+�?��a�N8�?�8�0��@Z��	o�@	��u	@ڮ�4�@&u|�@�/��Ί@$�
�n\a@**"c+Z�@0r~�]��@4j�ѯ�@9)^EBt@>m�\kY@BL�(�F�@E��u�F�@I��ʘ@NI՞�=�@Q��Ԑ�Y@Tp:�"�@W��+d��@Z�Z�"?	@^� T���@a[l� ��@c��@x�@e��u��@h����@ka�bf;@nf��@p�ѳ+
@r�<k��B@th�S�@vb���'@x|�yjjy@z�fN*�@}(1y�@�q��@��0=�3@���O��@��6�h@���3M|?@�#/���@��c^5�@������@�w0T��@�g���Ue@�6��T�@�D�Rܞ�@�^C���@��@��G�@��$X̋R@��9z���@�:ǶbW�@���G�2        ?W�m�h?�/�nBj�?�LQlS�c?�ؘI�Ar?�e{��t?Ҹ��%s�?ޗ�Q��e?��� "��?��p/s?���@�g@gab�3@
�gd�%@m8U
/7@��hb�@ z�&e@%s��r@+y�Ϯ��@1SՖ��@5�����@:o��[r5@@���@C55s#�@F�)Ż�p@Jɣ*��@O8Lȏ�p@Rx�|�v@T�N�&��@W�]�*�@Zא�x<�@^Lw�.�@a�m��&@c	O��`9@e6�Q@g��L�)R@j/��@l���n @o��%�u�@q]����@sͅ�}@t�l�7NA@v��3t�1@x�N3S@z�P��i,@}7Y���@mc�^�@�����@�S�@\9@��+z��@�?-#n5@��:7��*@�~�VR&@�@���@� �%@��Rj��@���2�)@���-�@�4����@�^�����@���K,��@����E@�, ء��@���� �@��,���        ?��/��}.@#'}�_P@@8U_�2@R}��i�@`�^��0@k!1��.@s�\�b�@{��w�@�V"8��@��)���@��ʅi,+@�]�D�@���Q|g�@�"l�@����5:@��ޑ���@���:��@�ɬ��7@��5�k@����^�@�M�qq��@�eDa�}�@���KQ�3@�
E���@������@�T:�� �@���@��&��@�F[����@��A ���@�΍�oM@ȷ�^��@ʻGi�d=@��&e��N@�M���@г�% �@���+�@�4E�L�!@ԋ"���@��D��#@�goy�@���ޖ�@څ��@�@�-M�Wa'@�����:@߲V?h8@���'K<@���У@����?(@�����@��m���@����AJ@�'M��ō@�Z�C�@�0.%�?@����-�\@�1m��@��j�Y�@��4G�@�5c�XO@�����i@�T��4@�Y�P        ?=�o���?u�0\?�d�.��z?��{�J?�}���k?�,��y�?�v+:^&?��2�,%?�S�����?��#aC�?�&��L��?���F�)?�2h�8�?�m)��F?��� ��?�8$�/��?���A0@ ��T}�{@�4h4ox@B��*M@��'sa@
M����@%����@���@�����@a��t @-t���@�AD�j@	��@.6K��@d�1�f@����@!T��@"Y;���9@#�����@%�I��@&�qל@:@(M�kP@)���:Tn@+8ٔV�-@,�Zr?E�@.��mg�q@0A��g@15=�~p@21+��@36�oy��@4D���-@5[�,̞m@6{����@7�N_1�x@8Ջ<�̠@:w����@;R#�f��@<��hS�I@=�=�!��@?PJ���@@[�x�#/@A���@A�n��U@B��L���@C[o¾�i@D(C<�@D�fd	�        ?EE�h5|D?�_?���Y��?� ),V�D?ơoL[l ?��΂��?�2��P?�/�6�?���I`#?�p�m� @}��`�@���[�@}�Kǻ@21̒my@�|��@ b��(�@$�\�qy@)jמ�M�@/2a�pҪ@2�� _xT@6�_k��@;hgdo@@HS ��@C6S���@F�7IY9@J;T�(bh@N`C�b�b@Q}eD���@T�EG�@V�vF��}@Y�i�l��@]Em0ʔ�@`w	�vC@bsm���@d���N-@f�<�M@ii��p�@l($A	U@n�u��I@q��%��@r�f�JA�@t]?�B�4@v2�p��'@x#� �_7@z0@��3@|YW�&@~�i���<@����{@��Tu\ޫ@�uA��@�r'�B�@����4@�aVB�5@��]�ky�@��g�v
@�C�*��Q@��/P��@��(�,�@��ʡ�]q@��!I_>(@�����@�������@�
�`[�        ?
0��1��?B���C�?h25�C`	?��Ș"a?��:!v��?��J�UE�?��V���?�y�����?���yG��?��R+��(?�A�W��<@ ����l@�m=P4@V<�i@�<���O@e�9�@$Xf��@)ђ���@0L��H@3�"�WI?@7�45�@<Y���@@����@C}�a�\�@F���@I��N�@M|����@P��0��@Rԗ��Zf@U S;@W���l�"@ZFD��X�@]&
���@`[=�a�@a�w&��&@c���S�@eq��b�@gw۫?@i�^�L]@k�@�K�@nOZ�J�0@pn���i@q���`W@s/�)c@t���-�&@v8M
ئ.@wנ���@y�?��@{L�;���@}"�e7�@D�H`@��<�uJ@��E��6�@����^tn@��%��@��DS�E�@�c��
@�?����@��f�:��@�ϲi��:@�'ρa�>@����#1X@��f37\�        ?��#�Ķ@[|��?t@&�S)d@;��� @I��Q޺@Uةt<@_:���K@e�)V��@l�ޙ�A
@r\h��X@v�E�ӳ�@{�S���/@���$�C�@��e\X,|@�Ν�1�b@�E�@)@���v"�@��ӺD8@���,N�@�Oy��d@��>�l7k@�#��@����s}R@�}�bu�@�/EY��@���ư�v@�F9��@��q�S{d@���"2�y@�u���c@�V,�/�3@�Kr7�@�Uo �!@��g<���@��*����@��t���@�-�7Clw@�l��{~_@������b@�T;,��@�zCz�ߥ@�������@�v�����@��B{_�@��|~&�a@��q>Z�@��x���@�~>���@�o���^L@�h�GV�m@�h�B!�'@�o��R1@�~C��}@ȓ}�8K@ɯ�vxk@�Ґ#�?i@��j"�B�@�-3�ֵ�@�d����@ϣ�D�q�@�u[��@���&��@��*�a+        ?4�t�?h*m�bt�?���qz��?�+��y:�?�&0M�T�?��%# #�?���p�t?��P��6?���lr=?�֥�w�?�9�Ƈf?�$���9�?�Ton%�?�FX�z��?�i+���?��(�^�?�v^ݾs�?�+�b��?���_�?�K�1]ro?��O����@4�'զE@-��5@H�_���@�_��+Z@	��1�@f̥?�m@8�I$@�o�tW@aY�)ܢ@�Lg6�@��L��a@3�%�"�@���Q/@Ț��e�@�C���@�	�7�@ ^?�XN]@!q
�@"��r��7@#����@$�g�q�@&+۝Og�@'w|8�F#@(�)�3�<@*3 ����@+��-��@- �S��@.�m�ކ@0 xR*OX@0����f@1�!s�0#@2���=^w@3�s��{@4x�%���@5jڞ�_j@6c�NF�@7c:�N��@8i��M"@9w���@:��E�p�@;�O'�5R@<�As���        ?� �H?N����O�?qŬ.P��?���q}?���y��!?��yO�?����[�v?Ѝ%6��?� �{���?�0��JO�?�S��!?��Z��8^@E�"K�@p_�@s��q�@ե��t@$�z��e@+WT0T�}@1��-N$q@6��Ck)@<t
�*��@A�X=��@E����2@JMO&�]@O��*�J@R�v �[Q@V/��@�t@Y�d��W@^,�:�!%@ah۾��@c��H��]@f���tB@i�-�݇L@m#\Π@pJi�>@r/;4��@t5bIOU�@v]#���@x��;�$�@{Q�)�@}�2۽�0@�'2�/�@��B��@�#w�ɼ@�����6z@�+M��=@��D;��@��>�a�@�Ys�-@�2~�MM>@�`"�w0@����L�'@��U3IG@��X{"`�@����k@��J۹�c@���k�@��|�k@�;�����@�qs��>�@��7a�=@��V���s@�;T
I�        ?QrK��)(?��D6[��?���8?���e�!�?������Q?��p\� �?�]�3:I?�K΍�mg?�ݲ��
@_0�r��@
/�t�b@P��N$@��4�+�@��֡3U@"8�~�V@&�l��@,18��@1G��p@4�G���*@9Iy�v��@>9�J���@A�^�E@E �G�,@H��!V�@L�o+�	@P�u?bD�@S����@U�U��wX@X��l\�@\%k>k�@_��3B��@aв�i�Q@c������@f4�J���@h��݂I�@kN6ᕠ�@n$P�Q�0@p����I@r7�^3�@s�V����@u���~K@w�;�$��@y�c��@|�3;z@~r��PBP@�y#a�C@�˚��LO@�1c��(K@��4&�#�@�9��K��@����+&@��jO�a@�i!�u��@�Q�4T��@�S ����@���ZXN@���K�@���=�@�.�r<@�q�?�� @��L�~��@�%����p@��4ۈa~        ?����V�?�ЖJb��@>9��>�@1��[ٱ�@A�~�_�@N���w@W�=��T�@a�ˍ��@g,[qY3�@n;�$��@sd{�@w��j�ee@|�{�q[j@��S#��@�*�)�@��
{�Y@�6c�lo�@�9(?q �@����h�d@�%*��$�@���s�cn@�k@��&e@�Y�@�z�hͻ�@�h��@�/�Z��@��m�t�@�����<@�0r�{c@�l��.Z@��&b�{@�"�Q�,�@�r?�_)�@��A�{�@�E���'�@�˹Fh?>@�e.���@�����@��Wp�@���#�L�@�� ��J@�T�pT@�dcnɿ�@s�<R^@ë��b�@��c�6@�)U�@�|��)��@�߃��}@�P����@��j��@�aB0s��@� �����@�W�e��@�7H���@��"�
e@�a��t�@�=&�(�@�s��,@�$4�w@� n$�j	@�:v(*�(@�]f�ߕ�        ?0@�Q���?d�B��*?������?���#i�/?�s<�i�Y?���-�?�?�A�诬�?Ȟ�����?Ы~�5�O?նn{)�X?�td=���?��3q�٢?�%�&?��()��?����?���R
/0?��W�?���3 E?��� ��?������'@ �E��Ӏ@�7�x��@>���@ƈ�iC�@
�pNV�@t��)�@P1h9T�@��FƗ@հ���@��=(?@��\�@j\��@ia��JD@�	��U.@ �B��@"*q�� S@#��!7�P@%1D(@&��a��h@(�\����@*Z�k��@,@o���@.=n��0?@0)U�A��@1@rx^�@2dn�djc@3���٬@4Լa��@6!��Ȳ#@7}��M�f@8�T��@:cy#ȁ@;��P&�@=���e�@?1�_���@@u��G�"@A[VD0�@BH��M
�@C>�p��@D=VKH~@ED#(S�q@FSc����@Gk��<        ?!����2?N�����?q�㎤2`?�����R?�e��.&_?�����z?��5�O�?�!�m��?��>Y��J?�����?�+�b	��?���(E��@�o#|ڼ@
ځ����@�(�9�@C�5l�@ �;ލL@%r�%�m@+r�E i�@1B�{:�N@5jY.Q\O@:=�L�iC@?��	�+@Cec>G@F��h�@J�����@O�L#�@R�`�k�@T����@W��H|�@Z�elK�@^JGdCE@a'�a�C@c63���@ek��8��@g�|W<\@jP��ؐ@m�xnPQ@o����@,@qu��G@s��n�@t��2��@v���L�3@xy%}�s@zx!�F��@|�(*x�#@~���]�2@��ר]G�@��2�W
�@��ʽ2@�T�2(��@������&@�&@����@��+�$�@�6���@��z���]@���(*l@�JE�.!#@��Lk)2�@����A��@�9C@��x(�b@�����j�        ?9 ą�?l�Qá�z?�{��]?��PU�9�?����D�?�H)'b�?�'��S?ه�Ϊ��?�b}�v`?��06�?��L�{��?����}@0�!m��@�5�V@o�<�@Q��fr+@�� 	s1@$>���@)����@/�+�T <@3����q@8
�~.yi@=	�
b�@A]��@D���[�@H5��_@L@r�q)�@P]�Wǽ�@R��]�n�@U�̩�C�@X�PS��@[�$~�� @_@�S���@a�@�\=@c������@e�&��@h�nA@@j�gJe�(@mL�K`O�@p�x�&@q���e@s2􋜶n@t�
ߢ�@v�t�u�@x��;t��@z�`�T�@|�6�Z@~�����@��* �i;@���2�@�nt��F@�Th��5@��.,#�8@��ߢ��@����Hu�@�'eEb�@���sa�@�P��K�@��ZG�>@�bߒ�z�@�K����T@�<x��["@�5D�ָ�        ?�h��x`�?�Z�\�}@�3J��j@&���|��@6W�:��@B�C̜�@M9�2�@T��pw�@[�u��oO@b0 ����@f�ě�j�@ld�����@q6�Ac�L@t��Z[�&@x>�?��@|J����>@�[3a��@��^mb�@�`.)I��@�4
fh��@�Af*|@�������@�	(:Q��@��<�b��@��E4P�@�AНk�@�e�q`E@��� ��k@�g��o�@��~�9@� }�>m@��7v!�@�<���@��F0�3@��%}��@�^�>+?�@�I�%��@�J�Pi@�0&���W@�F����@�hh)-�@��3��3�@��?�	
�@��݇�@�j}!�,�@��[�M��@�9��[�2@��s�EU�@�A���s�@������@�B�[�'@�ĕ6��@��I�2@��C>/@����I5@���~9-�@��W��@��}�J4@�C	<̶@�3�q�(�@�\����@ˎ��T�<@��v^�        ?:'E�	�?ln�/ip?�`텥�?�����?�Y�.��?�i/c�?��s��-?�q��]�?���<�?�����9?�Bs>?�}�%��?�d_�T�?�z�)��?�g\I�?�o��z��?�vW����?���ݚ�?�|}i�@ D+��@{K��@�)�Ra @����[e@
a�L�h@v�^l@c��hN@+1 ��@��N�^@���@D�"��@�Zx%�@ ~%',@���5�@!%�&��@"�ȃ���@$��]�@%�^ƅ�T@'U��u�@)Ժ:1@*�w��_]@,�97U#@.�}E)�j@0oW�9�P@1�(.w��@2��C[�@3���ezs@5	�_Ԍ�@6O,��z@7��)D�@9�:ȺV@:o��h6@;�~��H;@=t�}V@? ���@@Y"�#A@A3w\��A@B����4@B��s��@C�qe�E@D�MY�Cv@E�2 ��@F��9@G���pI        ?.X���4?H��/h�?n�邚�V?���6��?���2-?�vs��dh?� [�a?���p�?ةS�Ta�?�����?�GӗE_a?���� @.|)Sޚ@a����@��?(�U@�Z��@Mo���i@#�8	��@)K61��@/�&S|�@3�)��ц@8r!�N�@=��K0��@A߽��_�@EK�!X2@I#�x;�@Mp2�F8@Q��ۼ�@S���
�'@V�֢(��@Y�ա.hl@],e�w�	@`m�4�H�@bim#�@d�	�4@f�L��n0@i6��2cI@k�t�ȇ�@nz&�s�@p��)nv�@r+q�.��@s��/�g&@uhh��?�@w%#�Cn@x����ʺ@z����q(@|��w}F@~�����@������@��V�-J@�Ի�O�@�fs�@�O�4�ڍ@���Yw$	@���.w@�f8���W@���87�@�aI4�be@�����~@���[��@���\�3@�}���W@�bx�K6*        ?"���?T��?ˤ�?t�ĸQ?�9N<��?�@Ù�4�?�� ��3�?��i���?�
jfL?��y޻+�?���":��?������?�~�PX�?�D9U�e@�r�@f:Q#* @i��b�@@��<@[7`��~@#��{E�p@(��b�"@.�Ke@2��_�@6�#*�s@;5��N��@@�6lw2@B��6�@FN%.3@Iw\����@M?��w4&@P���)G�@R�o̚�@UdA���u@X�f�}�@Z��/ �@]�&2��S@`�R� @b]l��e@d;�Y��#@f9m���@hV�ElS�@j�>��D�@l�V�|@ox'?��[@qRj�:�@rt�$x��@s�>�X=8@ux�l�&@wV�*�@x���1�@z��)�6�@|r�ifb@~fvٜ�@�8g���@�I�9c@�e����+@��P��0�@��p"`@=@�U�H��@�TW�N��@���`�]@����@����66�@�zى        ?�Bv>��=?�W�dV@��u���@#�R��3�@2˿��@?(��A�@Gw6��I@P�]�{�@VK���@\�(S��C@bZ_�m��@f�,��@k���u{@p��,�O@s�0�|��@w�:G��@z��u�@��f@��CRB��@�T�^�/@�,0�
@��@/�@�?�� L�@�\�ǉ;@�9��~�@�9ݩN�@�]g�*�@��T��3@��5ȅ�@��I���@�0��E@����8t�@�)&��J@��&ـ�N@�wƬ'�@�?n�r��@���~4�@�z!�v�@�$�T7�@�%p�3e@�E$���]@�qKa���@��Fo��@��E�-~@�B/  %�@��!ߙ@��6@���1@��iH�@���	QY@�P�x��0@��X��@�c��:�s@�Lf��h�@�<��&{P@�41p��@�3Vm~�N@�:�ð�@�H@����@�^���@�{o���@ʠf�Ǡi@�����w�        ?I���خ?|�3���?�2YA��3?��F\��?����Ҙ�?�14_t�?�����?����)?߄�t�c?�6��G2?�CM��?��b1Ah�?���E�?�Q���?��5��v?�*��$:r@c���٠@�:]�.@��.�k@	�8���z@����QM@ k�mr@����(
@�9(Q��@��@^���>�@�j��M�@Z�Hl@ 
�@�q@!|�?A@#S��x@$�A�ʣL@&Wwdv@(%9S.�(@*�"tN�@,Ca��8@.0��_F�@07ߐ�@1g~�6ă@2�����@3�ڤX:�@5]�H�!�@6Թtk`@8^��)@9�u�8�O@;�>���H@=t}�Y�@?O���2w@@��vt@A�0C�l�@B����(@C˟1�/�@D���sF@F#��n"�@Ga���$�@H���<_@JZ��J@Kh�4��3@L��D]�3@NXv��@O�ͯ�۔@P�!fI~@Q�'�Ơ�        ?4y#�\ ?pML+��w?�j+�˘�?�I�@�?�u"/y%�?�iؐ�0�?��_'��?�8�'?n$?�3D�&H?�>���xg?��vfC�@����@C{�`�T@e�t�@��q�Z�@ZDm���@"/�HN/@&�;��\"@,�Z��@1�	�U<�@5}q�;�@9⧾�U @>�EJ}�@B?�I�Ʀ@Edߘ��@H�ˬ]�@L���?%@P�D�bI�@R�j�Tf"@U[�)GQ�@Xs�}@[��\��@^J˘�t�@`�ŵ�k�@b���Ц�@d���#��@fͲ���W@iL�y�@kn�R�C�@m��QN�@pQ��؟�@q��D� @s:B6-&�@t�F�O�@vu���@x3�s|�@z�L|@{�V�=S@}���J� @����<@�'<��gm@�P��5�@�����c@��YW��@��ZSP�@���mR/@����%@�t3�R��@� ���@���Ѓ��@�\��2d@��e1��@�|�Ӥ�F        ?+�M�]�?^y����4?~y�����?���_Y�W?���l|?����i�<?ķ�N��?��RY/:Z?�l9��*�?�Ci�Le�?��0�K�?�2�1�q@��F�Ԁ@
=ej+k,@���mR@�0\�X@P	)̪Z@$)_c{�~@)��F9��@/������@3���Ȋ�@8��䏬@=�=ک@Amw�,�@D�q��"@HZ]�|�P@Lx�L;<@P�]�q>@S�Z�i@U�ke��@Y~��@\n���@`b��.@bfujV�@dW�5��&@f�d�nY�@i\�KK�c@l.�\_b�@o9J�+�@q?��+_@s�2%�R@t�=�@v�cb˒@y���g�@{^����@}Ҍ�T�E@�7/���r@���h�Tf@�[W���@��B:~*�@�G~ѹdt@����nI@��o}R�@���ެ��@��>�ͥ�@����@�$��!@�U^�%f@���k��@��I���@�F�8U�@��AQS�@�:�o�e�        ?���H���@�r��C�@ ���m@3�=�.�U@B����s@N�Ł؄@V=�1��@^b�	6�<@d��l\�@iz�G'.{@o�M=띀@s@�~�-�@wB���!@{E�����@�r���@�|���I�@�B�YX�@�Gd�
�A@����渨@�V�uo�@�{8P�C@���� ϸ@��rc<�@�*���y@��@��@�m��2i@�(�6>�@���ǭiN@�Qjs�1�@�
���]r@���s�@��E,��@����˲@��o��@�<v�y�@���6�֘@�f��E�@�fz�MnL@����b�@�F\�ʾ�@�ӆ�4Sb@�u o}@�+W�.�"@�����@�ؠKA��@�h@��pJ@�o�����@�Y0-Q@áV1�4@��di��+@�-�@�H�Ά�@Ț�!� @���X�=]@�h�k`mo@���Z�L�@�o��F�@��w�S�@����|_�@Ѵt��`@җ�x�~�@ӂD؂:@�tk��]�        ?Y�f��#?��9eZ�,?�����??�,�m�$�?�E�hm?�2�1��X?�}��}(?���t��;?�.��>@?�V��~�?�pf9Js|?��� ���@�����@�i� @�< �@nK6��@A�Tl�P@r�g�@��K�s@DrE�#S@�f�5hq@��<@���D�@!fv��	@#��Vp@$�>�?�@&�%�s��@(� ́�@*�����@,�T´�@.�+����@0�ϡ��k@1��j�v@3P��&�@4lP���@5���p_�@79_ޑ�S@8��5��@:>t�z @;�~~ E%@={5�$a�@?/@g���@@x�j��@AaEn��@BP�D��@CG�d��@DE����@EJ��u�@FV��'��@Gi����@H��g0�@I����ɚ@J�C"u�v@K��&V��@M3��ȴ�@Nr]��v@O����@P�g5�m@Q.o�Ԓk@Q�t�'@R�u ��
@SGo�M<�@T`����        ?9 )�^?sM'��=�?�k�]��?�HEɡ4i?�oė�?����?�c��v?�ϋ�4�a?�)���?�޺��
@�����y@�O�Og�@����)@�X��@#"��J@)	Tɇ��@0��g�g@4B6�.�r@9'��B�@>�S�j@B��� ��@FF�����@Ja�0��@N����@Rko�@T֒���@W�,x�@[JȀ��}@^���H8�@au�@c�����@e��x��@hW�̮@j􏗋:�@m��Lx�@pUy����@q�Z)�WJ@s���?@u:��nU�@w��� @x儫���@zىz[>7@|�%Ř@~�h@C!�@��S�YR@������@���`@���m�@@�R�n�@���Y��j@��c��@�@�\�l@��N;2@�)�ge2@�~Z���q@��ЏQ�@�@\��k�@�)5<�@���$��@����r;@�~1��q@�[r�M�@�=���B        ?P�۬�z@?������?��Hd��?�j�"�Mt?����y??��cV�?�ݝ����?�82[�� ?��)}&Q�?�[c�@�5K�r@
�����@��@�&fh�@?%Y~@$�\g߂@)x�/٬@/��Q��@3�a���M@8$_<*m*@=:~�!3@A�4�e�2@D�*�w:w@H��z@L�z -c�@P�}CI��@S&fs=!�@U�:vZU@X�F`��@\C�۩�@_�_�d|@a�;� ��@c��4Kd@f'f�_~�@h� ��B@k��i@m̙-��m@pW��F<�@qߋ�0��@s~��0��@u5�_hk@w�.?��@x�f�@z�|�7�@}� �_@G��Θ�@��(P)�*@����L@�N�s�Q@��s�B�~@�
A���@��s:C�@�����@��6�)�@�C��v�Z@���}���@�ǿ�A��@�ғO��@�ʻ��.@�̘oZ�@@��mGw�@��|x!pv@�	��I�        ?�6�f�@I��@3>3O�@G���
�@V��Ч?@c`w(��@l��c+@t.��.�-@{5�_�{@�kr }�@��D�L,N@���
��3@�	��� @��8sX��@�%���r@��^!QQ@�>S��@���B�5�@���[) �@�兹��]@�@���I@��0k�i@�bٓ�Y@�-iMP/�@�i�"?@��}ڿ��@�D�64@�#@ x@��"ʴ}L@��X���@��1>wf|@��Qx�L@����=
@�5ی�y�@�k  6��@í�%'f@�� ��/@�X5�%@��X.'�@�7�.�#�@ʺ�,rC�@�K,���@��B���@ϒ�e2�@Х(�u�@ч6��F@�o���^.@�^%�c=@�R�B���@�M�
���@�NESd@�T�(	��@�a��D��@�tHH{eA@ڌ�MRX�@۫t��:@���t��@��T|��@�*�}�'}@�0>��.@���݃�@�n����@��1֣        ?C1]C�\�?t�X"�F?��z�M-?���Z��j?�䜛�7?�kЗx��?�z�~T��?�N3���?��:�� ?���E\ȋ?������.?��~�W�?�[U��?�Q�K��?��}�/?���1#�?�S<��t?�J�ov�@ b��l6@EٚI%�@�,�@_b&*@
EA"N�@j���ͨ@i�Hg�@@���@;����@]R���q@�4�5,Q@S��e0@�xv�
@ ?�b;o�@!�MF���@#Q�{��@% �2qY@&�.D@@(�0��I@*�(b��R@,ۨ�H��@/!Xd�w�@0���0�h@2
��}k@3cj,�{V@4Ρ��@6L�n��@7�c�g@9�����@;=���@=
����@>���@@s ��Q�@Azr[�Ϯ@B��ǁO@C�;3�@D�Y(��@F
�i�$@GL��?@H�V�X�@I�Ck�3@KZY;ho�@L̝�a�@NK�y��@O����        ?)���1]?hS��ܽ?��$(�r?��eR�͈?�����?�B�G�JW?�S��f�?�����,�?�;t�E�?����S@?��<���]@ �	�\�@V�����@�4��ئ@���F@�U�nM:@!�/Ŧb>@&���}@,@�F��@1t�I�MI@5P���@9��$}uc@>�r�oH�@B=`~A@Em��?@H��|Z�@L�����@P���t@S � ��R@U�Q}�?@Xn�\�Y@[�aZ �@^ԣ	D.�@a5�Sڅ�@c$�W���@e82pg>�@gr$nLu@i�飊:@l^�/v��@o�֝j%@p�{fAK�@r�e�p(n@t"�q跥@u�֏���@w�󺚄�@y�[�@{�E[�M�@}�k�e�}@��>�A@�.p�l@�lcie.u@��Й�!�@��P��E@���~�@�6�Т@���zDo�@�DB��1�@��ʲ�(�@�ȟ��0�@�T�3z@�N.68
@�R^��W�@�aP �         ?V�s-��?F��.�E;?kt����1?�ڷ�i�b?�u?m0 F?�ʞGF?�?>#*n�?ʧl!1�h?��)�0ٕ?�n����?�N^��d?�����@ '5&&U�@�ќ>�-@����d�@i��l��@Vd��9W@"f���} @'~�r
Q�@-�8�]� @2O�ٲ�@6gxN9ʬ@;��c)�@@3���~@C/�Uu��@F�[g{�@J0?H��@N:ei��@QQPE 5�@S���I@VK���\�@Y���O@\�Pz�I@_;B\_b@aNK��7@c��s�@d�M�Q�@f��9�%�@iu�/�@kKz�
��@m���S�N@p.���@qH� &��@r���8�@s�����o@un�i.�}@v��_���@x�v���@z#��!w�@{���U]�@}�`�-8�@w��&�@��{-��@��T�a��@�����Q�@��V�K��@��A�s�o@�$�n��6@�^�S.�?@��)5��6@��ba/_@�XθE|�@����S}�        ?�=8��!?���,k@^��*c�@$^P��}@3��0b�N@@Ĕw@I���s��@RR�^�N�@X�u���6@`^RZ�P�@d�X�b�O@jV�A@o��E��@sMzp���@w4�?0�@{/WHFz@��߀� @�v5`�@�I�*g_@�g�uq�@�����@��f��Bm@��9vz��@���@�|'nw�I@����@���?jqd@� G���@�$���~@��vဘ@��7�ʽ(@�ѓ*(�/@��	w�mq@�G7�kA@��Ƃy��@�++��,%@���p�@��olX�@����f�@�:<�R@��}`��@��(-�H@����7�@��h1���@���"H��@�ʫ�)t@�A&�� �@�{\xOVY@���V��@�c8�3�@ǂ4�Z��@���<D�@����G@�����@ͼ_!�B@�rǑ���@М���~/@шpy��S@�|,{���@�xbZkK@�|&2���@Ոk`z�K@֜�̚c=        ?C8��ɨ?t
�~�?�:�>��?�ˀ�엉?��9�j?��>��?�\|}|K?��3P=l?��hoX'?�-�7O�?��qj6�?�;B�R?�Nx#�V?�p�8�H�?�=5��b9?��B<y?��(�<@���C�E@�#��F�@	��5�G@�hD�)@x�	�c�@��ѫ9�@)��+щ@���@�/�m@�F�Ɵ�@ ��>0�@"J��n��@$//N"P�@&3���$v@(Y�<��@*��s�@-NfXM@/�?�*�@1$�N,Du@2�i�Lg@4����O@5�A�b,�@7A<�̧@8�<�`%�@:�Ň].q@<�_Ll�&@>���2��@@V�c��@Ah*��@B�0\@C�1�@nG@D����JM@F*P� i@Gz��#&�@H�����j@JC��K)�@K��w��@MC/K.H@N�X�0>H@P<�p�ݸ@Q�!S�@Q�V4: �@R����0�@S�y���@T�����V@U��s��        ?2�d �,h?i>����S?�h�q��z?�o�ǥ�h?�#5�x?�Aُ+3i?Ԧ��.��?��"d}�?�,�S �?�{`�+@��Lū@�l�+q;@�ֈ.�*@�_bvm[@"���a��@)W��tn�@0��xR0@5G����@:��=���@@�(��R�@D�����@Hې�5��@M�l�!��@Q�\ɡ�"@T�)P�7�@X=@��h�@\
�|$��@`7Gk+�@ba-&��@dء���@g���x��@j`}(��f@mr���l@p]u����@r���v@s���L�@u������@x�
Q�@z4@w/�:@|�x��z�@~�6+�wq@���d
b@�gV��s@�{�^O@��%���d@�{6Fp(�@���El@��i��$@�|5�Q�F@�K:�m�$@�,��,;�@���z�@��9�%�d@���Β�7@���
�Z@��>�gT@�΂��@�89HB��@�v����p@���w�V�@��D��>@�l��Sp�@���I��        ?*:�N��2?^�f�A?�%y�PD?���*��?�C���D)?���ڝ<N?��q��M?ܝD����?�NX�p?�ҪWbd?����Ĕ�@���GA@��`!U'@�#̶J�@ 4h�t�@%�HUd�@,��@@2�]�#3@7���}~@=�:�$&@BDRA� v@FH�_s�f@J��NL�@P	9p�b�@R�����@V3�?�q@Yʗ����@]���(��@aR�S�@cX��Re�@e�A>�7�@h��2���@kp�"P,t@n���l«@p਼��@r��r�@tfJ&5�T@vK�L0@xH�΅�@z[(��i@|��u���@~�w#Xs�@��\Y1@��r��y@�$/&��@�V�����@��LW�zE@�q����@������@�80P�@���|6Y@�<���7�@���A�L�@�T��6��@�<0� �@�,�٘4�@�&U��`@�)�	iw%@�6��>�U@�N
`��@�pCw�'@��碊8�@��6]�        ?���,�?�֡�J�@g��s�@,Í�y��@;�c.X1@G1�N"�[@Q��ȧNV@Y,��
@`�'� @f@�`Ia@lsV����@q�>k3a�@v�\�@{�R��@�^�	�@���n��-@�a�>�z@�����y�@�"x�*��@����Q&�@��^���&@��Q�� �@�*t��� @�㦪�@�����@�#H��q@�{CU�@��b_Wȭ@�� �n��@��UC I@�к����@�q-�#м@�*x�<��@��
>�@��I�.x@�m1�@�|=k\@�Lo��l�@�R*n\@�� ͐�@���!���@�,�I�~@œ�%�P@�
-`+�@Ȓ��)��@�+J��y�@��Q��R�@͑L��\@�_�&���@Р���"@њ��I�@Ҟ���R@Ӭr�jz@���v��?@��P�}�@�i��@�D�tR@ق���x@�����@�@�qjr�Z@�w��{d�@�ܦ8>rS@�%�:^v        ?K�ذ�?��%A�?�$r�M��?���W��?��	�DHd?Ȁ�Em�?��Ǣi�?�/>���?૘���?�t��}�0?�ꖡ7�v?��AF�>]?���6��P?��f�$U?��Y���N@ Niq�e@ӊ��B�@�&�uS<@�/NK�O@�eu���@/_�x��@pV'@��@i�QD�@�_[w��@����@#a[km�@������@U�2J�F@!q���@"�����?@$#��@�@%���>U@'�Gd�H@)R.� ��@+6K<X�e@-/�����@/>_�@.@0�`���@1�~8C�
@2��K�-m@4)����@5h�OM�@6�q��.@8�K�@9i���P@:��XTH@<N���*@=ӱ�P��@?d����@@��Zn�-@AU�KYOm@B0�O侸@C�m��@C��+���@D�m��X�@E�I#�@F��d]eb@G�S+��@H�jV���@I��^$�@J��C���@L,�?*�@M2�ߕ^g        ?&���~r�?]w���1:?}��rD�?��U���?��3���?��Lk��?��()�M�?բ邊B?�j�j�?�M�Ԥ�4?��X�}�@�Q�>J@	������@SE/W�@'8e$�@ �0�@&�G 	9@,[�l� �@1�F��,@6C)
��&@;M\���@@���'�@Cа���@G��"��8@K��xE1@P"�Wv@R�/4�@U�L���@X� �z�6@\s[ d@_���$@a��*1}�@d�{� �@f�Q�G�@i�̊�@k�Ǿ���@n�p�R0A@q8��@r�A�X�8@t�Si;Q@v�|i��R@x��Ñ�@z���+�6@}Y�G��@�~����@�E\bX�h@��>�r�@�*►Ն@���nī@�aP�BU@����S@��J����@�Ғo��F@��F̄&k@�qht�k@����ދ@�� ՜o�@��9\c��@��ۥ�n@�T����@��1,��@�b7���@�r��g��        ? �H�Z�?T�ͅ�P�?u3�����?����D�3?�,mP�?����9��?�Ү���?�4�e�|#?��I�;?�	�ƛ�?��.:�B=?��Ú��@j��E@
@���[�@:�t ��@�ANt�@ j�<ү@%b�P�hE@+_�kI@1?����@5kȋ�Bo@:B�����@?ς5���@C��`�@F�7�S`f@J��&��b@N��R�@Q�T]�/�@T�n��;@W~�pey@Z�~��R@^��@`ވ��n@bׅ��o@d��b���@g4C��L�@i���`�?@l$�ĻC@nֈi!��@p��,%@rX�9���@s�n2��@u�L���@wY�6�v@y0��H�k@{��^@}$j�᣾@B!H��y@��[��-�@��qρ��@���ek�@�\|l��@��<�9�@�[�h��@�zKJ�ז@��}
F�@��e��\�@�!zE��@��13dҠ@�F��dO@�/-if�@� Z��(�@�����        ?äio�?�o{Na�@	�4?�@)�N�@7� ,g��@C}QG"'�@L�����@TKi����@[.��s��@a�F{|�@f7�\��@ku3� �@p�����@s�7^�@w��Og�t@{�Hd���@����@�|Z`L'x@�"/�@����z@���~�@�y=n�U�@����@��.?ǣ�@���G��@�M6l�@��a;@�=�IZW@���@�^@��0���@�u�[R?�@�(e�U@�μ@9�@��� Ѫ�@��݇h[@��L5�f�@���Mg��@��� (�@��`\]"@�PAG���@��7�ź�@���q�+@�E�}׭5@��c�} �@�/{6��@���e\=@�Sv�ʭ[@����`6@��pF)�@��L�5@����l�o@i�x]@Ø=G��@Ĝk��|@ũJ]y@ƾ<�9�@��+���@���ĩ�@�1���f@�i�Ŧ�s@̪�\��@������@�HtI�        ?P�����?|(s�6^c?��{H@
?�����i?��r��0c?�W��
6?�%@�d�?ӑjʡ��?���qS�?���h?���mH?��?��N�?�.G�*��?�`."�?��ֻ��?�D�3�~?���$�@ �i�^@�(�1�Z@,;8��@�i�Ǖ�@
m�F�N+@T��>گ@6����}@�7PK�@���v�N@|�xk�@x�X�
�@�g�(5W@ͷa��i@(�z�=�@ R�����@!�!^
@#�e7h@$u��FP�@%�=�&�@'���~M@)9�p�(^@*�P�>|�@,�\C��+@.�1Pbf�@0K���5@1Oe��*@2\e셦-@3s
�+@4�_6�@5�t�
��@6�^�K@8/3�v�8@9w	�Q�@:����6@<%%�THm@=������@>�u��Y@@;�!�3@@���!w@A���a@B��N���@Cg���l@D@~I��@E�g�@@FX��4@F�FP��        ?-��~j�?e���m	?�k�7�ױ?�7�-��+?��K��tM?�}�r�w�?ϱ�#�?�H�wl?搴��D?��Vm	{?��O�&�@�qG�\W@�Jvʚ�@�v���@N���5�@$�$��@+�pʖ��@2�@��@7N���@=��c"5@B��M�+a@F�Aw�@L�Ǫ`@P��8 (@T^'5�@@X1h)��@\�6A��@`�!&$�w@cW��x.@fN��>�C@i���H�@m&�vIk@p��P)�<@r��I��@t�M�
@wg���]c@zО�e,@|�؏t4�@��bf��@���D�B�@�Jj[w}@���&#@�L')E@�
z�
@�*���q�@�f!/�<�@��Ng�j�@�Cdks�@�`�r0�@��H����@��~w@���Ï*@�=��7@���ʋ�@�DA(P�@��"��R�@���9��b@�Cd7+�@�4 ��z@�,�T�@�.1�a�@�8 ���@�Jo��X        ?�Pl���?Jʶ\�z?l�s2Ϗ8?������?�ƛ^�rS?�0'Ȼ�?���)��?�?���I?ۜ����?����K\?�Q����?��8��x@��:�@/Zl�Y@4K1p�/@Mps'��@"�Q��@'m��I{G@-�U]E�@2�j衘-@7A�b0�@<t��'��@A60Jh�@D�ősxb@Ho'�*w@L��f��@P�0��@Sbn��9@VH��8�-@Yt�>H�U@\�Rj���@`R�/;��@bW�II8�@d����4@f�]����@iT/'�T�@k�@(Ln@n�g4O�@p�ߔ�V@r{��R@t(x�R�@u��@w����3@y���3Sa@{�ܽ���@}�ؙ�@�`��#@�Fߞ�q@��w���E@���RXR@� �Di~@�zI�J�t@��jc�@�a�w��@���BT@�}~��@�|>(W@��[���@��0�/��@�����@�����G@�����W @��=��        ?�X=~*�?�	��j<@d�w$�V@%�B���@4O�o�@@��U@H�c���@Q�zڐ4@W���e+@^�[��"�@chn�v�-@hFVL�@m( �F܋@qp�� �@t����K@xf�{��@{։o��@��J��@�0��"�@���>` @�)��{Ơ@��@��ɋ�k�@�
�H��_@���r�[@��{���@��#�A�@���ߊ3@��F�G��@����n�@��0j�{U@��ʡ@�'=j�B@�|���vh@�
��_G-@��|���@�e��4��@�3��Θ�@�uΝ� @�tWk�@��8�@�$�V��@�C��|�@�n���2�@��w8�u�@��5�W6�@�7��C�@��JUZ�@���mQ@�n3��C@��5�J4@�}V�p�@��� U�@���mK�@��f��Jz@��p@Ã9SG@�q�jv��@�f�+�,�@�b�ᐁ9@�eBȆ��@�n�l���@�2 $�