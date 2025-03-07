CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T101728        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�4(sc��?�tf4��`@�+Ϟk�@ͬ}@$�\�kE@04���@7)jc!�(@?K�eZ @DL�[�Y@I��\;I@O[ e�@R�+��@Vd9�#@Z3�hS��@^Qm�^Y@a^��Z�@c�^��y�@fAOK�@h��p�q@k�Yu
_�@n�m��@p�V�JO�@r�J��>�@tO�j�c@v����@x�+�_@y�_�ea@|v��;�@~)�^YZ@�/�j��@�T��5�
@�����%@�����!r@���faΖ@�L$���@��nVN�4@�O�M�@�k��k�-@��҇dO�@�[�`e�@�♰�@�9�q��7@���3�@��ߡ�>-@��gd��D@��k����@�uK�1@�^^�}@�Mu�_#�@�Bb+h;@�=B���E@�>K7C� @�E�^.�N@�S����@�i"X�t@���1H�@���\=;�@�׿�(V�@���M)�@�&��;i�@��߉�8L@�s�~�%B@�!��?H        ?Y�EA?�?���$ut?�D�z�\�?ӈ	�(
?�V�/�9?��qL(8~?�p�d�D@	O�l:@����U@}�t�@f�'���@!
��O�,@%�t��V�@+>둝�@0��;�6D@4G�!�Đ@8q��A/E@=,%���@A@TUN@D:�5�r�@G�)���@K0�ƾp@O2:A
��@QȾ3��@T(�J+��@V���Z@YR!Y��@\wk?O�0@_��,�@a��CĘ�@cI����e@e*��@g$�z�4�@i68q��@k_X�x�@m���t�v@o��%�>�@q2a���_@rtSST_�@s�i�I@u{׃� @vzMG˯�@w�g~q�@y\í��@zݍKy�[@|i0c��+@~ f�S@�9Щ%9@�� z>ة@����V�O@�t��@�gL�A��@�c�@[�@�jw��@�|@��ُ@���Z��@���a�,d@���nmE�@�;�aQ�u@���ڡ��@��Ɉ,�	@�Ypd�;@�kBIx        ?p��Y?���%-�?ΆŦCR�?��$���?�b8�|׏@�8�k@�%�0��@��!
n@!'s��n@'��@�@.�n&)@3@��A4@8/�"`';@=�"w�@BLI�ZB@F))�O�@J}�fd.@Ou�"4�G@R� YoK\@U�ȶ��N@YUE��*@]e�V]@`�� ��R@c�8�!@fuQ�<�p@i����$�@mS�C
m�@p� �!P�@r��'�@uj�V��@x+�?h}�@{7S$t�k@~����@�$�G)�@�,�9��8@�fq+x�h@���l�R%@�w���D@�S�ΪH�@�5�t9v@�����J�@��!���=@��c�"��@��KԄ@��Ǎݹ�@�E�	��@����i�@���K�EV@�-�_�d>@��pB�@�J��>L@����P�@��c�v'\@���|�}@����+�@�����n"@�[
��P@�wC�9R@���j��@��nt~�@�;��l@�h�e8H�@�Ǿ�J�        @<���@n�'"���@�����u@������@�Z�iN�@�A\���}@�4���d�@�<3چ��@�9�9��@ҙX�x�)@�x�=P@�Ek�e�@�ֽ���@��czS�@�F����@���O�^@���Ś@�b.��@����g`/@�}@�(@�/�dG�@�[L��Y@�)8[[$A9���9A��rPA�,�TP�A�%���!A�L���A�9LyAj(�VA��g���A2ˆ��JA�-	�,�A�t��,A`Bk��A�w~�54As�%�3�A�Ж�dA���7�UA��g��AM�*�@�A ��l�ZA!��<("A"�����A#��OZl�A$��1J\A%��|�A&�7sy�PA'���}��A)�zeZ�A*L�HG�A+����1A,ţ8�ĈA.�d�ZA/Z�|�$�A0XR/*A1��]A1��n��A2o`��G�A3)�`c��A3誒�� A4���P�A5r�e�&        ?lKg]۝?�/Vځ[$?΁�C�1?�A��
?��E���@���`�@
��}�@9[T�@��*8@ }��b�@$����- @)]�B��@.�]��@2���w@5�
��@8d:"�ŋ@;�^
��@?�6���@A�c�(Z�@C�=[|@F*�����@H�uP��@K @���@M��}�ļ@P,�/?�@Q����y-@S��&*@T���U{k@VK�9��@W��V�M�@Y�VJ��@[�	��yj@]oWi#��@_^�^ޒ�@`�OO�a@a�p�Oҡ@b��y��@c�ҿ-�@d����@f�n#4@g=E��#@hn�LT{�@i��c�b=@j� �|�@l2�I�h�@m���B�"@n�{��]@p#x9�-�@p��Ƭ@@q��1e] @rY=���0@s !˗��@s�}�@t���`�@u���ӽ�@vt��Y߁@wY�	��@xEy{|��@y8}����@z3'�:&n@{5�LH��@|@Ȃ d@}TTr�t[        ?i4s��)?���%y�?ҋ_Ӏ5�?��d�Qg?�����e @�ާ7��@��D��@�$B�%X@�ɤ"�b@"]	�O�@&ݫ���-@+��zk�@0��9nj@3�&��@77��S�@:����B�@?sI{Ɣ@A�<^@��@D=7��@F�ӟ��T@I�i�a�Z@L�d���@P�V�4�@Q�#Iq�@S�MMB�Y@U�,�b��@W��_�{@ZN?�t�@\Į2#��@_b�|t@a�m=@b��nOF@d��YH@eeH@gOW�x@iS�gG�@k@ρc|@mD�Z���@obZ����@p̅a���@q��Ű�@s)�.��@tkű߳�@u�0ݧ�@wϸ�@x��|�u@y�"��6@{��n��D@}�$�@�@~���$@�6���`@��lLkt@� �yk�@��>�$�]@��Qƻ@����}K�@��d� �@�~!��@�!���ԁ@�FU�G@�u�[��@��<�m@�����        ?X�<��<Y?���i���?�8�I��?��[-@K=?ܵ�=g�?�����s5?�}�����?�E\���@}Q�h��@	����"@���
�@Bƞ��@ �14@�o���6@# �E��@&���A�@*�{+�Z@/j;�6�@2F�G��+@5%�S�8�@8X�7˂\@;����@?���q�@B��{@Dd%����@F����@I�4c��@L��)~�@O�4���@Q�-��>8@S����S?@U���F��@W�_fd�i@Y�Q��I�@\b82�?@_n]��@`��ۗD9@bj��pU@dzq�@e��q(b�@g�R0�1�@i�ާ6/@k�֯�
�@m�s_��@p�)�3@q\�o�m�@r�*��`@t���@u�����@w ��ٺ@x�*瘉@z��M*x[@|ci���@~W�h�r�@�3]# �@�G���;�@�hd�I@��RM��@�� �pR�@����k@�av3O��@��\��@@�!�^fe�        @RfM#�x@A���Y�@dq��	�@{UHw
�@�?QW�@��·k�q@�6&����@����{@� �w�@��^9�@����/��@�]�)�c9@��6z���@�(�/��@���h�@ͳ�ǊQ�@���D�@@�!�&Yu@�s4X�D@��F(�/�@�p쀵��@���rx@��g�B<@�e 8?��@��_�`@�v�CG�@��1�@��p�B.@�}"�%@�E\H/�x@���,�@���\��@�u���@�r����=@�u���,�@�~)�v`@�B=K�A@���-W�@��e�w��@�د��w�@���V��@�)��9@�[�/��0@���qN�@�ԝ-��@��~ �&A 5\����A �>��oA���iAC�8�A�E��qMA�}@��iAt�F:�GA8�.F�A ��o��A����R#A�%o�Z�Aw�K���A	T��L�A
8�2��A!8�&��A���)�AD�H�        ?�{̝T�?�T�-(��@vx��7�@.O��@<㪶�@G�>Q�Ȟ@Ql��L@X����@_�\�tl@dB�=�,@i�%G��@nq(����@r �w�i�@uE��v�|@x����5@|A�4\S@�
�Z 
@�����#@�.��H�~@�g9���d@���
(S=@� <����@���Ŷ?@���E�F@�n���@���o�l@�2��3��@��k9M�'@��)�2&@����G�;@�l��OQ@���5��X@�84I|Bz@�і+��@�90���@�}V�k�@�����D@���(@���I>xX@�����C@�t`["��@�d@Y�l@�Y�����@�T�P��!@�V��h@�^Ow�6@�m1��4@���]�@���[��6@��0ˤ��@����'Ki@���"�@�<�R��@��1�`(@���4=6@�Cb�x�@��?���@��-Ӑۼ@�z|���@�A��a�~@�f���@���h�,@��5�x��        ?��i)�E?�#���L�?���3_�@�K
-@��X�66@p8�3C<@&E����O@/�{�3�@5W'�/�@;␊�@A��sAv@F���)�@Kir���@PDP]ՙ�@SV��yQ�@V�T¥i@Zp�l��@^|}�Y�@an�˘��@c�ƾ4'F@fV�H�\@@iZ	�z@k����K�@o!P�Od�@q>O��6@s	�!f�@t����K�@v�Y�+
@y&�� >@{pMAZ@}�4L��l@�1�rGH@��7��F�@��AՂ��@�]F�Q��@���A�a@�v���J�@���5��@��dMb��@���-�e�@������@�:���@�@�@�c@�Q�Y��@�nK��6@��0'�@��V���@�5��@�g$�Ӱ@��V��+{@�7�ޗ�@��
��7@�B�(�Y�@��[�
�c@��p�}��@��@�ߊT@���SԆ�@�q�~;��@�e��6�k@�aG5��@�d�	|��@�o��f�)@��'5}��        ?�?a�`@��Χ�@,�z�@�@AU'W��{@O�F�w��@X�"�T\t@a�G�c�P@f��d��@l��%�$�@qv���TD@t��U-��@w‽��P@{>�XvR�@~�h�v��@�&�$ܜo@��	���@���[�C@��_�p5@�B�0�"@���?u�x@�+��4b@�u� ��@�����-@��	�ҕ4@�=ܻ�qh@�7�d[@������@��pkk@� 7O��@�TE�(%�@���;�D@���_Ȳ�@�,�Ĭ!@�ez��\@��[� �y@����<��@�!�1�8�@�dpB�4f@���=��@��t���@�6��6�@������@��Nm�@���/��@�@ }�$�@��S��@������@�Z����@�£ʺ@��f��9@��6oT�@�P�*��@��I��@�Ӕ,٣�@��َ}	z@�X��z�@�Lj&�H@��'��@������@�xn�]��@�G���A�@��ƿf@��q��Vc        @n�9����@��#�p�o@�:lQH@�h�p�IC@�ϳ`�O@�R�s�%J@��pĻA ��V�JTA����#A
�D���A@��o�AOV�otIA�0_��A
'�'�#A�����3A Ś�J'�A"��g��A$�D�}�A'н7�A)S�y��A+�$y��%A.�s� �A0Gĵ��A1��S��qA2�Q��4A46Q�&[�A5�s:Bc9A6��y�EFA8njԢ^A9����!A;e�9��$A<�Y%��A>{�F�b�A@	D�U�/A@����bAA���k;AB�̿���ACaһ�#:ADC�� �AE+:�^p�AF X�+PAG
Ӆ�AH�b{?AI�:�o#AJ�	3�#AK�q(�AL+6�d=AMHF�0��ANn=-�
mAO����F�APki�}�AQN���UAQ��}v�ARa��(X�ASSCW��AS̫Շ��AT���:��AUNB�?NvAV]QC��AV��k�AAW�ȥ�xAX��q�SAYqi9�         ?j�uE%P�?��M�[�?�Ϙ��Yj?���RR�?�\�%��?�L2Ŗ@�V� &�@�=@�DN@��x-*@j���K@ ���[�8@$;��Hb@(W�a�@,��#o@0�w)Eة@3�è�f@6�G��3@9�B"dl0@=0���@@^A;��a@BL��_�@DV?�LC�@F|Q��DS@H��#C�@K�0r@M�׊F�O@P΍�@Qj��.]�@R�{��5�@TH��&s@U�3�rȏ@Wo�,l�@Y!��Qt4@Z��59�Y@\�3�lO�@^��m��@`_o���@aj`D��@b}ϏP�g@c��J���@d��W?@e��e��@g,��@hK�Z�0@i��,�s�@j�j��@l�*��@ml5eX�@nƺB12�@p���Z�@p��}j�@q��icB�@rA$��� @s��C?@s��-D9@t����@u\��I�@v,����@v��r��@w�1OYC@x� �7"�@y�d�/&@zi�T�        ?<�/�tZ?�-J}�z�?��=�?���";e?ȓ�e�L�?�p`4��?ޠ�a@�?�m�b.�?�߫ڞ�?�z����?�Li��G�?�ڊ'?@�o�n�@N)��@	�M���@cz��;@��*M�U@$#@��@�&K-��@ճ;K� @ �=�T\@#T�`g�@&A/5@�q@)�K�n4X@-3�	��@0��G��V@2�B���@5x_�Y�G@8J���z�@;l��|�@>�j�۸@A\Cc,,5@Cy�b6@I@E��ed��@H\ֵ�Q@K*w+��@N8��o+@P�H�)=�@R����_@T�g[���@V��Κ{�@X�zj���@[Q$���"@]�%�A|�@`V�h�@aЄ6�l@ca�
1�@e+k���@f��=x#;@h��S��v@j�<���@l�P�D\�@n�/� @p��9��G@q�.M�rU@s!kD�}@t|j?�@u��$@wk<���@y ���W�@z�#�x�@|kJ=��@~A�
��+        ?9��G���?u���zr�?�0���?�����Z?�Չ<�?�����?�B�k�H?�PD�Zp?저��;?�Yj3�4?�T�3�@ +D'@Q@:e��Bk@���k�@5�-���@�v�)�@�pHh��@^�
se@���|��@!@�ml�@#��#��@&����S@*\�Q�Gq@.%Zn�@10��[�a@3�Em+#@66�^抝@9/!�&;�@<�2�%��@@�s%��@B.�E�V�@D{ϊ�@G�Q��@I�J/Q�@L��P��@P)�S��9@R��r�@T�nAQ@V)�&q[�@Xz�V(I@Z�|���@]�٪���@`2�n�1�@a�&E�T@c=�����@d�{��P@f��s
�@hevgt�W@jE�_H@l7�{Wo�@n=���9�@p*��y.@q?�|Ժ�@r]J�# @s��f,@t�ߍ�@u�w�в�@w#���o@xh{>��@y�Іp7@{�Ұ�I@|d�(/3@}ȂډU        ?�>��g@4��S�z@WW�
"5�@n?� �g�@}���@�qP;=(@�@b�:�@�lq����@��%�\�8@��y-���@��p���
@�D~��9�@�n?���6@���R�@����@��囵Z@�\mY�"@�Ҡl��@�M!&���@���t���@˳����@Μ�6�×@��%9Ŏ�@�j�p�B@��P[@�̫�d��@טg�?&@�wh߮�B@�l�({f@�y�V��@ߤB���p@��n̶ؽ@�-�)��@�u�/S��@�έ<�]�@�7�͸�@������@�4�a�@�ō:���@�`�jH�@�<`�9@�����@���]<@�&Qd@�~:()/�@�i1c���@�Y/hy@�Nq�P]]@�II&bf�@�Jx�@�PѰ$6�@�]�;���@�p��
g@��l&�-@���L���@���'~IX@��k}A P��!�A �y@sb�AA�zځ�A� �i�^A|���"�Aj�.W        ?�8�I��?��>�aH@��d� @X�ө$@*H.�%�o@5^n�o@>�6�t@D�u���@KjC�W^v@QS�"�kd@US���(@Y��k��,@^js��hJ@a�(V!�@dw?:�y@g_�X
T�@j{z��yq@m�Hգ��@p�����@r��=��>@t���4@v�r]��@x�{R��@{!��4�,@}�n���%@�1m�\�@�p���@���7i�Y@�Y�����@�擔���@���>�@�.���'W@��	����@��E �}�@����1/�@�;tȑ�@�7�S @�<+ೣ�@�Hgx9n?@�\��N1^@�xbL���@���&�@��.x���@��OQ�D@�5�R]C�@�{}����@��38Tn@�.-���@��>K"�@��s	���@�i��y@�J�{{@�:�jW��@�:��H�@�J�7�׆@�j��I@��0W9�s@����e�@�-����@��
F��@�x�1#@������a@��D
T�        ?�������?쫱c�e@
KA��C@�CK��@(����0@2u�hWc�@9�{D}@@)�m�@D:�z�@HQ� ��A@L�⻿�@P��?��s@S�vMD�Z@V��SX`@Z7ڼ�=@]��G�l@`���HH@b�k�_y@d�׺�z�@gJJ�$��@i�^f�@lOo�Qt�@n�@ҡ@pݭ�Y�@rG�H��@s���F�@u6�'��@v�x�d@xK3$�)@y��͞�@{��0+��@}R&�D�e@%	�O�@��[aX�w@��seR��@��wG��@����m{@��H+�D@���@�WlpU�@��HԞ�@�5΀�@������@���AZ�@��#!��@�!�YZ��@� �=Z�0@���u��@��%j��@�����@��P��/-@�	��@�1�/[�@�f�<yy@���n�@�[5w��@�g�or�a@���RTQ@�k���YO@��0��c�@�b(*<g@�J���#�@�@Õ޴        ?v��^�
?��Ld��?ȡ��!�?ޟ���S)?��UQ�'x?�Y�̺��@��}Ga�@s�؏� @��}�J�@�wu�ٻ@!P��HŲ@&(�Ϥ@+�x����@1V7�M��@5S��r� @:j��Ri@?v�^9�b@B�Щ��=@F�S��_@J���Թ�@OE�g���@R;��Fc�@UO�̭*@XN�"�e(@[�o�7f@_�����@a�8���@d4���4`@f�EГY�@iX��iT@l9fZ�e@oQbK�B�@qQ' #'@s�_Ov�@t�)-Q��@v�� U�@y$D,(_:@{lx�㏈@}ٳp@�i@�7ʲ��@���+�/�@�
���6Q@��J��c�@�9�>��@����Ƒ�@��+��?@���KMh<@��e���I@�� t�V@@�qCV
@�L�ij��@���E�ؗ@�ՉuF�9@�,����@��,����@�����$L@�w{%,��@����f�@���0��@�+�iz�@�`a�j�@�6Z@�(���        @U�*�\<@�Z��
�@�p�Sl@�o��YO@�����@׻�˩�@࠙֝��@���^`ǋ@����z,@���Y��@�T�&�k@�چ:��q@����JN4@�v,
")A��L �rA���CA=Z�Wj�A��|/]A3�@D�A�	j#F�AW�XK �A��H�VNAY�l��cA��i�3�A����"Ak���}�AD�k��FA2��A2}��.A "u`���A!4>��A"M�rO��A#on�+�A$��E��A%�x���A'9xm*A(FQnn�]A)��Jm��A*��/A,>mC��A-�*�[�A/���A0>�fq��A0�rl��fA1�]bR�A2�(�`E`A3N=�A4!��4A4��y�A5��
o��A6�<4J�A7���A9�hcywA:7_0dA;z���)A<�n]��A>D���BA?̑=���A@���8�iAA�<x*��AB�E�_AC�o.Dv�AD����9�        ?o
ֺaG?�	H
ʧ?�N=�Ep�?�!��!�?�~�k�@ _Yr��@	4s�/�@��?oU�@`�*��&@�<����@$	��~�@(����4�@-�	�/�@1�:��M�@4��l#�j@8�R@;�A��lf@?J-g�:�@A��W���@C��#\@E� ���@H:=@7�@J�E�s�@M;y���@O�D�Y!A@Q]��C5@R�X��W@T`k����@U��>��@W��?-�e@Ym���f�@[B�ǡP�@]+��`�@_'��Y�@`�Ϛ�Z@a�[<�@b�Y{I��@c�8؎�@e��j&@fOjx���@g����L@h�Y���q@j#4.��@ky���Q@l��Ŧa�@n=��A�r@o��Ots�@p�P(Ggn@qL�u��@r�,ESv@rѰW�S@s��(z�I@tcm=�@u0gA �@v �(�[S@v�d�\&@w�;/�˵@x�N�q@yb���"@zB�z%�@{&�H�"@|(�4f@|��鬙�        ?8���?��k ]p�?�V �(�?�߆X ��?��;��-�?�yi��!?��J�?�3��?��ˉ�?��.,�@w_\@�+��r�@!L]~��@�R�xh)@���U�@泷��W@>�Y_��@!�K��@#ǃ���L@&�3�Op@*3i�a�@-�^	HJ�@1���@3Y�J�d`@5�O#[�(@8�tk��X@;�?��@>�˚-�R@A6��9�@C GU�L?@E0��~;�@Giw*�@I�,fKTb@L]ی��@O͘�%�@Q���u�@R��d�S@TH��W[r@VP�z�@W��?k��@Z��L��@\,Ƽ!�@^w����e@`sf�֦@a��h�n�@c��%@d��.��@f{;
@g�{�4@iQ:Mba@k��c�@l�?���@n����ti@pm�B�@q{Z���@r��Τ�@s�"���@t�&$0�@v+����@ww*�	�@xЃ�R_?@z7�d�2@{���ʊ�        ?f���'@?�,�e	?�+L�?�_"m��?������?��0X�/@�C��H�@v�%L�@��m�q@��8}�G@!���\@&];�i�@+��+a�@0�yh{�/@4�`���@7�+�3�@;��v��@@���EC@B���'P�@E.`���:@H��o�_@K&s->3�@N���@Q���JP@S b��@UO��ak@WX��e�@YÂCE��@\Z�k@_��;�@a[��@b��L��B@dDׄc��@f
u�O�(@g�v�@i��ײ��@lK�b��@nV��"��@pa�fftd@q�iQbA@s	r'� �@t{�,�P@v{���@w��ЁO@yMx����@{17^�2@|�d}q�@~�}C8�X@�p={�@�@�}�q���@���]��@���`�z�@�桙K5@��v�+�@�d,�\�w@������@�<^UI:@�z�XK�@��	φ�v@�wF�`o%@��5�;@��6��@���%�e        ?�V��}@7���ޮ@[�>�_f�@r�KF#�@�n�K�{�@��G�q�)@��=�JD�@�Xl��~B@�̜��G@���� @�NOz@��Z��(�@�[���@�֙�k�@���
T$h@����5@�s�j��_@���X��@�l\l�-�@�j<�h&X@Հ;a���@׮=�?
�@��)C��d@�Q損��@��v;EPk@ઃr���@�����Z6@�]��E�@�ɵoHS�@�C�83�@��4ΟC@�`���7�@��d.�R@쵒x�i�@�u�L#�^@�"(WS@���[��@��cQQ@�|ƭ�@���ऀ@��Ä@��,  v@�4Q�� ~@�O�Rh��@�pi�;B@���5���@���z��r@��+ �n�@�'c�a�~@�aM,�E�A O�&'%�A �,��(A����0A9�s���A�q�7*A��W�A6omUA����ˉA�)��N�AD1�8A��B���A�1�\ϦAai��I        ?�����-f?��Wu��?��5���@ڥW��@����^@)�M����@3�Ü܋@:o ��n@A|{,�J@FT��%Fb@K��V@P���	�@T[gv@W�!O���@[|cp�B�@_�M۰�)@b P3I
@dY@:'1E@f�`!���@iz�?3�@lB�:�5@o0?�6��@q!M�n��@r��0�i�@tj�bc��@v+Xw���@w�B��<@y���)�@{�^k(;�@}�'�Q��@�Ť�@�e��@�@�i��]@�noT��@���g���@��"l@�/�Q��@��\62f@��S@d�@�@Wg)�@������@��;6��@��W�<�@��!���@�L�g�=@��ю>>@��w��@��<t#/y@�j�S��G@�7!���@�"��,�@���iA�@�����dz@�xQc�(\@�K�z�L�@� VL�@���%�"�@��\���@����Lm@�xɻ�T@�Pf/I�@�(�Gw@� ��W0        ?�8�5�,�?�v�kS�@6YV8@2��Z��@Agt˯Lo@L���2�@U KgG�u@].���4@c.*��?@hIS���@m�W/UA�@q�~�@u"�i;�@x��� V�@|�sn�@Ĝ��@��T�c��@�у#^`�@��l-�~@�龆�@�E�x=�@��J���Q@���|��0@�����H@����@�:!�=�@��{�4h@�����@�Vzs��@���`<�@�K#�"�@���om}@�n�`˲@��E�8@�_�����@�<H��@@�z��F�@�A�w�<@��H9I��@��7.k��@�̹�L�@��z��U:@��,���@����H��@��+�J*�@���7�E@��W�͜@��D<�ћ@��c
|{(@��s��ݹ@��=Eշ�@�aG"�(�@����/�@�g���@���1�@�m/s�N@��F衭3@�sb��v@���ڭ#@�y�4�qy@����6�@��(�SeP@��w�X:        ?��un- ?��QKp1@^����@*z�@b��@;���@G#��r5@Q��F�W@Y,�S��@`�}���7@f�ٖ�@k�|Nn�@q��$�@t�D1��E@xm�R±�@|����@����C/@�����@���i�7@������@�� ��@�����R@��Ď��@���J6^f@�G�br
@��C�Y��@�� �~1f@�p"?C7Y@�Ɯ�=�@�oEc�a@�2�>�K�@��ӫn@�����v@�'����"@�`���a@���;;��@����Ԓ@��f ʂ�@�J-/�NK@��z��/%@�D  �a@��o���@��[gk)�@�Q $嘗@�)�}��@��	�J�@������@���31�D@®P:��@�͋U��@����]Ld@�&���h�@�_<�3j:@Ƞ'ߓ��@���(S�@�A��ٔ@̧����@@��⯯@Ϩ �veZ@С��b��@�x����@�Xy�$�@�@};�p�@�/t�yg9        @I}(��@���z�$�@���j��@�A��>�@�U�ޚ��@�u-�P�@�2[��@�Sd�S@�M��&+@�9K����@���a�=@���_�5hA ����A�H�$�A�T)�=�A	��15�A1ɨ�)�AXC����A,��A�-_�A�E�A$]I�AI��y�A�A��A���� �A �*V��[A!Ε��x&A# ����A$Z�`�5�A%�B���gA'
�b���A(o���IA)�Y�sA+RL��!A,���YBA.Rj�1�A/�Z�_A0�� 2IA1��%�vA2L!��/A3Z��A3�&��.�A4�-�:�A5��9�A6_[����A71�9:PnA8�<L�A8���6�A9�G� ]FA:xR� �A;H�5�fwA<D@��A<�	,A=���X�A>���vA?R��S@�A@��ű|A@sV='h�A@����AA9�"1��AA�	Y_�AA��#EAB_b�)��        ?�D��]��@	���\j@)�T�ns@?�4� !U@N-�.�@X�n��LG@bRF�a]�@i{�]�`�@p�"�@u�g�}u@{nҿ��@�v��l��@���5-kS@�@�;<�@�����\@�.�4^�@��y�\A�@�I��UL@���{���@�'��Lb@��L�w�|@������^@��M�E�@�V/�f�Z@��T�S�@�������@�9JL;�1@��,�W�@��V���@����t�@�x*���@�44R�(�@�2ʤ_mq@�7�kAt@�C[����@�U�y�x@�n�[ΟC@��9��@��g��,@�����-|@�!!�V
�@�c�'�\@��OE�z�@�:M�N@�h���@�j�HȦ�@�&����@������#@°V��I�@�}�s��@�PF����@�(`��C�@����>~@���1p4@������@Ⱥ�v/)�@ɫ�e�@ʟ�KA@˙l��LL@̗�
9Ȭ@͚�{S�@Σ3��&@ϰ���0G        ?�%,ܯuz?�[�ٲ@*J8�0@X��!@'Qh�O
	@2m�am�\@:}8�C�u@A��Ar@G&eN�3�@M�'��@Q�z�l��@U����y"@Y�U��@^ck�Q�[@a������@d�����@g����8�@jЌ�Ƀ�@nX���i@q���s@s��(�@uM�9*X�@w�y'�X@zЀ<��@|�ޚ�3@��*�c@�3c��3@�������@�F����3@�����c@��T'<�T@�K�/�
@����� @����Y~�@�ç�C0@�X�J�-�@�WJ���@�]��d @�l�v+8%@�����*�@����fu@��i_<@�d�=@�H����@��N�9�@��"Zi>@�G/���@����F�Q@��%`C�@�҇ٶ��@�����@�f���#@�<I���4@��cY^�@���::�@��k��LP@��e9�t@��0i@����@�!j�7Ϫ@�C��3"�@�meŚ�m@��t��K�        ?�ӫ�/ ?�T&Lo�@�s� �k@0��H�
�@?V���:@HƫbD1�@QƓ��ˮ@W�la�h@^Ѽ���@c7H���@g`c�Ң#@k�L�t5@p`�f�P@r�?�dtW@u�
� �m@x��a/)s@{��5��@\N��)@�~(�(�@�l֝*�@�|s7�@��Ȼ1�@�
)ߑ��@��.�J��@�Bx~��@��(��"@��%*j�@�J�0�@�����@��>TL]@�w��b�@�0���)�@�����ti@�z�!��@��Y[ڶ�@�(�t�@��r�]�M@�"�f�9@���e%�s@�f�)�e�@�"��iM@���K 1�@��}��$j@�]��ˊ�@�\�?ԏ@�d3�s��@�s�3���@��Ժӭ!@��}�$V
@��p��@��	A�@�D��Bq@��Kh1/�@�ٹL�b�@�3)O��@���+��@�T�V@��z`��@��C�	p@�F�(��W@�Š!^@��t�6}V@Ļ��Ş�        @sԐ5�u�@��8�@˫�,���@�қE�A@��_Ί�@�sx�^A�N^�A	�A�A����+A?���A�C�.A<ﮋ&|A"{��J�A%���c�gA(�8��r�A,S�J� IA0r[]>A1��W���A3�Nv�A6��`�A8O�+��A:��ڽ�OA<��Y��A?l���D�A@��jx��ABF��*AC�����YAD�%J� �AFci�R�}AGԟ���AIN�K~��AJ�%�nudAL\�0�4AM�P+�aAO�ӱ��,AP�o�M�AQm�N�HARI[-��AS*�<:�ATh��G�AT�?ɽAU�X�LAV�~�w�SAW�f�=�AX��\m�AZ��(A[+��yYSA\R�nac�A]�٭c� A^��%��A_�I'4c�A`�jD���AaOfi~Aa�l�e�\Ab�X���Aceؐ��Ad~+�3IAdۭ�c3TAe��Q�[Afa�Bp@~Ag*u�5;5Ag���?��Ah���;        ?�3G̋��?�ԠQ��@� ���R@#���@2�E�R�0@>�B�:PQ@F�m4���@O,���@T��e�>@Z)#��@`3�\�\�@c���%��@gc�
�8@kt�]�a@o��f�l@rDch�z�@tƻF�x@wq«X<�@zE��$�@}B�����@�4e� x�@��ކ7�S@���,�T�@�g����@�L9w8�@�D�S��I@�Q׶�ޣ@�s���@��k#
Ñ@��U?�.@�(|��@�a��>�g@�����_@����1@�N�M�@����%(@�'G���}@����C@�1F�@@���t@�6�5�Ku@�%��@���.�#�@��ɖ�
�@�����@��x�P`@��g*��@����>�@���@��� &�@���ڌI�@����xw@�NC�J�@�.V�~;�@�_X�M��@���zT`�@�mI<�@��M&�@���^	@�lh�@�! �m�@��y��1@�����Xi        ?�@��ڮ6?����|�?�?/Ŗ�?�e4x�m{@B����g@�  �@![|�4@(zȈ*@0k�@&g�@5;jg�?�@:����R�@@n<K�	�@C�)�~@Gĉʸd{@LzdK�@Pv���|9@S$�?��@V�����@Yb�g�V�@\��p7.�@`u�xJ��@b�� Z�@d��E��@gv�k�@j/B!��9@m+��@p<�Ȱ@qɵg*j�@s�-�SV@ut�N�I@wu���@y��Wp�u@{�ԙ/��@~ G��.@�H����{@���9t	w@�����ӏ@�HW��q@��#Ō%X@�:��ߌ�@���`;@�hI�Nl�@�)!ހ�@���[��@��l����@��6���@���)UԶ@���S�@��v�?]�@��"� 6�@�,���@�7� 73~@�s�O�l%@��V���1@����8)@�pz:�y @��`�W=@�Y�xY��@�q.n�Qy@�<�bԖ�@�=é�@���R�r9@�ʎ�<O�        ?��
�,5�?�� 
�V�@ۈ�M��@&�c��5@5�����t@A�6�Zt+@I��]J@Q��x���@WC�$@]�r��@a�~_7)\@e|��Г�@iQ���[@m^�\�@p�=�F�@s-��K@uVX'8@w�C�"��@z6ny���@|�J�-@m�rM@�d�Ŭ�@�|A�J@��є�@�io���@��	���t@�{_xS�@������@��;K�@�O�8��@�����
@�Q~��@�(A#���@� �È��@�ڟ��8�@�����Ͱ@��b�)N|@�p�3�M@�P>�Pd�@�1��tV.@�#�X�@���7<@��rV܅
@�����\y@��Iy0%@��㞝
�@�s��t�@�Y�f�?h@�@�~��<@�Y ��@���j~@����;�i@�s8t�@�����&@�a�g5; @�۽ŀ�@�Wɠu>�@�ֈy�ET@�Xm���@���r94+@�gC8h	�@���n>b�@���,}        @Sˍ��@�1��_K9@��Y�v2@��4�b?@�@�@	N@ך���b@�=����r@��	�w{@��'�4�^@�v%p��@�������@�ءD�.A6<S�aA���hKAM�gA
X�Z-�*A�?��C;A�l����A�<<���A�U�i�A>��*�APg ��A�Ki d�A/��iA bZs�m�A!�Q�7��A#���n�A$��Q�d�A&����'A'�����A)$�t�A*�S��.A,s���|A./3��5A/�=�.nEA0�r�MMA1�[T��3A2�4f�A3�G��A4ݝQw*�A5�:J��A7$B���A8"g~���A9H�4*UA:ue�^� A;�x.r5A<�'��A>,��$�A?z����A@ho?nEyAA��^�AA�1?���AB��J�ACC�2cAD
���AD�^�G�AE�'�6�AFo�7M��AGH�b|4AH(a�4��AIY2e��AI��J��AJ��5�        ?����E��?ٌ���?��_��\Y@u�vvX�@0]��t@)F�A���@2���rY@9�81!�@@ͪ=���@EUIF	@J_�;�;@O��4��@S�;)\@VP�5s��@Y��	'�4@]�=W�}�@`�R�+tY@c% G�Q@e~y��!@g�)��@j�qIN�@mi1��@p*^;W@q�{���@sI� n)-@t�_PK��@v�1�xjO@xz*(Ny#@zV�r` �@|C�<T�@~?�Z�~@�%�;��@�37���@�H2�X�@�d�dz,@����Z�@��]J�@����M��@�!C���@�b�>r�j@��,tR�@��q�^h@�V��N�x@��W�;@�ّ�S�@����Etl@���>��@�H2��@�lC�A�@����x1@��� ��@�v���4�@�L�*Sk@�'$3���@��Q�n�@��P��R@��Ik s@����?W�@�������@�����y�@��J@��4��@��拢A�        ?||���ڽ?���P��?؃�<K�?�o���`?����'ɇ@�#��@�&�dn @!����u@�֌���@б�&-J@"㌆��@&���3@+1��e_�@0ŝ��@2�P����@5ꓟyQ�@9^ø�P@=9�;S�@@�gsϹ@C%,�+�@E�\�$&,@H�a�NK�@K�C�y�@O[�����@Q����@S���?	-@U����[�@X4�@Z|����@]���@_��
�@aM2i|�8@b�^��س@dW
g%o�@e��~ϸ�@g�!�B@iq`��;�@kNU��L�@mBj.�=�@oO{��6^@p��&�W@q���W�]@s<>���@tV�	��@u��A�B@w$c�ӎ@x�oY��@z"[��Y�@{�VC��@}uw⯁(@7��53�@��6�[�@�sH����@�hS���@�b�@��@�a���U@�e�3���@�m�q��r@�zւl�@���֐К@��	Y(.@��[)��@��.��8�        ?7��G	�?�v��<?�p&�X�?����Cj?��db2$H@
��� I@P+<��@� �F�d@#PB�A�@)�}t|�@/�l�g�i@3�߈��@8*��@@=	���@AVX^w>�@DnS��cO@G�w�Y��@K�6��@O�sc��@R;;VI�Z@Tȵ�`�@W����mP@Z���H��@^'!p��@`���9�t@c��,SC@eJ�U�ʽ@g���r@jk�=�3�@mR�եL@p<�=��5@q�gA?�:@s��TKR@u�R
4@w�Gf�[�@z-4v�i@|�k�@6�����@��aՀ@�wO��R�@�'�b<�@����K�@�uU��@�Sm�>��@�N�& �@�fZ؝@���^�.@��nAy�V@�4�Ù�*@��Ϭ��@��:��)@�L׳Dy@��4{�/�@�_����@��l��@��CpvA�@��J�@�!@�4���Jy@�/2V-��@�4+�A@�C�����@�^hL��	@����D�        @3&��c�@p���{�C@�1�GV@�'�`&�K@�ԛ���@���v2@�9����@�f�N=� @�g��D��@٢��\@�c}h���@���ݭ�r@�;�z��@���*�^P@�׮Y	�_@��1�w@�G+�`�T@����Db@�3u����@��FZ�Q
@���e��XA T�7�=A�v��A|vM6�A(*e�yA�ٰEo]A���D֡A
�}l�C�Aw�.'�Ar���A=��$uAJy���1A^ko��sAyǢvA�}��MA�z���A�����A/����_AoD�~'�A��- ��A2\bAX5-~d�A����A �FA ��f��A!y�{ ܕA"5V�t�A"�z6���A#��� A$|�ΐX�A%FH���A&�7�A&��d6Y�A'�J@;BMA(��'P#A)g:Q[M�A*D����A+&��z�A,
ΡP%�A,��g�@{A-��^ A.�`�^_A/�j�Ch        ?fxX@#?��tYJ�?Ƙ�E��k?ށE%�v?���3��?�w!�<@Օ�Y
p@���@�Em�V @L�EK@�jaE^�@"�l�h�@&��8�y@*�]�^"@/�묩?a@2dl�@
@57ik��@8JV��p@;�8l8^%@?<"���@A�� ��R@C�����j@E��x���@HQ�>_�H@J��8�}@M�A��(@PIƣeڮ@Qث���@S�2���@U@AJғ@W��i@Y�g��B@[=�z�@]Bx2š@_���@�G@`��#$A@b-��w�Z@cx�uV'�@dҕZ�@f<v��@g�:�X+@iC�),<�@j�k��;@l����!h@n[�1k:�@pp���X@qa�.x�@r�*�@s#ɀ��@t<�m3ƨ@u`����^@v���4@@w�8/F�@ye�`�U@zmm�S
@{�^��m4@}Ik3��J@~��SAB.@�5JL���@������@��vϭ�&@��f��@��ݞ@�x        ?IO�/�?�!�]�j'?��o����?ІYY�?�r$�Y�?�`����?��+"<C@ �Y/"3�@�;�d�@B��J�E@O&օD@+/@Y��@����M@"/��t��@%���m��@*]PO�@/d.ƨ��@2����@5΋4���@9u��L�@=�+nn�|@A�=��4@C�%����@F`���@It°du?@L־���@PE���@RL���J@T���2�@V�B&�&@Y}�ٓ�@\JrG��@_MV��)@aDL\��4@b�,��@d�}���@fі�{NE@h��^9Y%@k)�vY�@m��ew	�@p	Z�
T@qak���@rΒ�J@tQ�w� @u�;���@w��4Ѣ,@yj��@�@{Q��,@}R�n�	q@q4�3
@�ֆ�T@�޼3q�@�A$N��@���<R@��h�xtv@�]��s�@���Ϥ8�@�t�{a,@���|!@��F��@���Ŀ2 @�Ůq���@�������        ?GJ�&'T�?��;��?���@y�z?��G�*�?�0�j>?�<��P?��@��6?��#����@Jؒ�RE@�B����@��R�@��I�|�@!1��g;@%��5ҷ@*�o�,m�@0,�2VH@3��U#�@7LZ��G�@;�)Ȥ@@9B�<@B�J?�	�@E�X�3n@I?���%�@L�3*�B�@Pm�Ώ�c@R�}��@T�l�HpJ@W~qcFq@ZB	mJwc@]@"��t�@`>��u�@a��Y s�@c���5M@e��]�ҳ@h!�чc1@j��鳾d@ma����@o�p���@q[j�@r��<F@t�E�~�I@v\<-*@x=�:8R7@z<E`P_P@|XL�w�@~����@�u?��pg@��H���@��{����@�ZY�R�@��r׊l�@�Hl
��@����\'>@���[��#@�;�/JC@�
�kC~@����c�H@��"�Ws�@��Y��m�@�fIO�@�4�� ��@�a���p@����qW%        ?�kx��ؒ@3uK��@X3�l��@p���x��@��:�7�@�*�?g�@�j1�O�@�_:��\@��^dW?�@�g5�~�@��$����@��F��#@�B�-��k@�"�N�%@�:f�Ө�@� 7�@�E5���@ˬO�h��@�X�mF��@Ѧ���@����S�@�~�@�~�� �@���@�ሇ��{@�k�Ҥz%@������	@����@�q,���@�Rq��@�NӨ�>@�e�9��7@�ƂT֌@��� �M@�)VV4(@�l��|�@�:m^@�ȏ�(@��M�0O@���+u�@���dm�@�A���b'@��z�)+�@���Ne A N�B;��AG��y�AJ@�e]AW4���An3�N�A� ��XA���QA��^ϯ�A	1w��$A
}p��w�Aե�P˫A;,^ƚ�A�C.��A��PɮA�󡡘 A�*n3_0A��ձيAy$�w`Ah"��U�        ?�I+S�#?�d U��?�z�*��@�Fs�@!?�Xm*@,�~9T�@5U0��=@=�2�=�@C��ԇ�(@IA?=w�-@OqƑ�S�@S&���|�@V�!�@[	��y�4@_����@b&�it�@d�!�b�@gr@e��@jS�U�n@mX�0L��@p@/V@q������@s���Ol@uT�Ҟ��@w[ɻ��@x�	G�w1@z��5�@|���>��@~��*qm@�We��]�@�Z�A��b@�cBKk@�p����@���`F@��^	j@��F��WT@�ݰR��@�����+@�5]��t@�i���B@��R3m�@�侤ux�@�+fL��@�;��@��Rl��@���E���@�=�^&;�@���;�xV@��M��T�@�U	��X@�E�]@�� e�@��bT.wH@�=�Ksj�@��\��cr@��^���@���>L�@�H�5�gl@��j���@�ڐ�N��@��L�;�@�s�\��@�Cn�a�E        ?�QBvEQ�?�0�/�?�%M�@胨�K�@��aS^U@!�zv�Ds@*���l@2�
Pv��@94`赭h@@7��r��@DNd��m�@H�&�is@M�,чU�@Q�'���@Tҹ��$�@X(T4jş@[�q�j��@_��]r�@a���{~�@dG��ח�@f��_m@if_έ��@l;[��@o>-A7�@q7��V@r���%�+@t��Z3�s@v����@x{�C�6@z�z�NV@|����e�@~���:LN@����Ӫ�@��AC���@�
�Yߵ@�V@"v!@���T(�)@�Si�@���Y/%�@�&2��S@���k�*�@�-L�Iƚ@��G���!@�E���@�'y���@���v� @� �I�@���<���@��b��9@���P3C@��N,@�(pl0^@�J���@�uo��@���.��5@��hg�T�@�16H���@��[��|@�p��,.{@�%��W@�ޕ���@��t�n��@�aȞ���        ?xptz��?�pD GT?Ѯ[K	|�?�'��8�?��+�8L@��@^��@|����u@nA�E��@!c�J���@(WLg/@0F���@5��.�@;����@Aѩ;*��@FJE{�Z@Kt�GZX@P��d���@TCXѤ�@W���Ӕ�@\ rL�A@`rC��cC@c�E��t@fU<�@i4�c�@l��b�`@p@�ELq@rP��:�w@t��5kY9@v���?;@y�O�:�R@|I�:nKv@@�I���@�6}auM@��0�u~@��Й�EF@��?���@���UiEE@����M�r@�"φC	�@���驵�@�~0�cu@�pOv���@��_��Y�@�d-�@��(�vE�@���7��@�j c�@�@Z�n@�+�3���@����@� ��Х@�4����@�R�nb��@�{d?3�R@�����m�@����8q@�/�\���@�~�9I�e@��F)~t�@�8���@�����S|@��R �@�G!��`        @3���;X@q ��@;�@�x�ᷠ�@������'@��흆�@�ە�+q�@���*���@�RU�҅�@�x�>\�@�3^)��@��h�ɛ@�N5���@��F�{x@���Z���@�K�ɜ�@�����@���Wd@��`�iz�A 3o�:�A����qA�=:��3A��o*�NA�
�ߣ�A	��E惶Aw���A3�I&�A7�n��2A\%0+A��S ��A��m�A�{��A-�A<Aq����A��d�_rA�û5�Aj�|ٞ�A�t6x�A5�\�?A���H�_A �F	��A!QR*�piA"���_A"�qM��A#�uG~�EA$��>���A%V����A&1��?A'�'�TA'�v���A(���>A)�qD+8�A*�@#&�jA+�9�+T�A,�X}��,A-��G�=�A.y1<�A/uq�!=A0:���ZA0�_5�n�A1>:xpQ�A1K��A2HU\���A2�I�{��        ?�;䅀�?�~��H!?���y�/?�X��n�@yr��t�@s���]>@"ZI�Eh@)��\=�q@1,w:A@6�~~G@;��Xv�@@�$��ں@D%��mE�@G��_YA�@K�:�V�@O�vK��@R3f]e�@T��w9�@WDtj�}@Z��u&@]'H�م�@`7���p@a�F�4��@c�Z��}@e�j��"@hR�	Μ@jG7
�@l�����@o,�G{�@p�G�&�@rJ���x�@s�k!�9�@u@eG��@v�?q�H~@xu����@z' J�.l@{�p�q)�@}�:��G@�,��@���o��@��+�H�@����@��k?@@��D��@��y�ɯ@�	�0:�@�,��P�U@�U��q@��O�y+@�����[/@���v^e@�;_�S��@�����Lz@�l���Z�@�
I�<@��=��Yg@��4�'�@�8�C�j@��ڮ��@��XL�T?@�wC.6��@�=�,�У@�����/        ?9m0ɺ�>?��H�]	�?�����@�?ƺ��\�<?ݝT~�͢?�vj���?��L}�&>@�6����@ �Ds�}@���U�"@!����v�@'xp���@.3aM�8@3�W���@7|�{��@<�E�Z�@A%��N�@DX\��([@G��J;é@K��6p�@P�u~yS@Rrò�_
@UL/�@WԲ��@Z��c	@^-�&7>B@`� .(ܞ@b��՘�@d�&C�3(@g@8��1@i�T��1@lw�Z>U�@ok_/VS<@qP��~�@s�X�j@t�!T�#@v�γs�A@y8I�*8@{�,��2@~<wy��@����L2@�
�N�p�@���KD�@�k�d�@�K���*@�K����@�mL���@���F�[:@������@�W#����@��Y@`�~@�$ ���Y@������q@�D���U@��'W�!E@���]�@��m�*�F@��/,�@�O�Мvm@�bF6/��@���m��>@������"@��
�7�        ?�� ���y?����^J�?�_A��̘?�t�0ߍ?��(Sf^@TH�L�@0�X��@��a"	@!�7��@&8Z��@,,S&)�+@1��#|�8@5�M���@:����@?H2||�@B�q��2�@E�����4@I�����-@M��WQ@Q����@Sx��ܧ�@V(��	��@Y�;I�@\X���@_���cݞ@a�7{�-s@c��C��@fCl='0@h�vi�@kU/��@n!W����@p��Q"#@r!�ʰj[@s͕�轸@u�j�,�{@wm����@yc:�5�@{r��e�3@}��e�H@��Ro�@�'�VZ�P@�kv��@���f��@�!�)^��@���рN�@��"+]@���� Z,@�;��9�@��g�[�@���}P�@�)vȤ@���^�A@����4`@����	O@��\�9i@���ʀ�@��=.��@��8���@�F��J:@�GH-���@�~'V��@� ΰf�@�9:la        @#D����@Z4ܼu�@{PT��.�@�l��#@��˶�.C@��PW�@���fEݙ@���"@�C�V�#@ȑ�U���@�o��`�,@�m��jO@����@٫�����@ݹ��q�@�
�J�1@�aZ��u�@��d�E�@�Ab6�@�}�fYD@����^l@������@�����@���$���@�������@��O��)�@�M$0Ƶ@��T�pP�A �&5uAAP�	/�0A�	&�(�A��O�A����?�AZ�Q�bA���p2�A
Y>"���A	�*��A�w�%�A��تA�IR��A��r��A�l*��A�#���A���]&A���@�A�p(���A�ۀ���A�2f�vA���T"�AR���tAJ��V�@A~�q�hA�����A��=��A ����w�A!K��#�A!�Cw���A"�q�#_�A#[��i0A$�z�@@A$�u?GA%��(j�A&I�<��M        ?��]�?��:5��C?ݥ^��?��}�jQ@r�@Ya�Y�@¯�MY@#vu�Ơ@)�%,��@0~�
��@4����(@9�x�7@@=��mv�J@A��Q9U@Df�QTL	@Ga2�{��@J�.��;�@M��x�&@P��� �@Rw��b�U@TZ��U�@VQ��M@XZHA�@Zv+�T�8@\�8֗�S@^�3pO�@`���@a�J�2?�@c�K��O@dI�$��@e��O�� @f�jE�H�@hC����@i�v5O��@ky�g8�@l���0@m�n��@o{���F@p�,�d	\@qK����@r�A]�@r�� V@s�4|f�l@t���	��@u� ���@v�Ŋ%��@w��Kݲ@x��v�@y���H��@z�Y{�1{@{�|D�(�@|�D�<�@}�ҧw~@&>w^i�@�.JR��V@��g ���@�pfJ��,@�+��Y�@���\Y�@�oz�t@� ��q�@��]r�~�@��R{��&        ?c��ƙ��?�3M����?�*�_�:�?�����&?�h1�ğ?��tt��@	<!��@/���@-�y*��@#�緟��@+dS�{�@2A����@7�`/B��@>�
�@B�*�k��@F۟ex��@Kn���@P78�@R�>7�@U��Ij@X�'hKb�@\c��R@_���	n�@a�pn6�@cr�D@ektS&@g{���@i�U�pI @k�F��K�@nAȃ�Lx@p[Kc�@q��a�@r�A3AD@tQ�66	+@u��)T_O@w)��c��@x�M1Q@z#Ǒ���@{�2���@}8��͸R@~�lQ.�Q@�1�t��@� ����@���1�@����t�B@�|��t�@�T���E�@�/ف��-@�U�S�k@��e����@��O���s@��m����@��#��@��ֱ���@��;��@�v�&� �@�r[��݄@�s`XE�"@�y���y@�C'�@��Lw�@�Xo��j�@���E�^        ?a�����?����LEg?��y=C�?�ֿ�<��?�F<&�R?���` ��?��e��m�@ ��I�%�@}=�S�T@��`9�@8n=�,�@S ����@ڎ�á@�w#�@"�F��<s@%�0�<�@(��IX|@,V�&���@0��6t�@2(;K��@4g�y�0X@6֊I5��@9v[[��@<I����5@?Rv��^@AI�5)�a@C#d�
)@D��b&@F�\JU�@I�|���@KLn�84p@M��~��@P(=���@Q�����@SAx�d@T�G�a@V=H�6̙@X ����@Y�.U��@[��]RW@]��&���@`�"}D%@a2~�P@bg{��B�@c�$��t/@eD�cM@fmQs��@g�4z+�@i{�ϼD@k"��J@l�	��Y@n�ɓ�z@pU�$�@q[�$���@rp�\m�@s��k�T�@t��F�F@v0[1zp@wk�:;�@x�R�8~�@z[SG��4@{����@}�8��0        @�F!��@S��oW��@v����K�@�� 7�A�@�r�!8�@�/�%�h@�����c�@�xC���@ÎX>�v�@�ױTg<�@ΐ	`�@�Yc)���@՞j�ޗ@�^�|�r@ܺ+���@�F����j@�E�S=C�@�Y�%
�@��"ב5@踡8�@��9�UX@�`��Ds�@��%"��@�'NnL��@�o)�ˤ�@�Խj�@@�"]wD@�uk}��@��vev�b@�I^�@��@��v`��@�:DIP*@��+}N	�@�C��IA hn'{A0�嚬�A��|�%bA�5�A��0J�{Ap�0[�AKU�{v3A+��YAtU���A �g�ؒA��(c�A	�D����A
��iF	A��?A#
0���AD`
%Ana[���AQK��i�A��Z ��A���SA>�ӏA��'O��A�"�|X�A[P?O�A/��A�A�c�A�v�JI�Ak��MNA9���_�        ?�}�n��~?�C��Xj1@�M��=@!m.�Pj�@/���P�@9I��P�@BG5��@H�	��>@P |���@TB�i�f@X�܃��`@]�����T@a�OJ��U@dh� ��@gw��G�#@j�c�R��@n'�*
+C@p�:��^�@r͌u	Xi@t�w�eٲ@v�oA1?@yA��>'@{�?x�=l@~Z�.�˒@��2{U�P@��n��4@��[��j@�k36��@�;�Cxe@�'?-ۮ?@�.Sě�@�P	�mH�@��(gF"�@���0b@�,HrTM�@�s�7$�>@�Ȳ����@�+��#dT@��Ȓ��@�s��qL@��h�S@�NMȕ�@���O�;@��*��jD@��JS�Q�@��s��dF@��f7�D�@���^�@��Ɨ�@�Ócƌp@���cV�|@��~H}�@���<@�9*���@�d�q�}@���u[�P@�Ǟ-�@<@������@�����?@��S�߀=@�^ӟؿU@��n�@��.}���        ?���o׆�?٘�_�oA?��С�@�ߔo �@\�>q�@%h�q!@. dnP�@4e0���@9����h@@ �O�-@C�u��nG@G����x�@L	�K=�@Ph11L�@S nz���@U̓[<Z@X�l�@\ ��"	w@_a"͗J@ay���ce@cc��.�@ew ��CE@g���@j=L���@l����jJ@o��,Fѽ@q�n���@s1u3I#@t��G�x�@v�1�+�@x�R}���@z��JO0@|�0�Ԧ�@4���@������b@�S���@�Sn����@���W�@�@�HY�1@��ЙgW�@�,��*��@�͎E닣@�Ԭ��0@�B�O���@�
�^�Ҩ@��;'3�|@��A	�)�@��C�"я@���B���@��Rނ�@���[Y�@�N��X�@�9AZK��@�]g���@���r@ӫ@�.���@�_�iK�@�S��zu-@��Nq�!.@��E����@�C-��@���TG�@��\ј��        ?�va��?���zg��?�7�n��@�i߇�$@�+���#@���p�@'HUV^@/~�4��@4~m�\@9�QK�@?�s�z�@B��>�9@Fk��<9@JG7�/ZN@N�،��@Q��ֹ@TA����@W#��BS@ZN�Y�3@]�^qP��@`��Z�V�@b��i�Y@e-5.�,�@g��h:ic@jm�� @mi�$�i@pR���H @rT�	�@s�#j�*�@u���XL@x	ܯ"P:@zGe�1*f@|��E���@#BZ�@������.@�C���I@�����m�@�>VF7RH@��>���@���6 ��@�G5��$@�:���@�R��:@���RA@�
D�>@�&��hR@�I5�Y�@�v�NGf�@����/C@���C�~@�D���8%@��q1_�Z@�����@�{'^���@��A��˕@��9&O�L@��fc�@�_tD�x@�6�bqF@�w�(X�@��E��@��p���@������        @[�iC�@����s @�0�*�c@�H�IX�@�Lͪ�e@����tU@�kq�G��@���"��@�~���:-@�{d
`�@��o��"OA�M4�`�A�Z�+�A�K;��A]�F�2)A�]���7A�6���A���4��A�e��A�n�ҁ�A8�D��A�h@�Ac���S=A!'x[�A"���p&�A$j�A���A&8רc�DA($��3v]A*.u�U�!A,V�3��A.�u�{$�A0�L�ӱ�A1�e�HA3�3�A4t��SEBA5�aXH�A7f�e�bmA8����Q5A:�^Ot�A<X�w�y�A>&�hky�A@(i�e�AAX�AB
Oﻜ�AC�i�AD;�@��|AEc�^��LAF��ͳ��AG�wǌ��AI	���jXAJM�6�*�AK��:�]�AL�o*U�AN6ډ]��AO��5�ZlAPr�>�AQ �:�AQ�v��	AR}�u�lNAS-LYQa�AS݌���}AT�D�LAU?f��.�        ?�[ef��4?����ad?�ᢦQ�?�l�c�5@<��:Th@%ϔD-�@�^7@�@$ ���9�@*�p���@11D���@5�h���@:{��]@?��e�@C�1�;@Frޝ�c@J7�ڡH@Na�dQ�R@Q}G+�@T����@V���x:�@Yűq01K@\�<�O�|@`8��*]@b�X] f@c�S��K�@f&�m̙@h']D��@je_��̀@l��:���@o3��ڣ{@p�	D�i�@r8
=�@s���D�]@uI �_9@v�����Y@xB#��@y���d@{I�B*@|��`�@~�^���#@�8q��@��|��@��䤒�@�����z@��(M_�}@����y�@��z��ڳ@��b�|�@� �^��@�<4���@�_��^'@��|;�N@��Tm��@���N�3@�2����@�=%�@��/��@���4��@�@�4wN�@���ł�@����0*@�n2���@�1�|*�T        ?��+V�?�	�5�Q�?��s���@!�d~�:@��3s[@)�h&���@3Mr��;	@; ���~@@B.��}�~@G�����@M������@RB
����@V~��Z@ZeY�b~@_!�<J�l@b*�M�xn@e�~�s@hT�7�C@kpQH�$�@o�3e�<@qr��x@s��f�ɳ@u�n�p�@x����@z�9`�@}<���@�$���@�\�� @��7��f@�q jIhs@���9��@����ir�@��L�#��@�bƁ��@�F���<@�;b��@�����@��{+G�<@��}v6H�@�҇��/@��Y�Ie�@�ȇ�p�@�B�V@�&@�ug(�5@��ΈY�Y@��.zg�@�6�y���@���4�g@��)���@�A����@�Ѓ�N:�@��
J��@�D&�'@���
�[@��R��4�@���>���@�dƱ�7�@�9����@��~��@��䎿��@���
1�@���Ƥ�@������        ?hQ�%*&?�B("���?ʤ�	��?㢮�\χ?�Uj%J{�@5�j��@����Z�@h�+#Ǝ@����i@$os��{g@*!r:R4�@0HpԮ�@3�H��@7ݱl�W@<C�V7�@@�,�7��@C3�c=�e@FSH�X@IT�߯��@Lْ�[�@PX<ց�@Rlە�"A@T��ևG/@W���sd@Y���W`@\b��V�@_P��z{�@a8�$�w@b�ۆi� @d�T���@f�bDB�@h��l�@j�����@m#f� I@o�Kە@q [�ν�@r�����@t%N^�@u�X��|�@wKM���@y�؎e�@z�C���@|�%;��@
�A��5@��+	�v�@��?y8g�@��s��n@�7���'�@��G�J��@��%ӨI9@�H��q�5@��3�`�&@�D.�Q�@�����@�{7��{@�(�J�@����|�#@��Rә�@��|b�i�@��7�˶O@�Ҩ����@����]�0@��@�.$�        @Y-��@Z�2�1y@}n6l@�h@�����t_@���݈m)@���Ljw@�k>�ꞓ@��qb�J@�"!CR��@̠����@���Z�@�%\	g�a@��^�x��@��.@�cX@����_�T@�����@�l�߰jy@�=�὘�@�H(/�@��B�%�T@�u�RQ�@�`�\�@��+;���@�������A �j½��A$�eH��Aۤ�|A�*5�n�A��ՔAnA	w��l!�A~��&�	A��;\7�A�p݆�_A��V�A1�+NAAe���xA�ӨąDA�G^HDA2���A��FSgA�����bABǨ�ȶA�a��JA�-���A�\�\��A �����A!P��A"�>�"�A"�[�w�A#�HZ2)�A$�^?��A%d�wďA&A�8�2�A'#�	�zA(~��6vA(�-sA�WA)�yl���A*��X�N�A+̉��-A,���PHA-���8r�A.ں#�>�A/�}�        ?h]��Jk?�bq�Ԕ?�X3��9d?� �#+?���s?��?���=?�����p@�Y���@	N�f@�@q�[�=v@�_�S@��-3
|@Nx4��@"�c��Z�@&-�"?�O@)�%�_=e@-��p���@1f�w"�@3K�B�_@5��{�a@838��I�@:�Lꓮ+@=�St���@@M�i@A�Q��U@CsH&c�@E!r8��@F��k��@H��j���@J����t�@L��z�A9@N���|)i@Pb6��U�@Q}�鏾�@R�+�<	A@S�.�a��@UEE��@VX��ѾQ@W�A�X@Y#��@Zx��lG�@[�t���@]z-/���@_F�QPN@`Z�+cA]@a4�Ot�@b�v��@c �]
�A@c�zr�{@d�q�K�@e�&Q$� @f��fY<@h��QO@i.��.�@jVJ��@k�,�V�@l�T��
@n�&��@ob�P�Y@pbS�0"�@qQ��t@qؠ�t�@r�K���        ?�|����?`��3�u?���O��?����%q5?�^̟&?�X�
��?�<�g���?��:;t�?�"�D�]�?��i}�?���Ƕ?�?�x�@���^�T@1jQ\��@�ӊg��@���t�@ٝ��d@�}��<@ �>!LbD@#�nswk�@'��ClՐ@+u�o�3�@/���9g@2>��H��@4�T}qS�@7�`$�`�@:�U�@=���w@@���h@BSK���0@D>Qn
@FG1#6\@Hos��m�@J�ڞz��@M!]-�O@O��"�&m@Q-��@R���'�,@T��Hڳ@U����@WM금R@Y
�%�l@Z��y+q=@\�υ�@^��*�T_@`���B�l@aə�I��@cHx�*@de�㎋�@eӂ>70�@gWku�{@h��8c>@j�p�jB,@lle4R�L@nM*���@p#�FIj@q+�����@rA*�7X�@sc,Ԧ6�@t�� �@u����@w^�q�@xnO6��        ?:��?t��A1��?� �T]?��%��F�?��üT<�?�\'��{&?خ��	<?�	�%�?�*�.�?��l��:�?��-��?�?})Ü@�9�L�g@_EG���@�jU���@	�9�m@��ə�@Z8��}�@��NQ�@"���}�@&:H��-@*u,s�p@/DW�Q��@2X�ʨ|�@5c�����@8Ȥ5�{-@<����l@@Z��6$@B��B��@E$�A4�@G�<��B~@JՑ��@N	�V�;T@P�y�v�@R��>>|�@T�g�֤@V���߬6@X��yl�X@[[�U�J@]�[�X�@`P��M�U@a�h���@cH���$�@d�g�@f�'#��<@hi�8�1�@jPD�P��@lPIh��@nj�	�[�@pPd8��@qy����@r�4b~$�@s��֘~�@uSآ)s@v����@x=w�qB^@y�0�]d@{x|��&6@}7�-�-�@�U�@�f�}�4@����5�@��]T�
l        ?��V�r0�@)���*�@K�F���@bw��T�@rb9qWa@~��]7�@�Li��@�^:"A�@���+�@�A��m��@���x�@��m�pC@��Um�7@���^�ׇ@��|�]e�@���北@��s��l@��|��o@�%��@� �d(�@�:�~ص�@�s�4�3�@���
�@@�Bg�HE@��A��/@�D���N@Ѭ����@�#����V@ԩ�j�@�@t��%�@����H@١,�b��@�m1Fw�@�L`wh_�@�@���@���Y1@�@TX�n@���cUW@��B�?�@�-�"��@�q`���{@��-�rt"@�#��[�Q@�����@�sL��@�AN���@�<�ݸ��@�t���ӟ@�R؁�@�@�8�^x��@�&�7�j;@�G��@�� S@@� &>� A@�.�UOJ�@�F��a�@�h�x5^@��mYG@��C�_@�Y�!@�_�>��	@��f�q\AA ��ݓJ�        ?��k�Ѓ~@'���@-���k@A�6rC�g@P�[zAJ@[(�w���@d����@l	lvYt@r���l�z@xc��C�@~���+�@�g�m>�8@�!�W3u@�5d��@������@���G,�@�@GՄ@���h��a@���*=Q@���k��@�	�<*�@��d+=�}@�r���@�D���)�@�)�\(�'@�"�ڞ�&@�.���;@�N��gS�@��\��H@����@��\ ;[@�H#?v��@�����/�@���f�)@�!�{��@�{�vw�@�ݾ�h@�IM�/�t@���|B�@�;���@��n� ��@��Z�b�@�tw��8@�E���r@�ԽC@���J�o@�ч2�	@ų�*�0@ƚv7�<@ǅL^�F�@�t=���@�g)m`@�]��#��@�XM�	�.@�V,�p��@�W]X��@�[���Z~@�c8�uҍ@�6�
�+�@н����@�E��a&@�ϡ\��T@�Z���        ?��X���G@
�R@$;:@)o�Ϣ�u@=-ݻ�V�@J&�&���@T��:�j@]���@d��=҈@kV�ue~@q��宑�@v;l&�l�@{o]J�@��(1
�b@��3�h�(@�'��(@��[d9�`@�6�mHZ@����?G�@�ߵ,U��@��,137�@��G���@��w4{,^@���OK��@���j��@�j���"@�'���V@�|_Տ|@�
U��@������@������@��t�PIS@��Z=dR�@��!��?�@��\��R{@��}^Y,@���W�Wm@�������@��H�$�@��J�wv @�����@����D�@���˂7�@�a�=_�-@��X"��@��GN��@�2��=�K@����V"@����U�@�>����>@��|��؇@��{ixT@�~C-�bK@�G�km)T@����R@��:@�Ph@�� eD��@��$�LK@�{��L(@�b�Ep�f@�P<݂�@�C���0@�=�h�fG@��	o��        ?�G��o��?���UE~�@���^d@,�w��@;yaM�@Fz�����@P�ngF�@WZo�D��@_Y���@c�:�?�@h�����@nx�>f@rF���K@u����/Q@y2����@}j%�N@���yc�@��7�)@�J9�WN@������@���*l@��8���@�Q/sG@������@��!�MG@����Z�@�msc�74@�n�W��@���1R @���	�n@�����^�@�,��r�8@�g�N(@����S�@�� ���@�d�t��@�Ҿ����@�N,nZS;@��w֎��@�o*���@��)���@��W�?@�ɜ�� �@���Z�8�@��vr�1�@��f���W@���� 6�@��-C�@���/bO�@��6��M�@�)�5�G@�_�42a�@����l#�@���̺@�8k:�{@��A���@�z�([@�0\�D�%@��{F�@¨�� �s@�k��6��@�3����@������        @�Q����m@�7c��@�4��@�h	�9�Ap�װ�{A����ǜAIE�77A�F�}a�A"Q{MJ��A'C�!z.�A,�_�F�A1c��C��A4�7����A8)�uFk�A;鲉�A?�,V&iAB�Ux��ADB�r�?AF����zAH�f���AK�9����AN`7��APi4��^MAQ�~v�AS@��VGAT�5�k�JAVG��L�AWܴd��9AY}�M��A[*;j�ՅA\�}w�$A^�|=��A`8����Aa#��XAbz�I\�Ac /o��Ad4���Ad�#8��Af�|�!wAg	oo}?�Ah�d��XAi'd�U��Aj=ۑ-
AkYU�m+NAlyϳN�Am�;��An���W�Ao�|�$Ap�%"�9Aq1�Q�'�Aq���KvArp(��<As/����As�v�yAt[��G1Au��3TAu� J���AvV�q�xAwE��7Aw����Ax`AK�d�Ayo�3Ay�_e���        ?����N"?ŞH5�Cx?�ϴ��B3?����7+�@��jԐ-@�Ӡ0�@#�ƺ�5X@,�q��}@2�<��y@8�P��@?3����@CG%��=@Gec7v�l@K���!s�@P�J�Զ@SEډ��@VG�S�<l@Y�,�w<@]	ŵՋ�@`d�ʎȩ@bdÍ�\�@d���q��@fŢ��@i(��d� @k��S��@nY�|���@p�5��i�@rt�A��@s�Q��0@uH���UZ@w2�{�(@x�}�V�@z¶孩Q@|ýY��@~�FJ�y@����_^�@��u��b,@��w�{%�@��g��e@�O.+�:�@��W�q�@��z��Rp@�`���,�@��.7���@�V`�b@�䰯��q@��(_�@��i^�M@�ov��S�@�Q��H�@�:뾉��@�,�1SX@�%�,�"w@�'�����@�2�*��@�G��fR@�g�W^�@����{a@���]u�@���@�N��U�@��KY�K�@����B�        ?`_�$�?�M�C��?ǉB���?�M��v`?��O�r�'?�^��E��@�g�݄�@��$��4@ �C���@� �m@#�?��@)Cg|��0@/d���o@315���^@7$^؜gN@;��_��@@<.��E@B�ڔ�}�@E���$�@I'�z>D�@L����4�@PH]��@Rdc]�C@T�\�h:�@W;J�פ@Z)���p@]���n@`5a����@bT�s@d6
��R@fG�S��1@h���\�@kM@1�5@n ꯰,c@p�h�R;�@r9�P@s��1L�@u��(�gV@wӊ:��@y�1�*��@|-��@~�$l"�@�� �7�@��VM�H@�D��er@������@�L�cLP�@�����@���i�h@�o�ݼ��@�O`Z��@�C�[��4@���Ș�a@��8;s�@��m��"@��Z7�iu@�%�;�x@�_����I@�����I@��K���@�P��ot@���d�]@�(_oh�        ?Q��ܧ�?� �a`T?�-���?�u`#�/?�#�)���?⿈�5��?��:?����<�@�Nk+!@
���f@�,�S��@�7��z@$jP�~ 7@,����*@3���7q@:�`M���@A��V:�@F�Ӥ���@M!/I�@R+��*+�@V;�}D/f@Z��\!0@_tb���@b6��{4@d�LiKU@gP8��\�@i؏6M��@lT�!!��@n��Jze0@p�T��5B@q��Ȟ5�@r�	_0�@s�5���@t�J#��@uᆫ�e�@v�|ǹK@w�a�m@x͉}�@y�Zl�R@z�%=�J@{ƁA�@|�����@}ꏰ�Oi@�iy�@�!�~k\3@��2�9@�o*��Z@�"��*�@����È@���Ը�*@�o�%c�@�D9W�@� S�6*@��P?@��y9�'@��RRq@���c�3@��e�#H@�ʅpw�@�(:��/`@�S��]K�@��=�Y�@�e�2F��        @J���a@Rk�6�@t�9o�ў@�t���c:@�TW��;�@�E��Ys@���9k'@��/�ɍ@������@Ň)o�R@���:�@и$ٰ'@�C!A��[@�4ɖ3P@ܐ����@��Ƃ7|@�Ir�6@�߉0N\@�,VoF'@�s���2@��E��4@�����}:@����r�@��8�2t@�0��M4@��
9S&@��#z_�@���.ѦACz��|A���5�AL%Y��UA�\���A����t(A	r�nO��ASB�8��AH�s��AQj9� A�R��ysA�k���A� �$f�A"H�:�A[�s�ƸA����/A�*� 0�AL���A��%�%�A(3�pA��[HT�A5�r��A hF�&ޫA!<�kDI$A"��QA"�[�P��A#�a'l]�A$�"i�A%��w�$�A&�rL���A( �W��A)!�����A*N3>ʮA+���r�A,˿��s3A.�_��C        ?� �cR��?�;�7�;?�5E@���+@�_g@!׏}���@*wo%k:�@2^)�BCS@8P9Z���@?E�V�u@CM^�1�@GxJ��{�@L	�}`F1@P��g�F�@S0c�V3@VM�}-�@Y)��x�@\p�#N�"@_��+;�@a��A1`p@c�x=��@e�u�Op@g��$��@i�	(\[�@l%Q�p=�@nrij\[�@pi. ��@q�Q��Z�@r���ȍ@t0�a��@u�Hj/k	@v���~ze@xMRA`j@y���G�#@{9�Y�k@|�����@~N%#&�@��s@��|E4@��6��@�|���q@�a����@�N"s�@�BX2k¶@�>��⼳@�D(�>@�R�-�
�@�j�kw�a@���Tk`�@��Y����@���S@�3.�p�@�����ͬ@�l�:�59@�e�(�+@���9'�@��Cge�@�[6
T�@�&D?��@��Whq@�цБ��@���G�@��m���        ?���F�?��7���O?�8�x?�ξ�T�@�����@Գ���@�m��3'@#$���,@)"uW@/���&k@3e?a'�@7P5O�H@;��ʭ�]@@���`�@B��i��@E>o��ب@H+;C��@K\�-Ő�@N�\�`�=@QZ�Yz��@Syc?@U�Z���@Xb�V�	�@[8:���@^S��@`��@�z@b�*�N�@d�CIi4�@fϜ^�;-@i۹�@kxh���@m�-�Sx\@pQ��G�)@q��}��@s#�nt@t��k���@v+���^@w���@ye�zEf@{ꢊ��@|̊�@@~�:sl"Y@�4f�¹�@�'���,N@�$��dm�@�,\N���@�@	}{��@�`ڷ�Y�@���In�%@�Πb&�\@��9K@�~���i�@����3�@�z�s�3A@�	�穒@�f��D�@�L�i"�@�@Im��@�Bjx`�@�R�C�c@�rD����@�����@���w�?�        ?�"6��S:?�ʚ�C0�?�N�-Dv?�S��|�@	oA��T'@9�:[D�@!Po���@(�#}�Q�@0�"z�N]@6�W`��@;یƯ��@A"�n(��@D�cC�DR@H��6�2y@L���̡@P�Y��w@SE.;m�@V��*��@Y
'�[,�@\Kȁ�}�@_�ӑng�@a��&O$^@c����/@f�O5';@h[�5U�@j�'__M9@mz'�Z@p"Ʋ�ͯ@q�0%��6@s,ߐ�@t�f��u@v�Oe��,@xa���@zK/U�q@|M(��M@~g���Z @�M��H�@�u��c�@����[@��v/beU@�G����@��T;�Oe@�+�4��@���l�W@�_x�@�����@��1��[�@�gGM�dT@�fd�e�@�p��5b(@���;�@��Wa�@���aj��@�X�9w@�fo���\@��Ϳ�@�-�r��@��+�:�w@�7q�R�E@��@��N*@��=t�@������@��Ѡ��p        @,��-�@c��<�Y@�N��D1�@��;��U�@�(�jۏQ@��e
)m_@��l��;�@�zOkq�@�o��C^@������@آ:k�E/@����/ B@���K<R�@��dR��@�Wq����@���5��@�ٲ-b�:@��'�@�)ha�@�s�8�!h@�٪�t@�Z�wk7�@���Y�:�A V��8�A�㨩�@A2����!A��`��ADV{�A�4Q���A	�!����AD�+$A���Aޟ����A_���(AV��s~�AT���9AY"���Ad�[Axc����A�̒D�A��=1ްA�	���A��t�Ac�P�,�A�<afi�At��(Ay.��tA x\RΉPA!;�q��UA"��3A"�A7-[�A#� &�)A$��R0A%�L��QA&~�s�A'~����A(���i�A)�k��DMA*��6��A+ܣ�o�A-�0�\A.F�/+�A/�qH��        ?^�`=�؊?�!�(!"\?�����?�'�B+�p?�A۩��?�!���?�}�m,�?����@ }Y���@A����@
��'��@VH>���@������@n:��q @�a���}@ �>�]�@"zM�I<�@%#��G��@(����g@+����$@._�۾p@0�>�˽�@2���4@K@4��T�3@6�����@8��f�Ψ@;�o�@=Z���0@?����l@AS����@BQ�H��@C�F��W@D���N�@F?��T@G�:�Az�@Id���r@Jr���{@K�]O�C@Md1�.�@N�a@��@P:Q4]J�@Q����@Qџ�5@R��f��h@SxVp��@TQ~#F>@U.2(�G@V��k:@V�[��Q@W�zr�@Xː��@Y��5��<@Z��p-Ğ@[�}T��@\��m���@]��k��@^���Ռ@_䀵��@`�(,W�@a͐�y�@a��Z7�@b9D�xc@bҦﲫ�        ?B?ʋ��?�)Z�'PU?�{����?�l`Lo�?�6^Ć߱?�y���XV?����j�?��C�Vt?����u�@'0��0@��!D�@g��/A@�%�T @�(7�;@\jCC�@!��n#@%,�=�,�@)
�)Go@-}�{fG@1.�z��@3ڇl%�@6�.�$w+@9�A8��l@=PH2ʫ-@@z3�mLP@Bl�t��|@D�L�@F�x�xY�@IWG�9�@K�.�^�@NM|T][@@P�u@�L{@R'����@S�[�q�)@Uw����@WP"����@YG��~:�@[`!��
�@]���@_�Z�5��@aC)�p��@b�����N@d(,	��@e�5����@g36�&��@h�����z@jĨ�W��@l��R-< @nέ�,��@p��~��@q�F�O�@r�/lr�@tC�"�8�@u�>�ѽ@w)���@x��4S�0@zh�g#L@|+ǐI�@~3c�Xv@��Z��f@�B��@�#B+o�@�:k~�1�        ?QZzm���?}�+.9o!?��m��0o?��<���?���x��?��_�H?׺�r)?��䊛�?��x��UY?�9L*�?�i��m?�{�a\{�?�hǟ?�6@�rbau@��W�`!@D�	]��@Ut	��@~��>�@0JwK�@�F��Q@ >���;@@#�M��@&Xi-�!@)���Y�#@.����@18�o���@3����@6G�F��@9 �5H�v@<5����@?���G8@A�U�s@C}�>*�S@E��8�p'@Gͤ^]~�@J4kC�C@Lǀ�2�Q@O�N�L�@Q?��y�@R�|��@T�O�
��@VS��:�@XA1ƹ�r@ZOߟ�L�@\�ޑ��L@^٧��@`��op$@b���ܚ@co1�mu@d�|�YV�@f�|;o�@hG�Tw4@jƳ�1@lf�~eD@n
����@p����@q7�Ex@rf#S$T@s���Q�w@t�O�'P@vR��k@w���;��@yE^zt��        ?�X2U�I@%�_>�&�@G�N1'��@_��CN�@o�^Q�=@z�[Q�7�@��*o���@���93��@�X.�lݮ@�f�[]yn@�&�p0!@��Ba��E@�,�:0��@�d�^[�@�U���H�@�_^�-@��_�MՅ@�i*��@�r+�4�&@����^��@����;�@��j�^�X@��|�	Q@��<��%@��b�y�@�D�a4�@̍�Ϙ��@����6�@Ц��{�q@��b���@��ҕ�3@�d2q�e@լ��F�@��m�̪�@�Lmbid@٣Z�@��4p��8@�^a�#?@����@�+�\�\e@�L��Ǹ�@� i�*@��~�8B@�U kDh@�?����@�l(�u_@�����l@�P�]�@�[���B@�*�[�L�@��"ki�@��kBKB�@魲�z�@�H�u�@�n�<E�H@�UjYu@�@Y;t�@�/k�1,@�"�Os#�@��� �@��z
1�@�
OW�;@񋺋�V        ?��*�8�?�̀Ӣ�k?��\렾�@���YF�@S����@'=	g�I@1B����@7�>V�@?�>�rt&@D"�]J�@H�.Y �@NԈ�w#@Q���b<@T����|@X8qG��@[w��~�@_�T)��@ay��C�@c��
F;<@e��,�l@g�m�ڕ�@jRb��@lҶ!��@oqyJ��@qQ�lL@r�R��@t Z���@u�"�H��@w$��6#�@x�(U�@z��U��{@|K���J@~#�<z�@�D��@�k�}<�@�5��t�@���oS@�*a��@�I�����@�r�w�3�@��j��h@��l��E#@�#�����@�qZ�d�8@��Zt�]�@�(����N@��5�}&[@��h�:@�@$p!�@�5����@�Ȅc�|d@�����X@�a��'@�4pU�FM@�|����@��ۜ���@�ƣ�r@���5�{�@��̎��}@��_��pd@�s�sJ}<@�k��
@�g6�N
        ?sa �	�?�F^�PAg?�ۀކ7?�e��?��Qz�e@71�ࢨ@~���@��R\�@ �J'2@#2�%90p@'�Ƃ5�[@-9�?]�@1s�-�7F@4��yz�@8]��oF@<s�O�|]@@�vϭm�@C
��C��@E�(��@H�G]9/G@LV�6�@@P�v^�w@RX���K@T?1����@V��L' �@Y7g�ӓ�@\bIV��@_	N�P��@a&S����@b�V�-�@d�&'1��@f��O��I@h���a��@kMz��@m�Ŏ��G@p/Q�Z5h@q�)c�@s�:�GQ@t�?�#�Q@v8<n�@w���Ɏ@y�ۀN�@{��z�}�@}�;�c@�����@�3aw��@�s��8@@���}/C@�4#��m@���s�b@�R�q�n=@��=�O�@��' �f�@��i�w��@��-see@�����a@�# ��z0@�V�O�@��;��1@��'�f�@�L�t'l@���A�j@�9�2�4�        ?��`�(��?�B6�U�?����2?�4�^���?���+�\M@}��"�@m�r��@>��R�@!�����[@'L�S�?�@-ֵ.AL�@2��}[J�@7��{��@<�v�@@Μ����@C�cd��@Gr�ě�@KRPٯ:�@O�2�Ss
@R$���с@T�6 `��@W��N�C@Z��`:�8@]�:����@`Ľg��@b������@d�g���@g�j��e@i�5�ٜ^@l]̐�@n�1t���@pݻ�"�Q@rb�ʨ��@s��P�z�@u�QW)�9@wh��6E<@y<�>B��@{%�A�h@}#�A��:@7�k��@��*�OA;@��<nZ@��� �C8@�9����@��%x��@��O��@�:���@���٫�#@�/��qg�@���sU�@�hZy4@�Al��'@��R"'@�@���51�@�⏀�Ǟ@��ά� �@��2�<�@�I��a:@�J��ۗV@���aq�@��[5���@�'��-�@���u�;         @4 ʦ���@j����ɚ@�I-Ʋ>@��[K�g@��G��]'@��n��xD@�ӓ���@�(�a���@��Ն�)@Ճޡz�R@�V:����@߆+I��V@⇗��h
@�wR��
@��.��@��.�ٷ�@�J�����@�u�۪2�@�]n.<.�@�\���"�@�ti2�F@��HY���@��.�=�@�Hb`��JA ^��v/�A�m~�:A�=�5��AQ gDYDA�,Ս�A*� ��A�����A
3A����Aʈ��x@Ao?v��#A!�9w��Aq���AY���AIf���A@�M6NuA?h��FAE��
�PAT/9�jAjRZ0��A��I��A�b9��A�qx"XA��;�AU�����A���Z��A�}	��A ������A!Ri 3��A"��Y�A"��H�DA#y.m�mA$8��ÀA$��P��A%Ė�a�A&��g�/A'a��qA(7�T4��A)�?�A)���^         ?ȁ�3=M?���|Q�@=C�B@1�jA
 �@@_���H@J�iu��@R�;���H@Y����<�@`�
ɀx�@e�!�nE@j���rr@pF(T��.@s��@w
�y�,@z����Y@Ll�C@�Ыg��@�<Q7z;�@��ێo°@��-$'�@�ti�TG@��3T[@�^�x���@�6�ѫ*@�ػ�t�a@���$#��@���yԒ,@����e\@�ͪ��9h@�
�}�\@����7>�@�׿Zk�E@��0_o:@�]���y�@��x�bA�@��Db,E@��R``@�r�B��@��0��@�mVD�@��-�2�L@�7��Z�@���\RH@���Jm�@��{Y�k@��'��K�@��7ª��@�����@��	�Li�@�� Frv@��Z� :@�'W���\@�O���A�@��s�@����	@����V>@���8@����H��@�s����@�#��r�$@�דj6d2@Ï��)�@�K}��E�        ?��&p��c?��/��?��q���@ X%Bc�K@����z0@�)z�@%m%w��@.�r��@4�FtL@;��
m��@BD�m$�@G*�����@MK �I� @RML��a�@V���+C5@[���J@`���*m@dY���p@hf��km@m?HRk�@q0�;�@t3���+_@w������@{YY�PH�@��P�f�@�
��%p2@����7��@�GM���	@�A"�|��@�|���q@�_�8�@�c�TM�@�nV�Y��@���c�Ɇ@����2�@�q��U�@�(c�n�@�q�g� @���X�>l@�}��0?�@�#���.@��u׼95@��%�~@���uk�@������@���]�@�WA?`�@�i�%RD@��y����@����@���*+6
@��#��*T@�%ǻI@�'���&@�P��2S@�|��p�@����"�@�ݡ�$1@�W�Ce@�I���I@�B+OϏ@��Y�G_@�f�ɜq        ?�p 1~�+?�}|3�@���@p@+v	t#u@6�u���@Ah�&�!@H
�U�%�@P,�X��@U:rK�@Z�e��[0@`�ߣ�@d/F�)g*@hIKؑ�@lޟ�jU�@p��v�x�@s��J�g@v�U.�F�@zEP��O@}�Ĝ)gE@���ם�@�.��g�@��8g�@�1ZW�@�����@��x���@��fXE�@�=.��@� Q��]@�	Y��t�@�!�Qo7/@�]떗�@��K�zH�@�GlA�@���k�j@�h�W5��@��_��#�@��k�yx�@�4���5�@��.�LD@�݇���@��\����@��2#��@���Б��@��T/���@��2���@�gJ��\@�J6l��@���@��@��V���@�Y�g�q�@�μ���@�Ra�7I@��dn@��tėmx@��>�@�{�Q��@�d����'@�U�NH�@�O_����@�Q��=I�@�]��eo�@�s�Y        @au� �@���>�*@�<����@ˆ�f�1@�>��@����D�@���-p�@��,�w�G@���r�oA �����A�1��H�A	7�̢;�A\��Ll�AH1���A&���A��t��&A0<�2��A sz�b1A"!:|��A$V*��ތA&�M����A)!	����A+������A.p���zA0���m�A2$t#���A3���MKvA5V�' a�A7A�KjA8�����A:��]�<A<��e�¾A>�*��(BA@V��ӡAAk�3�AB���p�:AC�G��AD��|�wAF �|Z`AGfrAt�AH�?�ƶAJP����AKn�M�;AL��b�ŝANN�D�sAO��ʮ=AP�~%2�gAQu1.���ARDztM�AS�Z��1AS����`WAT��hzAU�7@��[AV�\�_�AW�}_��-AXy��<~[AYp�B�<�AZl�܆�A[m�5<KA\s��.��A]~�-��wA^�/i�I)A_��{�i        ?��� <y�?�
�㝧�?�x��5G?����2k�@㺝��!@k[���@$H���?@,�c���3@3�}�S(�@9��W-ɩ@@E4�w+@C�xJ@H�l�Yn@L��l���@P����@S��7��@Vi(���@Y�4'`F @\�K;.+\@`0�����@bKw�H@dZ�yи@f8ݱ=Y�@h|��xO@j��&�4@ml�gG4B@p�26�i@qx$k�O@r�:�7�u@t����l.@v/�!/�@w�����@y�ݺ�M`@{���6@}��ns�@�E+熠@��x*�@�mT���@�7ո�7�@�k��%��@��9ʳ��@���<�Ɨ@�A� L@���]j�@� M!���@�m=��g@��Z'��@�b�s�~�@�v��!Q@�?��h��@���y�@��ߍ�I9@����c�o@��H��@���޽�V@�q�!��@�b����@�X�]Ԙe@�S�cHj@�R�֭��@�V�U�S@�^���V@�j��^�        ?S���s�?��%�?��կ	j?�cC�d�?��<���?�G�
��%@ �P,?ِ@���@q�wNH@v���@��C�@#�4�{@(}���@.0�&�' @2Z���M@6C1(�@:6�g�l@>��!@�@B����@D�2�W2�@G�\=L��@Kl�~��@O+U�7�#@Q�^A��@S�+YE��@V=:��7@X�"�#@[��r���@^�I,K'@a�`@b�tu�@d�{����@f�vۻF@iY�Z@ky�C� �@nB��@po�?I@q���s�@s�2>���@uB�k�>@w�!��@y
G2���@{`�& �@}Vsװ$j@��o�)�@�tl@�zKl��@���z���@�tl��@�2'@����p�@���a��P@�i�̎�@�WT�Ս@�+uMD��@�4��'�r@�G�3�@�e���@����m@���G�ͭ@���ǃ�@�F�0D�-@��!�b�9        ?�A��us?�h�<X?@6,ͧ�#@+��]�@;�PgD�@G�Y�!o-@R�-�z+@Y�ّ�2Z@aq4F�_�@f��^7W@l��g�@q�9��!@u�=�Kӻ@z2T��3@
(�=�@�-����@��187@�2%J�4i@��Z���@����@�sBE�2J@�sp|��@����)@��A���@��ī7v@���]"��@��ɉe�@��b�V׎@�;#���@��Ae�:�@�-/0���@��`SP@�`aT��@�Ҏ�@��L9}�A@��S�=�@��^I�!@��i��cM@�֊w�DF@����i�@�?nT��@�/6z�x�@�a��MX@��d]��@����69@�<g�	�@��ڥg&@���b�r@����s@����@�˺�Ҥ@���vt@�sO�q�@�Qj�{�i@�7X~h�@�$+3 r@���D@��&i]|@�]�gݎ@�#�9�V@�6��1,>@�Q���� @�tI�|��        @<�1�HC@u�0B@����%A@�Ε%�`w@���u���@�� 2#s@�]ګ
��@�ˇ�U�N@�X��؍@���':d@�lC����@�?Wt�x�@�,���P@�9��Z,�@���T�|A!�P,IA��ӦUA#���t�A	ӌd��hA��'�pA�q����AT��)MA�#��A���<	�A]s"շA0Fjl�A�9/�A�\��A"]+�A $[N�bA!CG��CA"nUF�A#�� 1A$��?��A&<���FA'�?��4A)����*A*��t���A,�9<_�A-�/Y��(A/4���A0n/ŶPjA1F�y�A2$�|�0A3�D!K�A3��i��A4�e�!VA5�/��TA6�v8��eA7��VnA8��{-�A9���JhA:���RA;�&�V�9A<��v���A=��j��A?��N�A@�FJ�A@��V`�AAA���7�AA�5��	ABp�QിAC
nP��        ?��w�5?�"�nJ@l�xmo�@#����@2�ͧ{c@?;�7f�+@GlQm<^)@Pp*���N@V �����@\l"��1�@aۭލ`^@e�=x�h�@j~v�rJ�@o~���S@rzB�NS�@up_�$�9@x�� �@|Ӛ�P�@�����@�т}zP�@��e�s@�I>�X@�e��E$@�ҕr�fD@�\���9�@�㶲J�@�d0:�@��;��� @�T�����@��1 ��@���׽Y@�)�MםS@��U2W�@���l�"�@�v�QZ�@�*G�YW@����@�=�"V@����$�@���@�,#O%��@�>��9�@�U�O�Q�@�r��ZGS@�����@����B�N@��̹��l@��Ț�@�O�ŐL@���d�@�e 8�S�@�HM[��@������@�R���W@����/c�@��W�w��@�U::~	@�����M@��6P��Y@�m?����@�$�ջ�1@���^�@���͸n�        ?��N�?�Q�e|ϐ?����M@��=8�@��'Tm@"6E2�@+����@2�N��7e@8�l�z��@?��*5��@C��u��@G����6�@L��#Y@Pk���]�@R��6P�@U��mM}�@X��_�l@[��H��@^ӦLD��@a"�Ҙg@b�o�M�@d�q�7@g��-@iT�62+ @k�W���@nX<b:|@p�����@r��?@s���H	@u>H;��@v���Z�@x��:�d�@z��d!)W@|�. �@zHo�@��Q�"�]@��ߺ7`@�9Aq���@������p@�X#f��@���4��+@� ��F@�ʖE�k�@���$�[�@�Y+I��@�8x46@��K�g@�"��s�@�3_���@�M�C�Z@�r�G�l@���(���@��w��@�#KpV�@�^� l�*@��a���@��i���@�j	r�>I@��y9=8�@��i��ʛ@�_+V/@����@��H/7a        ?���a�p?�D�(�?�� ��@+ r�R�@y�u�@*5_@��@3��H�ڳ@;�F�$�@B��sMq�@H)yֽ@Ny��L�6@R��m�m@V�7*�@[vEV�@`K����@c'�0m@fR�vP�v@i�8W���@m��3!�-@p�!	�NU@s��-]$@u�4��n @x��^��@z��i@}�؎	I�@��x)��@�B�,l��@��0� @�����8@�I	=�� @��Q�v�"@�+�L�a@��2ĭ�@�t:�Z��@�
�:@���?��@�����@��M4�j@��W|�b�@�엂��_@�@S�/'m@��\�B� @�x��D�@�r&�Dd@��=�8�@�A�>�f^@���$���@�C��yL2@��(���@�rN+:�@�u3I3Z@����TX,@����..@����oIO@�{T�f�@�^��,�S@�DĦO@�,���@��`���@�G��x�@��vK�c@��0��@��r+��        @VJ����@�Wn�M7@�jJ ?�a@�+���@�T(E<@�e�/�"�@�!�f o@�smo�/@󖨀kTe@�)�ϼ%h@�vY?H�A>���.tA �l�|Aa}��8A pi:xA��K��A.p���A.� T�AGc�uA\��W�A �;����A"�;/��A$�q[���A&�m,Q�A(� �T��A*�$hL��A-��~G[A/t�oS]DA0�(82{�A22{�͕#A3}޾��A4���I�HA60��Ќ�A7��,I6�A9r[���A:}#��A;�wt�A=�Z'>iA?�D���A@Q��W&yAA 4<��AA�8���zAB��?R��AC�����AD|��RAE[�pc�6AF>��C�AG#~�I�AH1a�AH��r0�AI�:D�VAJ�p���cAKθ(d7AL�/#�6AMOAN�>U�/AO�/v8/APd0�T�JAP�b��BAQnF�lAQ�EiDl�AR}̐;{XAS��?F�        ?mUf>��?��Z��?�o�zk�e?�h�&�J�?�2�7g?��v�9�A@!��Wd@
�����@��>p-�@��/�@�ܫ=@ �eO~�@$:6_�32@'���J�@+��6^A6@/���z@2 �&<t@4U�9>T@6�s��\@9p��J�i@<6�5i�@?"|��`@A����@B��.)�T@Da�>(?@F �Di�V@G�vQ���@I�L���@K���C@M�l�e@O���(�<@Q��7@R!өr�@SI�`iӖ@T{�p!@U�:2*��@WpR�d@XX4x&-@Y�T���@@[,��+�@\�����@^<�S���@_�b�'t�@`�n	���@a����B@b�i,Q�A@c�����@d������@e���\�H@f�~ʓ�Y@g�Io9#�@hЮ�@i�`aXK�@k*��0�@lb{�"�B@m�[��J~@n釐b�&@p����O@p���n`�@qu3���>@r']X� I@r�PF>�@s��        ?!o%�Ԟ?fd.���?��H	8�?��L�J>?�{z-�~	?Ȁ�Ѐ��?���z?�U��u�?�Bښ?��dCfh?���P��p?�:oN�@ �HiWP@�e[i�@���$�@Z�1�=%@�'�{@��(lC@ J4��.w@#����*)@'����I�@,E���^@0���b��@3���S�@6��yb�@:�"�K@>�_=X��@A�H�iST@D&��8@F���@I�ap�@M<�}L�@PkC�q_@R_淟ݜ@T~?�3|�@V�&�x��@Y?��ʼ@[�L���@^������@`����@b�t��I@dE ��s�@f ��'n@h�w���@j7O��u@ls��J>@n��p�ܕ@p�cT@q�.��\O@sfy���@tዦA��@vp��3B�@x9P�:�@y���aEM@{�-�
-o@}�����@���@��d]&vl@�މ���@����$vX@�,��'��@�e��wi�@����9^�        ?m1�r9o�?��0/KT�?�q(����?妆�PJ&?�q�,4ۥ@�h�[@v�k�@��C��@ .�v���@%�h��^@*�, Y��@0k�nf��@3�	�U��@7��Z�Я@<2��xj�@@�� ��@CN���@FM|.;��@I�k����@MX��M@Pq`%\�@R|��\�@T�sO�c@W���P�@Y�[dh�a@\3q	
�@_-��>@a �j�@b��6��@d6U8#��@e�4���@g�����@i�7ψR@kx~ڻ�@mq3�Y�@oxq_��@pƾ���@q�أ�n�@r�AGK�@t�hMQ�@u0Q��|1@vY�:���@w��6��@x��zo_@y�U���@{@pO�Z@|�]btuY@}ޠ2�1�@:d)�c�@�O�zTw�@���Z��@��y&@������@�I��8.�@�X�ǷI@��v�չ@��Dw>	@����O{�@�|i�i�i@�d�ρ�@�S�9�d7@�H]�z��@�C{�!��        ?���%El@2����,P@U*���4@mk�����@~	��(�@���u��@�}���@�`Y�H��@�2|��@�@�Q��@�ׇ�ϲ,@�|�K�1@�Ծ���@�uR{C@�`�'�`�@�Mg��`�@EB�;�@�����@ǟJvΩ@�gz��v@�\�r�`�@�?;r'`'@��MY���@Ӣ�c�6@�s<K�@�W��M�U@�M�	6h@�T���G�@�k��7�	@ߓ���_$@��#���@�6<A�'@�9]�R��@�qz��n@岨��M@���(���@�Va��o�@��g��@�*UB�o�@�i���@�4��wI@�Ъq#-�@�!�C@�/tv��@��ջ<�@�r-����@�j����@�l0.��j@�w!�oŲ@��x���&@�� +Im@��⏏s"@��p�.�@�7k�T�@�wkG��@��ٸ<�A oUI�A �Z��"A`�=|#�Aθ��AȄK���A��"��)A>��~�        ?x0���H�?�վo��+?׆�ͯ.%?�5ק�*:?�����.@
@N|�@�^,	C@Tv�&@"�<�@'#'h;5Y@,����qm@1f����O@4�����^@8d��E$@<\��6�b@@U�J�D�@B��`%ON@E,�|k��@G�+�cd�@J�jYd�f@Mݒc �p@P���|C�@RT��@T/�[G~�@V$֒&ӯ@X4��4<@Z^�M�Q@\���,��@_�%�B@`�����@b]�7@cg;	���@d��y�&�@fL��[@g�TH��@iu�%8�@k$�����@l�zjz8@n��Z���@pPϳ�>@qM�n[�7@rTO��y@sc�a��@t}��@u�ԇ�S@v��_=)@x�עV�@yAY�̟�@z�V`Gf@{��aF�@}9�[@~��~���@���~*@��%��b�@���dE�@�I�E�'�@�!��`@��/\�Z�@��� 1�y@��Y�D.�@�lS���@�M���W�@�3p����        ?<��ə�o?��K�6�?��#�WR�?�]8_P�5?��~�J�?��?�?�s?�߼ۮS�?�g�%��?��l	��=@ z"�
y�@tI��-@Le���0@r	��_@ �¨�@�'^�`�@�c���@"Q*4)�@%�Q˓9m@)jj�l7�@-�0����@14ug˶@3ߕ����@6���s�M@:7�r@=�?�@�j@A�tw�@C_P�@E��`@��@HŴ�,1%@K揅�19@OW����4@Q�>oG�=@S���U��@U����M�@XSu*�@Z���%@]�2�R��@`u���@bcoK��@cެm�@e�aG�̓@g��q�g�@i�i�n�X@l,O��@nm�h��Z@pr)��)�@q�>�-v�@s�9�`:@t|I,�i�@u�"�@wvv0	@y�̈́{�@z������@|Y�c�@~[���@�Pf�k�@��X�/�H@��W�@��O2%@�����wQ@��@�2��$ɣ@�f)G�i�        ?kbTt�se?�P���}?���C�&o?�Jп�Q?��'��(?�!
��h@��8k(x@+Hs[H�@�����@q�uր@ 3��Ҟ@#�C��>@(_J��N@-`L���@1��[˚�@4�P�[�X@8@�G`�@<8-An��@@OHV*�#@B���)6G@Ef�Eu�D@HP�)�u�@K|��z@N�a�Y�
@QU�}�7�@SZ��k�>@U�b �Z@W�Ğĩ@Ze���"@]`�w@` 9��ĩ@a����p@c6y����@d��P�EI@f�MY��&@h��Al��@k�����@mS��%+B@o�D�p�<@q'kf���@r��@���@s���Pw@uo(6�6@@ws��U�@x�`z��g@zj���@|?�[nۦ@~+�My�@�Z�%�@�'��t��@�D	��Q@�n�N�r|@��v�#8@��i%Ddr@�F�_]`@������@�%6���@������@�F��xI@������Y@�V�a?��@�>4���@�/��L0~        @�_��v�@D����x@g�sPB�T@���@�~j�!��@�t)���@�⿧D7�@��MB[@�`�3��@�mn
(��@��`��@����b�N@��`���@ȥ��:D�@̪#��C�@Ѓ��/�(@��a�c_@�n�VΞ@�-�h�@��Ae��@�A�!Я�@�˒���@�~�~�@�l�{0Se@�b�?���@�q�n�2@ꙶ�L�@�ڸE��@�5X�r@��-)V�@�L�zy@�s�(��@��z�nVh@�L�t���@����=�@�e˾��a@���,n�@���hm�@��~�i�eA 2���סA)$��B�A(>�s�A0P�V0#AAaK��A[{���A~�ZL��A�����A��vҺ�A
|h�w,Ag����sA�O�3�AT����Ax���As]��A/��	�A���A���bA~���mAM?�.NA ���L�A�PJ(OA�e��f@A��EZ�        ?�@gȭ��?��Ȩ�}�@ �`q��@5�409@D>Ƕ��)@P�󘽀Z@X�u}j�9@abI6W`�@gE���q@m�����@rj~�pN6@vc����7@z�+=T�V@a�N=4@�2W��d2@��ˋ��@��e���[@��9Ku�@�"� e�@��e1���@��Lf]��@��0g��@�+2��@�^(Rۮ@�ڏ4�$@�x~b�
+@��
��@��я�	@��͎��@�����#@��U��7�@�K��]�@��Y�4@���M��Y@�����@�s���3,@��/��q�@��(�-@���:�G@����x@��X��@�������@�$����@�SE5M@�������@��"�K�@��1��H@�^A��|@���tuZ�@�Hȱ@�������@�xA��No@�5_O��@���9���@ýȺ?G@ć��(�@�WA��o@�+��B��@���ƭ�@��m��b@��5W
��@ɩ�)��@ʓ�'��        ?����?���h��@���%0n@�Ǟ]]4@.Zư���@9{�X%�?@CRtIh>h@KU��p��@Rd�K`�r@W�d�9=�@]��o�x#@bm9*�t=@f7���D@j_�vw~�@n�B�ɞ@q�Ҽ�u�@t�G:�A�@wn����@z�^{'P@}�H깯 @���NO@�{Q���@�p�u�@��>EN�G@��N�1�@�����@�d����@���+��@�I̠�],@��Bg���@� 晘`�@����΂�@�9����@���&�#@����i�@�\/��:q@�4�3��~@�&�i@@���w��@��( �@�"#��87@�9橵�@�ZE��4�@��%�$�q@��f9��@���
V�@�/x���@�yƨ�@�ʿµ�@�$��b��@������@�yq���@�4J�vۉ@��W`��@��¹��H@�������@�UPܖjt@�+�%�!�@�!��@��e��*@��J�I��@��WE��@����$��        ?ƭW7-hQ@���$gK@!d$�n@4�?��U@CZ /�x�@N�ըܺ@V=����@^����@cU�.U3@h`���l@m5״�+@qc+���@tdBMt�@w�cZ��F@{*�		6l@�u���@���3��@���1��L@�����oN@�E���]G@�/��G^�@�D�j��@�@���1@��HE�"=@���1�X@���FA�c@�w��"+�@�u_A��#@����@��'<��@�~Au6r�@��4�;�^@���� �@�J~��I�@��\���@�0��1�@��X���E@�l�����@�-�&&@��.�%@��<grl�@��G�@�R�m��@�>��"eL@�r�.�Ax@���4�@��(+��@�t�k�Z@����e�@�CͶ�2@�#5�%>�@��¯��j@�V^QN#@�I�����@�I�4'^@�U���$@�oTj��@ŖG�_�@��bn�
h@�)�@!�@�bk�[�@�Đ1�@�7�#W�        @v�*���>@��.���m@ԁ;�̺�@����x�R@�U�=%�A�p��CVAf���[A�nu�\_A��>u�A�<{��A"�g��c�A&����EiA*��?���A//�(AA�A1��rA4]� ��A6�����A9�ӱ A<���z;EA?蟈�+lAA�����KACx�	W�AEgJ�AGqU~4�ZAI���2�AK�R�rAN!��b?APB��ɄAQ}{r��AR�����}AT
JJvO�AU\�8���AV���8?�AXpx�|VAY��m��gAZ���#�vA\{�`�DA^�0�A_�9z['A`����LAadP���Ab7�ScN{Ac�����Ac�f�H�Ad˱:��pAe���pҨAf�GC^�Ag�
���BAh}U��Aiv�Ʀ��AjuK����AkyT�?��Al������Am���3cAn�}���Ao�����Apn���Aq 1�|�Aq�;#�Ar,��2̄Ar�|&�ZAsbwet¼At G$x�'        ?�-~e�l`?������?񢶡��@�lS�(@��I�Lu@$�yЈ|@.��W.T@5�hO�.�@=A_	5x@B��V@G�e ��@L隹e�B@Q_��`@T�%^�]�@W���Z*@[�a@��@_u!L
�@a�����@c����"@f@ӏ4�@h�!"�@k.1��Xr@m�%w�@pG�2�k@q�W��4�@s4ޡ���@t����@w@vcԬ##�@xj.0�
@y���@{�X��I�@}��v�	�@���68�@��s��C%@��t�j�@�$>��@�,��s�@�`�H�0@��b6L��@����L �@�C��
n�@��~)T=�@��
���@���P�t@�$Aj�@�^���]c@�1���{@�"`��@��E���{@����2<@����=#@��*~S��@��kAE��@��u�e��@�����@��7\�	@�ȼ�Z�@�ݫ�Kh=@��+�!�@�&�҇@�=��R�|@�4ʓ<�V@�ͫ���u        ?w�)�$�^?�����?�Rl�%�?�g��}��@bY�E`&@y�1F�P@"�NH�<�@*Ӫ���@2(�e�R@7�E��@>@���^@B���t�@F�N�bQ�@K�k�»@PX�b�S�@S.���m@VKT�}�@Y����:@]Z"�c�@`�����@b��	n�@d�V��C@gHQD��@i�_u4d�@lW�֨!0@ok��@p��_��@r{?{D�=@t����]@u�lLv3@wxc��g@yL�i�!�@{8��g�@}>Qh�@^gb�S@���3�O�@���	�8_@�:q�=�@����o��@��:`�@�c��hd�@�韛��X@��Bѕ@�M<��J�@�"S-v|�@�	��΂
@��Y\iX@�'ے3�@�O#�d�@��h����@��4��&�@�,�����@��&T�E@����W@��:A�O�@�X�Ͳ@�d���@�r�v��@�f��}��@�e�Z��<@�qSuDL@���J�đ@���6        ?c*f�J�?�s7p"�?��,��?�ŧ�t?��gt@H?��%s��q?��JG!Ӫ@%����@Gu�!@v-G9�@�D.�E@�Qҷ@ fgͥ�@#��>Ǹ*@'�}�ɾ@*����@/<���%&@1�~��0�@4��]�*@7M�%�m@:XA|^��@=�+����@@�Q�92�@B�@h��#@D�A� �g@F�����@IC���zv@K��^��I@N���#�@P��"�t@RS�˳]R@T8���@U�<�ù@W����6@Y��G�'@[��s@^B�Q�2%@`]�x���@a�]xn�:@c�$���@d�fĞ�h@f��	S@g�ɍك@i��yb�B@k`�@zC1@mS/Ѻ��@o_�}�T@p���:u@q�x�@su�bf�@tS��W71@u�ƈ�,�@v����F@xh �P��@y�W���@{n� i~�@}��Kl@~�u����@�>.WX@�(�y��@��Կn@�J�Ŗ�@�*#�	�        @�
~�@_�-a�1�@��=X@�~��5@�F ����@�:@�r @�Ιs�(:@Ǔ��Fy@�\U?�F@�L!Kt`@���Bc@�L汍*�@��HU�@�*Rd�H{@�u0;@��d<�=@�D��5@�(�\	�@�?<+�@��Н��@��i�=w�@���pQ��@�	z>S@�R�8r�A X&��ޢA����}�A�>���\A)!"\�A�<"�CA�>��rAp����eA	�[t`�A��_2�A?�'� A��X��Ac�
tAR��G��AJ�,��AL�aTLAX�K�JAnrڙ�A��WIA�oy!5A��8g*A-jlV!Av��CؾA���'fA'�ma�A���9A ���й�A!>����A"G��S�A"ȬëxxA#��󈺁A$e��-A%9�D��A&��A�A&�ȦP�A'�]��A(��P`A)��q�'�A*��q���A+���~�        ?i2���e�?�!�`�>�?����/F?�=�:?�?��k���?�*���0@Q0��@8�,���@�f@�.�IX�@�ٽ��?@[ykf��@"�s#܁U@&�L��{@)�����@-���@0�!j'�@3��9�@5x��O�)@7���t�@:�gz�G�@=^b�+�@@$�v���@A��[	�@CGX���@D�@3�|�@F���B�u@H��9���@Jw�Z�F$@Lx����@N��16�@P_�Abc@Q� 	F.�@R�_���@S�Ag��P@U9ݭ��H@V�t"4x�@X$�J�@Y��>�}@[L�B�@\�=,��B@^p_���@`1�d�i@a��״�@b�X >@c�iv@d*&��@eJ+�" m@fv`g��@g������@h����C7@jD�3&�@k�����@m	���}@n}O��@o�) 2�1@p���\�@q�V���|@rW�mG�+@s)�F!<�@s���� @t�.
�m@u�����Y        ?h2=&�?���c���?̿]XyqO?��')D�-?�d��ZQ?�s�8T�T@�87�8@&�Jxj�@�b
�P�@F���_�@ b���;@$)��B@()x�K�@,���g�8@0�]�wZ>@3���=��@6��gH�_@9�t((�!@=e&]��@@�7X*@B��f6�@D�� k8�@G!�t@�x@I�6VY4@L\���|@OFo�D/@Q3g�sVS@R�݃���@T��_�2*@V��,�@X�j�ǟ@Z�`�2؝@]S�W�-@_�ߜg�@aX�CX9.@b����@dqV���@f'�c��@g���S@i�[�"h@l PQte@n1h���d@pA1T[F@qy��1�@r���@tٓ^�
@u��L^� @w Ɇe�c@x�O�/x�@z+�A���@{�C~��@}����R @z���Z�@����X2�@��1 ��T@��8�*W�@��M�5@����>0�@�(oP?%E@�a�c�@���>*E@��� N@�T���<        ?9u�E�m�?u̶M\�?�#���T�?�i�@�#:?���{�#�?��Z��?�q��v�}?�:M4��?�Zk�as,?��F��-�?�Q@⾈?��ț��v?��O���'@2W!a�@�$�8��@��K�<j@`�=EG@�#ҷ@�3{m�@�� �J�@!ma��R@$n�ko� @'���#@+��T��@/��ZC�@2:�ۣ�[@4�M�~җ@7�py�n�@:�ߨX$@=�km��B@@�k<���@B���ݸ@Dшx��@G��5�k@Ix.�B�@L	�+gٓ@N��;'�@P�I�]o�@Rb)��
�@T7|�\@U��u��@W�%�N3�@Y{;��e@[���oO@]�c�_�2@_�z��qP@aI|���@bT�Ɯ�@c���[��@d�5��j@fg�Y%N@g�I�U@iu>���S@k�a]-�@l�'� `b@n���;K�@p3�p��@q(����@r&V��(�@s-c2��@t<��H/�@uUC�]�S@vv厊��        ?�B�h^@9�'7��+@\�z�7�e@r<��@�=j�Ya@������x@�5�`*�r@����@�=�\%�@����U@������@�P�Br~@�.�t�@�q-��@�\��Q��@�{����@�|@�^��@��pY�v@��*�.��@��GY�׉@���љ@љ~�p#@�N(�0jh@�.�>a�@���lpի@��X�U�@��6?�g@��1N�@�8��@,�@����@��@CQ�,@�$c���@�g�ʠ�@巎���@�$��@����a�@��A�@O@뇄�+��@�%�3Q^�@��� %f@�M���E-@�:�ɀ�l@�2m�h��@�5�e�@�C�9��@�\��>��@�����_:@���-��@�����t@�4�
�^@����^�5@����m;�@�H�<=�@��o+�<rA �gI��AX�}w�A:�z�A��{�A�~���A�wߐAT;d��MA*�lOlA���hz        ?��=�E=�?�B���?�*JQy4?��]t�0@z��FM@��*:@��(@"�OAr�@)5I��j(@05u����@4?�͡@8��O��@=���h@Aq�M�1�@DK1e@GY�G@J��mHψ@NM��@P�-���@R姀���@U��� @W>��Y��@Y�]�D�6@\�W//@^���ly@`�K��@b?_SG�3@c�_/g��@eku�po5@g�� �@h�1a��@jǌ�b�@l��_��@n��Z8�@psrӽ�`@q��9NB@r�nt���@s��t�F@u*q���W@vu����;@w̘�0!�@y/G����@z��׫5@|�8��@}��Q�'A@/I�U��@�f����@�;��3�'@��k���@��6.��@��#bД_@���40a?@��:ah��@��<&�X*@����[<�@��s�J�A@����F�d@���M��)@��Z��@�E�~���@�t��@��@���JI�D@�s�E�        ?P&���?���ptj	?�1 �P�?�'�DW?���َ��?�q1Y�F$?�]�&�@[�"�@�:J���@��f%F�@��~!1{@�q�J�@#��ʂ�@(X��� @-���@�@2M��n�@6+��6�@:�=$��@?��m��@B��j[�'@E�G^��c@I
��ǲ@Lɐv�{r@Po�ݎPH@R�����@UW�k@W��ғ<�@Zg	��J�@]^C�#��@`D��G]@a�`���@c�D8�B�@e��K�a@g��n��W@i��Eأ@l/_]:�@n��֫�@p�k�9��@q�c8��@ss�Aȿ@t��'{1@v��d9�@x[�t�@z-��V�@|V�;�@~�\��e@�Dg�_ @�4BM
��@�[�T�Q@����bZS@��>6�f@����9�@�}�Np��@�ꉀ��@�ga793@�����4j@��r�6_@�DD�l_J@��T�}@�o��y�?@�e�O�\�@�fqѲh@�ro���        ?u$�}��??� O��?͚��m?�?)����?���W�?�Tܰ���@>C%��@ם��@�!0��@�'N�S)@ G��U��@#�H<��@'%iD��g@+��x8|@/.��P"@1ل7XX@4Nz���@6���?y(@9�$��"@=,<�oP�@@^�ݰ@BV�{(�j@D��dg��@F�S$Mi�@Iz�kA��@LP5�~�f@Oc���~�@Q[���K)@S'���@U<O�@W,����N@YjM8���@[��!���@^h�;x7�@`�a^A>&@b_�'�@c�R��@eZ�|[�@g&&`�@ie�u�*@kmRE��@m6����@owU��K�@p�z����@r.�I5@s�`�A��@t�u9έ<@vk�B��@x4l�)@y�-�>%@{|�7!@}c��+@h'! �2@��rzb�@��}yX�@��o�@�X�$J@����v�@�=���@��V����@�
��!	@��2�/�@�<�D�}�        @Y;7<�@M�����@oϞsù�@��6&��=@�w�"1@��^�dO@��H�&��@�bd��݀@�t��A;@�f/��@�:D��1@�~�(��@�B,g��@ξ9��@��'�b�@�P�Rx�k@��U�7�@��_�k��@� '�&F�@�$q����@�����e@㿣H���@帥E�C�@��BfF�@���ק@�aGWrX@���r|��@��/6@��ߺ��@� ��@�㿫��@���h�-�@�^3R�0�@��1�v�@��"ª�@�����ƙ@��RQ4�A �}L&A�G6�9APh�c�A8` U Ac>y�A���41AұKF?�A	�җ?A
c�T�;�A�F��Ab�<�A~e@�w�A�g[��DA����21At��e��A:[���A�r��"A�aK,�aA�hB �vA}%.d�AY��N#fA:�n_�A!nP�fA���A�Af�A�I��s%        ?a{ϻ1^�?�jd�K�?���o��?�a���?�I�T�Δ?�$�u1�@+G�q@�!WƮ}@�*$�B@��^��O@ G�U�H�@$5�-��~@(��k}~@-�T���@1|�~��@4v߳@7��:��@;2�E� @>�v��m�@A}'�~�@C��ˡ �@E��y���@HBH6?�P@J��#�@M]S����@P	�"q
@Qx�@��7@R�aD{C�@T�1t+��@V�<o�@W��7O#@Y�-�А�@[djC	�@]Li�Ao@_H�d%{@`�@��?�@a��-&��@b�K3�u@d�F+�@e=�ʳ�@f}�!C4$@gɐ��W@i!tn�@j�~�C�@k�"/
�R@mp�@n�m����@pFx��$x@q�'�,@q�~�+��@rǶZ�yh@s���4J@t����p@uvq+YÔ@vd;)�_5@wVP!���@xL��p't@yG�5/�@zG4�D�@{K�1q�h@|T�wB�7@}c��Rd@~w�A�-�        ?@R����J?��^[K�!?��P`q� ?���qL`?�4��Ґ�?��\�?���ʒ?���X��?��k��+�@���@8$⦬@>�][��@x�Ei��@Z�茘^@�0-%�@#-6����@&�N��c�@*�y�@!@/���Ko@2T��U��@52�[Uo@8_��k�@;����@?��yBZ@A�3��'J@D8���m&@F�RN���@Id��y�@LPnᏵ@Ox�T��@Qp��a@SFaDF!�@U>��!6�@W[-P��@Y�]t�d@\!6q�@^�����$@`��nM��@b#<S��@c���z��@eX��?f9@g;$��@h��7M�a@j��0n�Y@l��=�@o*ScYJ)@p�_�s�S@q��]�`@s6�`��@t�}�U��@u��{��%@wq��I@x��i�|@z�� U�@|]K˷ZG@~.v��"�@�<���a@�d{�D@�i&�t$@�<��H@�j�)�W@��lk��@���Փ        ?=|Zy}�?w����<?�X�72��?������?�h��l?�с�Gr?߀�0��P?����,�?��I�S�?��Y���?�ο�a�@ ��tȴ@���oD@	\����@~�=]q@+����@|���@<&e{@q�<�@!���@#�����@&�@$@)�P*�s@-K��]�@0�&�%F�@2�aぎ@5@K�V�@7��`�@:|Ҝ��R@=���P@@����s@Bi<���@D})
LԼ@F����WU@IH{H�^@L	nP*
@O����t@Q-,���@R��+%@T�1_�@Wɰ؉�@Ya1�V	m@[���UY@^���n�@`��C�2@bG�B5��@cﶞh��@e�b��U�@g�xܕ��@i���-�@k������@m�;�ߋ@p"v��@q[օtG�@r�;�:]@t�R��a@uxj^���@v��2�@x��4�.@z<+�4|@{��3GZ@}�T֓@�`f$        ?�S�"�@0��DrI@S���e�@k������@|�SuEo@����"��@���U���@��"m��@�;�Y�)@��m�5�@��g���@����p�@�����iO@�  \]/i@��l[� �@qO�@�{�C}��@Ș� n�@��C@y@�v�� oY@њ_WM��@ӑ�]$q@ՠH����@���ET��@��8/��@�N��h��@޴��9<@����ذ@��đ�Rc@�9��d@�9eo�>@�S]@�@�é��@�'h��e@��r!�'l@��f��@�N[���@�,�6�@���zg@�����W@���m��@�5���o@�WB��U�@��{����@���X+Ũ@����t�@�Ih� Q�@���,��@������@�n�h|)@���"��A ����IAs�7��A:#�X��AK�G�/A���j�A��qAw�F���AP,s.A,#.H5�AB����A��N�A	�,��U%