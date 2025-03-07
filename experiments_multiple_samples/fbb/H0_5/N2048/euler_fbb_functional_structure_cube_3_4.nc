CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T104907        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @               ?p.(z/&Y?�}f�Ks�?������O?�A�=��V?���hf`?ըb���?�~��F?�-	#�
?��'{PV?�1N�%?��_�P�?�u9�=[�?���4�\Z@�&\�@���3��@�51��@w+A|l@ x��@�ܭr@@��Ւ@�ː]O�@���i��@`#F\I@��=e��@ _q<P�@!�2���@#O��'@$�7ul-�@&�o�p@(0s2J��@)��i�@+�z����@-�՛�S�@/��Dl`[@0�M��05@1ؘ�L�p@2�W�{�@4�&���@5*M[8k�@6V�;;2@7�a�A)5@8�¨�\e@:�+;.�@;]ET�x�@<�l�ŉ,@>1=z��@?|��sW@@v� �@A3�%}�O@A��6��x@B�-��-@C����/.@DQ�H+�@E$J��@E�妐��@F����@G��q/o�@H�W��m�@I�p��@Jk�,�^@K\����@LPq��:K@MIi�J�        ?E��<�(?q'sf�}�?�_;w�T?�3�r���?��%�@�?�2y�TSR?��L]`'[?�`���C?�Ռ؋?�~+��n?�BF�Z#�?���Md�?�>n܋��?�
���+?�P�=��?��)�lW�?��=v���?��_1�a3@ �@�!�@Y�7��X@.X�A@	Cc|Ӎ/@����x@����@����@"߭:��@^h���@�� �Rc@Ht�i�M@�����N@ j}_o~@!�jr�x�@#�QJ��`@%29ж�@&��OV��@(�Ӡ)~�@*�b�	/@,ί��?@.�#ȏC_@0�%#E�@1��@2��k�|@4:K��@5���@6�Ƭ:%�@8T�ꁩ@9��[��$@;S�#�5j@<�#�x��@>��=@@�*�J@@�GH��@A��޸@B����$@C�mB��3@D�0K��@E�f���0@F� ם�6@G�m(�@IZ�Rk�@J$����@KOZ]���@L�� vc        ?]\�iR�?�ME!2 )?���`�)6?����B�5?�Z~���r?ƽ�/�?��U�|?�ˀe�˜?� /?�?��+�9?��77}�?�/�h ?�k��?��B��U?��b̝��@z˗6�@m-��O�@�. �@2T�&oz@
3z��@���Vw	@�n�nH@B0SJk@�.��uw@�z���@��wB]@ ����&@"��ܳ�@$@���@&қp:L@(\�1��@*�ɠe�@,Cs��Sk@.��5���@0q�ti@1��lC��@2�L�]ly@4RpO|�q@5�*���%@70��Y��@8�c���@:Kd'��@;��jǲ"@=�t:o`@?i�#�@@��=�:@A��{I[@B�ڊSs}@C�|G|:)@D���:�4@E����@F�D�bEi@G��n
�8@I%;��"@J]���@K�B�&�@L� 5��J@N=�Ꙃ@O�R{��4@P��-n:@Q9!(��V@Q��?x@R�����        ?�F���D�?�@d��?�w�ژ�?�*	��y@	�/.�@X�U��@�C���@"���cx@(��td�@/(,�Z@3Au�^l@7U�!@;�A	\��@@Xt���@B�z�@Eӑvݩ�@H��z<�@Lj0��@O�L�>��@Q�bm�h�@S�T�%�	@U���I �@W�B���@Y�sBc=@\J>]��>@^����@`��w��@a�xi��@cZ��F@d�|[��@fE�d�i@g��1F�@ig}����@k�(��D@l�J��=�@n����@p&�E"�@q�v�#�@r	X���@s��	@ti�hY�@u���1�@v!� *A@w8^�U��@xV���G@y{���@z�Ѿ3��@{���hB@}�ߔ�\@~U�(�@���H*@�v`�">�@�!NQ.@�ϴ�Cև@���J��@�6�3�!@���VQ�@��z9��@�k�#�H�@�/�D�@���ۆ�@����K��@�����.        ?K����?u؞�Z
?�r�Ԙ�4?��k��S?�8��un?��wx{݉?�=�f�Ԗ?�P����s?�K��ƍ?�\���V�?�I�fo�?�]�@���?�������?��A�e?�G����?�Sq��?���O�?�9fп�@ �  @��OkC@T���6�@��3��|@	2L���@��i��X@���<7@�=�т@\��)@���9��@�(�w@|`O��{@Y��ɠg@K?���!@Q��)�@k,׶�@ ��ʾ!@!�~�'�$@#r7�?@$PϬ��@%����Di@&���mc@(3*v;�@)��Q�H�@*����@,u���;�@-��@/��l�@0���>(M@1]���0�@23�"'1�@3d�g��@3�A!l:A@4�q""�@5���,��@6����@7����@8�4��y�@9�߮���@:����@;�gw3/@<Ƶl�q�@=ܡ>!-�@>���6�]@@;V��        ?9D�$_d�?g�鼿8�?���6���?��䣫?q?������?��&�?�8r��?���@�?���hx�?��z�ck?�V���qv?㉉a���?��a�?�ls9GB?��46�)?��
��x�?���8Ƥ�?��ήg7@��,�u�@��t�@��t�@@O��J��@n�q�@+�7�lM@k��(@֯Jxx�@m��L`�@1�<;�@$Q:�@!#P���@"���v@$��&��X@&h�ft�@(]�\��@*l�I�g�@,�k[���@.�Jm�׊@0���o�@1�2op#�@3(����@4��\�*�@5ퟴ֗@7fX����@8�8o�+�@:�v/�@<,F�,�~@=�ݗ���@?�kdE�]@@�|��@A��6�ѭ@B�Rh�Q�@C�cC;�@D���2�@EԿ���@F�.շ<�@H5�'h+@IF���V�@J~Lŕ��@K�|�t�@M�q�@NYr�}U@O�V8@P�Ȍ
�        ?@/��{n?h�A,�x?������?�=�=P�?�W�8��M?���2�w�?����m?�� �]?εi���?�ј�`BG?�m�G��
?�|o��s?�C���5?띆�?��uF��?�`p��7?�Rf���?����D2�@ ԥ�C9@�oҙ@�_ۃ
�@	�u�W��@h��W�@�ݻ��Y@�I����@�_g�@u,�ι@K��u@ݟ��{�@�l�#��@!��r��>@#0���&f@$���/44@&�jUc @(��N[@*��O�5�@-#8ܜ_@/r��
@0�ZSC-�@23�˄�@3���!ڟ@4��,1,@6Y�r�G@7�.��iZ@9i���@;	$ss�@<����Z@>vۥ|T@@"�역@Ap���a@B
-���@C
+O���@D{�&��@E#0(�'�@F<Z�A��@G^��;�@H�WS��@I�Lcq�@J����+I@L;}��@M��ᮥ2@N�/ޘ�@PD|t^        ?�$A�08?�ү;W?�(���?��J]��?<�?�����@>}e@d���@1`*�C�@����@��[B�@"f,l;@&N���	@*�86@/f{��G`@2M�$��A@5!�Iye@813���@;|�U�@?��<�@Ad"��
�@Ceog�T)@E�����@GŻ�O�@J% v\��@L�>ޅ@OC5�=� @Q�@Rp���t@S��`�2�@U��h��@W\ki�@X�âx9)@Z��X��@\^�����@^>�M���@`��:J�@aqY�o@b ��h��@c1�K�'@dJ�e�H@elk��@f�b�kF@g��l��i@i�q��@jF��}@k�^Y@�@l�\�3�@nB�$��N@o�WZtw�@p�eY�@qD� �!@rKDh�@r��N��@s����^}@tWx��@u&C	�U�@u���k@v��8H�@w��C�A�@x���{T�@yl����@zS�@펝        ?\0�h��?���3��?��t�
�?���!bS?�7�t�?����<>�?��xy[Q?�p(P0?�B �Y�,?��=�cr?��t��;?��쏎��?�)��(L?���l�j�?��nNEQ�@ �8Ԍ@g�[�1Y@�Z0�9@��x�3�@
`���@_%W�`@D�
)�@�*Z�@����@���m>@v���@{ϯ]9�@��o�~�@ʙalEY@ 
Tz�@!:��t�(@"wP�W[@#�ZN���@% ��@&r�P @'��$�~�@)U���@*�ً��"@,fvˠ�@. ڦẹ@/��t#y@0�{�_r�@1�X� O�@2p_�|�@3Z�hz]@4K95���@5A��+��@6=�O3�x@7?����@8G���.s@9U��4�@:hH�<�@;�0,��I@<�����,@=����C9@>��R,|@@���V @@�2h�],@AF��b46@A��L8V!@B��vl�p@C/�6��z@C�Z
.xz        ?E}���h?rڨ̇�?�u��A?��W�%�?�!U�nr?���ƌ��?�G_ �b�?�<K��E6?֟��8�?�q����?��Ŏk�(?�w*Y��?�����?�Б�p?��j��,?�ñ���@j=�%U@B��?n@n���@��	�_@!E��t�@��/y+�@%^R�@��G��@�h��ζ@�NN�@�	���l@!��ʰ�@#b��@%R�mQ%@'`h��P@)�|����@+�f3o�@.A��2^�@0e��J�Q@1���Bv@3�mc2K@4�~�Ɔ�@6��Z��@7�?(��'@9Y���	f@;���J@<�7���Y@>����p�@@P���d�@AN雖�{@BV�^{@Ce���@D~��M�f@E��;U@Fʐ2�X9@G���0�@I:�RI�e@J�+�_^G@K��ε�@M&�-��@N�0I�0@O��Q�y�@P�V욵�@Qq��*+o@R5_[�G @R�x�1�@S�O��L        ?NN�� |�?v�!]�5?��1���?��ҋs�
?��(��* ?�a���?����Øe?�X�qN?�JY�@5�?�ci\=&C?�܂Ā�?�5�R�[?�7P�ID?��'he?�D]>%�u?�3kx�?����ጕ@/G�i�@���w+@������@	�n�@2�қf@k�m�f(@a?�|I�@z���@@����D@����@�����@ZWzy�@ ���'�`@"ϑ4>@#����CW@%bx��=@'%bECK?@(�8��@*�����@,����@/:N>J@0�C���@1��BiT@3�1|@4CAg���@5�z�34@6�ZC��i@8OWj�D�@9����/@;A�Z��@<��T�J@>gb"��M@@�@�@�@@���2@A��s��@B�����@C�F:W�@D�lLX�@E�<���Q@F����@G��ڼ�@H��y�@I���J��@J��^6�@K�f^y��@M�u���        ?�.��Bx?ØD-l��?�RPֆ��?�{��0?���s�@��97Ρ@�T2�@Xߤ�H@ ��H=@$�:�ѕe@)�� $�@/ig
t�@2�@d>@6E����w@:�Aّ@>�t`��@A2"'`3�@C���8!k@F�i��K@H���
�@Kr=-��@Ng�}��w@P���N�@Rf���jQ@T��/Х@U�M�K��@W�
��[@Y��Ў<@[�>c
�@]���%'@`�c�Fj@a>�s��V@bp
��*@c�:�<V@d�+B'��@fD݋Z8@g�R�Х�@i���@jz���wj@k�MQ��@m~�Ϧ�@o,��@pW&���@q+����@r~��I�@r�F\2�a@s�so=�J@t�����@u��v@v�0���P@w��R��B@x����ʕ@y����Ew@z��6�@{�w�|U�@|�%�?�@}���_A�@~�G��@��=L@��Bԛ��@�6 ��j@��R��}@�k6Z�`        ?HÚ��?s��D½P?�d�~��?�������?��5�P�?���(�?�H�b�ex?�릆�=�?����B�?�%�v��d?�����?���g�ڧ?�tCzmU.?�u=�?�����F�?�E�AoM�?�јx�?��}�ir?�v�C�'?��@���?�ۻ��@�R ?�P@� �餗@ow5'�@v��1�@	��f�+@��[أ@"�Kp�@Gi��9e@�u��\0@�z��#@7��=�@��]�7�@ ��@���m{@/�ϧ�k@�^�U~�@|s����@7/��C�@ �[
6�@!j��r�J@"]C��@#VJn�@$V$3$�@%]5���@&kV%l��@'��߅"�@(���t�@)�vL�J@*�<��ߘ@,J� 7@-V�=(�@.�i7�5@/ߔn�V@0��of��@1C1�ܨ@1��<@2����1�@3\�DP�@4U臊S@4��Jm'�@5�3�C>�@6^a@���        ?1�K��
�?a� ��2?~���P��?��ië�?�E���(u?����?����I?���a?�F�OG?��@��_s?׸�88�a?ޣ\
�Ҩ?�a��H��?�����e?�V�j?���<<��?�G�3X��?�&F���?�s0i�z@�I {K@�����@�qh0�@	�F7R�@�Ѿ }@Xr!�r!@O3(�YG@k80v��@������@�m�m�@�wo�@f"��B�@ �y�$@"/�����@#�Y20}@%��L6�u@'S�ӟV@)9�\�@+6΋d�@-M5$a�i@/|�����@0�تTPC@2Lm���@3R�ޭ�\@4���v~@5�R�Mh@7_�t�X�@8Ԙ^~�@:W��=@;�#���@=���N��@?7R{y�@@z8��qm@A`:��0�@BM½CNf@CB�U�ѯ@D?�?���@ED4J���@FP�`^� @Gd��XuK@H��Bw�@I���3��@J�ږb%@L�N��S        ?6��z��?a�%�|C?}��#+~?�'q��?���p"�?����*<?��1F�C�?�ش)f?�C �jb�?Хyk�j?�-2bܹ�?��N/z�?�[%k�?���߱v?�KQ�i?�21�F?���-9W?��l�u�?�� �\�1@ �W�U�2@��X��k@uZ��@	�|6Kq@#�߾O@t��mB�@~��u��@�w1�@
e��Em@�Յ�"`@>r���@Q�j�@!�0�L@"���A�@$`�0�V�@&,v��@(�֠��@*�	K=�@,$~~>d@.UlK@0O�6n�r@1��ƞ��@2��)z@4&Wc�@5m\s��@6�Σ �@8Oe�^��@9��O"�@;k[P��G@=_�$��@>�L�X8�@@B$AG�@A*���@B]�׎@C�.�@D�A�Mf@E�vX�@F*$�s�@GA�"�P�@HaW�&@j@I�<���@J��$���@K���>��@M0���"�        ?���:%,?�]܎v�i?�k25��?�FF�H�?�(�ix�?�=�v��?���_|��@6nRA�@
���@@`���`k@�rPXW/@��!��.@ qgz�@#�ʍ�2@&_	��@)����@-�n�]/�@0�IP3@3���@5jQ���@7��\�G�@:{W:���@=:.ZF�@@���@A���<�j@C)�"�̃@D�pp�"a@F����@H_�3��^@JC��f�@L9�%�x�@NCȒ�1+@P0�^�3@QI��� @Rls38�~@S�M���@T�Ftȥ@VoE�ݤ@W\�o��@X��px��@Z��7�@[}N���@\�\=o�@^q�I�w@_�Uq�@`�k-��@a�  I&%@bm1-�Ծ@cG��o�@d'��Gh�@e�'�<T@e��9��@f�
y��@g��uc?e@h�k��l@iڅ��M�@j�B�3�!@k��(X�~@l��d��@nV��%@o4�eIm/@p+�9��Y@p�,�~�        ?[��~A�?���0��;?��(���H?�����*?��]��z^?�ٲ����?�c!��Z?�(�r�?� `.
?��h��?��P"
�g?� ���?������?�����A?�����"@O��ƚ@��%��@xQ[Q�&@	O^��$@S�@����@p}Rc��@5�v2��@}���@���8@I(2Z@,�Qۻ@c�7�-@�	���@!
�[�@"HS�?u@#�px�L9@$��Ĉ@&FI�֛�@'�!*��@))���o�@*�����S@,<
u[;�@-��%�S�@/}�T��@0�-�Vc=@1wpb�@2\�!1@3G��ͮn@48�e9Ǭ@5/�>�%@6- 2�1@7/���B~@88�j�¼@9G�]9RP@:\��a�
@;w���@<�鷴�n@=��5�@>�'N��@@5����@@��nJˋ@AL��@�B@A���aP@B��H5�
@C>��� �@C����@D�5��S�        ?R����p?�wy� ~?��P�pv�?��!z �?����?Ʈ����?�yV�+?�S�d���?����V��?��<���?��8��m�?�7��Q?��� ��?�+��6�3?�T���MX@���BB_@�����@	=����9@�X��y@���V�@��e��@e)ڋW�@Oa�Q@�E4�\\@�xjXJ@ ���ZWQ@"b�8�;!@$>���YG@&7g&�+k@(M�Rྤ@*�ji]x�@,ն)�:@/HF�3V�@0�RW)@2F�
��@3�_%h@5*�W�@6���*�@8R� �y@9�\tp@;��
�3@=�O1|��@?p2�e�@@���皁@A��y�Y@B��v֯�@C�^�h�@D�S^P\e@Fp���@GJ�	FFi@H�V|�;@I�5�c�@Kn8�PO@LiC.�b@M��}�O@O0�[�C@PQY�Oy~@Q+�0�@Q�̌��@R�A�?�@Se����@T6��Ul@U�����        ?E��JSY ?qc�✧�?����Zd�?�}BK ?��.��?��n:s�*?����8?�O<yS�?������?�U�S�8_?��"��cN?���`iG?�@�8��?�"G�%�?���U�?�j�7���?��$;c�@ E�YE��@�[�r��@�f5ęe@		Lv<��@��E͏�@#.8���@+��|�b@[�ZOE�@�'=E
%@6s#2�@�t�qY�@�*���4@ ��U��@"zI�"ށ@$+�E��@%�X�M�@'�E����@)͎���@+���$	@.�z��@0(�Qg�@1X�}O�@2�л�B'@3����l@59P�i�@6�}@�S�@8���_@9��a�G*@;'�ւ|�@<�O��s@>u��p�4@@Z�J�@@�c+�K�@A��mok@B�%=�N�@C���S�I@D㖦S�4@E���e4�@G8[�`|@H b��Zg@ID��in$@Jp�����@K���Gn�@L�n�QjH@N&�D�@Or�B�m        ?�_�����?�����?�vl!^�-?��\���@ 4�@T�@	����@ڪ���c@���:@!5	w�@& ��N��@+g��8�@0�;Oq�@4�7K@7���ǐ
@;�����@?ϝ����@B.��?�>@D�����@G4���@I��ܛ�O@LܷV�M@O�k�@0@Q�l��<g@SD�07@U
25K�@V�`AdQl@X�+x��8@Z֤'�
�@\��9�r�@_��v�G@`���L}�@a�S:��@cF)O�'@dP�վ�J@e��F.Q@f��@hR%b��@i�X�p|@k3O��F�@l��N��@n?�;H�K@o��!��@p�����w@q��<��@rmMJIE"@sNN"R#�@t4�L��@u ����@v3�)y�@w	*�/p�@x���C�@y���d@z:�x�@{Yu��)@|/	�� @}GOV�g@~e,��a@����0�@�X���@��< 0�@��ll���@�'qV�@��K^-�Z        ?QV>��?z��H*s?�Á�X�?����ѝ?��_L7?�§ )o?Ⱦۮ�*�?�4��?��6��?�k���?�i���?�@~��J?� ����z?�hZ�*9?�ҫ~ڷ�?���u+�?���'?�s�q�t�@ �)�+@	2c@p"@ Q��<�@W�l�+c@���H�@)��/�a@��k{@A�s[y@����@4^�v�@Ƚ�3]�@oi�q��@(�����@� ���@�i56��@�a��@ʜ�oD�@ 񠧞�i@"����@#'��g�@$QZ�t!H@%����*e@&�o l�]@(	́^@)[aPt@*�NK�f�@,�ؗ�\@-��e��)@/q�j�@0C�f�^�@1
��TS@1�j����@2�oٸ2K@3}�1� ?@4X����@59Yj�5�@6��ȓ'@7	�L�=@7�хG�j@8�~7�>@9�(�D�@:�?�4�@;�<{��Z@<���[�@>;�G�        ?-0w�5��?Zg��T�`?v��,v�?��0���?��EQxol?�tX�@�6?��P�0�?��W+�?�<���I�?�Oh떦?Ӛ�s��?َ;d��7?�Lqw$6�?�h4���?�$�/H��?�ȏ?�T���z9?��J�1s�?���o�0?��:U��8@9����b@�HOsdD@�]��G�@	���@�0���m@(k�K)�@
k�)�@����;@5�d��@�d����@��8B߷@���@ �H7'@!��\@#�]H�@$���E�@&\F(5�@(�A)@ @)�S&�@+�d�f�@-��EoZ@0 �(Y�@1��m@2;�9ڞ�@3j�[*��@4��@��@5�PN�@7?� w
@8������@:
/C�go@;�	��7@=��^2b@>��j�V@@ؤQ]?@@�A��X�@A�(ΈEJ@B���q@C��V��@D�IŪI�@E}��e�@Fz�0k�k@G~rR�Ǽ@H�1��i        ?KF!(ȅ�?t��s?�Z��ą�?�l�x�WN?�)�Τa�?�_�y�Y�?Ţ��vH?�$?��?�w)�@>?ܝX�*t!?���-T_?琝�ǣ�?�\�|?� �F�?��u�k�Z?�x*��i?���˒��@�AD@��t@$��%D�@�����@s�(��@ʺ.�y�@۝j@m[n	|u@����@�S}��@��4Md�@ ��;/@"�jF`b�@$`��=m@&@-�V9@(;qhj�,@*Rg��@,��bw��@.է��@0����@1�$;v�@3;�9���@4�;Ȃ�-@64��|,@7� phЪ@9,<�&�J@:�Ǉ�Y6@<���I�@>L�!2@@�$��,@A�@���@Bv9�f@C		���(@D��@E0$���q@FQxƦ��@G|�>��@H�3Sl�@I���Z��@K5	�Di@L���G@M��3�@OE����@PZ#�A�@Q��rЇ@Q�'E���        ?����+?��_���?��_��}�?㥤�i�~?�Й-�9?���cӃ�@{�	�@.�k�5o@`��@|;@�f(�N	@}@�[;@#�K�la@&�v�d5�@+����@/��E��@2T{%:Ӵ@5�Mp�*@7����)@:�� ��,@>E@���@@�'n�K@B�}��g@D�h�cV@F�Ct1PM@H�Cs��@K=£�7�@M�f��1�@PyE���@Qh�c�@R��ⱏ^@T<%���/@U�C��@WN>�0��@X�4�]�@Z�<?ۗ�@\aj!���@^2�&�no@`
0�
D@a��c�@b��9!@c&�,@dJ�A��@e7�&1�@fXЏ���@g�=4��&@h�ѳ��@i��\@k/���(@ly��uy@m̮x	-�@o'�;D@pE�3 ��@p��i� b@q��D5Ū@rtN��0�@s7���}@s��G��@t�N�ъ�@u���O6@vl�%)��@wD�;�U@x!wI�@yT���`        ?V4 9}�?�業�B�?�;��)�.?��۫cn?�fu���?Ƃ^�r?�r���0?ְ�K��}?���~Ƀ�?�)-�~?��G� <?�G�w�=?�j ok �?��%'?��w��?���#KU>?��4[zv@�7.q�w@��
F@}���Ty@��/�m@�g蚗�@lB?�!@��l��@3o���@�[O�M=@w��W��@4��6@�@�r�j�@�]���@ږ�I�@�?}�9@ }3�YN�@!��7 2@"�,5,_@#ږ�,�@%LD��(@&GJߣ@'��??��@(�����@*/ƍ���@+���bi�@,���[�@.j���.@/�-��	@0�L�P(�@1|�|M@2Gm���@3\lq�@3�����@4�X�xC@5��؊Dk@6�.�q@7l<ʴ��@8W��d��@9HOr@F�@:=O�c#@;6�~�@<5+� �7@=7�L8?@>?f[\ʍ@?K]�F�@@-�CaQ�        ?Qt��� ?� ��(E?�_:��S�?�M��/U^?���o��?��N`+?��A\q`?�?���?�jE��?㴱�r�i?�!��?�`|�JyW?�>A��nt?�@�5�Hn?���)G�@ ];s�ş@s�^m@%E�;5@	tr8fVU@�[7��@{Go�@�RGB�@ܭ'�ə@L�&��@�����@���� n@��� �/@!d줙�@#�G��@$��|]B@&�T��@(��)�@*�kE�3@,я�ah�@/v��^�@0��=�H�@1����@37.�&�@4����B@5��j�"�@7]3ǒ~�@8�Qp�u@:e�{f@;��x��G@=��i9�@?X����@@�{5T�@AuǒS�F@Be3� �h@C[�ٌ�@DY�\�b@E^�1��@FkJdVɤ@G9g�@H��+�@I����š@J�)CtQ%@LZ=��@MT9��:@N��Q	�}@O�.!�@P�+c\f�@QD��v}        ?B�����?p�l��?�x�/@e?��r �?�ٕ�O�?�dZ��?��u7uX�?�]/-��?�	�:h�?�~=�$M�?����zg�?�,ec�$?�tf.vK\?�A�5�O?�K��K�?��X@�y?���&�*�@ ^`�]C�@��P��@�(�8$@	&^�K-@���[��@3���@<eJ!z@mu�_h�@�p�C@Kj��N@�q?�rK@Յ�}�@ ���Dd�@"�ڑ��d@$<Xf��@&�UR�H@'�u���@)��ߓ�@+��s@ڗ@.'Ў[(A@07�	�yK@1i<��֌@2�Зk#@3��`��@5M�Zݖ�@6�3���Y@8*�(MQ@9�f��$�@;@W���@<���@>����c?@@&���i@A�X更@A��TD�V@B��8��@C����x@D�+#k@E�զ�_^@G�k�Vu@H-�Aey@IQ�>��]@J}1��"@K��DF��@L�#��q@N/�fh�P@Oz���        ?��) KGH?¦�t�N?�(�� �r?��g�U�?����ї@����T@�X��Zm@�|����@J���>{@#Y�LzȚ@(�y¥@-T��b��@1���E@4�6o.�@8����@;ʗ����@?������@A�q)t@D2�JE��@F���@Iv�:i@K�.�OV�@NsT���@P�R�:��@R0!_�eK@S�(��O@Ukx��@W#%1}�@X�@ѹ@Z��]�@\�����@^���հ�@``��=�@ap�����@b��h��~@c�����6@d��wVk@f
��@gGX��89@h��I� v@i�	o�&�@k2s�T2@l���2�@m���b�@ols���@ps�=[�@q4�O7@q����r�@r��t�Y@s��laU@tg����@u>�@�YU@v�ٕ@v��cOc@w�m�F@x�V̞�W@y�j�#@z��9Ud8@{���F0@|�4	Yj@}���01@~����@�h�=��        ?d�2%�@?�gN�5n?��gnC?�90V���?�N��[,d?�;e��y>?�����?�QR�Y�?�|t�cE?�D��4�i?�<Tt;?���|lfE?�~�Ʉ�@eq�#@C�k&@[_���@
�����@5����;@�O1 ��@�h���@4Ͱ']@L�E���@��- o@-jϒg@��&z@ �hQ��\@"	+����@#{T�6�@$���O;g@&���u׬@((;���@)Ӳ�1\@+�����I@-Un{!@/+�B���@0����� @1��Dm&@2�R���@3��u!"4@4�.k���@5�5�~�@6��/�/�@7�,xN�Z@9�� @::��h~@;n����@<�8K�q@=��P�0@?1/B�9:@@?F#)-@@���r�@A�r'�>@BFP&�tp@B���J0@C�`3�Rm@DjJqf��@E'-��@E�����@F�����@Gs%C㨨@H=��7@I�NI�Z@I�P#�        ?Vl/��?�ꝳ;?���ux�f?����zM?�	_�Ͳ�?��W��W?�Q9���?�0�D3��?�W�Q��?��g��S�?�x/�
�?��13A5�?�=z,��?�	وf
�@ ��vn�@��Q�Kc@��5�Y@
�Y[ȃ@���o�@eM�S@���\�@6�<�G�@���$�@�{�o�@��D�e@!�5�!@"�S�zC@$�c$y�@&�V����@(��<�_M@*�]Q.y�@-0����@/�DL��@1e@XN1@2hhAi,P@3�u���f@5B�:��i@6���]�@8_��v�k@:�Qy�g@;�bbT�@=���*=?@?jBM��@@��mn�R@A�1՜�l@B��g&}@Cͻ$�k�@D�Yzp�i@F�f+�@GGߍ܆�@H���[f�@I�U�֥@K�0�@LzK���@M�����@OR!P�z@Pf���0@Q*�,v@Q�(+W�@R�T?��@S�|3	�@Tl�%C�@UI�=�-[        ?M�6�n�?u���-�?�y�}���?�,��ۭ�?��N��?�I&~�3;?ĥEc�Xe?͍,�A�'?�H�U�?���|� ?�r���s�?��Y��?��È� ?��:��y�?�Z :u�?�N[�_��?��tpS��@ �.R�<P@�	�6�@���R��@	�8��@VR~��a@��:�'V@��o�<�@��6i�3@W�ck�@��w�Z�@���0�l@��	�j�@!ab���O@#
���@$˰_`H@&����5�@(��/�3@*�J��\O@,��1M�@/5?wJf@0�R<<��@1������@3M��~z@4�����@60FM?�@7���.�@9�1�i@:��P��@<b{�D�@>�/j�@?�>����@@���9�f@A�Q"���@B�fg;G@C���@D����C�@F	�\M�Z@G+ޛ7R@HV����@I�9il��@JȢv�z�@LR��O�@M_a\T�u@N����@P�+��@P�Zϝ�h        ?�x��R�?�U?u!.�?�p�O�ց?�DHQ$& @�f/8��@�N�m�@Ѕ$�@!>2�bp@&od�G9�@,�uκ��@1�"�J,@5�O,�Hz@9àhb�e@>V�C�F@A�~�
u@DNuV,U@G'�X�e�@J0�;~�@Mi�h��x@Pi9v4@R5}=���@T��� �@V���n@X)��-jn@ZU%.�w�@\��S,�@^��͈2@`�6�,J@a�gxi�@cI\�`͐@d����|@fj�%G@g�dG�q�@i��gQ@j��Xb@l#87e�r@m��1��1@oq��/��@p���ѥg@qv)�K&�@r]M��@sIKܸ�C@t:�VS۽@u1�X��@v-ñ�U�@w.ߟ��0@x5;�r�@y@2�X�e@zPn!���@{e�h�5@|�.Yd]�@}���.@~ąq�@��.�@���,�W�@�)+x6��@��%��N�@�e���@�E��j�@��x����@�Uv;���@� D�']�@�����/a        ?W~+M.V}?�t���3?��k��V?�a�!Y�?�:TC�g�?��:��8?κ�Q�?�F��	?�4L����?��8�?�?搴��S-?�ZK��?����A�L?�p��?��e��C?�mV�`a?�@�xC�@,�$�@\)Һ\�@�{���@$�� �@
��^o@y�ӏ@-���t@�L]�X@C�5D�,@��2`@�H3m@l����@J.�6�@9��(��@;����@ (���C@!;���|\@"X��'��@#~���JR@$� ��@%�j2x<@'(#�h�@(r�h���@)�[��Y+@+"��A�@,�V��A@-����@/m�-�@0v�^{i#@1:�-�#6@23�zf�@2���@3���)��@4v�.;�@5O��h��@6-\`�V-@7��x�@7�%	!#�@8�2��6[@9��^y@:��˴�@;���Ϧ/@<�6�|�@=������@>ġEPQi@?Х ��        ?3����j?a5S���?}=����?��]E��?�;�r?��@�{n?���>�*�?��Ҭl�?�8��'?�G}�HR�?��;w���?ݿ�b�?�݇Y}?�~U{��n?�̀a.CJ?�h�2�?��l	Tw?��q3֝2?��t�0�@ ���tc@5Yk6�@���óN@�p	�@+%���X@��."�3@�bi�rS@��K��s@�M��P@����@r�J�}@����$@�(���@!=Y��y@"���ɢ@$I!IpG�@%�Zp5�@'����G�@)oA�S@+O�<�^@-E.��Y�@/P6/��@0��|�G�@1�-�u'K@2�$����@4-��r~~@5k�;Vx@6�9�P�@8�Q2C@9o|1��@:��"~<�@<Z�y���@=�����@?z5?��n@@�Ӓ��@AgFq��@BF���7i@C,���@D���@E��ŧ�@F	Q�.;@G�ڭ
@H�c��A@I'ŪX�        ?G2i�F{�?p����os?����
"�?���Q�?�3'�##0?�{�<��?���V�`?�ߋ��	?��%w1V?�8�A]+�?ߍf�ʯ?��ү?��o|�?��Ռhf=?�Lq�?�bS���~?��G���?�nO]�@*� �:@ԥ���@ٵ�a�@!J!�J@�<�ˬ�@?���@L�2;�@~	^�@��̕�@Q���{@�cP3@�Ь&V/@!Y0��@"沒>�@$����@&?�Wپ�@(qݨ�&@)�G�z�@+�{��mX@-�#���@0	p���@1%�G/@2Mʚ���@3���]@4��ם�}@6
;�tԎ@7`�i�@8�˟D��@:19���@;������@=3#/�=�@>�����@@3�ܫ�~@A
k+�M�@A��,�@B�v޴!o@C���s��@D�)��T�@E�+F�@�@F�b��	@G����@H��C!o@I�8(�X%@J���_Cr@L ��I_        ?��n�?b?�VU��F�?�"X7��?���g��?�փ�Ѳ@?����@<��$��@�k��5@O�@�ڌ@M_-�s@!�bt�k@$�r�ۦW@(�WD�@-|����C@15��VGj@3��wu�@6��3AG�@9̰K���@=6&R�'@@C�9�M@B�5��@D	��U��@FÏ�mB@H:P��c�@Jz��zͭ@L�Z�w,4@OM%�I&�@P�:���@RF�i��@S�5��C@U�^	�c@V�|�8�+@X-0����@Y��� 	[@[t�l21�@]-�_� g@^��rպ]@`d�����@aVx+��d@bN�ȇG�@cN\j&�f@dT���3@ea�Г�2@fu���@g��3$��@h�h=-�@iڱz��N@k	�D��@l?@A�f�@m{��ɕ"@n�v�ݬ�@pΔ��@p�K�9� @qW�kܯ�@r	f�ʡ@r��
��@so���u@t)|B{@t�ِ}ː@u��?�@vl���S	@w5J���h@x�gA�N        ?O8��&�3?x{'��3?���M�?�����?�ҐtԨ?�#��G�?�6�58��?�ۜ��r?ԁy�>��?�V�%q�?�w����?�#���?�2q��B?�����;?�Ū�cn?�S�M+?�Q�{?���M%?�K�,l+�?����g{�@�8��3�@�2ӄ/�@k����@����h@	ñ�?A?@��D��@m&���@s���@��|��@���F@w�oWm�@眏��@c�2���@����~@�:�T�o@$\)i�@�7��j_@����-�@ ���K�y@!��6ӆ@"��B�<Z@#z���@$v��+�@%y��&�@&�5�{�@'���w�@(�nh̗@)�=��L@*�y�~Q@,V���@-C�����@.z��ui�@/���v�@0~y���@1#[��@1����@2w�T\[@3'+��A�@3ٶ�k��@4��!b��@5H�ǀ�7@6��Ҍ@6ĵG�        ?7���z�?c��/�<?�SZ1ա?��`�Z�?�]�P:A�?�X�j}��?��� ?�8L4��7?����`�?єS�ڦ?�N�gQ�?�-�uc��?�&l�.�?��P<m��?�^�}�?�Ѽ\Q�?�`I�+8�?�a�6���?�ܹ�β@k�u�q�@,H9{%@2��	@
�R��>�@�v��L@�	�Y�@!iM/~U@i
N���@����h@{����@Ie\Ӏ@ "�5��A@!�P���@#h���JC@%1`��@''po��@)�W<��@+*@1U�@-^ː#_@/��`ɾ�@1�a)��@2T��_��@3���R�@5��J�@6�&�|��@8���@9��Ȥ�@;Bz��@<�Dʻ&@>�g�ܶ�@@M��1m@ACq��U@BBh�W�@CJ�t[�@D\9�f(�@EwZ��4�@F�#o,�@Gʵ����@I1�Z3�@JE�F� @K�d�	�@L�W����@NJ��({�@O�|��ee        ?H���:Y?r�^�n[�?�U�痩.?����̹?��ϡ���?�w�/�v?�l�&m�?�����q?�C�P,$s?٨���,�?ࡢj:�?�����?�<l� ��?�Ћ^�?�hL��I�?�*&��>?�[�;݌�@  ���
@�ڼ��A@_�EL�@p@4�7@�6�I�@]tߩ��@�%ا�@�?h�E@��)��@P�\�@ؙz�P�@�FwX��@ 1z��@!�<�]y@#JO���@$�<F�@&��	H@(�]��@*���%%:@,��D��@.��0�\3@0p+��J@1�y	�l@2����@4
�d��@5V�4�ZU@6�$Y@8%F�RB@9�ш��@;6U�Q3@<�g[�z�@>'vzoQ@?�s�K�@@�7cX��@A��lB�,@B�ɗ��e@Cqj���@Dd���jp@E^x��č@F^�d�@Gfa��@Hs���@I�(L���@J�6�z]�@K��a�@L�WHն        ?����3?�/��Y9�?��G��,�?�}�6�Q?�����?���IP��@����@nqv)_C@ԏ>$�@zy\��@���$~@"Yfn�@%�4��%@)�}����@.N>_p܈@1{���2@3�G�2��@6�r�d��@9��X�I@<����.@?�vE��.@A�8$L�~@CM��^m|@E(�5@X@G;H/L�@I!���U6@K?�hI`@Ms��P�$@O�;��9�@Qm?`�@RJ�ՕX�@S�?}r�&@T�֬c@V?�D�1@W�l#���@Y�g��A@Z��`J�@\���Yb@]�Wf'@_O9�oU@`|7����@aVg�r�@b66�g-@c�ߞV�@d٫���@d��r7W�@e�b�R�@f��\�.@g� 	��@h���G@j�!��@k���@l0-͜0?@mO�Næ @nu$�%�@o�n���@ph�;��@qu;	+�@q����@rD��-IV@r�Ǉ�N@s�����@t:��'լ        ?L��� �?yA�Y/"�?�j�Ʋ��?� �~Os?�&5 ^�s?�RLm��?�jnXn�?ѿ����?װ�CP��?ފ5Q���?�'F9�B?�6��l�?�Q|�I=?��p�1�?�0]�mM?��	(��?�8S���P?��#���t@ �eQ*�4@�C!���@0��6M@��Pp�@
+�2�@��/�	�@x<ֺ/�@2�k�b�@�n`*@L@Xދ�G�@_�ũ�@�Uɱ�@�+��T�@����G|@������@���u��@ ��C��@!�oF�c�@#!�ף��@$R�dy�t@%��59��@&ҥ����@("+Q��@){�I�@*�G�ߖ�@,O2U0��@-�����@/M&��,�@0n.�*�@1;?�<@2��R@2�߮ģ�@3�z�\1�@4���c,h@5�g�<d@6}ǹD��@7q�⻺�@8k|v�}�@9jٶ�@:o�f��@;z��:��@<���ٟ@=�&[T@>��O�k�@?�h;�#        ?:u/�ۉ?j[C�v��?�Bl&(�:?��<H�Q�?��)�b�B?���,#@I?���>��?�<%6 �?�����-?�Z�I�?�Ʃm��?�c�Xk?�[C�?�	Ѭ+k�?�]cD�J$?�'ܻY?�'�PB�f?�#|~	��?��)��(�@0IK���@ո�I/@���p�@
�~s��@:M��D@��aO@��wZd@��&�@;4#��@�q�0f:@(U-�1�@�̷K�+@ ��
 �@"[����@#�:;,�T@%�h�)�@'`i��Q[@)8�w�@+'+�R�@-,{�.b@/H����2@0�i�p�@1�z�C��@3��0�	@4Q�^��@5�li:�N@6�9{���@8P
���@9����$L@;5�9R�H@<�=��{@>L����@?�cEt�@@�w���I@A��Jw��@B�|X��@Coj=ch�@D]�M�{y@ER7�r~V@FM�� }@GN_:���@HU� [$�@Ic���\@JxLQ��G        ?<�q��G�?gE��X?�E 5W�?��Vt��?�I�{�?��
��s?��,����?�ı�t?�v5�!�?�,�ƞ?�����?���V�?���&�Z�?�q�|i?�l����?��Cܗ�?�2%S�Kn?���A��>@|S��3J@V�
��@z�1^@@
�*���@���A�@aE�!�g@���{�@��y�1@��<��@G�9��@7�1V@ ����<@"W���@$����@%��VQ�@'��|idz@*�X'٭@,F,�?��@.�ss:�@0��yA@1�&���s@3$��U�@4��6e�V@6�94[@7����@9'�����@:ғ�q�k@<� ��!�@>]�t&�@@��s��@Ap@�@B9�j@C'j��2@D=e�ъv@E],��@F��鏳o@G�H�+�@H���J@J@Ce?i@K��rC��@L��$Ѣ@NXc�r@O����\@P�Q��I�@Qh�l�$D        ?�uus;�?����z�?�k����
?��1�??��R_��?�����D@H�@�Lg@���j��@���($�@C!����@��n��@#O�]�kv@'4��9@+yM�q$"@0����@2��N�k@5K�&]�@86=NǺ�@;TńcJm@>�4I��@A�?�J�@B�}`c��@D����v)@GS.vT�@I?�3�t@K�B4�6E@M�W��Y@PC>�!t�@Q��Ki�@R�g�&))@Tj�h�v@U�ކ� @Wz�[�@YI�VQ�@ZŬR.�@\�E-X��@^N%��d�@`����@a
�`5@b����@cږ?�@d�]y3	@e-�ꉭ{@fJA@�n�@go�ߛ@h�r���@i�:N��@k�v\:�@lTl��w@m��Na'�@n������@p+�q�Vq@pߕ��y�@q�{[�	q@rS�˓fJ@s ���@s��W.a@t��nGJ@un�Yə�@v@o�(��@w+�4�0@w�&y{i@x�]H�(        ?T^lg�Z�?�0�#��~?��7(��?��{��KL?��N�aP?���AF?˞�o�?����r�?�5��{�.?�!�e�1�?�H����?�וp҆?�w�N�p?�lZW�j??�Yժڸ�?���j�?�?��7�F�?��o��9@?3֌@S ��@�a`��@�e��x�@
Rfje��@�l�@��ft��@>�z��@�T�\��@MB)7�I@�c@��4�@g��R@>5�庭@'�{g�G@#�ʷT|@ �
���@!��;ԋ�@"ç �@#�$v5\@%'T�G@&J�Gm@'��}	L�@(��N�@*(It���@+�zT�Ƹ@,�[*hQ@.\�>�i*@/�-8'�D@0���b�I@1t]�I~r@2@���!@3}��� @3�΅]A@4�����@5���p�p@6��-���@7ky�[�@8Y7W:@9Kh{�V@:B�]�I@;>�X��@<?�M}�@=E��x#)@>P���_/        ?2/,���?`���� ?{��uj�?�]U��#?��7w\E!?�S{��y?����2T�?����-?��G��3?�qM���?�����N?�2?���X?�M���e�?��-zn4?�d�-��?�*`��@�?�fU�?J�?�	G?"�?��爿�?��vrB\@I��^P@��n�@ ���i@@>��{@�˄t�O@I��,!0@V[��l�@�c//��@��	�@g���M@��w��@�.���@!x���9�@#���@$�mvZ9@&�%�{ �@(e�%6G@*\���fX@,l!��U@.��g�@0k��#)@1����9�@2�kjz�4@4a��æ@5u��@6فEd�@8L¶��@9������@;\/�(@<��K��@>��k��@@1��Z�@Axv��{@Bt�Q�@B�"zK�;@C��O@D����K@F<��@GEOx@H52�R!�@IYT�D��@J��HfQz@K����M        ?=t���7�?g����H�?��p<�w?�='��+?�H���D?��|��?����A?ă���:	?��z��?ӕLdM�+?�Թ�	�?�
u�?��?*�?������?��hHU�	?�A���ԏ?���4�D?�*��[5?�А]��V@zB�~Pt@N*:$@f�o��@�/3g�_@q�ȭ�{@����@�"��@&��X@�;�*@C�0���@�|Ւ�@ ��v	�;@"$Dx I�@#���>�@%��Ø6�@'��m�D;@)�p.��@+������@-ז5�i�@0�Ŷ��@1N�S�@2�N�n�@3��s�;�@5Q�5΀@6�S���@@8L�iBm+@9���d�@;�e�;@=@�b���@?	��EA@@qYH��@Af���e@Bex��J@Cm;�?�@D}�ņ�u@E������@F���j�@G����^@I#�5&�@J^G��T�@K�B�μ�@L�1좵�@NZ2s��x@O�`l�>�        ?��c��5�?��;mײ?�.���?�"�"i?ｓ�#c�?�I!�ll%@��J5�@	�,i��s@���jq@�Wt3S�@\!��T@ �P���@$Φ��@'�su���@+�*�WN@0pȰ��@2{B���@5 [Eդ@7�$�J�@:�+TB�j@=�����R@@qpCǺD@B&����@C�蚯@E�E]�y�@G��D�@I���ZN@L��I�3@N^r���a@P_:L��Y@Q�'g]@R������@T<���Bo@U��f�=@W�naz�@X���f��@Z�aU]@[��|�k@]^=JJ�>@_�P>�@`ky�s/x@aT u"��@bCλ-i"@c:�(@��@d8^Ô��@e=K�BG7@fIW�+��@g\��.@hv��3��@i�`
��@j�m)!c@k��j�l�@m(�l>@nfm�b�%@o�	�I@p|t�OX�@q&�.70�@q�F`���@r��!�LT@s:�SGq�@s��3��@t���f��@upRL;�        ?Su���ү?�0@qe��?�T(�B�?�N>/el#?��0�X��?��e�&?�@Z��_�?֑����?��x�4�?�@��0�?����??�oȟ൰?����+e?��L[�4?�u���/?�E��u@ /���@`�<z��@���I@1���zn@	���h8�@���^V@�?����@Hi���@��w�4@�NF:�@P�2�?@#�f��@
vY�I@/i��@(�1�[@ �Q��@!2d�qe�@"U�[��}@#�m�P$@$��6]�@%�K��r^@'AK�@(������@)�:U�0�@+T�9�"@,�A����@.9��#"�@/�GT��w@0���C9@1k��߫�@29�N�:@3��C��@3�.~B�@4�\'e�@5�:�kQ@6��A1��@7qD�01@8`�Gu@9S����@:L;�6�@;I^ߝS\@<K6�^/@=Q��*R@>\�-5@?l���@@@�h���@@�iZ0�        ?J�.f� �?y��t
��?�r��n	�?��	��2�?��yy��?õo�d��?�6��\.?��OOvDQ?����ξ?���'���?���4c?�ZнW(�?�N-�4+%?��'���h?��5yA}?@�Մ�_@ �R~ݯ@��O�/@lfD���@W���@�S����@2g��S�@��P�f\@�ң�(�@�����@ ��̢̌@"���)�8@$cK��@&����@(�$GXO�@+5iU:@-�ل��@0��n|_@1s+^�1@2�Њ/@4i)���@6 �z�@7�k
�5@9k�L�@;@� @=(�-t��@?'<G�"�@@���qÀ@A��I�s:@B���Ө@C����J�@E6a+X�@Fy��	H@G�i�}��@I%V� �!@J�ҷ�jK@L��@M�G���@O�61��@PX�x���@Q-�L>�h@R	�D�:�@R�}'��/@S�J�Q�8@T�%���?@U� s婓@V�L�ǀ@Wļ����        ?<G]W�#?g��U�?�G�3�?�)={4�?�Q��Jp?���B ��?�bP�S$T?�"�i��?�� �*$�?��J�mE�?��F`N�?��&�Ԟ�?���jl�>?����H?����?�Y�iT�?��^^/��?�c��VW?��X�p�2@'{��J@��@u�)@����J6@	��'mv�@�2:�p@)���
@v�%@R���n@;�j�*@�ױ�s@����@�;�-(f@ $�M�\�@!��ю��@#�Ҳ��@$�}�ol@&`����@("D�kp<@)��k��h@+��@-�YF���@/��wR�@1����	@27���@3e��Q3@4���c(@5�q�6@72��V�@8�6	#@9�t�I�@;l
����@<��@>zk朵�@@
=%�P�@@ݤ�q�D@A�|6�mD@B��D/.q@C~�Yt.@Dl9��P�@E`gg�@F[N����@G] ~k�@He���3'@Iu�UjN        ?��,�)�?���1Bh?�:�̠?�E��ԇ?��D7�(@u<&A�@);�ՎK@�i� ��@΋[�@!װV �@&I��Ĥ@+>O%?@0Z�ͦ!�@3Xq�mN@6�$H��@:G2=��@=�+}zY@@�lX@\@CNQj�)@E`�I3�@GʯY!~�@JV�o�B|@M!M���@O�.��@Qe:ں�@R�i�"��@T�e[e�B@V<RO�@W�w�f�@Yη�C�@[�ՂQ��@]�խd|@@_���_l�@`�1�Y�s@a���
�@c��t��@d@���ό@eqB�>�.@f�\"3��@g�G���+@i7i��@j�����@k� �u(Q@mL��ʉ[@n��	/�]@p$-�h.@p�^ %tP@q�)�5b@rg�$U�$@s5���5q@tUْ
@t��T4I@u��`�x@v�ٽ�N�@w�����@xl� �RY@y\l�@zP	x F�@{H���@|F��U#@}HHC��Y@~O2�i�@Z߈X��        ?WE-#��u?�������?��
i��<?��K�<v?�헔��$?Ę� �d1?�+{����?�����?ۗ��c?�$JrBL?�7��f?��AtF�?����I-?�iC��%?�9غ���?��K<�x�?�Z��F�@ �:Ӿ<�@�V8�@�rj\��@W�Llh�@	���4�D@s���S@3���l9@
m7%$�@��<�2(@���@����9J@t���z[@92��@w�\��@�y�]�@�.�dd@ yE�(�7@!�A=&�
@"����w�@#��R�߀@$ڰ_�nX@&��t�k@'<���?@(y��ZR�@)��O�@+3���c@,a����@-�4Fr(@/$����f@0Ichc@1�.�g@1����N @2���a��@3L{H�tY@4[���G@4�=��f@5�!V��b@6��y/@7j�����@8I��9@9,���@:��Pbl@:�)Ƅ�@;�p3�GC@<���@=�Z�i�        ?:�jCt^
?f�+����?�xT;���?�3���m�?� ��aF�?���$�\?�c�yeX?�\;m9"4?�.M���?�naH1��?�NZP��?�Q�G��?��Yg�?��!�q�?�(����?�3Z�*�?��rE��h?���l� �?�1���m@��ǧ\�@FĈ��@A�c�@
�P�|�@
*=��U@�"a�Q7@ =���@9:cȯ@��Ye�@(��AԐ@ᩫ3@�[<F�?@!m�e(�@#�6}�f@$�E`�/*@&�?�̞�@(�O���@*��,�@,��$�Y@.��R��@0�3ذ��@1�*��!�@3!���A@4mRW=H@5��at�@7A8���_@8�R1Q��@:Pm��N@;��p~@=�E"n'�@?YG����@@��aK�@A���p@Bv�ܔ�F@Ct᧎�]@Dz��܊�@E��몑@F�P��@G�(=�,@H��m{@@J/͉Z@KF)�2'�@L�h?`V"@M��U=�        ?Fdg�W�e?p���?���:$�?�u�٠�?�����k�?�����g?���p煹?�I�wP�?�z��?�XǸ�8�?�W���V?�G:�,U?�	CV~�?�|�Fꭝ?��Zʙ��?�Q^"â�?�4cL�
�?��"���u@"�W��@�  ��K@�s��$@	�M��@恘,>@Qy]��U@B�5�@V/�x��@��E�7�@�ۄ��@p�F�i�@�B^g�@ w7$8?7@!��)0pq@#�[��r
@%.�!Y�{@&����2�@(��^c=�@*��ś��@,�#^+c_@.���@0u����q@1�Ok��@2��"�@4���ż@5H�S�P@6�Tyg�t@7�}筂�@9im��@:�GS���@<j0J�y�@=�I�ˮ�@?���K��@@�E�`��@A�vu�k�@Bjxtn)@CVWH|>i@DIHø�@EBӎ��@FC�����@GK/�@HY���@Io�$���@J�]	�?@K�-�J?)        ?���W�\�?��iPT��?�l�GR�a?�2�m��?��1��?��~D#K@1u����@/�o�@6�]�*@&.���@ �
���@$�U��b@@(�v���@-@��㉃@16�d@3���rOU@6�0���@9��$���@<�/����@@5��@A�q��j�@C�_V �7@E�����1@G�?�5�@J'e4��o@LwvQ�S@N���Xj@P��7�[@R��h�@S]�?��d@Tƾ93��@V<�_v5�@W�g����@YO8G"@Z�r�#�@\��8�F�@^J�)���@`���2@`�;��0l@a�:�p��@bВ&0�@c�Cp1Nz@d�Q&�En@eӾ�~@f���A�@g��9hY�@iZo�!@j1\
j�t@kX�C\ߔ@l����S@m��O&,�@n��� �@pS�&Y@p�:g�	@qf�=y�@rV�3HQ@r��&\Q@sn����@t"�IA%@t��l�b�@u��]?��@vR���@wzZY�        ?U�w��?�^T���?��N�r�?�ۘ��v�?��3�2q?�6,#k��?�#P���S?��3�m�?߽^� ?�j�/�+?��0�v?�Vx����?�ܨ�$��?�]��&?�/�xϱ?�R؉Z%@c� ��@�q´/l@T�����@	��"�@����@�P�1�@W�{�@���`�@�U��nl@j\\#@\2���@c�u�1@���]�@�]��1�@ ��#�D@!�����@"�V*�o@$0���q@%��d@&��,<@(E+Ö�@)�v����@+4���O�@,�B�=�@.Pƭ��g@/�b�=L�@0̌$��@1�����@2��<@@3ljn�/@4WvD.t�@5H
�j��@6>&~)V@79ĩ0�V@8:��P��@9A|(+�@:M�i�-@;_
ݮ��@<u�E�@=�@5h�C@>��t�Pg@?��9�h�@@���C�N@Ad�a��@A�Ѧ�å@BU�,M*g@B���8        ?DB݂�Q�?s��yF?�\�XJ�?��i{A?��jw̱h?�"��߲:?�#��;K?Ϭ�f�?լBk��?ܨ�$A�$?�p�Š��?�7���?�(��h?�vxx��t?��M�':*?��稓�W?�D��¼@��S��@��B�@����@	�I��`K@*��P�@n;�H�@k.;���@�C�~�@�w]�O�@D���	@�
q1�@�E����@ �+�f]�@"M��@#�Ř�uQ@%�5.�@'qM�za;@)Uzؼ�@+Q'�De@-d�|Ѭ@/����n�@0Ꚑ�/E@2q�@�@3U���z@4��jXb@5�z�z�@7U��c@8�.�`u@:DZl�@;ϴ$��@=iIB�P@?�pp�7@@cq\d;l@AE���6�@B/1��@C��2s@D�=2��@Es	�l@F|b�.@G-{��K@HC+A�\@I`�E��;@J�Dg9-@K�RN���@L���V�@N$��Q��        ?O�e:N?y��%\�?��}�aM?�Y�?�?��d�%?��Cl�?�`�;��?��?k?�� |���?�'�Wy�?�@�#L�?�<<��?�W��R�w?����<�?�SgƵ��@ �j�a@�#���@���fx@
����P@k�����@O�4�Q�@�)���@��N�@�$g�?s@x �.�@xQ�r�@ �v��u@"�W��<k@$Sg`E/�@&9��9�X@(:�E�!@*W$��@,��m�)@.���Y�@0�m��6�@1�Ѫ�zy@3D����@4�J�U�@6���3�@7�^2\�@9,�"��@:�u<F!x@<{����@>:x�z*|@@w���@@�N��@A�L�<�@B����]�@C��e:4@E {�BP@Fk)�@G8�)#�@H`K��^@I�����@J�&�xj�@L�W;'@MV+֍!{@N�%Ԩq�@Pl�@x@P���S�@QkV���~@R&u8;�g@R�s��        ?���
��z?�ü�6�>?�YSLwS�?�*�y��?���|l@S�WK�P@B��`B@
T��|W@  Խ�U@$�P���@)�|��,�@/��*@2���U�@6w���|m@:E.��ٕ@>as�@Ae�?K��@C��'u�@FE��f҃@H���{@K�=r�NC@N�P0L��@P�|�ޥ^@R� 3-�@TL�����@V�x��@W��Yo��@Y��l�@[�Z(cL�@^���!@`A�̎�@a@w�+R@bke��Y�@c��%Y�@d�2��@f%���@gw:��@h����@j6!I'��@k��yGZ�@m�w0<�@n��H0@�@pK��m@p�Ʋ
�@q���@r|�}Զv@sTi82�@t/���e�@u��%�{@u��E@X�@v�-
�ڸ@w�Ch7�y@x����#@y�ћK@z�<�~z@{�
�9�]@|�6L�-@}����Go@~ˋ��\�@ܨ��r�@�y�D�@���nih@���	�R        ?M���Oҭ?x�ک	�m?���ze?����&�?��e�7!?��	��B?��..���?�]Y�6n�?�.G���?����};?�{*���?��~����?뵒u,��?�pﺠ�?�B�%� ?�P��b��?�����?�$Ε#?
@ u�Ӡ2u@x�C�@��	�9@޻��(�@	B5���@�|BI��@k�Pn@�I�=�@rḍA@�����@(��&�@�רRa-@�N���@R��@-e��2@>���@ c8��:@!��f*@"%�)�CV@#?����@$b�q"��@%�#�W�@&Āb�V@(�s�@)J�ܢ-�@*��9�!�@+�4�E�@-Y��$@.�"}�H�@0�,\2@0�7�@1��0���@2mʖ��;@3<u͚s�@4k�{�@4�k83�@5���΍@6�}A8��@7��C�9@8|�VO@9n:Ey-m@:el"��@;a���@<bVׇY@=h�`�j        ?C=S!�.�?qYֆ��e?���T��?��F`?��t�$��?�mI��?�M&�X[o?�\�Lb�?�J�>|
'?�|^��k?���,�?�M�08�?�ģ�u�V?�zX��?�z �!�?��Lg���?���Z/�@ �K{3!*@��#:��@��T���@	됻��,@vL%���@��<r9@���Ħ@�o��]�@T5����@�@�Pt�@����D�@~����@!H��|SV@"�Q㞉�@$��&�@&r�4�e.@(\�L<�@*_ݵ�i�@,|��A��@.�\����@0�HZȏU@1����@2���]2@4Q<�K�~@5�*O�b�@7!�}(~@8����� @:,����@;��=V�@=t ֝�r@?.�5T@@|�=�5t@Aiά���@B^�ȓ�@C\?�g�@DaZ��ʎ@En�'O�U@F���T��@G��g��@H�GU��@I�H�ͭ@K/����@Lo����j@M��j���@O
B]Ђ�@P2E3��l        ?L�uR�r�?vCw�Ap�?��3�&?�g�ueߔ?�?��҇9?�\��1?ȥ[zlz?��t���p?ؘ��?�fT�]$�?�D�H�-?�����u?�����0�?�ET&a?��<�I�?���Ŗ@m ���@^�ƝX�@������@,7,}�~@�ƯU@��C�ݠ@����H@`�k*?�@�	���@��%��@�2E|�@!���	@"����8@$�`�Q��@&�����@(�"�H�@*��{�@-�8�8�@/j�����@0��Y`��@2HS��'@3��.��m@5Y�?��@6��uhp@80���÷@9Ԡ�!A@;��:@=Q(��@?*'����@@���.��@A��ȝ��@B���@C��W,8K@D��3w�#@E�*Kn~f@GS��f�@HL�a�[Q@I��yO&�@Jݵ?��\@L5���@M��a�UM@O��:�@P?-z1L @Q �#��@Q��E��@R���@Z�@Sg )���        ?�u�}D��?�!R����?՛��D�`?�4�a&c^?�0M�=C@�z�/-@
��<��@����9�@�k,��@�y s�@#�zjNgz@(r�bڝ3@-o	�E�A@1t���@4o��J�@7�!ܢ@;'5qL�U@>䰳�CC@Ar.�jN�@C��S�`�@Eֲ��W@H<$�`\�@J�5��b�@MoD/ƍ@P�WtN@Q��9 "u@S"�2��#@T�!���3@Vo�^�o�@X1�Cq@ZV7t��@[��#�*@]�1VB� @_���[��@a9ٜ��@b%L�Kw8@cI$l�4@dv�Wע@e�g7&�@f��M&pY@h;�l�Y8@i�3�i�@j�p��@l[���R@m�fE��@oN��@pk���T�@q5]h�_�@rof^@r������@s���e�@t��p�,q@uv2OdJ�@v`)�J*�@wO���r@xD�<���@y>�� S@z>�1B��@{D�J�@|O�����@}`v/���@~v��-8f@�̐�        ?H�jU��?t�����?������?��R���h?�J��<�?��'�v�?�Ւ�XK?�%��Q�k?�{��`$?�(Z7?ߙ,�2.?�h�H�Q?�ih���y?����N�?�N��k�/?��D�~o?���k��(?��<��1k?���I��c?�h��	�@����Q@x�&���@��@��:@�SH�K@	��Ʋ2@U�^�@�(����@�g���@]!mS@�B1�q@A��o�@�?x�,@1iYK��@�����o@��/�K�@n�4��3@O=m
v@ �dp�z0@!��^\�#@"��ct,@#�r��1�@$��?�$@%�a��@'+�рyo@(b!�(c@)��.�.q@*�;=�@,<��E-@-�,�7p@.��9?��@04��4<�@0�>�{%w@1��~(A�@2u|J�&@3?)&9-@4��	.(@4��`��Y@5�d�i^�@6�����@7vkG��@8[���].@9F�Qs�@:5��Fٌ        ?6�W���?eXdr�J?�p��L�?�v=E��?������?�����a<?���@�5�?Ħo�dw?�lf�ا?�ɡX!�?���/�?�՛s5e?�BU��(�?�bj��	?� ���~�?�u���O?�5P(ma?�d�t��&@ �@4U�@�e��ӿ@aD5��@pF[Y��@�w �B�@Y�|<8@�	47�.@���N�@�H����@Gr���@̫�A�@y�����@ '�ܕgl@!���i]@#;�p,�@$�W.1�@&���5�$@(wO�(+!@*a��!@,a�)��j@.xotf��@0R����@1t��*G@2�����@3ڊ$|�@5Ř�K�@6n�c��@7���G @91YOh�@:�\�1��@<#3dP��@=���~@?D|�?`@@s~�y@AJ�3hl�@B'�y�@C)�z��@C�hC+ba@D���@E�皏�@F�of&��@G��D���@H�v@�+@I�T
�@J�����        ?:�}�1~�?e���U�?���i���?�2�S)�?���n�Ld?��K2�G�?�����?ĝK���B?�'�F(�?�ൻ��n?�QI2\+�?� ����?����I?����H�H?�fl|G�?�����B�?������?����0@ h�+v�+@�V,_@�.B�/j@	'��׀�@�����?@.�,�-�@4kC&@`=�' �@�&L��m@0��\�@֬�\ŉ@�0��X@ �H%ϔ�@"e�oV%@$7��Ⱦ@%�.(�l�@'�R��@)����@+��7�-Y@-��{?P:@/����@1$ϒ=�;@2Z7�D$�@3�p	���@4렄z�d@6G�
q�D@7�����P@9(��7u@:�'t��@<?{	O�[@=߮ޗm�@?���lI@@�'p��@A��f#�@Bwޤ�H@Cj����f@Df@��M@Eh�k�6@Fs"#���@G��5��@H�=Y��7@I�D��HQ@J��
`�@L�LI�@MPݘ�A�        ?��Ȍג?�wW'�1�?���?w?�]ID}�?���nk�?��m ���@�#�Y%a@
U��orj@�j���@��V�@-�Ɩ�$@!>M�vY@$�!�<�,@(���k@,�4�WP@0��ep��@3 ��n��@5�p�K @8XoAA"�@;G	j�@>b��d�^@@ն����@B��b3��@Dc���_@FL��$+@HM^K,,�@Je�o�~@L�����@N��D"O@P�����@Q�M� �Q@S(,�Pc@T�|mU@U�nα@WT���=j@X�(��s@Z^�޵�1@[�f�:@]����@_S9=G�@`����m�@ar����4@bawJX��@cWS���_@dT7�@eX,)C��@fc=���@gutWZ��@h��Jw=x@i�jS�@j�/X��z@l&�Ϻ@m<O��Jl@ny���U\@o�*}��@p����8@q.P2cw@q�Fw���@r����E�@s?�YBk�@s����@t���V��@uqv����        ?Vf���e?����+9x?��2��(?��<�$�u?��YY_{?�:ۨ2�?�.
��K?�`�
���?ݟdz�*�?���� 1�?�zqP��?�ҽ��G?�F��?�fN�M?��Y�k��?�rD���?�^2��)�@�)~0��@m9�@]����@��	�@~VB4�@B%N.�@�,5���@r��Ey@��/zB�@Tv�Ӂ"@-i��@���I�@�x�@�"/dAC@�b|��d@ Qܤ��3@!a:x�u@"x�.�k:@#��.G��@$�L�p�@%�4�W�D@'+���!@(mJ��/@)�����@+
S� @,e�lK@M@-��c&�1@/6�^pP @0V
٤n@18�0�@1��h��c@2�����@3mp�d]�@4>tr��@5�p_�.@5���~�@6�w-r�@7�zc��S@8� U�|@9����h@:s��/�|@;h���j�@<b@�0�'@=`fO	I�@>c-�@?j^ :G�        ?=G̻�m�?k�^{�&?������?�F\O_?���6�?��K_֡?�T�R2�?�̨���?В�Z��?�H�s�>>?�!�ˏ��?��e�?�O2��E�?�F��L?�ruT�ts?��ϨY�?���)��&?�/����@ �����@���g@�@��W��@	�n���@\9?@f2����@b��cs�@�I,tC@˾5VV@:	����@�S��!@����P@ �nu!f�@"D�z �Y@#�f���@%��Τ@'c i&L@)D�O$1 @+<��>[�@-L���h�@/s���g�@0�?�k��@2��Y@3<��@4���C@5ϥ�҂N@7+�z��t@8�΁e��@:
:o��@;�U�(V�@=7?��@>���m�@@/��?�@A
�8�US@A����@B���gF�@C2��@D����(@E���ǝj@F�0b�d@G�~x���@HϏ&�cL@I�h�pė@KDXX�@L(��e�`        ?L���F�?t�QvT�^?���4S?���'t��?������?��"p��?�9�}�@�?����?�*Z�^3?�lk��7H?��NO�C?�.�x ��?�_����?�mA-�]�?�B�ݸ�?��`���?�a�5	�@[�Iv�@LĘ8�@�R�e%@:Z1P@�"��@ �0��@<LfsШ@��u��@5����@��-�g8@�-�99�@!M%�<@"���;@$lB����@&G�]�C@(=bQ#��@*N_`�S@,zI�C�@.¤q�
�@0�����@1�� w�@3%=���@4�����@5���O�@7r?���@9 ��Zed@:��긌@<Oq�b��@>�W�$@?��O4��@@�]և�@A�cn-�@B����]@C�<�<@D��f�_@F�`~A#@GB��^��@Hr�5�e�@I�a�}��@J�tz�j@L<aAq(N@M���T�@N�c�9h�@P.�lwl�@P���}�@Q�q�ڊ        ?���R�?�� x��?�R����?�VK��?���؋@i�A�:o@
����@��4E��@����o@��@���@#�I�9[@'�+a�N�@,��F*v�@0ݮ܀@3�ƩS�@6�;����@9����@=@u9K@@p�wh�@B\�б'@Dcĸ��@F�\9��@H�Gk��@Ks����@M��<w=�@P�K~,y@Qe䤲�l@RȪ9`�'@T8����@U��n��@WB�~B5@X��5L1@Z�+��� @\4�?0�W@]���?el@_�.� �B@`�ڡ"|@a�9��u@b�94�.z@c����@d�=�K(K@e�^� ɐ@f�T�Sr@h1�y��@i/�mP(@jY�ŉH@k�І{U�@l���W@n+J�@oL���5�@pM�-�)y@p����`�@q��LXA@rYIq�y.@s&��4�@sȯ�gG~@t��fb�T@uF��R*@vlٵ��@v��F[�Y@w����j@xo�v�[�@yCFB&�        ?O�� ��?z��-�	�?�)��l��?�r�	Q$?�O5IY�?�U�K�?�?�n��?ю��L+�?�\����p?�"��W�?��~��t?�
sn��?������?�p�E�?�@K#S�^?�L�KF�p?���A��?� 3��2@ t��/��@y*��@�^��@�ri�@	K�*�@�G���5@~}�@�?���@>�f��@�UqNS6@=��"�}@�@�\�@�VZ)��@r
�^��@Q��5Ԥ@C�]@ #W�c��@!.XeiIW@"B�b��@#`+<ת@$���	@%�v�L�@&�F��@(4��#�3@)�h���@*��#�1a@,7�Ɇ9�@-�?k���@/Vh���@0H~��^ @1�66@1�xTn!�@2� ��A�@3q���o@4G�r�@5"ޖ �@6��[/�@6�X݌q@7�Ò`}�@8���ŷl@9�勺�<@:���Ud�@;�(�� @<�c�7c3@=�Y��        ?9����
5?g�/��\�?����JR?�k��;�Q?����,�?�;���"�?�d�Q�:?������?���x0?����9?��,�!
?�ܖ�=Ⱥ?�i��M?���)-�?��JȨL?����4?�����v�?����"�!@ ��s�v@����pF@��;7	@	�ɭE�@���O-@��{�5v@�U��@	:���@uF���@�lޱ7@Ӏ�Б@@�HB�Lo@!v��9}[@#!�.�y@$�Ir��F@&ļ,	 @(��6�)E@*��\��@-�yh��@/M�F�� @0�k��5 @2���@3p���A@4�Qbp$@6C]�{�@7�Ep�/F@9US�g�"@:����U�@<�<?�@>la	EU@@ �w&@A�t_�@B�w)��@C���U@D#R��v@E;��E@F\Z��i�@G�>	���@H��d�6O@I�lS�}@KB����@L������@M�ܹ��@OZ��kf@Pe�ʣt�        ?6{cJ6�?b�����?��_�n?��X���b?���eJ�?�v=뱦?��2�]�?�D���?� ���o?Ҙ��}�C?ؾ��hk?��)�*?�jQ�XM?��M�f?�\#�f�?�a���?��"�u?������?��,����@��&��@s�_Qr$@�
��=�@���5@ߥ-N3@���>�@,ݠ[�@��*ӵ@�.gJ@��G5Q@�����@ �$�<K@"|0���@$4��[A�@&�DJ@'���|
f@)��D��}@,hS���@.O���6I@0S��1@1�/w��E@2ӑ��"�@4)th4@5��X�=@7���)�@8�k�Yl�@:�з:�@;�u�u��@=j3AI[@?,��F�@@'�5%@Ap���{@Bjf��f@Cl��o�@Dw����k@E�xɲ��@F�
Kkԛ@G͌��)z@H�8]��@J3�0�@Kt��^$@L�ޤSH�@Nw��6@Oo�����        ?��;76 �?��ԔH�8?Г~<�Q�?�{ٍ؅�?��kPA�G?�/�2�*@k�$]�@\UN�@�}��@�� zT@.*X&��@"���4p~@&MLO(%�@*x�	��@/�^P\@1��*��@4��-,��@7���$b@:�FZXn@=�����@@�v��@B��U��@D����(�@F�d�	��@H˦{�v}@K�:+��@M�h�?e@P�j� �@QV��]�6@R��wcq@T'�����@U���,�
@W4�����@X�N)���@Zg��B@\<6��pp@^��xʣ@_��]n�@`� �Р@a疸A�@b�1"���@c��A�|[@e�<O�@f36\�bi@gZ��鱞@h��z[ٷ@iªm���@k}Z!�@lK�_#�@m�H��@n���>�@p,BǼ��@p�tL� o@q��$M�X@rX��5��@sk��D@s��R���@t����<�@uy�B8]c@vLZ�$"�@w#l;Nq@w��w�UO@x�>���T        ?\���L�<?��$&[�?�}n<b?��h��i?��� �?�5� A>�?���-��?ۓJ��f?�B�3UN3?�d��L?�1����?�ՂW�7h?�ip���&?�U���V?��~���@��k@��3�q@H�$ ��@	$4�7@.��zA	@iΩ��@jy�F�$@8l߇)T@���@;��>0@6s\�G+@g�z,�@�QП�A@ #$�G�@!I�QV@"���>�@#�
�l�,@%S��]@&�5s���@(E�jV��@)����o@+m�I�@-�/Kc@.ɓ��@0E����@1-�7��@2�׵/@3e8�@4^<�!r@5uN
�"@6\���E@7,�b@�@8C�$��@9b��\�@:�a���8@;��ːl[@<�~�;K@> ��^�@?a�q��:@@Tڸ�q�@@�S}�_�@A�Ip���@BU��dNH@C�����@C�*4q@Dv���@E2ls���@E�Q源�        ?K�A%{�?w}���y?��$QZת?�!L�G<?�����?9?�f,Ms�?�e��3��?�od���?��׺Γ3?ߕ��y�?�Z(wx��?驲Z |?�Ƅ^���?�^�6�%?�MSD��|?�� r�@ M�sz`@�ە@��F~��@	=�J�	f@�#._��@OGu�{@a#�1-@��68rB@���F*@�ɪ@B���9E@&:A<s@!I�7U@"�@Ep��@$pq��d/@&>K6���@($8�Ӣ[@*"����d@,9��]�@.j}����@0ZV!ll�@1�i�
~)@2˥1�@41�^~#@5r8Pe@6��d��7@8OQ-F�@9Ү���M@;d"s�7@=�T'߹@>����s`@@7ѱސ@A��e�
@B	b�L^�@B��$F��@C�m-F98@D�š��@FƬH��@G�s��@H5�dB�@IW��$�j@J�&F���@K����b@L�؋,�@N2�]gT�@O~.�|P�@PiV�<        ?Y����>?��+��b?�Nq�x`?�L�n��?��'b?�[ k���?�B^�FM	?��=���Q?�~�
�3�?��׉i�?�B����R?�Fl�M�(?�l�S-K�?� �@ +�/��b@h�(�@JH=\�@	�UۋU}@�O��"b@����5�@/+���@��H�3y@>Z�q�z@s��Ѱ@
�/�̶@ �NNb�@"N<��s�@$�y�5@%���Y�@'��t�/@*��D��@,Hܑӎ@.�Z��@0��m�+�@1�Nd�@3 ��)@4v�G;�@5�j�=m@7blV��@8�(�t*@:��ɻ
L@<2a��I@=�$@xƇ@?�0Dd�u@@�T�H�@A��>��@B�34�z�@C�yE�k@Dº�gEp@E���5�@F�q�ؔ�@H�L��@I@����@Jt�w�e@K�N�7"@L�~5gf@NC55�=�@O��I((:@P{j��?�@Q.�E:�@Q�CLڂD@R�"ÜK@SbVD��*        ?������?ɑ�t?㟚�"�?�^�(��@'�E�)G@b2''�A@0b�õ @�~<q	0@$(�,�R@)�V��RJ@/����!M@3q�aMs@7@��\�@;h-GOx@?�?TJ�@B`��Xy?@D��>f<7@G����۩@J����h@M�%3~@P�Uo M�@RM�Nc�@T!�nXˇ@V��!{@Xڙc�@Z'�
\	@\WR��3@^��}�L�@`}�0'5�@a�8$�h�@b�&5'@dO����0@e���#�*@g����@h��0��h@j	�E@k��d���@m,��	&�@n��NB@p?JAN��@qqL�@q�i5�y@r�1��f@s��8 �>@t�*����@u�[&���@v�Yı�W@w�(��@x��G&Y�@y�<�r��@z��k���@|�d�T@}?�ܔO�@~h}�}�@�+��$�@�eץ#�@� �C@���X�@�E��d�$@���#�]@��e��5@�?�����@��#��        ?I?ٞҫE?t=��9��?�[��J�?�3�-n?�9ķm?���6Fʒ?�E�\V��?�ZT�-V�?����?՛@#(|�?� G���r?���*=KM?��Mlkn�?�yx���?�n:vۿT?�w�d�f?�'�nD?�����I?�>aEa�U?��|�?��~OG�@ ^ĭ3?@�T���@m��Ʃ9@=p���@"�\5��@	�k}6@.�F @Tsy� �@������@�&���@&,0
�@e�~��<@����E�@��4�@gߊ�w@�[=1 �@K��Ne @Χ�o��@\Vk��g@��T7`�@ L8���@!#`����@!��PSb�@"��? ��@#�$�>o@$���eS@%��9���@&��[2M�@'�?ϷB@(��f�i@)�՚A	�@*��^7��@+�2���@,ן-���@-�1
�6�@/�dE�@0�;�^�@0�R�|�L@1JX@;�@1��uLb@2��J�S@3!�M;'�        ?3.�=�ލ?`��8D�?{�w¾t
?��y��#?�>���e?�$,�?�d6�bg1?���!q?��E� O!?�p��Qj?�� OՃ?ܐ��?�4Q�b�?�ʬ}��d?����?����db?�\{���?�dW?ȽY?�������@ �{��G@i*��w\@R����1@	��Ө��@��.xvV@^`Jc�~@f�����@��:t�@���P@xy�zj�@*�8�G@
�:}�@!�(�@"��P(@$e|�t@&6����u@("����@*)0t%��@,J�-��.@.�5�OB�@0p�Շ�@1�>�@2�6d6�@4O!�ѿ@5�(�U�z@7.��U@8����Q@:LxT�@;�R6���@=�b�@?q�T�@@���$��@A�^��@B�A�'�B@C���2{ @D����gm@E��'�T@F�N6e@H�#V)�@I:hq��i@Ju)�:@K�ǳ���@MĽg�@N\����        ?:Ɇ����?en�Q�I>?�=�z�3�?��P�	�?���f�~�?�K�F�o?��3K?�uN	��?����!I?Ѡ[[,�M?�A�N�7�?��㣬G?��ϐMf?�m�G�E?��*Q��A?�_���~?����,??��b�&:�?���k>$@ �� ��@?���q�@ĥ)r6@	Ieț@j���F�@ �|�<@�{����@��͖q@:�+�@�*���@#��F�	@�!����@ X~�w @!�K
/@#u�M�'@%&,���@&��$�]�@(̮4�@*ùl�>@,�4Տ�<@.��5��@0��N@6@1�H��?�@3<��@4O���4@5���>j@7�G>�|@8x�H{��@9�I+G��@;��!@="=��{@>�W���~@@C�ͫ�@A(x��u@B���o�@C	TԘ��@D�/ˑP@E
6��@F���@G,�%�`@HI���J@Io�|��@J����V@K��_7�        ?���t��?�K�]���?ʪ��`�?����B/?�(����>?�Ѓ���?���{�p@��MQ@�:T�h@�$�n~
@IH<��@2����@ N�OD��@#D�A���@&| Z�H�@)�q��H{@-� 6e<M@0ם���@2�IR�p@5:�_��@7�g�"�@:%|1_n7@<�y��@?��>�@AC�L�@B����@Dc�	8�?@Fq3�O@G�sOu�u@I� |�\@Kw��(�@Mi����@Ol�}�@P�:��@Q�F���@R�w渮�@T��+@UH:u�LV@V��)���@W�9R@Y��ُ�@Z`�.b @[�S���|@]!j�
�@^�O��ׁ@`�w��@`²�I��@a��J"v�@bO*���@c����D@c�� �@d�?���@e�ޠ��<@fy��$P�@g[���3�@hBx��]@i-B_U��@jY��P�@k�-[H�@l{�P��@m�柁�@n�Y�2@o�Xo��        ?]����/?�����
�?��y�X��?��w(���?�T�-T��?��M�?���	�?� ��@{?�y=+$�?�n-#C�?�%\b��?�b��3��?�CP/�F?�����A?�#��?��+�*?��١A�Y@ �g:��@A��z�@�-����@	.y�x�@��G\$@�,�,q�@���/�^@\Tv�M@�醜{�@���5�@n��n�@C��`�@*�!Q�@$a��[�@09����@ �A�\�@!��:eI@"�t�h�T@$����{@%A+m��t@& ���M@'�|ѕ��@)?pѺp@*qhq�'�@+���P�1@-A�P�[R@.�F��Ԫ@0DL�@0����z@1��u
�J@2w�COI�@3Jn� MM@4!��3_(@4��ˬ�R@5�Y��t@6ä�u�@7��cb6H@8�6��h@9�ǔ�@:�s��0�@;�Y���@<�`a�+�@=�]�)�t@>���e�@?�rJ�&@@\��|١        ?7� '�")?c�\�C�?���o.?�Q�}S?��(��?��N �?�K��t�p?�1���?�B���7?Ѕ����?��c�Cv?�@��i?��{��a?�DRo=�9?�M���o?�� h�]?��*ݥD�?�i�k��?�y
�	�?��_G�@vO��vn@-A�%k@#Ba��G@Zy�3�w@��b��B@J_hI�@M��S�@u�5�@Ù�q}}@7��$8@�H캓�@�5� �@!B4�r�@"���C�@$o 1L8�@&&R^�O�@'��qc��@)�PBf�x@+��#@-�-���X@0	7K1��@1+	�27q@2Y=�>;@3� �
�@4�|���@6/ܵ	�@7�HVy�u@8��X��v@:{�:���@<D�Sx@=�M3���@?A*j�
@@yߕ�U@AZ6���@BA�ߛ�G@C01iGf�@D%�Uϴ4@E#<�	p@F'b���@G3+���@HFkQk�@Ia3e��@J���� `        ?O D,�?u���?����ū�?��q��?�X�.Z)>?���Q�?Ť���پ?�R<{�?�E�t���?�9�m��?�:խ���?��Hؚ�?�%fh?�r��N)?� � b�?����#�?�|l�R��@5����s@�1}��@��F�*@
Y6�@�O��kA@�uu#D�@��!��A@�]/�.[@Aʢ�&�@��6TWP@c�3oWO@2>d���@!=�<�Y@"��E�K�@$M�@&�7��@'���Pyi@)�[�|��@+�
��?r@-�7CԉH@0
�� 	�@1/'p�V�@2_�w�e!@3�~�@4殐K�^@6<�֎Ӟ@7��W��@9P�@:�W��@<V#�$X@=�ݬ�h@?S��W�!@@� �(�D@Ac)��y@BJV3@C7�%BV�@D,�V�?�@E(4ܒA@F*���2~@G4�8��@HE[�oNe@I]9�O=o@J|7:�
�@K�[���[@Lϭc�0@N1����        ?�:�^�?�J��=?�H�a���?���W��?�4���ni@���k��@	��P�@����@�Ɯ�@r�q:Ye@"J~枆U@&@����W@*���S@/]�c$��@2C>�[/5@5���y@8	/7�w@;;�@[@>�,z��@A!\Q��@C	��g@E:va(@G4�ޛ@Iq�0/��@K�g�}�@N@y�9B`@Ph����@Q��49��@S$S�:�@T�$9:'J@V�3�l@W�;�f��@YD���]�@Z�tM�@(@\��V���@^s��0�@`%q��t@al&���@b�A-�@cIiSU�@d1ve�@e-n�a@fE*��{@gc�Ѱ�$@h�B�k��@i���G`B@j��<8O@l)j�
^@mm7���l@n�d�#i@pw�d�@p�l,wa�@qcJ)�@resd$5@r�m���@s�*��n�@tJ�=Z�@u��@uԱ�3�@v�Q7�m@wm�o�?@x?� ��@yw5�6v        ?N���K�?y��^�3�?��Ek�s�?�l�<o?�,x��?��B��?�k]�P�?ѿ%.V^?׭�k	R�?ނ����?��^e�P?�rQs��?�:1l���?��z��?�\��?��0�m9?� �I�?�?���Ä�@ �����@���)��@�I���E@' V���@	��x)��@�>��@���H��@��?5��@@�^)
�@�h����@c��l@iI;z@��v���@�jy��@~&�F@q��~Yc@ <����@!H�sz%�@"^X����@#}�&�p$@$�2}�@%�T�;��@'�D_�@(Y&��{�@)�ܳyW�@+ ����@,a�-�Ր@-�)=�}@/A�h(N�@0`�&1�@1#���q@1�|"(_�@2����@3��,�k@4bnU�@5=�U=��@6���y'@7��j}�@7�J�[J@8ڄ~	�@9�nڴ6A@:�	m@;�E���\@<�+6�r�@=ǳv��        ?8�F��W?g.�Q5m?��_��s?�2���?�f���8?�4��F?�ʧK�4?��b���?βv���?�Ă��,�?�M��1�?�z����?�/�?�v?�M���*?�#���?�⇒J?������?�,�Uۅ@ v�B��R@��OB\@��$r*@	g
5�@�}/�@",�$@#�YT4�@L�sR��@�n>�c@�8@5@�P��*@��g�W�@ ��H�@"]P�oޯ@$J3���@%ф��}@'���`�:@)���� �@+�[�x��@-�2(��@0�d@1I����f@2�k6�N�@3�iQۣ@53��8L�@6�B�`@8��� @9�D�4��@;<x-}}@<�xJ	�e@>��E;@@3���P
@A �O��w@B5����@C���@D���@E)�t��[@FA�eW!�@Gb�����@H�'[@I��<S�k@J�U��;�@LC�+�@M�O�o{@N�}��|        ?9�a����?d��ã)�?�O����?��9z�v?��l���q?�3�	���?�-���T?�.$�rd�?̘c���/?Ӈ|���?���u�9?��.7T�,?�?�G�	?�zqyflX?�?�H��?�B7/>?���+�'?�����[�@ fD �X@�n��v@K��Qp@	U�<ux9@�q��@c�z��@}�}4^@�]��@3��b�u@�;y_%�@��`�5@����o@!h��P��@#�S�J!@$��8�@&͉R�p�@(ϟs��B@*퐔���@-'�}��f@/&�0�@0�鴙��@2C4�H:@3����l@5��3�:@6{+v�g�@8�ؘDz@9��@;A���@<�*�γ@>����#@@NzS `@AC��"��@BA��S۵@CH�K\�@DX]��bt@Ep�.���@F�L�[ݝ@G��?g~I@H�~C��@J-g_��@Ks�ǭ��@L�G3�9�@Ni���@O _�C�@Pu�y�        ?���Q?�8&T{G�?��40�w�?�ITf�G?�#\�a�?����3�k@?/�$@
��泋[@����@�G���@��B4�>@!��{��@%nO��@) ]_�oI@-@����@0���L��@3fsM;l�@6�X9�&@8�����@;���fo@?����@A>sQq�@C�n���@D�g���w@F����8g@H�;��{@K#����[@Mi��+K@O��U�n@Q!�s~@Rj�ĉ۶@S�Ȇ�=�@U&2	��@V��Ci�@X7�{�@Y�M'F9�@[?/�.o�@\��`[e@^��_<G@`1��?�.@a�>�j@b#t��@c\�MA@d ����@e���@f�Й��@g$����@h>�����@i_2X�I@j��w�^@k���-�@l�D���@n&Bt��@oiT<�@pYS"���@q����@q���p"@r\��/@sg����@s�=&k4@t}1R搯@u9��	�^@u�dl��"        ?Z��#[��?�0g���?� �6�??���"{L�?���E�s%?�iHk���?��g�Wnr?�Ŏ�<N�?�d���|�?����?�$<i�?���۸?��[$�\?��GP�E�?�RZ&��8?�_g�4�L@\YFQӍ@�(���@(A)U�@�;���@��ݔC�@x���?@Żҧ�P@c#�B�@nL'�C@�[,�`@�梶�@��_�љ@���  @Ė��T�@�ӽ��a@!l�F.@"KbqY�h@#�W`(��@$�T��ym@&`���@'q{h�J�@(֤C��0@*F�>^?@+����A@-H0��z�@.�LϤ��@0:�2U9�@1!;��@1�	�6+@2�_8�6@3� ��ƒ@4�J���$@5��j��@6t̳8^�@7n$�T�@8l�.�]H@9p��t@:zB�
�@;�	���@<�7f��@=���m&@>����h@?�O�5�@@�P0x�%@A**�b�@A��#�4q@BbMf�>        ?1�y��?a�fo�3u?~�F��q�?������?�Zt��?��T�Ӹ?�[h[��I?��˞m�?����ߟ?�s)y��?؈ܼ٫�?���W*�w?�8S�'�!?�=oC��.?���A�?��F�CY?��f2�h�?���w~?�n�2:��@N� F��@)�wV�@I	[�|@����@c\/} @�==���@�P�C@(��4O@�r���[@E���Kh@��v�@ �P��J�@"�&坮@#ˠl{<�@%���=��@'mߙ"l@)d>o�@+t�&@-���N�"@/�U�'��@1 Ӹ�|@2^4����@3��rR,j@5	q��@6j�DV��@7�t�n�@9f�-��@:�/�u�d@<��.�@>Q��9�@@
Kd-/�@@�A��r@A���Zp@B�/�'m�@C߸�}�u@D郇�@E����#c@G+���u@H9-�!@Id���@@J�� �e@K՞E��@Mn��@Ni;%<        ?b�kֱ?��H��A?�{��np?��4��L(?ŵ:Xl?ю6f9�,?�&+1�?�\>[Oۘ?�/5�?�5�zX�?�H'�n~?�z���}?�����@G�ˏ�@�9�͐�@	E�R�@C��=@�¾ʯA@$�~~x@�_��@_0eee�@C��5@Y�t�y�@ �xF��@"�Y,3��@$c�@��M@&T*�sݳ@(^�#,�@*��-Ɛ@,��D�5_@/��%�B@0ʎy�<�@2zԟ�@3jH�G��@4�J <A@6A���l8@7�bi��@9Ry����@:�L�O��@<��.�@>W�tA�@@����S@@��Ya@A����M@B����5q@C�t2d@D�6��1�@FcT<پ@G%S�=(O@HGvoL@Ip�YS��@J�b�0�@K��m	@M��ɒ�@Ng�E��@O�� 6߅@P��H��r@Q:����@Q�F�G:@R��z���@Sg/�V��@T(�rԭC@T��~        ?�`v�Ƞ?�s�H�!+?��[-��?�a�b2�@ Of�@	�ySd{�@�ԑǦ@V� ��O@!i����@&Cs+Pz@+���l�@0�]�x@49�]�@7����}�@;�N�)��@@�F-Q�@BPJ��}@D�I���@GU|f��@J�F��@L�^�6�@P��ߘ@Q�y0a�@SIm+�"H@U�V��@V��b��a@X����n@Z�UBU[@\�%k�.@_��C�w@`������@a����@cP��\@dP���&@e����@f�����t@hZ��:rR@iɻ�^�2@kD
3��@lɏR;X@nZK-�AM@o�@=��@pθdyW�@q��x��x@r����@sk;OE�@tUO�̇�@uEf�$@v:O��[�@w59=�*^@x5�w`�@y;�;}�p@zG�ѡ�x@{X�eY�@|o�T�Ӗ@}�Uhh5y@~��-���@�O[;�S@���o`!]@�q4Z�h@������@�WJ���@��!�|f        ?a�A�l��?�!۝�r?���Zz�?��j�tT?�"1]�?�zJP���?�|���\*?��&x�?�����p?�s�%yI?�Jb���?�>�2��?��~gC:�?�Q���n�@85J�D@�4XFD`@��"�@i��@f�� �@���1�@��j��=@��$@�/
�5C@Hq��@C?_�@�U���@ �^�F@!M^��/�@"�N�m�y@#��^�c�@%h'@�r�@&�	���	@(b1���@)�c��@+�*���@-4�.(!@.��`���@0Th��@1:y4���@2&��U0�@3ŕ�3�@4MsF�@5M,�R@6�D�z@7Ҫ��@8.p�Es@9D�UYE�@:aa���q@;���
�D@<�d�e��@=��GJ2!@?8�{@@$� P_	@@Ĭ�1@4@Agu�Y�@B�H��z@B�9�k{@C`�H�@D��f��@D�~LS#@Eo�ip@F$�U:@F�W����        ?HxP��'t?w9�
�?��q�?�2�R ��?�����o�?��i�`p?�U�C��?�d�<A?��w��˙?ߝ�P_�?�l��B�?��C��?N?�
�5��?�~�i��?�������?�;(
�'@ �N�J@|˶���@��M�m@
�b�o�@�א~�2@�wno�@��{�r@y�Q���@�8n'@���G��@�T��=@ ct���@"
Fj?}�@#ʮ�]��@%�8r��5@'�l�il-@)�����@+��y�m@.2���@0B�f@1�" ��@2��迂E@41��O�@5��3�m�@7AU=|@8�;��@:F��:�$@;��߶@=�.>�@?}�U�w@@�	�:@A���H\�@B�kU]�@C��`��@D����C�@E��3�@F�-�uY@H� c�@IP�A�h�@J��y7�m@K�D�xQ@M�����@Ntq͙�@Oӯ�	��@P�?G���@QWH�O!�@R�VkV�        ?N��$*�A?v�8hc��?�����?�>+�?�����y?�|�q�V�?�-cB�+?�s�c6'�?�x��h	�?ݭd%��S?�G�{?� Y T�?�����?������?��?�s�l?��C%�F?�.Ȫ%��@��L�jD@JI���@B��lQ�@
}�I��@�Y�5<�@�{��n@��Cݦx@$���@g�VC]@��vJ�@�nm@K�Wr�@!���
�@"�*�ʮ@$RI���0@&C��Q�@'�y�� @)�O'��@+�)Aվ$@-�m,v
q@0���6�@1$a{���@2SL���[@3���t�v@4����+�@6+���l@7����[@8��B��@:y�"�:�@<�|��@=��s�P"@?A�f� @@z���@A[����3@BC�>��@C2��@D)mq�g@E'7է�@F,`�"`G@G8�)�E�@HM��@Ih�X@J�� @K� ��@L��v�TA@N$L��Gf        ?��a��ң?�<fK�]?���jj?�U�Q�@��+�z@���ۮ-@V�m�@�$q�/�@"bJ���l@'h��@-	���uZ@1����@5�P^.W@8����u@<�菈�@@��I[�a@B��]3/j@E_��H@G��`���@Jǡ���@M�����@Pf�k7-�@R2�!@S�ֵ�M?@U�f�@WX�V��@YE���[�@[E����[@]Yn��[@_�4�?@`܉��Y�@b�@Y��@c2�Z���@dk�+'�\@e���-W@f��
�q@hN�ܧ�@i���M�@k m
�)@l�n�oy�@m� |췒@o���ȩ�@p�B�wK5@qP�V�q@r���
�@r�Tۈ�@s�x�%@t�/~��@u�wֲ��@voP).@wY�̇p�@xH���k6@y;���T@z3ɴn�$@{/�qQE�@|0Y#�Ib@}4�ͪu�@~=�mh�&@Jfc�m�@�-�� 
�@���I���@�D8�T��@��z���        ?O�h��^?x�ȕn+v?�%T݋Z1?�A[f��??�f���?�Jk��Ce?�1x;�Et?�/n����?՘�H��?�����?�u��j�?�k��ʇ?��$䫭2?�3�ѓ?����??�ǲ�4d1?�ץ�+�u?� F���?���"f6@.����n@)��%@@�/��@u<m�{@	�2í�@6����@�i��7@��D�z@�k��@���I�@�(h�@��.Ы_@@���u@��@@�\��|1@z��e{@U���fU@ �Ae��@!���x�@"��Cr�@#�����@$�{e��@%�G���@&�J�ȚO@(!z_�~�@)P�S��P@*�:`}J+@+ĺ
b��@-	H=�n@.T�*>@/����@0��is�@11V���X@1���It@2��D#H@3Y���@4�w�@4ݱ�5��@5�~��B�@6q*e��@7@��f&�@8�]>@8�B@g�@9��Te�:        ?(��t;��?V٬�^��?tc��?�۷��i�?�7�G��?�� ���?�]����r?��>�=?�m���Q:?̎g���q?�R��H}�?�u7�ԼH?�d���u�?��`��?��__�?�y�j/?��GZV�?������?��ep�?�q��h��@CH�cQ@%$��@���T�@o @�y@
 �<_@w�<���@�}ᶢ�@зF�b�@9p�
l@��~E�@��p���@ 8��ˉ5@!�c��T@#d�HI��@%�U�0�@&�1J	Q@(���@*�9�Z@,�%���$@/(��8��@0��&��@1�<��G�@32A�W�R@4���x�@5�r��4@7J�v��U@8���#F<@:L�Lz@;�[��C@=������@?=+8�v@@�.�L9�@AiUTb,z@BZ�8��@CR�M��@DR��V~d@EZ��s@Fj;V�A@G���"��@H�&��]�@I�r���@J��q�!@L.܁ar�        ?GuS���9?q��ݴ�?��a�K?���6y�?��V1G�?��{J8�?���J)+?˜ *Ӥ?�tF\�E?ف1mk�?�����p?�;�ވm?�;�_Qj�?�,] s}?�t��#?�?Ϟi'3?�|E�S��@ ˲g�@�j�Q�9@�ma�|I@�(SM�1@��k@��/�D@�>;��q@�f{-�@-�/�ǌ@�I���@,�,���@�4I��@ hDT�#�@!�%�1��@#�ᶿ�)@%D��B�@'����8@(�R��(�@*�L���@,����ޮ@/*"�?��@0���8�@1䮷k8�@3v� *2@4g#
�;@5��B���@7�PBU�@8�L�3��@:
P�-�@;�O���@=-���;@>Գ���@@D�~�I@A&ͭ	^@B
�PQ�@C ś�w�@C��\@D����@F ��?@Go�
s5@H'�;�M!@IF�:��@Jm�J��@K��񌫂@L�0u�@N����&        ?�[Tm�)?�� O�?����5	�?���-4?�k׵��?��	<��v@ �i�GF@��Wц�@��b�|1@YE�I�@�{����@Ca��^@"�t	Nq@&P�h�K@*0�>�@.<S�0��@1U���9L@3�z��f@6>=8ro@8���@;�,E��z@>���Μ@@����%@B�6����@Dlij3@�@FB�,���@H.V}Y1�@J/:o:�i@LE���_@Nq3���@PY0�[^�@Q���,�@R��ň�*@S�b�mz$@UF���F@V���8�@W�Ŵ���@Yi�;�@Z��A@\_ a�!@]齗���@_~��YRg@`��w5 @ac���:@b=k,�ާ@c?��_e@d B���@d��t�@e��eq�@f�Э��J@g��5O�@h�
dO @i����Ħ@jɟ,��@k�%+�l@l�A���@n��@o!+�.�@p"nF���@p��L��F@qN3{��@q����@r��	Uώ        ?St�_�?~9W>��?��l�B?�n���e?�����$?��
�D�?�	���'?�v���j<?�؟ƙ
d?��l���m?�! W�?�Q�9�y`?�fG}�zE?��f�N)�?�� ��?�A1Y��l?��3�5�?�@Pw�@��)��@�'�(�@�uT	�@t�le@
�ڣuL�@�P]�}�@#C���@��MA�v@5V�X�@��`R�@9 ���@����@�����@s����@Q�ڎa@An�K;�@ �����@!���F�3@"��G,�@#�69�@$��CY��@&#��r��@'X-1X�@(���ߣ@)ې�j�@+*F"��@,��K��@-�gAv"@/I���L�@0]>"��@1�%���@1ښr�z2@2��% ,@3h�P�/x@45�mK��@5J=�$@5��K$�Y@6�i�,}@7�$�kb@8u��O�#@9[�UJ�P@:E��b�@;4 ���@<&`���@=�/g�D        ?7�rF��?e���d'?�R�Z�?����2��?���j�;?�E��?�b�x�4�?��q��ح?̈́_�`@|?����S�?�tT��H�?�	����?���?�(U�i�?�P;��f{?�a��?�| �\cm?��8���@ 9a��\@��Вâ@���=N@���|B�@6%��@�C��@�q��s@�64�@]�t�V�@Ѵ6x�@o iW�@6�f�	K@ �@�Ld�@"%E7��@#��}@%���"��@'_y2�R�@)M��M�@+S*��@-r#���y@/�f�{�W@0�)؜��@24$sCݭ@3wP�^@4�����,@6%��$V@7��ь�@9(��
�@:����ݫ@<(CC:SE@=�P<��@?~F)�A@@�wg@1�@A�]���@Bv��d@Clq0��n@DjD���@Eo�n.P�@F|q�å,@G��h/X]@H���®F@IЕO���@J���R@L.��j|z@Mi�M���        ?P1�މ.�?w	w���?��6`���?��pҏ|3?� ��?�qDii�7?�;5��}�?Ϲ@݇]N?ճ;&�:-?ܻ۷ro?∕��?�f��AN?�d���?���Q�?�]CN|3F?�t�D�E??�W���c@�͸�#@U��@:�@e���M�@
��3�m�@`"`��@'ӒT~�@G?��w^@�x_��@�*>*�@����k�@g�� Ci@ /@h�@!�U)��@#k,L�&@%-~��@'�G���@(�z�@+Ψ�@-.���6@/o�D�A@0��"��@2!PأJ@3jf����@4�I��	I@6&��)�@7��ۍ%�@9ٲ�Y�@:���g�@<Fx��&�@=�UQ��z@?���M��@@�� ��@A���?iw@B����r�@C�I�ޗ@D�I�
�@E�İ$b5@F��mh2@G�T�J�@H�z�@JA����@K@�)s�@Lw���R8@M��!]:@N�GK��@P%�L$�        ?�@BAJ9?���#X?�GV���?�jĪ|?� �-�[�@���&@	�vٜ9@��5�'�@_����@סJ/�@"��I,@&��_�G�@+o��v�@/��x:�@2��޾�@5WPtӐ@8Y��0�@;��>�Vp@>�$� <@AI4?%2@C0`��,@E1���@GKsA֗@Ib���~@K��:2�#@N3���H�@PZE���@Q�Q�\@S&C���@TgВر@U�`�G�@W[��W�@X�yDK[@Z�*No�@\,ՠ�@]�_�X%|@_�.jh��@`�R�g`o@a�m�(��@b�j�f��@c�A�R<@d��w�)@e�BQ��@f�JQDb@g���z�@h����8@j����@k@�7���@lr�5�	�@m�����m@n��i�,@p����@p�+t�@qd�{���@r��)@r��a@F|@spZgp��@t%�b�@tܷ�&�,@u�f��N@vU*m��@w�'%�X@w�A�yK�        ?f-	j�U�?�隷[�.?��t� �`?��� 7��?ƤO�9�$?��~k=?��z���?��Ҍv>�?������?�F�F?�Bu_?���+�ZL?�*�r�@ _�#@���@s�oq�@y�Y6�?@��]�V�@ ��r@`��{�c@K�o��@O�����@o4��Y@��^o+@�'VF,@l�Z��@ z�W@!��G�	@#,�4)��@$�ߣ@�y@&wF�A@'��N41�@)2����@*�&+$�u@,���Ơ�@.Cu����@0S �l^@0�I��@1�x�&��@2�A7�@3�+�@�@4����-@5�`�Al@7g�� ]@8#S��@9DA�4��@:l���@;�{qd7�@<�|���@>C��@?MIi�`U@@K
u�@@�'�X�@A��m*H�@BL��D@B��%@��@C�r���@Dj�2Ŷ�@E&�+F�@E��c;H@F��ҞSI@Gl_���@H4�T�<)        ?DZYsb��?q��R>��?����n��?�S ޞ�j?�t�z�?�!R��{�?��`�?�Y���.?Ҿ�q�2w?��@{R?��H���?�.��Ō�?��|��ل?�p���`?�LB[��?���7�p\?���l4��?��)#i�H@8���/@�R��*�@�x ��@	�HW��\@ĩ�Y��@ ��#�@��6^x�@ N*�VZ@#@S�*@isDr@ӺH�� @b�9��@ ��&Z�@!yz<�f@"����Z�@$��#�6@&9n���@'�Ǯn5@)�WV�S�@+����L@-��4�ƾ@/�4J��@0��(�"�@2?��@3Ir'\�3@4�l�EA@5�Q�XX.@7G�@8umo�<W@9�嚽�*@;T���@<�Hp@>fqIk g@@4���<@@ժE?�?@A��ڕ>�@B�D�5?@Cz��҆)@Di��b@E_?@g@F[ʼV�@G_/j��$@Hiwؐ��@Iz�b$�@J��\�e        ?n�T�q�?�b��a��?����x�g?�I�3 y�?�]��_��?��1��?�S¿�?�yQE��5?���[+7?����sb?�g���Fy@r��p6@{
?@	y @{���=�@&[U �L@�	�St@�c}��[@��E��@���m�@ >ZD9�@"!���@$#̿L:Y@&GXH�W@(��w�=�@*�>��4@-E_"w�@0;�E*�@1�W6\@2�a3_S�@4��e�[@62�Q�@R@7�Ek`�.@9�37d�@;��w	@=�qa���@?��E��@@��q���@A��r�6@C&R?�ɻ@DZo��@E�j���	@F�q���,@H>�`��K@I�U��3.@K��ͅ�@L�x5>a�@NK����@O�/�@P�'pQ�@Q�i�r��@Rfvˀ@SMa9��`@T;A'�:@U0+�(�@@V,7mA]=@W/yl�R�@X:��@@YK�S���@ZeTʎ�@[�:i�_�@\��2��@]�؈�T�        ?�Sϰ7��?�G��{�??��� �?���w@�E�@�8���h@�N:Ǌj@#�6���`@)�cIO�2@0t|�z�@4g�pu�S@8�h#���@=����@A`�M�@D.��@G/�Ns7@Je<[4�@M�2j�@P��mj?0@R��+��@T�ӥ���@V��;u�@X�x1�@@[@�w�@]�;��	@`�B��@ad��Aʤ@b��5<@d'����@e��ޯǤ@g=�@h������@jG��t�@k�=�=\�@m��J)<X@od�)��i@p� 讆k@q��k��@ry.���@@sr�r�o�@tr2�[SD@uw�8u�@v��ڮ	�@w��̓�@x�c�XT@y��9�J@z�f�mgg@|s���@}L�[-�@~���|�n@�&*�A@��9��:�@�&�b��@�λhv�T@�y���@�'w��@��fR�ܺ@��_ o�6@�C_�d�@��g�
@��sQ�a@�z�Xf�L@�=��O        ?R���!~?!�F�A?�������?�	/�T?���pb�?ú2s�a*?���� ?�0�on�?��lP�]?�8_U�/�?刓,��?�["|Ia?��㟕�?�ǉÑ?��+�|�?�q�Ӗ�?�/�H/�@ �!�T�@���G"@�z֗�@{��	��@
��@̄�m
�@�XX"@[t�,|@�KT
\@��.p��@^XN��@1���|@��eyz@��KN@&w�,��@ %륦
_@!C�L�@"j�I�
�@#����{@$�g�=,@& ���@'r��pxc@(�v�@�J@*6��O�,@+�W����@-&�E�;�@.�ݞ�YT@0!dN1@0�^��Q�@1�J"K8^@2����Â@3�N�7?�@4f�E)ä@5R��L�@6D��^S�@7<f;�y*@8:<��'@9>��@:G܎�E@;W����@<m{��o~@=�Q8���@>�04G"�@?�J�U�@@����)�@A�ϡ�        ?G����?ui�6�(�?��''\h�?�gr8�?�홈��1?��$�-�?�"*���?�n�~|��?���IG,?�Ӣ.W{?��s��6?Ꞥ>)�?���ʆ?�ftz@��?��wi�R�?��
��@��D�@�t��p�@�e>'�@�ԊZ{@����@ ��p��@b;I��@�LC�d�@�l�Nk�@���@ڟ�酙@!�R���(@#hGF��@%N�}N�`@'P�;���@)o���H$@+�m�Xk{@.�ow7A@0=�$��H@1��MS��@2�'�e��@4Mb�٠*@5Ǹ�x@7Ro�s��@8��l�!�@:�t��@<W���@>&�jV�@@�!�B@@�� �T�@A�h�V�@C_#�@D !U�@E>�<�51@Ff�C˔H@G�c�
�@H��SU2@J%}qF@KhX��M@L���̈�@N$�F�%u@O�H���@P�̉�;�@QE�G�'@R�V�@R��e��@S�Lui3=        ??^�_H�?i���1�/?�ﺻ��+?�S�mݭ?�SxK+��?��8�u/�?���$Qe?���|y�?�	0�**.?��#IJ2?ܻ1��X?⃠wX?�dW$2ʳ?��11;�?��^{sF?�|Y{�?������?�W�>+�@�+@hI�@��'Jb�@�%s���@G��-@ � �@�TlCr<@�1[�0@-��p�@�^��;�@|h�9��@kp�a�@ �����@"n��4^�@$1��к@&��&��@(��Jc@* [ң@,EYH��9@.�G!PF�@0y�&,�@1��hC@3�(�@4fA	k*b@5����@7L�(�I|@8�/�o'�@:n���J�@<@�+��@=� � @?�i�g�@@��1�!@A�`���"@B�	��c+@C��P��9@D�T:�[@E�=�̠@F��4C�b@H 
Q�U�@I+\EfO@J^�`�@�@K���mn�@L�?�A4X@N,̿��@O�@���t@Po��6�        ?�����8?���j�q�?����ә?�CJ��:�?�n�/t@��6l�@
�3@-B@��R\H@���U@�M��_@#Rjfמ@'�(�3@,u}�@0�bе�@3�p��j@6�qU�d@:8%��}@=�Wϓ�D@@�m��@B�>�@E�|]@Gh;"�@I���J̢@Lo|=�n@O&mQ�N:@P���4@R~	�FZ�@T��QL�@U��zfD@Wa�H�@Y&G��@Z���
jX@\���ʨ@^�P�a4@`v�"v?9@a�tŴ�@b�u��@c�ǉ�Ҧ@d�xG-_�@f"����@ga1J�S@h�U�×`@i�3ɶ�@kV�,x��@l���F��@n*�����@o��b]� @p�4�@�n@qY�R|0�@r%2*�@r�ч�*�@sː���'@t�v�f<@u��0LO�@vkĕu�@wV3muK@xE�"��h@y:����@z4��nC�@{3�?ܷ�@|8p��4�@}B3��G6@~QBA��"        ?N}�FP�?x��1BU?�˧�L�?�/}��g?�Z����?�u���?�mG�#�?�˘���?־��p�?�M��q�?�]���I]?慒@?��;�Ï?�J�§?����N?��Q^7��?�}�y
�?�u&�)��@ ��㻓@��+�a@���'�@J�����@�lR9x�@z�]0@��[�T@$��4��@�Uo�8�@���N�@���T@"��)tP@�b�^�@��hL?8@K�|<�@$%Z��J@Âm��@ ��E&��@!�`Г?'@"�/݈�@#��YS�@$�P{L@%��!�t�@' �;��u@(W��F�@)��� ��@*�Α�+@,-��O�@-�h��s@.�#�@0&pO#�@0��q�Ȧ@1���ȸ@2YO��e@3�腁@3�l��@@4���@5$q
�@6Ra6��|@7)���-@8Ԑhh�@8�+��U�@9Ǫ�4��@:�[w-5�@;�C�^!�        ??�)��@?n�3�2jv?�&�ȁ?��V��?�Г��>�?�TL3�?ÿ^#r�?��n�C?�E�����?�dj2�?���xU?�(1 �?�V��<?���8��?��$�RS?�b�8=,�?�p���@��*��r@��JA��@	+�]@�_�m�@�OZ�yf@߻�X�q@ZA�� �@�8���@�	<��@���xk@ ��B5w@"u h�@$Zb�Ư�@&^kc�
@(����Р@*ų�x�@-*T9[�k@/�{OӬ�@1,c�i(k@2��n��@4	��;@5�;	P�;@7-��(�R@8�r�zt@:��ae
@<o��z�@>V�)i@@(��9�@A/�n�:@B@�y���@C\0��@D��(���@E�����s@F��� 8@H0�Fj�@I��J7�@J�ђqE[@L?�R@M�˄�@O+$���@PX�5��@Q!y�y�@Q����@@R�5����@S�K��cq@T~E��-�        ?E��6��?o��*#�?�&��D�$?��L͙�?�ݓ r
?�`��ρ�?�)��NBR?���G1�;?�'��?3h?����?��71L��?��y�.�?�ָL�?���U��}?�6 #�?���x?����m�+?�����p@ �<{�v@Z�_��.@"E�<6G@	&H��֭@h���H�@���<��@�l�� ;@�����@ �=)S@I���(�@���A@Hm,��@�:��xE@!m�I"3@"撚��W@$��[C@&.��d�@'�=���@)�ֲ��@+�Y�@l@-��)o�@/��v�I@0�[Ѧ@2�E� @3.���C@4a���@5�RiE��@6��WW_�@8;���[�@9�p}�/@;N�@<yR��X@=���_��@?���p��@@���^I�@A^��Q@B5����@C4��Z@C���i��@D��� @E��h!�@F�B���@G�!��+@H��X�=@I�^R(W        ?�&^���?�<�4`�m?ѳ���w?�ҾD*�?�*�g�R�?�U�.��C@����'\@L���m@-��R@�'��}@ @CU�Z@#�Q#e�S@'�'ܴ�@,^��`�@0��i/�@34��
��@6D���@9z��#@<?J@���@?��E�@A��7�(�@C����Q8@E����k@G���� �@I����A�@LQ�W<@Nũ�)�@P��5�A�@R Z��]�@Sc��m�@T�[�n�'@VT��=F@W�4��ٹ@Y}�.
�@['$X���@\ީ$]4�@^�3��@`;�6��@a,�oy/�@b$d>�j�@c#9f�@d(�� �U@e5e�,�@fH�#i@gc^EL�r@h���O�h@i��fC��@j��Y�@l��O�@mM�:pen@n��a~6@o��,�8s@p�����@qA":��@q����@r�����@sWO>�r@t�"��@t�M��l@u���^��@vN��y�@wI�,�X@w�r��wI        ?O%���y'?z��tq?��� �=�?�����f�?�Ň����?��8��b+?����v?��
�(_?֥9'aO?� D�Y��?�<���S?�Y�ڛlW?�����4?��%/�?�q�t��?��ű}�?��^�଄?�8�1�To?�ݮPO��@�b��
�@�EMRP@���Ez@h�ϴ��@
����W@ah�h�
@t��E@odz�@���.#@rd&�@]�R�@��"	�%@}�����@QBxJ\)@7�Ĕ?@1��ی@ �ŝ��@!���۲�@"�Kp�w@#�4ԕ@%	��@&P]��#@'��W�O�@(�r�%�[@*3ex|�@+���<�@,�}��c@.s�d��@/���ʚ@0���<��@1�{
�<@2YK�� @3.m���@4����@4諘�l@5��w���@6�9v�Vl@7��ڕ:@8�k��@9�{���\@:�0��@;�21?�H@<�|�}��@=���+f        ?>8KI�	?k;	A\	?�d�r)�k?���yM?��$��}U?��^�N:�?�T���&�?���Q$9~?��4���?�̱�*�?����?�K��<�?�Q!�3?� b�A�?�cz�n[?�)��`?�g�ާ,�?�%�� @5y>q@k|j�@O;.�Բ@ͱ����@��/U@ް/0��@y�.��@�ꂗ;�@�����@��Kݜ�@�5�ò@! qb
�@"�@����@$x��<��@&]#���@(]m��6@*z�^��@,�V-�@/
U1f/f@0��,b��@2	]��m@3b���@4ʥ���@6C/�.��@7��C��@9d����@;�y��_@<�,]�P�@>�͡O=@@8���@A0!df9@B0E�n{@C9k+]��@DK�$~Ѿ@Eg&����@F��{�I@G�'h*G@H���b�q@J35��<@K~<.�p@L�?@N1��N��@O�emѥ�@P���1�7@QD��^�        ?+(l��?W5�r��?sŪ  C%?��X�4?������R?�$�ȝ?��2�C?���Qu?°F#էp?��%ʄ��?�q�S��
?�ڜ���?�H�<e�1?�iF .P?��g���?���s�?� ��ӽ?��(o��=?�w���&?�j��,?�����\@F��S I@��Ģ?@���ᶞ@
�3��@��O�8@�2!���@�l)��@�q�9�@�lR֪@I1Ǹ\�@���{��@X�A�'@ �p�jI/@!���L�@#��d��G@%!GN���@&�Q	g�D@(��1��f@*l��a@,ZmGȤ@.]۟�@0;�6z�@1SOM
[@2vB��{@3���k3�@4�a�̗ @6#�o��@7u�If�@8��Δ?@:;Ŵq�@;�H�%�w@=1�]Hf�@>�^M�o@@,��I9@A �C�@A���b)@B���!�@C�ku�@D�y�`5�@E���@F{c�n@G|^x҃        ?�=�Z4�?�+��8?�w��SD?���A�?�Y��=m�?�!}֤��@;X�yN@
��%�K"@��y/j�@��vh�'@���N�@!y�-�(]@%F4�p@(�@��y@-/
��@0�N9N}@3a�(�\@6��F�@8�қ @;�k��@?)�އ�f@AJ.�u�@C-�+�%@D�\����@G 7���f@IC_/+�@KQQp�@M�(K��@P�h��%@QLBSO�@R�Z��g�@T�I��@Uql�E �@V�m1�@X~���@@Z�J��@[�W{X��@]�ފ\�@_N�9���@`��xخ�@a�x�gE@b�Llq�@c��zh@d�գ�7@e�����w@fɗ�Ƥ�@g�}8��@i����@jQR�.��@k�����X@l��NbLq@n"�ʹ��@oy8h��@pk�1�@qS���@q��^m4@r������@sRs�l@tr1�s�@tޔ@ʰ@u�ظ'A�@v{>���9@wO�]G'�        ?>)~.�l�?i���8��?�
a�rw?���^?�a�:�,�?�Z� ��)?��f�y�b?�}�Ա|*?�H>�!�}?���5�]?ՠ,I~��?ڼ�~��8?�8s��Q=?�`3�8݇?��fJ�?Ꞝjk]?�`V��?���%9?��C�T�'?������I?�9fƢeg?���r�N?�0�d�6�@8t8�d@�n]Y0@�m9��@@��g(�@�[?] �@
����0@�&'Bn@0��@�ɋ?M@�o�v�@O<4�hf@���I,@���J�@y�nS�@�@��=@��
\��@+G_@�ۇm@n�UI�@ �B9�;@!}qExPY@"jv"��@#^'���@$X�Y|��@%Y|�Is@&a��Y@'o-��@(����@)�ə���@*� ���U@+��$�@-r��c;@.I==s(R@/��~�C1@0aN����@1}�@b@1��dqd@2R?����@2����@3��R��        ?1]=J(��?_�8���?{X(�y�3?�n\�dE�?�09q�a�?�"aNA5�?�n��!��?��$�p�?��I�klE?ЁuI�#�?�9�X��?ܧ�D��?�?.�R��?��K+ŕ"?����}?���O�?�p&jm��?�=�?ʕ�?�xj�G).@ ��{��@$T:�'�@�;Y9�]@	_���@P�V��	@��l��@�
�+�G@��'m<@Ѣ�?@v�q��@�b��@��mZ�@ 2�S�@!������@#9����@$�HP���@&��(��\@(`W���0@*BN$�AV@,9��Ȃ:@.G1���@05B�1j�@1R����@2y��E�@3���w�@4�P�t@65�S7��@7���!@8�n�Z@:X�&�F@;������@=U�Dn@>� �W�>@@@iK9@AL�kd�@A�3���l@B�'A54�@C�0�5�@D�Y:;U�@E�����@F�(��;o@G��[>�@H�ϻK{@I���#        ?1��)2�?^K6���?y≒Tޙ?�f���?�G^W�qf?�xa�F]�?�T�FP�?�����j�?�'���?ЦЎ��m?�[�ڗ}�?�B�H�D�?�j�B:5?��֤�?�#ԉ=e"?��VΒ�$?�k�P��?����{iV?�kl�g�@���U��@p�|�@��-�4F@
���_@�����@O,k�e@wI���f@����E�@E6LT��@�|M�@�D�VD@ ar~-�p@!�]�:�b@#��@��@%p�f/�@'O��Q�u@)G�}:�@+Y?��~@-�ojdC�@/�l��@1��Xp�@2N�q�`�@3��-m��@4�b��@6R����@7�Oz�
@9C��Mp�@:��,��@<l0�+@>:��I@?̌I%�6@@��9R@A�	1<y\@B�?t���@C��oM��@D�����@E���0p@F����R@Gȭ�8w6@H�^H)tx@J��t�>@K8w�V] @Ll�e�@M�vy�G        ?yp ��?��a�̔?�t!�=+?��SC#)?�]�ɾi?���<�Q??�o[�o�?��Cd�8@5����@�9h�@X���_@d9���@�{� @�P�5;&@"&� mۅ@%�`�@(Qㅻ�@+���B@/yb�6�@1�j�M�@3�<�b@6#yg@8n��=@:�H�@=��!lb@@,r���@A��'� @C'07��@D�7��B@Fi0Rjo%@H%:�@�@I�t���@K� Ӧn�@M������@ǑC���@P�b� �G@R�V�kZ@S&̧���@TO-w��@U�
���{@V�j(3j�@XN����@YO�:9�>@Z��$��h@\	�!	g@]s��˟@^�P-N�^@`3 ��n2@`�~���{@a����F6@b�:�rĖ@c\Y�	�@d1�`+
�@e��i@e��ق��@f�,��C(@g��&�"@h��b��@i�R.��@j}� >�@ks��'X�@ln��AU@ml;yY�