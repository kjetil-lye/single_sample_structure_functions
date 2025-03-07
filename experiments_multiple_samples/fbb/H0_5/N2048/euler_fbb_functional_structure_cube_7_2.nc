CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T102932        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�`�E
5'@�Z��@0؆�9@0a���s@<�@���@F���=�@P=>8z�_@V �6@@\�+"5�@bY\	d�]@f�Z�J�n@k� �ƥ�@pi63�!�@sMEt�E@vn�(@y�B�n�@}h4�1�R@��㨤g�@��nS4[@��%�u�z@�x����@�r�Ȑ,@���`��@��	�N,@��K�U��@��v��@�q*?�$�@��Ӗ�~@�x��s�@���\�(@���([�U@�Y+�Wj@�.�o��@��۹C�L@�M�E�@�8O��M�@�(3s��@�!w��l@��`��@����Y@��PoQ@�"�����@�0u�uK�@�B�N��@�Z?9"y�@�v�L�@��s�d�@��9>��@��]�&.@���!q@���?M�@�=	�&�u@��r ]d=@�z#�OA@�&X��@��~�	#@�g-R���@�0���W@���UN �@�i*Q�{@�#@��p@��}̌ʂ@��O�^r�        ?�G%�u?���«<?���u��7?���6�?�Sy��1@����s�@	c,牚$@����C @��O��@?�ꃓ@ n���EE@#�!Kyt�@'*�"�N�@*�FiʧQ@/���#D@1�SS"��@4x�X�o@6�ږ��@9T�b�@;��Gu�@>���|�@@�~�/�@BY�m��V@C��Xׁx@E��ut�s@Gq��X=1@IP2Y�@KH�a�0�@M^�w�@O�@{]@P�_J�s�@R8�̐�@S��*���@T��=��@V�u�;��@X+�����@Y�R�?��@[�ی�2@]�ʨ=�}@_�����@a�r���@bX�0���@c�u���@e톅q�@f��e��M@h"[���@i�mŞt@k��,�y@m������@o�)m��
@p�;Z�@r¦H�@sU�$4@t�S���@v��.��@w��^�s�@y*���@z�lś�@|�T��%@~�؟r�@�Jխw�@�[o�~\@�{��L�        ?�uTj�m?�_=�\?�T�[�%�?���3f�@ M�K.�g@
P=�]0�@xӴ2�s@qSJ��@"x�1r�@'=��&٤@-0��n@1��t��@5̔ j�@:����@>�D�Ԓ@B,=�-@D�M�2@HK���@K��(�B@OO��?�?@Q�iV%@S�p̀�@V3�_2Q�@X��譳�@[j���.�@^N�<�@`�~���@b[�z�'�@d!�8v @f�Pk��@hv}�}@j2�rs�@@l}��mŐ@n����/@p�N����@r!��N�f@s�4V@u�+���@v�L�P|�@xnA���@z5�b�D@|�F@~w���@�`y�E@���@�*<��%@�Kޥ
M�@�w�~[/�@���q��@���V�M@�:���@���"Hz@�����H�@�fw���@��ی�@�q��
@��8�N8�@�]�ڃ��@�<�ur�@�%<���@���@?0@��n�2�@�va���        @lJ�_O�@�
�I��"@�7�<}2@Ġ��]&@�
��\n�@���]Tu@��_���i@��r;zLK@�\3����@�ς�#�@���?���A &��A
-f��A;JQ=JFA	�]��a�APi�!�A���f�A���I_�A�J����A���nAg��L|�A�s�S
Ab:�$��A ��ڪA!�r�Z�A#>��S�SA$�'��A&#����fA'�P(2�A)-����A*�;cw$�A,Y7��XJA-�N��6A/�S�W��A0�����(A1�7޹5oA2h�,��FA3LeL��OA43���A5?	/�A6rF��A6���1\A7�����A8���ߋdA9���MA:�}-�Q�A;�6>3�A<��/5dA=����A>�.�V�nA?��I��AA@���7�AA���AA��J�O9AB%OI=�eAB��R�`ACCs�r�~AC�#��ADh�F��AD��6W��AE�����}AF-d�AF��?q        ?D��L�?�nQ ��u?�&���U0?��l��x?�H=b��?�����?�"��nP�?��6a��??����#>?���2A��?��*���2@o�429@43mO�@Ctf)
@�v���y@�G�B�@��,Ь�@ 2�Q�@���x�@�s�!�@��{M<@!nm#~p�@#X����@$�2U�c$@&�B���@(��"��P@*��E%�T@,�b���@.�O ���@0�v6�$@1�f���n@2�Fϣ�_@4.eVo��@5c� @6ܦ*K[z@8Gz{}�@9��8�qv@;F�X��C@<ۯ��K�@>�?��@@���1z@@�[!�5�@A�Ⳑ�o@B�=+f��@C�J��j@D��r�o@E���Q~�@F�L��\�@G��Y��z@I|%�f�@J@,t��@Kk���@L�ѿ'�@M�����@O�sG:@P1��#]@P�a(j,i@Q�{Y�@R7���:z@R�L��~�@S�M}!t@Tf!�!�@U)�˦��        ?,o�����?r@^���^?����ta?��uo�p?���K�?�\�Ȩ�?��%(�?��j&�?��!rX�;?皳���?�ʊI�P?�9/��=?�Qsi%<�?���g�?�w�e��?���\[�@�︞y@��
�4�@��9�H%@
�6��Q@\���.@9���@�_�&8U@&��I�@G����@��o�@ -	��q�@"^8���@$�V�67t@'��5���@*᤺��@.z�j+�@1@�:�6�@3�q�LV&@6 �yf@8�
���@;Њ����@?*0M���@Aj����@Clt�>@E���%�-@G�T��(�@J�3KBT�@Md��&%�@P8T1܀�@Q�k\�<�@S���U��@U��5�X@W�(�'�<@Y�vٗ�@\C��gV@^Ӿl�@`ȹ�h<%@b?M�K�I@c�{i`+W@ew"| ɛ@g:#	(�@i`�<@k�M�%@m*6Z�s�@o_��_��@p�jWj@rtVF        ?~�~n�?G��͗S?k2ԝ��?��hKn�?����,?�g��{�?�ͺ4�ng?��&`� @?��*c�?����L*�?�P�._u?м#F^[�?���v�+?�d����?�D �?�SVV�i?�j	�>�?�<�|?�=g�bx�?��ϰC��@���S@�|�@
`���<�@ؕd�w�@���s@���V@�EB�k@��6*��@"��2��@%މ��a�@)h�����@-ao�9@0�q��`�@3_���8@6%7�}@9�v#<�@<n��	��@@�<É@Bp**~�@D+�W��@F�;m�vE@I6�v�@K��3&�@N����@P�:jp��@R��?��@Tv�A�i@Vfc��@XvP��?@Z�-Q�@\��q�L@_o�'��@a�U�@bbR�|�b@c�F���@eW!I� �@f�Hn�q`@h�!�v@jX~�_@l+�����@nӋ)s%@p����^@qi��1�        ?�DĽRb@�z��(q@4���*@MG���g@]� b���@io���@s2U0ǰ@z�b��@���UC�@�}�1�һ@���"�@�����@��L�@�װ�T@�0�!��@�����@��P8sp�@���,e��@��eC��Y@��*��@��G_L]@�.9'U{j@��Q�"�=@�
C��:�@�Y,S��,@��y����@�"I(�M=@���M&I@�&�v6�@������<@�j�a�a@�&3��@���%R�@��uۜt@��Ç��@��M�%9@���W��@��{f���@�ޔ��@�@����@�q+���A@ȫ�݅��@��לC@�@n���@̙�.�-�@��g��#�@�j�M�@m@�q
x��@�1}�@���w��@��_�&�@Ӑ.�D��@�d\�E�@�=�O��j@���O@����{��@���p��@��"=�/�@��nB_�a@������@��iC�k@�͢z���@�ۯ��?        ?��J_R`?��P���?��-Sm?�Dͽ'�R@��A@�M�ҿ@�m
o�@#�����A@)��#�Y�@0Ic��:@4#4���R@8k7����@=&�#@A-+|��@D��yba@G*��v�@J��O��@NX�@BU@Q7�+�B@So�$��@U�QH�_Q@Xh�?��5@[*�J@^��)��@`��DP��@b<���p@c�BOTn@e��1m(@@g�q[�I;@i�Mٱ�@k�����@m���%�@o�5U�M@qoV���@rQ܉\�@s�'2қ�@tڸ3X�@v2YP�@w��*n�F@y��V
@z�$5z=@|��M�@}�a�P�@c@�Ǥ�@���Qf@�u�R��@�c9�&�@�WV�1�F@�R?=�&h@�S4��4a@�Y�]}9�@�d�(a�@�td�gfN@����Y=@�����G�@��Ӱ{��@��R1��@��)R�P�@�}z��T@�!�/(5 @���o`^@�O����#@��D=         ?h��l\�?�J�_ƗG?�=q�f��?������?�^.���@ ǉz�@�8�g=x@�Z�>�@��]�@�]; `h@!`/)%�@%�
D.�@)3���@-�
�9��@18���4�@3�t��@6��rm{@9}ۏ(
�@<�-z ~@?�#/��@A����MB@C�� "�@E�\p#o�@G�=K���@I����:@L)�d-�@N�fH�&@P�&��?m@R�^x�@S����/@U#�Yd�C@V����B@X���2��@Z�v̫�@\ѣ���@_èe��@`��;���@bB��&�@caGnZH�@d�)^W��@fSXV��X@g�X��(@i�����@k\!���V@m65��+^@o'�_D��@p����Z@q�S-rT@r���<��@s�7P��@u/��%4�@vx�e���@wв�D�@y8��@z��M{@|5�߲#�@}�2J�c@r�H�z@�����3Z@�w��0�@�cG>J|�@�V��Pf@�Q�k>�        ?��s(b@?�)E���?�+��_(_@I�d��@�Py� T@'0�Sa �@/���z/<@4�C�,@9�"4@:3@>�Ql}�P@B00?�@E&��@@G�l�@K78|�%@N=^�6@PմqQ�@R�^�WM@T�/�t@Vͻ�6-�@Y![p���@[��qGE@^_���3@`�`�d��@b6�{�@cݙU�@e����P�@gn��v�o@iW����@kU_W �&@mi'�#�N@o����r@p�H��,O@r��	�*@sS�C^�0@t�i0�@u�8�vJ@wZB�$��@x҄t|�{@z]d�(`�@{�E�`
@}���_r@{[�d@@���T�@�����f@��ۇnJ�@�В譤�@��È�z@�.=�~�A@�t��i��@�̲��ƪ@�6��*�@�����0�@�D��r��@��(lH�@�Rb����@�:Q\��4@�,�An��@�)臺7-@�1N|��&@�B�R��t@�^�s�[@��HcVh@��K6�        @=�X��/@@y0㛬��@�{�W�6�@��Gz���@�%
����@�g�����@ʹo��@�q�)��@�yg�\�k@��r�<(@��]�(@�)䁛�l@�u{�@�iǟ"�@�BB��=@���N@��t(=�@���"�@���M�!@��:�j�A ��-u�AA�hi'M�A������A��1&�A	QF�XƂA�ҳ3�lAY_=�A�܏%ǏA�}�k�ATnx/AΌa�x�AVCQ&�OA��R~�qA��o.'A1�&���A�0|��A�3C0�#A 1&�DA!��q`FA"�G��A"�s9rD�A#�8NZA%��!�mA&��:EA'1s���A(U�kPA)�f_,n�A*�����vA+��r3�A-<*sA�BA.���M}A/��,�
A0�,��A1;k�u�A1�]�e�5A2���:UA3;B�[2�A3疅��	A4�L���A5D���A!A5��/l�A6�"��v�A7b����        ?h�^G�q?������\?���W��?�E/��?�D��H�?��}؎�`@��<<@���QO@�6���@<���k@!=����@%Ra����@)��/���@.Лd���@2{nyG�@4�Yg��3@8B�R�N@;f؁ȑ�@>��X�@AM��9�@C@Sd#RJ@EKnj�6@Gnf��gD@I��Z4p@K�1s�@Nb.�ZXR@Ppl]�+@Q��`o�@S�sdm�@Tq��?�@U�k#f�@WTL (@X�>�&�@Z`�$���@[�ىǴ�@]���[8�@_@���|@`ze'm��@aY	)�@b<]=�I�@c$(�Q@dU�O�*@e �S�>�@e����h@f�Mg0�@g몔y�@h���h�@i�iYI	@j�ܳW6@l	6Td 7@mO��L@n.�:���@oG'�͠@p1?���B@p��ȯ�@qQ`e;��@q�L
�P@rw��7@sۓ}ɑ@s�za��@t;`+���@t�z�F�@un�iPQ�        ?K +��?�A�ق��?�1���@o?�]����?ؾ����3?�;�s�`?��#�%�?�Y�ĳ�?���A�2I@ �L��@�@���U@	O+F�J�@V��r�@@�ɞ��@0�����@��HX�@�����@ �Yu�@#c�<B�@&_9�dnY@)��Y<�@-���]��@0�����e@3N�'��T@5��b/@8����@<:����@?��y�D@A����@Dw���@F���	�?@I B��x�@K�;�w�@O���^@Q;�i�B@S#זQ@U
��� �@W-@VQL@Yx�*r��@[�QL@^�́���@`�}S�!�@b+T�!��@c�����@ei<��@g+
���Z@i>q��@j�dxӷd@m"��@o,�n�n@p�����@q�B/*�@s!�y�[@tk�8q�@u�3ˊ�@w*���@x�Y���@z#��.Mp@{�%���,@}W�Ď��@R½�Y@�d[���@�L��        ?3����-i?pA����`?�n���?�/
��	�?���d)J?� o(\#�?�wJ١�?���$?ҏ��op�?����?�~�	5�?��S�(�?��
kv?멒5���?���=�s?��I��ݐ?���g���?�����@ u��
�@H��'�@~\f톇@
 �����@8��^�@h#�x��@�)n�}@��S�&4@���g�@n��(�@ ����2�@"�����3@$��^��@'x'q65@*-ly���@- ���5@0*gW\%�@1�����@3�h�m��@5֐@Zm@8���w8@:l3?hlw@<��!�&@?�w*u�@AP�[��@B�ň�O�@D�����X@FE��"��@H {|�m�@J*'�G�@L'�c��@NV�����@PQ��E�@Q�a|[��@R���G�@T"�H��@U�)e�,c@W _>��@X��*��R@Z"@TC�%@[�KuL�@]���f@_X| ��N@`��E��g@a�{�N�        ?�c����'@7>�Ď�@Z&S˪�c@p�Q�yX@��L���@�`7�+�@�l�˺�@��x|�T@����y�a@�n$����@��`J�a%@��PT�du@�mO<h�=@�x���K@��fT@���U�@�."P��@��&.H�@Ƀa��>@�b_�V~@�cC�`�@�B��KJ�@��yB�'@ԓ�����@�S��C�@�"�F��@� P�Ѻ�@����a@��t�8y@��#��@��2R-�@�JҽZ�@�3�� K�@�UYF�-@�}�
F�6@�R3�A#@��?�ʻ@�����@�^w/��@��)�@���@�E5$|�@�%�_p@�}D��L@�.����@��ߕv;�@��R��@�S|7!s4@��?��@���SZ��@��)���S@�S�nr�q@�����@��^�Ȃ@��p@Q�@�w��V�@�DO}��@�,(?�@��M}D�@��QV:��@��v���@�\�| �@�2�_3��        ?�zq��?�q�@<ۨ?��]��?��}i�X@�X�mD@�[�@IA�c�@%a �c�@,�窒�(@2��C٦�@7��`+~@=1�H��J@A��� F@D�M���@H~�ңSz@LY�D@P<��q8�@Roz����@T��]���@W<�ب8�@Y֔�c�-@\��ڴ�@_p�WB�[@a8.�d(1@b�͵p�0@djP%�@fε�"@g��f�@�@i�; ��@k���8�R@m�%?
@o�pb�@p�s3�@q�E�X/@@s�;ўZ@t7��P��@un�g�e@v����¬@w���]@yU��@z�kvɛ@|*cK��@}�ĺ�@,�#Ja�@�_G��@�-�F�(@�26�aV@�����@��@���@���V&b�@����7@�x���@�m0�[�@�f{�){�@�d�f��@�h+� c@�p�,��@�~X'%^�@��P�A͙@����6@��d;/	@�uU�P�@�	М��        ?Uo�N�*?���r�?�uB@��#?���Ah�5?��|�j?��W�+?@Hƽ�V�@
׋Ф�i@����S@��(�J@�#�#'s@$� 4�A@(��X�@.`���T@2��KO@5x=\	@9E�'��7@=�bB�d�@A��N@C��9ֺ@F��E_�@I��Z�z�@M?�C��@P�%�U�@R����@T�j^�}@W9�F��@Y��c��@\�Tpx��@_�܂z�`@a~��4G�@c@X(��@e!,c@g"_�|�@iD�Ҭ�O@k���{�@m�N�@p<�TKyK@q���(ȏ@r�sk�+@ty˃�/�@v	�����@w�I���>@ye�)�@{4T���@}���@�I��@���]��@�������@�׊�;�@�ʰ�ϯ@�P����@���̺a@���^�@�y[cRP�@��႕�?@���;~n�@�8���m�@��8ˋ-/@�߸θ5@�Б��@�����@��3ަ        ?OIѨ,}?�H�T2*?�L�D�-�?����?׼�0��?��Hha?�\@#��?����<C�?�s�\ZV6@ζ�A@	{-���@��- @�J��Xe@��u�@\>G�y@ 6X��>�@#W>��g@&X��;@*	�)��j@.4�! B�@1sZ�k}@4��3�@7��=��@:RM�p�@=�K�i��@A&��@CBU���V@E�A�=Y�@HvࠎY�@Kw�c"\C@N���M@Q15nI5@S,�/��@UWWQݧ@W� ��@�@ZI��"@]i[��I@`���>�@a���*E@c�L�1�@ev��O�@g�{dG��@i�Z��@l9��Z��@n�hU�@p�9����@r@�R�Rz@sΏ%= �@ur_j��@w+�*��F@x�A��]�@z�*R�V@|̽���l@~�:�@�o��rO�@�}V���@���Y�k�@�����i�@���H$!#@��Б��P@���3�}@�x?�M{@�=F��b�        @��q�X@L���;�@pB&҂%�@��?>���@�����i@�T��P�@���R��@����1@����@��\�v�@�+�
��@�?;wox@�h��Y&�@�qNd��@ֹ`-D�@�A[�|�@�	�l�j@�
ϵ;|@�0o?�s�@�x�mu��@���sT@�q�W%�?@�#@`+�@��<�h7�@�z
EY�@�
1^��'@��l
oD4@�d�L�@�.y�QB�@���8�@��G0�@� wE�pA ��	npA(�a��[AK!�p�Axt����A����ZA�1��i�AB����A��o�A
�r���As��?̸A�F�=~Ax���!A�	5B*A��Yx\�A��O��A�����JAc��h5AH���h�A3H��	A#GJ{A0@�JA|�Af��A��$f�A �����A0����RAE���A`��Y�fA�"�[A S�	���A ����        ?�8�T�?���>9?�d�W*?�F�M7BT?���'�@\�����@%��O�@����+@��� $r@!�����m@%袄��@*�+�� �@/���,�@2��� I�@5ƽ�]%@9�3���@<�@���@@+^���@B*I�v}�@DG��� @F�x3���@H�4��&@@KN�U^7@Mߚ^�,�@PF�#���@Q���<@S
��O_@T�j��b@V)���`�@W�u�]�Z@Yh/��x�@[�]�C�@\�Rq�t@^���|;l@`?��IHU@a2��M@b+�vZi=@c+w�%��@d1V�G*V@e=y���@fO�N��@gg��n@h��?�\@i�|�x@j������@k�3�M��@m)���м@nZ؟�@o�yB��@p`xd�5@p�d���c@q�j���@r.�\j@r��\��@sc`{�u@s�J�D��@t��"�a�@u5�?
��@u��oU�@vqa3]��@w
��ø@w�G^��/@xUI "p�        ?X
k7�A�?���`wo?��o¶%�?��J*�?�5ͯ��D?�J�v�o?���?��D��(�?�s)"B?�f�^�?�Pxw��?��<y	b�?�h+��'@ �I3Jl@�"�D�@
��Zi�r@���*��@���A� @��w�lB@��[�~@���p,@ �ן�\�@"��&H�@%�8�8D@(���� @,-��&D}@0���D�@2&�H��_@4�2�r�@7;�u.�s@::p��I@=�B�p�@@��޿�W@B��o��@E�D�Џ@G�a���@J^�Ғ�
@M|����r@Pv�Oَ@R[�U��@Tqԑ�"�@V�5~�`*@Y>³fM@[�%��.�@^�䓙v @a���J@@b�Ӿ�l�@d�i�H�~@f��6Eh@i
���*-@kh)s)�b@m��1^�#@pQ�����@q�2�%@sI��@^@t��51k�@v������@xu��J>@za�S�n4@|h���@~���s�@�d��O�M@��:�d        ?���j�?��9��/�?́#��S�?�6ȭ�	?�R���u+?��~�s�@�c��]�@�@5C�@���|@\���v@|�7���@ ���¨@#�@�M@&�i<�C@*@Z/>~@-�) ��@0��!@3
K�zq�@5B)�"5'@7� p��\@:�a'@<�}�<~@?u�����@A.�h�s�@B�m�0�@DT,�9m@Fr��[�@G��5R�@I������@K�A>Y7@Mȭi��@O�t+�Ղ@Q&��\�b@R_0C�Xv@S�g�7n�@U ���@Vi��`Q@W�E_Ċ�@Yp���Xk@[L	q�r@\���+@^��r��@`/¡mN�@a'���@b+ϭAz@c;5K{خ@dXܞ���@e�46'��@f��\�>U@h]L���@isTz]C@j��I�~�@l~o���@n)���P@o��i�@p�6CU��@q��+�+A@r�ǿ�e@t�5Vi@uC��?��@v�t�iO@w�N���@y*����        @�úMG@J7���Ę@h-��:�@|�k�2�@��Y�@����\2�@���c/jV@��G4��@�k��r@��y5�c�@�)L�r=@���OIb@���{��y@�XE@�t,Cޯ�@ȎW���@��[gM��@�azE��@эbZ��6@ӄ���t�@Օ��+�@��v�tD�@��Z���@�e�D	��@�������@හ&�V�@�N�� @�l`.J��@����{@�Nߡ,i@�о�>�A@�]�-���@���<�`@�4�QF�@�C�pj�@��$����@��_Մ�(@��\�ޠ~@��%Ŝ@��3}@����B�@��TTy�?@��0���@��aKR�@���af��@��)<��^@��� �-@���i�@���A�&e@���S*�^@���@��YA 3��rA ��ِ�A!��LA���D�A5dV�dA¿XjMAQ*��A�߲x!�Ar����A��)"A�ⷦrA1TYvY        ?x�S��?��G��?�I�9��?�����R?����k@
UA췺c@Q:4��@D�9H��@"��#y�@(K�۝��@.@.bH�@2]���a@5���X�-@9�d2�~@=��[D+@@�]fL�1@CNO��@EO79�=@G���@J4�-u�K@L��s+@O���k[X@Q3-�;2d@R���U�@T<r��E�@U�¸��@W��䗛j@YG5�̜@[N�im�@\��WG�@^���&/�@`v�ݾ�@a�=7Io@b���9��@c���@d�AЧ9t@e�|�GQ@g&��p�U@h`��
�P@i�誩@j�d̽�@lB�<�b�@m� ���<@o��-�=@p:�\��w@p���yU[@q�o���@ry�f�̳@s@�����@t
��ں�@t׆d�~@u���F�@vz����@wQX���@x+��\��@y
�1��@y�uUr�@z�LC-��@{��'tAB@|��1��a@}�5W+W@~��fS@��LL�        ?r��'c�?�HӜ��?ኑ��|�?��#��Ԁ@ �'|�@H����=@!�����@(xd���>@/�5��@4~��:�@8reZZ0@=�w�;+@A���g�@C��x�R@F>��
>@Ir'�6@L���;=�@Ỏ�fz�@Q�ĩ	@Sex��F(@UF�o��@W?�%C�@YR2��@[~Ocg��@]�fo$��@`���@aN�d�JB@b��Z�0�@c�0�Z@eM�T��5@f��l!W@h3Ņ��@i��}��@kF	��@l��wL}@n�<��m@p/���h@p�<���@qՠsA�@r�>D�e@s�����@t���@u��B߇@v���.e�@w�9� 5�@x��	�C�@y��$�X@z������@{���i@}�HK�m@~6�Άߧ@o�"o@�Wj��j@�� q�H�@��@��x@�M.���t@��ޞ�1�@��s;x@�e����@� ּU@�ߖ}MԤ@�����z�@�m=�L        ?dX��ɫ?��Ep'?�܂�<�?�2�0�h?�Jo73?�>l�N�?��FR�Y�?�ټ�o"�@=#��@EE�D��@3M��g@p�#���@1��q@d�-Ȟ�@�N��@"'��:f�@%��cHj@(E����@+Ӷ�+��@/����L@2	-�±]@4i�$P~j@7�r�N@9�
�A.a@=	unJ�-@@<�]�Z�@B.jl��@D(�{:��@Fc ���@H�I�绽@Km�7Ƈ�@ND��#q@P�''��(@RR��7lN@T��)y�@V£�e@XC���0@Z8��k:@\����\�@^������@`�2T�3<@b ��p��@c��o�x@e�)�<�@f����s@h0�9 #�@i�ًY��@k���n�@mjH]Ƈ@oIfg��+@p�l����@q�lIn�@r�c��j�@s��ǳ�@t��.�@u�|w@w����*@x*�/�@yUj(��@z�����@{������@|�]E�R�@~5-|��        @��@�h@U)���^@z�7��kF@���uA��@��̽��@�9i{�1F@�p�[�~M@¨�W{�@�ҕ��@ϣJsΠZ@ӆ�	�)@׃H��g'@���:��@�"�#�#!@���@� �Ҋ6�@��`4�h@�S;l��@�'17'�@���4@�7�'@�)���3�@��Oy%?@��Րj<u@�J:3X��@�w��VE@�h�o��@���̌$i@��D<�~A%�Ύ�ASn��A-Ut#�AIX���QAjjj�!hA����A�7�;��A����A
`��[�AJD�}k�A���[�A��¸��A�AY�|�A!s�k��A�Η��Ak�"OAF3ѸA�a|��RAc�>�i�Ax�qPiA��byA�AXȼ��A�<��A�AJbPAHRtY�A�>z�TA����]A>�t�A�Ƅ6�[A�����AK�6n��A3�(rxA���[A����        ?�	1q�p�?�s�;�+@RM<}�@�&�+�<@"�����@,����@4�-H��@<Tv@BT��2�@G%��@�4@L�v9@Q0}��)�@Td��ѓX@W��g��3@[�V����@_�����@a�ߢA�@d,9�Ř�@f��Y�eh@i$���4@k�]P�]�@n�AC��@p���ҡ@rz�x�F�@t)��@u��5_@w�X���T@y��02��@{�Oz�{@}�+��D@���X�@�DZoH��@���Ep9@���(��m@�=���|.@���B��,@�B��*��@�䱅e�N@��Mkߟ@�l��x~�@�S�iU�S@��߈1I�@��Dl#�@���|�b�@��s���@��E��@�K��~�@��W6d�@���
l� @�.�H'�d@���S�
@��KZB�'@�w��N@��\�
�s@�Ś5@k@��C'<9-@�f��Y��@�?�>V�@���Q��@��b׳�@��S F@�� ~�u�@��p��W        ?c��w�?�.���?B?�AO�'�?�I�q��?���!�?�+�8�?�&���m�@y��^��@>���=�@�/D$�@P佻��@3��ϣ@ T�J�g@@#]����t@&���*|@*h�o�>@.p$Q�;=@1j�x�A�@3μG��@6h#G1.x@9;�s.7@<Nb���@?��Fv�@A��Ş�@C�y]Da@E�5!�9i@H$1�@J�,00@Mvǌr2�@P:�Ra@Q�l��0�@S��%#xn@U{čo@W�"W��@Y�Q�C�<@\�W��'@^��!�h�@`�/�s�	@b4���@cΰ���@e�,�*�J@g\6��z�@iQ�ʃ�@kg�ɄQ�@m�Ή"��@o��-+{�@q<�Yݓp@r�H���@s�>�?�@uoY�_�@v�!����@x�i*�@z[N(dI@|*"�F>�@~qu�d@��+(�$@�H���@�#�[��@�6�awͲ@�Z˖?�h@���I���@��w��se@��
�m�|        ?�\Is��?�����?�����?�V��r��@����{@B���@&���B�@0L.|o�:@5��[T�@<TX�X&�@A����@E�!� �@I�H>ZE@N�Pev:@Q�/�uI@Tұ�D,�@W�E
�[@[Eɂ��p@^�Ў�@angG��@c����@e�i�$��@he��(9�@k m�@n
�cY�y@p��j���@rP�)�@t(մ��@v)���d|@x\27`��@z���]@}�s�F�@�]�͙�@�'�k(��@�-A���@�o"�� T@��%����@��"�*�3@�� �A�@����&�@���]]�b@��[_�=�@��b�a@��v}��d@��j��U�@�<��d�@�����@�/�U���@��BBK��@�HqS�@���Sw�J@���ҥ�@��V�G`@�t~���8@�<__a�@�H��v�@�FHk@� �}a��@�	���y�@�I�;R�@�8�aCt�@�_�L'@��x���        @A��6�b�@v?��Ο�@�ǔڡl�@�d"|#�@�m1�ȉ�@���Ś�@��� ��@ѻ�F���@��c�@�#���m@��8��Y@��KN@�z"��@��O��t@�*:�*w@�L�{��@�=)�C0@�|�^�-@�֞g�@�.���PAG��%�A�d&�A�I��ѫA�EVf�A	�y�M�A_�I�t�A�y�/P�A�.IV�An}���~A�o[�|IAFp�|��A�v
�PAu����A0\����A�zPaA�XK�A����q�A ��ȟ�A!�)�tfA"厱��A$(9�ǽdA%{z�5�iA&��&38A(TZ	�!A)�&T<?A+pc�{��A-i-+A.�	o��A0K��P��A17�nB$A2,�NAA3)���0A4.�E:[A5<NЧ�)A6Q�//e�A7o��4�A8�V���FA9°[�!A:����A<3�MR��A=v��'�?A>�.�Gq9A@	:�	�        ?���%3?��o��T@L9�D@��ȝ�@$hK��@0'P��Y@7_#2���@@�k�Q�@E����@J�4�F�_@Pq���@Sܲ|�T�@W����q@[���bn@_�H��P@b"�8��l@d��_@f�)�E�@i�EvP[@lN�\`�6@o#����@q
��C��@r���7�@t'<���@u�9u�?@w{#�O?@y9�!�X@{s��[h@|�u|\e@~�s]p9j@�[���@�[QS�@�a0H��;@�mE�
)@�~���@@��A���R@��-�(�@��nt[J@��ܪ菈@�)O~>�@�Z���xY@���� jD@��*��@�	��Z��@�&QǞ�@��rđ �@�n(MZS�@�>���@�����H�@�c�~���@���&>�@����/�0@�a�Y:��@�+5�}�@��{��?@�f��P@��p�c@���w��@�tL;�j@�%�G�H�@��>�2=�@���X)�@�@�o��l        ?Q��cɣ�?����f�?�C��?��.T٘?�"�8-c?��=v��?��2dN?@ @��@��֢�@��ȴ�p@�(͠H�@������@���@ ��=r�K@#w���Y�@&��w�cO@*C�!�3@.*]9Km�@17�?���@3��O���@6��i�@8�ʄ�G@;��5@?DSC���@As('�!�@Cn�� <@E�/4�b�@G�S#08e@J��Yb�@ML���@P'�K]7@Q�,�V3@S�"��8@Uh^A�:k@WiT۩8�@Y�P!��F@[�m�/� @^2��2��@`[����@a���Z3+@c��V+@d~���xn@e��t,�@g�(�@@iNxc@j� �kd�@lhΩLe�@n�s��@o��s�@pԎ�J@q���9�@r�����@s�0���@t���@u�L��I�@v��\�>:@w�����%@x�RI8��@y� :�� @{t�ێ@|Q�ɆSz@}��&�<T@~Ӳ	��8        ?�;ƩK�p?����WL?�%��XuG?��fȬ�A@���S��@U��=t�@nbg�h@��n3��@$H�W*�m@)>���*�@.��l���@2=�LDw@5d�0�i�@8�vCl�o@<sЙ���@@3.�P�&@BT(*�j@D�V{�E�@G�a��@I�dS�A^@L�r�@O�伴xV@Qw_��=@S5�|uM`@U�2�ٓ@Wу�X@Y�$��@[Kܴσ@]�����_@`g76`�@aF��@b�px��8@c�'�@��@ek�oϯO@f�r@��@hz���I@j7��@k�`�[W0@m�����@oT���Y�@p��az��@q��T� @r�fQO��@s�D���@t�S�B@u�TX{��@w̞��@xJ!-x�@y��_k� @z���~�@|P�#���@}��� w%@J��٥	@�o��=?@�B�=�B�@�{���@�y_A�
@��f3c�@���CT�@��0ra$c@�����@�1,�@�=߭�v�        @3��W���@n�[�tbQ@�yD<��@�7�H'6�@�����@��RI��@Ò��p��@ʸxH�\u@�ll[=M@��X�'ry@��+�Y4@�+%�W�(@���"�@�,�^�
@�s����@���r�@�CS\\5�@�')�Cd@���\�@�*�ٿ�@@�I��@64@�|.?'�a@�����@��G$�A �6;2�Aul�	3AJ��/�8A��Z�QA�UC�D�AZ��+�$A�o�o6A
<�9���A��>�zMAA7�3s�A�t2\(A4$ZS0�AT���"A���n��A�a�pA� CH��An��� AS�	6�WA;�e���A'����A��K��AoQMvA��*ƵA�S�lOA����#A�ث�oTA�J{��XA���g�A۾R�J�A mP�[�A �RlY�A!m�,y�A!�$�CxA"q�ƵWA"�6�_�A#w����A#�WƠ�,A$�r'��(A%t�~�Q        ?e����?��۬���?�oeޡ\�?ڕ�3�0�?�m��F?���Yu�@ 1���=e@�.Qd�R@ɿi�)&@��]�(@yiG,�@f3Y���@ ��Ǉ�h@#��) �@&�B;5jU@*��5�@-|U�:�@0�TI'1�@2s�mc@4nt��W�@6~����N@8���41j@:�ǵQ͔@=#چT�@?�Vh�@@�v��U�@B7���Y@C��*�δ@D�E�܏2@F,Gܱ� @G�z.�@H���� �@Jj��/��@K������@MdprF�E@N��x0�@P=@	�@Q��3�@Q��+�o@R����@@S}Z�,q�@TV��[@U4G����@V��}@V������@W�r���@X��_�c1@YƧm<<@Z����֨@[���O�v@\���u�@]�?я4@^�*c�:z@_�{�=�@`s*<��@`�`ҙ�.@a�ё�@@bc��O,@b��)��@c@��!@c�B��&@dm���w@eۖ�        ?TSo�AT�?��g�^i(?���l��?�ś\&�?�\�&��?���}���?��� i?��]�
G@J_u?��@�N�e!@
"WM.w�@ß�"@:��v@�
��@ؾH˨@�r���{@`���@!�1�@�@"�^D�b@%R
�j@'s�f��@*1>�^@,Ҩ�w�@/�$a*��@1������@3�{�<��@5�>�� R@7ѳ�"�j@:JnX]@= L�@?�� ���@A��n�*@C\]}�$�@EE���O@GW��4�@I��J782@K�"S��@N��qj�@P�̴���@R)�5�W@S�Ν��b@Ut?W��G@WEu�'�P@Y5�b���@[G)����@]z8�1��@_�q����@a%��V@bvg �_�@c�V�Ԉz@eUv֬��@f��!n@h�6uǡ@jL=e_ü@l$3����@n����g@p�u��[@q$8-s8@rE�G��@su<ݱ@t��U5�G@v ̙���@w]n ˂        ?J���g	?�'��[�?�$�\mCx?��pԹ�?Ш��G�?��b����?���XI?�(�D=+k?��u?�Ü��@ ��<�~�@Z�͌��@c�-aV�@х�ph@� �A�!@}��xU@d��[��@�����@��U<�@ f!g���@"t����j@$��Z@'�ţ��@)���=Q�@,�s��m�@/�>�sc�@1nA� V�@3,�;���@5
S��b�@72Q�{@9('�_��@;lS�@=�2�Z[@@4s�A��@A�����@C	�c�H@D�V�_��@FC��q�T@HX)/@I���2�@K�`X�r�@N&u� n@P<i�լ	@Qz���@R�s�Q(�@T8":��@U�`���W@WX�
���@Y�p.�@Z����	�@\�0� �@^�p���@`���8�@a���5� @b��䛱@dM�����@e��ff�@g*��@h���XC*@j[3&k�M@lȼҤ�@m�lB�`@@o�<
!ۡ        ?�X�v��w@3S�6@�@U�<��M'@l�k��@|p��B�@��f7Z@��Y��b@�SI�r�@��6�� �@�6�yX��@�ٚ� �@��ʅF��@��q���@��F�,��@��-9��y@��Bk��@�!f�i�.@�Ҩ0��@¦Z�HP@Ċ��S8�@�~���P@Ȃ���'@ʓȅR7�@̳��>@��!�$p@Џ?˲%@Ѵu�-��@��0Xr�@���uT@�M���@֍�W@�ԙ���i@�!CUKV@�s�(��@�ˑS�Xe@�(�ٝ@ދ&EȊN@����@௑���&@�hh����@�#���-@��!ꁮ�@�/S'��@�g�mn@�.S��@���C���@���o�u@�'��5@�h�:�O�@�?�~��:@�2=�(/@��W��Y@��0A�ߟ@콝6�ߛ@��F}S#H@���u@�}�P�W�@�7	��'@�iþ�d@�*�AZu@񦅱)!@�#6FN[�@�	R�w�        ?u���:��?��4�=?������?啍���?�Y�{Ec@e�Ħ|�@	�M��Q@	�d�@�ַ� �@g��K1�@"��Z�
L@&��G@+!��b1@/ͧϓ`�@2i@[!dW@5�n<�_@7�ʅ�@@;pZbrW@>C��0C�@@�)i��@B�A���F@D�#
�O@F����=@HՏA�e@K���@M�	����@Ps4�^@Q[�d�@R��0:�@T7����@U�Xt2C�@WZ�����@Y �o*�@Z���wG@\��P�I�@^�j��'@`=�"Tƈ@aD��1��@bU\mV��@co�k)�@d�r)�X"@e��q�1@f���@h%IW�P@ia�)��a@j��׃��@k�-w�.�@m=��b9+@n����H�@o�+1���@p�i�y)w@qaX�@r��Zw+@r�BXzt�@s�fR�gF@t^v��@u'�Y�@u���3@v�~��/�@w��4��\@xwx!��{@yW&�r4�@z;�%�o�        ?<Wj��,?�ET	�2?�.�8�?���ͅ�o?�v��w�?��4�WA�?�xl���?�B����?���}`��@�Ȝ��v@�9�=2@]�s2@�p��@���P��@![��y+@$��\=}�@(���qj@,�Hv�T@0�����@3G0��M�@5��R�>�@8���\~@<�f��f@?\8П�@ArAq7җ@CQ�/�6�@EL�ƃ��@Ge��V�@I�җ{�@K��C�@Nm
�@P�����d@Q����I@SZ����@T�T��7(@V��+F�@X@p���@Zd�_�@\?Z�v@^�2%�@`f�)�/@aF��$X@b�F�!f@c˸����@e+��
&�@f��z�@6@h+���S@i�ڌ�i�@k��4qh�@ma4ሶ�@oS� w�R@p���]@q�`+�{@r��f�@t,���9�@uyy�3�@v�P����@xM[��@y֍�H��@{u���@},\�Ƙ@~�����@�q��1��        ?k_O�?�xQ��?��O��?�&D���?�Ŀ���5?�ǋk�?�$nȵ@ e�ڲ��@A���0�@
�$��"@;�h�̑@f,���@���)��@v��!�@_U�՟�@!Epeʩ�@#}�=؋�@%��>�i@(^�i~@+��0j�@-籈�l�@0|W�n�@2$ǖ�6@3�+��G @5�� �@8#ˈe^@:���k
@=/��֤@@"�X�@A�v�Ln@C6�g��1@D�����j@Fީ̨�2@H���!�b@K�e��@MHߝz�@O�y�%�@Q�)'M@Rz��dz@S���m��@Ur�� ��@W�4��s@X�o%"{@Z�2�y�@]_he��@_c'm���@`�n�?�@bQ��?r@cª:k��@eH�#s@f���Z
�@h��#��@jZ�K"�@l7?�8�@n*}�L@p'O@q+)���n@rH�uj%.@st��;^@t�M�&v@u�Y�Ohq@wJ`d�u?@x�eE˸g        @��灦X@F`��@g��v�׈@}嬲��@����9�x@�c>�&b@�2��@z@��^�� +@��it@�u-���H@���[N�@���K�5�@��5�U��@ï�Q��@ƥ���M�@��O}5�@�&�����@�ZX7�k�@�<��@�9�=�7Q@�S�k�pd@؋Mb��x@��KV>�r@�V�_���@��x�M�@�Q�Z�ح@⾶�#�2@�=;�|�@������n@�p�j�Q@�&ߟ� D@���o�4O@�̄V:ų@��
��>@�`�X(qs@�l��\4�@�,B^w�@� �-@������@��%��\@�>����@�����@���`��@�� ��@�r��[@�ͩ�2<@�/����hA LL��?HA_MMߌA�1���nA�~�eGACvWrH�A�g,�Aְ��k3A�u;��Azm�fm	AR��[��A/W.�O�A	{���A	�;��ҀA
�9�$A��t"�A�"���        ?�����+�?�ᕤ�?�̼��?��
|��u@���G@w���n@ �0�b׎@&÷4�_�@-�����@2��$'}�@7h�$�@<@���ů@@�����@C�?%ڡ�@F�x��@I����@M��22[@PL%Q�-�@R#�X�X�@T���ʐ@V���@X&�-�@ZR��p�@\����@^��kٴ�@`���L@a��t�Z�@c8SBOQf@d�� Ͻ@e�:��l@gL�~�>�@h�����@j,r�j^@k�3T���@m(��(��@n�"��R�@p��/��@pꐕ�Q�@q�M>c�r@r�#�a��@s]	��{@t3��a�k@u�s-�@u��Sʋ@v���$W@w����@x���(@y}#h�@zi1�ø�@{XG�)�@|JYb���@}?kkg�@~7�t]�O@2���[@�~��D@��8_3��@���=c@����U�O@�%E�#�a@�����'g@�6+�̟@��x\#�@�N���z5        ?l|��!�?�=�Rb�~?�� �x�?�`����?���Hoj@6��d`�@� ��B@�&��y�@�ou@+`@�q`���@#D^oh?�@&���H�@*�{�S]�@.~ό�!@1RE��@3�e���W@5�ҝ���@8.���1K@:�X�<��@=ND��a�@@�w_��@Aq-m椓@B�I�]�5@Dy��7��@F$�(�@G���sc�@I���'�@KZ���_�@MB��ӽ@O>�Ƨ�@P�&5�Rv@Q��R]��@R�x[6��@T�f��@UG���9�@V�Y��1@W���a@YZ�J��@Z���A_6@\gy��*�@^
���@_�wXy�@`��l��@a��P��@b��lͿ�@c��wL@d�HE�wF@e� ˋ��@g#���t@hc�Ĕ�@i�����@kψV �@l��=x@P@n	��{�l@o��~�S%@p��i|�@q�_���@rr����@sh�R���@tj�I@uv�S�m@v�,`u�@w�����        ?�N�n��?�rr!bcW?����u�?�r�Z��b?���ly�@I�jI&@	#����@*r���$@iOU.=@MtX��^@!m+�7�P@%�0=H@)QY%�	@-]�J�@1�ic�@3��؍�@6n�Rҿ8@9|��@<˱"�*�@@0A[�G�@B4���;@D0�]���@Fhe,^]n@H�PD�P{@KOv���@N��ɦ�@Ps�~�MP@Q����@S��I\t@Um��8��@WXi��~@Yk���<@[��z��@^#�"�@`h��Vz�@a��r��@@cv:�A@e162�@g �׵�@i��IY�@kPK#��@m��S�.@p${)�S@q�wD�%@s����R@t��*'��@vpȳ�Z@xX9U�)�@zh��.�@|�Pz�~@xD��A@���v��@�J�����@��ZkI�@�w�d<� @�9ܩ���@���Z/@��vA8�@�7�@,$�@�v��
�@��(�@�,�����@�~��M�        @#�&9+��@W�T��@w&��� i@�Cl�i�@����Y@��?�}Oa@��R��@�����@�lO�%��@���^R��@��9�I�@�X�do��@�	���@�/n$��@ԥ��Dq@�j�	��@�P�n�G}@�V�c<@�>&��@���q�@����@�T+7�N�@�'�V�U$@�����n@��B�@���J"�@�&�&��/@��M>@��m�K'@��@a�X@�DoӉ@�E@�>|@�|�#^@��u4#N@��
�
2@�@��,z!@���t�@��c��%)@�3ZeP�@���(��(A v�F`wKA(��M�9A�^o��A�z�ՍSAN�K �A
%���Aȳ���A�����aAM����A�6��<A�K��uA��Aߦ�A	r�:�A
B�i�Y�A�yX8A��,�LA��)�J;A�&lڰAyx��AY�2Av�tA����AM��X        ?�\j#i8@?�E�@T�?��4�43"?�����އ@�����@��YҺ�@��#�w@$��u��@*�jvB!@1MJ��@5%e
8d�@9��)��}@>�͵IV@B!
���@E
�0�@HNkL���@K�=@�k�@Om�͆#@Q��&�3@S��Lv@U��ឭU@XY~h^E@Z�D���@@]~ܸ�u@`%�vm�@a�+Ѯ��@c1Ⱥ��@dةE�P@f��$�֞@hl*���@jZ�.@@l`���(0@n�p`�$@p\��%�B@q���=��@r���Գ0@t�dR@uT���@v�R�!@x"\��kE@y��YM?@{*��B~�@|śM���@~p=��%4@�u'
}@����G@����V@��z��ץ@��r8�a)@��P��6@������@��@�"����@�G�Y4�@�t���9?@����
R�@����Χ@�'���]@�q�e(&�@�a�fSy@�<Ȳ�@����lÛ@�qaC4�        ?;gh]�%�?DrTr.?���}0��?��N��?�l�v�?�_̭��h?�s]HK??�=@��n?�J ]�%Q?�<���0?�����H?�e��;`@P?��&^@�\����@��I!�@������@lL���@i�Tٮ�@��.ä@���)�@�O�U�r@"lL�g@%,��\@(E���Q@+�I�&Q7@/�hD��q@2����@4{���W @7;�@u\@:O�Z�@=��<��@@ȗ��A�@B��cB2@ED8K�@G�8���@J���o�@M��@#��@P���~@R��y�@T�����1@V�w%f�x@Y���@[���n�@^bI̷�@`�vĄ��@bGV�
��@d ���:@eێ�S?�@g�G�{E@i��7���@lK=4��@n�4��:@p�1E]�@r�'�'@s�����@u<��	@v�❇ɧ@x�yh�@z�?�'Ң@|�i��J@��ʹ�@��� �[@���sGvB        ?���?�!ψ%(H?袞rp�?��ҡg�i@���۝@{e,C�@#�>=@*�n+(��@1�`=GN@6�]Kjc7@<k��A�@A`��[̥@D��l� @H�9�.��@M ��� @P�����n@SX���6@VA���@Y�*�+S@\F~��@_�vۯě@a���`�-@c�5#J@e��~@hJ��9@j��_�.X@m�E�@p0�mU�N@q����@s_#�9]@ug��Pa@v�C��iz@x�,��@@{���@}3����@�'�4�@��p2'N�@�=����@����Gw@���}��@�s]\�X@������j@��mVp��@�FA�w�@�g�	�M@����1�@�^����@�ZČ���@�`֐�@�oF<@��p,��@��Z�@������s@�	���ȶ@�G�o2;�@���EKKk@��02㒭@�<M��ʏ@��K+��@�.=�q@���ls�m@���d*�@�Nj���        @-��]]@T.��^@u#����@�æ$�4�@����߾F@�0�W�L`@���@�����@���"�*
@[��N@�Ps�[1@�&X�&@�ۑi�ݤ@����Î@�6��6�n@���S�B@ީ:P�s�@�h���l@�oP���@�>�k@�RK�wE@�>�Y	�5@� ���@�h� H@�3�['X@��L�Y�y@���(z�j@��ʔ&�@���<��B@���w�m@���A 8�S�qAv�aXgA�M�&)A#SB��A�"�%`A�[�T�A���7�A
;dUa�uA�[�`A�Qrx�A}�߹�zA��ְA��Ә��A��-��aA�q�s�A���-�MA��[B�A%o��N9AX�r�ɳA�ײ?\'A���GA%-o��AyQu��qA�J�i&�A �lS"�A �8�)��A!��
ɼ�A"I#��A#
W0�ݑA#�]!���A$�1����A%d��<�        ?\<:ւ�@?�5�4�?��� �?�Y#��<k?��<��}?�b��2�H?�ux����?�T��n?��m�4��?���Y��@���5x@����@	��۰�@}&����@�]ֲt�@q��;`@Z�,�-@w�y~�@���uo@ �F��A�@"��v+�a@$����@&��]i �@(�9�N9f@+O�5�@-v2p��@/�Nf�b@1>P'�h�@2��f�a@3�>1�~�@5W��]@6��3�sk@8Q=���@9�)�7�y@;�5���{@=.�m���@>�LDI J@@[���,�@AIp��\_@B?k5�~@C=��mX�@DDi���~@ES��B�'@Fk��U�B@G�>�g�@H��+,��@I�A#m�@K#ֲB��@Lh�q�cZ@M��Z̥8@O���;@P7W��@P�Pk�v�@Q��b�?K@RdHh6Z@S&��:�]@S�ij/Q@T�J��p@U�?'�]@VY^y���@W/6	��0@Xn�|@X��&}�I        ?t��Q�?�;1,���?����r�?�<�:��u?ЛW���)?ٟ6�~@�?�M=��?���h��D?�!S��!=?�qW�v�r?�e���9?�� �ۑ@��É�@wG�y8@
���Q(@I�-�,W@=̝�*�@��;L@L����@�ǫ`}�@��N��_@!�z.M��@$;�1�@&�'�Szc@)��;��w@,��K�ܴ@/��7���@1�D�-�@3�*��@60�9�*@8�y'��@;{�u�O�@>�e(��@@�*�g9@B�v��@D�(p�*@G���ӱ@I�ꕀ��@L0�I�@O���@Q�.�ɻ@R˴v�D@T�!K��I@V�qH̰@X�R����@Z�|$9:�@]d�haK>@_�sv'#n@a`C��'L@b�*���@di�6���@fGPǅ�@g�ҐU6�@i��[{w@k�_�N�@m���m�K@o� ��@q�:�@@rH���@s�7ʦt@t���(�@v=.�l�@w��J�ԉ        ?W����?�T �q?�j8a�Nq?�At�?�������?�kE/�?��I��&?��wQdѷ@��J�U�@
��5��I@���4'@=�q���@J1T؜n@�Lv$�@ Ԃz��r@#��V*�D@&|,�K�!@)�]�I��@-C��i�@0�8���r@2���f�@4��|@7qBK�~�@:%Vj5�@=Hqp��@@%�S�.`@A��0�@C�$_�@E�����@HD,��@Jҗ�q�@M���2�@PY���5@R�;���@S���K�J@U�񊄮n@W���b��@ZB�Z���@\��>�G�@_\f&��@a�w#/,@b��9Xt@d)W}I�@e�·�7@g��9���@i|5����@ku�՞F@m��@<@o��GD@q�}�4@r;
<���@s��p�t�@t�$!��B@v>#O�S@w���E�@yA�4%@z�o:���@|�jP~�@~T��2E@����|~@�|T�'@��[2\H@�#)��        ?�ב��'�@-�h��k@J��W{�@`w���t@n�3�A'j@yE{�Ry@����=1�@��,@�HvI"�@��k�A�@�j��g�8@��׳���@��2i���@������@�~�V�;@��`�U�@�6=渁}@��1+��@�j{�rY@�M���G�@�a� �@�S_>��B@�)���@��(PG@B@��"��/@�Κn�m@���`���@���s�B@�^s	8FC@�^j 2E@љ���D�@��kK��@�8?I�] @՛�x�Ȋ@�z=���@؍U��#@���D*Y@۸&Ζ�@�c@�Ӫg@�ӑ�֦@�rf^wP�@�]��R��@�O�����@�H�5�B�@�I�Y@�Pb(��@�^ǰ<@�rݿͥ�@莖e�Y�@�:h���@�����3@�\��ǌ@�B��x@�Zu��/@�ƣb�|�@��C�4@�2]��!@��rHǂ�@�O����@�>�t��@��7��@��0�p@�a�H-�3        ?��!PvP?�q�	f�@���s�@kt�nU@+���A�@6����Y�@A	��=s@G�?��}@O�$���@T�M�_L�@Y�̪��@_ti�C�@b�N�M@�@f_0�P�@j#�  ��@n2�m�9@qD�/��@s��k�H@vB�&`^@x���27@{Ce��@~$s��@���	l3@���"��@��?�-@�=���G@��&�T�@��^Eq�@�z�v�l@�T~0�~{@�<�LxqN@����a@��gi�@�%��g@�6�bl5@�OZ���@�oEh�w@��d�O��@�ĉql�@���/���@�57`9�$@�w�o @��d&c��@��U?�@�e��"�@�a@O�v1@��n�!@�����%@��Lɉ�}@�<�,�@��PD� @���*2�@��<Isӧ@�L1V��@�X�J̢@����@���3�@��A�5V@�gj����@�BU�!@��m��@���v�U�@��PeG��        ?��و+`?��A�I�@�,3W	@�Es<<!@+��x�@7er�ȁ@At8���	@H���~D�@Po�I �%@U:�%�l@Z�G��Z@``m
P@c	[ؖ@g|n)ytU@k�[>j.�@o�p%ڐ�@rb[Z�f@t�S�J@w��p8�a@z�ǌB��@}�ѯ&D�@���hz(@�A��}g@�x�~��@���U{��@���@���>i*@�6�	!0k@�t#C��>@�b�T[rI@��.�4@��wH�]�@�	kGp@�l���@�ȡ��Z@�.{��*@��4T��7@���Vv@��ū���@�'z (�F@����jA�@���g^��@��Ǎ��b@�]��r�	@�<j�f��@� Igs@�	D3"��@��m����@��׫�A�@��6���@��sP�@��6�k&�@��=q�Z�@�����@�'�J�'@�+M�s��@�Kt0-�@�8�'�?�@��6���@�h���,�@���Sx@���k�E�@�I̪�O�        ?�0@�*}�?�k7��$�?�� �h#@���$@ �W� &@"�F�X@+ݫĩm?@3'�@���@9ߡ
e@?����M;@CfmX��@GNv%��@K���L��@P	��̎�@Rz.�JJ[@U��_[�@W��x�R�@Z�fy 2�@^7qP p@`�7>�^"@b~�Z���@df�S�@fl�-�A�@h�oj��@j�B�Cp@m:S��@o�W7~oN@q4�iY%"@r�� �Ȉ@tG$�M6@u��5�A@w>�D�/�@x�r�w!@z�[۽y@|��&7y�@~�!�ǻ"@�U��?��@�ky2rMg@��K X]@��\{�k@��ݖz�R@�F�qKj�@���|��\@�^Eү�@�z�xq>@��xu���@��+h�o@�-*��O�@�m[��ٍ@�K����s@�1�O"��@���7�@�D��
�@���0��@�`��8�@�0t�Rj@�L�֟@�qJ����@���� �s@�����I8@��C�@�cCP�0t@��O�99�        @I[�	R@�ϐ���@��1���P@�v��5@�g�=MT�@��iw@�MTfl�@�ibE��z@���@)�@�AT��@��Y'~}@��'ވAʦ�Q�hA���L(TA������AN�T�A�r�,S�AI���.EA;�l{��AB}/o��A] 	�BA���]��A�U����A��a�fA @�%�wOA!z�Sd��A"����,A$��?EA%X�-��SA&�j����A({Ĕ��A)|��!eA*�k|���A,d��Er�A-�� �cA/m7�A0~���A1J����A2+�1��A2�;�f��A3�����A4���>A5�E�A6e��WFeA7L�\�A87�a]A9&~��vA:+�ZL2A;�ad�RA<	�I�^VA=9���XA>'ba\�A?G��A@	�Կ�A@��3r�AA1�+�AA��宩AB%�qP�cAB�Ȓ)SAC;h�|äAC��z(��ADU'n/jKAD�x*���        ?�V0U�(?�&�ٽ9E?�!LV�L�?��w�I��@��n�j�@�G}�B�@CK�d`�@%T�3�+@,��>>n@2kK5i�@7�x"@<9�+W�D@@�����@D
H�Y��@Gd3�9�o@K9y^�p@N⇳���@Q��D�?S@S�̓�@V�ŤJ�@X���V� @[S���D|@^4K�RLr@`�@	g<@bG� �@d��M�@e���8�@g�f���w@j���ù@lvKW���@n�U�<9�@p�t���@r@a��І@s�A���@uSm��(�@v�`�|(@x���e@z|�)��H@|Y҂�'@~J,NO��@�'(�i��@�3����@�J����@�l��l�@���	=��@��{=R�7@�����@�f�s�}�@�����@@�$K�9>f@��yb&�@��tQ@��}5ɉ�@��*�?�@�QLj��@�J�r�g@��U���@�ʟ���Q@��X�`6@����N�@�t�߸z�@�c�AϒN@�Y.T�˝        ?R���Ӹ?�$8��`?�l�pXP�?�2vf�?޷0z�?�?�q��?�D�}!"?��D8C@㲣�A@稧O��@��3e��@^l_�N@�zkP-@�JX�t�@��G���@ �cmT��@#��M��@%�Qy���@(Ӻ�v6�@,�|�d�@/�=����@1��K��c@3ܝ�`�m@6%kk�@8�Ҭ��@;I�2���@>+9/8�@@��yM,o@BM�]=�@D��d�y@F�-~�@Hj�w@JHrMz�@L��f�Q@O)*����@P�����@R\����@S�o���H@U�8�7Q�@WF��J*�@Y#[=��@[U�Q��@]<���@_}��[��@`�ٛz�@b8/�@c��af�@e�����@f�3I"�L@h$O���@iא�:Dv@k��.Hx�@m���cj^@o���5W�@p˧�(��@q�T��n@sC�)�@t:�X���@u{.ǃ�@v��g��@x'Q���@y��uw�x@{����        ?��E�[�%?�C�z�N@��j�{C@#!��G�I@2����-@>�OD��@F���1�x@N�+�� ~@T6���@YlB����@_#5�%_@b�D,Ո�@e�J4�i�@iZ�z� @m�iK7�@p~�0:x@r�i8BG�@t��%v��@w ���tN@y��ȡ�@|1��5�@~�0$Ht�@��X"d@�h��
t@���)��@����r��@�\em$0�@�)��6��@�K�G�v@��r%��@��f���@��ZI��@����\�@��y��|@����Pr@�IЂ�!�@��J�aa�@������@�G���S�@�� Gt*@�2z$9>@����捨@�V5�г�@��[�c@�\�)o"�@�BVGs.�@�0�q��@�'�ĺ�@�'׈
�@�1Ua��@�DI@���@�`�+�]=@����@����H+@��Jq@�4Sت��@����"�P@������@�����+�@�TQ�NL@�FO�;@��V	�@��;�@�        @3=6�'@oD�br�u@�>�"�+@�u�g�t@� �Cg@�E�5� @�:i���@�ޟ�C��@��9�܂@߂��DM@�j69�@�cdB��(@�6�Vg@� 
�
�@򐲃u��@�'���m@��#;gt@����ɗ�@��US4��A ���|�A6��A�tA��?E#A��ڹA��ol�A	秼�"�A!���~AjTd�@�Aq�4�A�����fA,��p-oA���u�*A?�+�J�A���xYA�fi�MAj�ôp�AE��	�A0�7�CA �����A!��� �A"�cu���A#��א�A$�yP��dA&�	�MA'4Y�2��A(nz�&�A)��;?�A*��qO��A,Q,�'oCA-�~U��A/#����A0=�'�^�A0�K�Z>sA1�|��A2q#���A33�܎�}A3����v�A4�Uѿ�$A5�	p�}A6b�4��zA78�T�meA8��BC?A8����_�A9��F��        ?Q/�&?�?���b��?�R�/��?�G�~3�?�>!�i�?�(�j|��?�$[K=m&?�BK�P�u?��{9?���O�@ �BzT�#@�v�F6@	YT䕻@�́:J�@mq��@1q����@.8C�@e8UM��@�؏E��@ Ò�f5@"���ZN@$Ϋ10�@'���C�@)S�l��K@+�2Pə�@.T��@0�ZgC	S@1��$?�)@3g�7�wg@4��߁VZ@6����@3@8R v�cz@:��"�F@<�{�m�@=�:/�`�@@�;e@A���:�@B2�8E@CTx�@D}���@E�r(i�@F�~��@H��8��@IWB�'s@J��K9��@K�8>��:@M'��Â�@Nu.;5^@O�D�O+�@P�#�}�@Q=H.A��@Q�1����@R���m0@SX�PMcf@T�8�S@T�:<�@U�^p(M@VOac�@WE!���@W��$�@X���=@Ys���Ϊ@ZDM�~�        ?�0z��j?R�p���?x�n�	?�4!(]]<?�ZB�o��?��zG[?��/2.{S?Þ{�B.?�5�{_�)?�6�K��?���ZP�?�z��?�DuU��d?�e��?��=;p�?�e�p�?���|��?�Y��>�@ �e?k>@�ܠ�^�@��ZT�@=[m��@����*�@����x@r��c0@�Z��&@-����@"���1�@$��ߤ�y@'���(�@+H=D
�W@/ ���@1���A7@4	4�<g�@6�*L?�f@9{g�q:�@<���*E�@@۴<Zl@A�:n�t@C�g��@F/���@H�(�,��@K�.ϰk@M�ߛx�@P_IhH�@Q��,�#@S�+����@U[�Ŋxz@W8��YH�@Y/]���@[@�`��@]m��X<@_���*�@a�
�߯@bO,[s%@c���c�Q@d����h�@fo����@g�A$4�]@i�!����@k%�;�%8@l��~��@n�+��_        ?)��o��%?c��
5H�?��0��?���:}q?���<��J?�����?�:��'`�?�ӳk��8?ՠo��g?�U�Ec��?��.�?杗��?���cS�?��t��,?�},���?���ټ!?�<�&��@Q��{�@i����@��x�C�@��Q��@Hn'�@�@��7��T@��N�@�z@>�:@�nëF @ B���@"m��>0�@$�1�c@'aĘ���@*.l�/��@-5(Q(��@0<�'�o@1��҃�@3�t���@5�r���w@8W���&@:\D�8f@<ס�4�@?�՚��x@A,�O�F�@B�*M�q}@DP���N@F
�?c@G�q�L�@I����@K�ӑ��@N	1��@P*��9)�@Qa�5hkP@R�1�,�@Tq!<@Ut��Px@V��OQ�@X�����E@ZC\7�<�@\��i�H@]�
���@_�
"i�@`��EZ�.@b�E[�@c4���L@de�+�e        ?ӟ<� u@/ l;FB@3����@J��+���@[�ץp�@g�h�rC~@r^�U���@z0�5��y@���W�@��4=� Q@��np�@���5D�@�wNԧ�*@���U��@��0F~@�]GZF@��� *k@���� �@��<���R@��q�8�@�0'�W'�@�{m��t@��O��{@��ƛ�Q�@�:�ɋ�@�\h��@��x ���@�9��a�@���B;��@�N@` u@��q<��s@�G�l�j`@��s{x@Ȏ�+�W�@�P .*@�#�)\�@�	4��ƹ@���iC�N@���($��@�AE��@����(�@�%ڎ��@�<�~3{S@�X��A@�w�h<�r@؛t[ͪ$@��H��a�@��Y-)@����C�@�U!���@ޏN���@��~%�w�@��S���@�-וa�@�Ի~	�/@�}���^�@�)yI���@��G=��@�Z��
t@�9�MK@��2C �@�кbG�@�]j~+�Q        ?���0�;q?�֩�Y��?�t��J�@S9j͎�@�΄��@6��W@%�Í]�p@.z�~B��@4Cнwݯ@9�	��a�@@0~���:@C��m��:@G���FA@K�"�zO�@P&=��@R�nEX�@U!paZ�%@Wُ�np�@Z��G`�J@]��uDBJ@`rDf���@b����@cѢ�di3@e�]<}�@gx[uT�@ie�Uç@kd�8�b@mt�U��O@o�@���@p�Y̖�H@rx�.�@s3��;��@th�����@u��+\��@v�zo��`@x=�Ej��@y����L�@z��)@|d~,}W�@}��.<[@V��2�@�m�$^h�@�5@(s#p@� �# ��@��s�H >@��M=KS�@�|EIj��@�XU~C&�@�8yF�k�@����{@���NF@��,sH��@��f���@�Չ��L@�ͅœ�S@��G��z$@�ȼ�o>@����17�@��p�m<@�nGy�@��h�f�@�}�
@��p��        ?��HtgQ?�0\���?�"'q�@빰`�d@�l�͓�@'n��$ @1萟2k@7N&��Ċ@>,���CX@B�t���@F��c&�@K'�D�*�@O�zA/@R4���n�@T��e�d�@W;P(�p@Y�in�@\��Tق�@_oJ`�ͤ@a+5��
t@b�xe��@d2��;�3@eƒ3<��@ge�pȻ@i�̑�@jǺo�)�@l�33���@n[��a��@pb�Ѭ@q�)�k�@r��$D(@s�9a�I@t&je)G@u=�k���@v^��K�t@w��ʡ�@x��>V@y�od�_@{I��2�@|�r���@~�8V��@sťg�}@�x���*-@�>ꆆ:@�
��q��@��+Z5�@���@�H�@����i�@��~��U�@�sj<�Qg@�j\y<�@�hP��@�mC4��)@�y2�D�@��x�;@���6�S@����6G_@�f��@��^ҷ�@��JEЕ@�Gd�m�3@���<���@���?�j�        ?�m^7���?�Y�
�i?�UH6Z?��l(:�S@	H
h,�}@�΁��4@^���@$~=�X@*�U�n��@0�E[��@4M��O@8+���Px@<C�.��q@@H&�Qb@B�����<@D����X@GMr��Q@I҆n�Ÿ@Ln3y�d�@O ��fA�@P��Ń
�@Rg�4z@S�x��a@Uq����@W.u�X@X����@Zo��K@\:E�g_Z@^Zt	��@`l�+ّ@a]/�@b�m�Ֆ@c$�3f"�@dF�~��@es�r
@f��3���@g���/�k@iPF+�@j�Do ��@l1h�@m�mD�U@oZ/(�0�@p�����@qh���@rU�E�L@sN`��@tQ��`��@u`ʱϵ @v|5�W@w���Qс@x�l_�g@z��{<@{j�t��@|�L��c @~7%B�.@�ݘS�[@���F8�T@�q��l@�J���b@�-j�Q��@�|��:@�q�*"�@��P$2l        @1JW�9\�@k �s�@��%Ԋ�@�r����c@�����"j@���-���@��jk�z@�=&֣�@�،�F��@֐�
��f@��eAݿ�@�*��@�n� J@��i�
�E@�q&b���@�͆��]@��Y�G^@���\�:@���x�@�A�FD@��"t��@��{|U�V@�O�lHrNA j��7~A�I���A��m�Al�(N	0AւP��AI��-PA�9�A
K�.q?�A��O�@�Ap�����A�(�7A[q���A2���>A"x�,A���4�A�m��ŃA�b�\�A���|�`A��@��iA{���An�o�Ae�.9.A_��)A\���A]�xހhAa�hc��Ai6>=�As���)MA A%"���A ����fA!T}�љ#A!૤΄A"n�Xg'�A"�� ��A#���"A$!��b;A$��BMA%K��5�A%�K�Z A&|7��        ?��U���?���'�v�?��a�5?�GzE�@
/��Y@�J@ ��/�O@'��?��@/�&�@�'@4�����@9���q�@?��ܤ,�@CO����@F�B>?M@J���zc@O0�=}>@Q���m>�@TU�U�P@V�T�?L@Y�`���@\��F�z�@_��OE�@aR���K�@b�$,z�@d�g^69@fX�U�5@h!��i@i�ZO�J@kؖ%"��@mǾy��@o��i�/@p����@q�y�S�v@s.X9�@t���	@u?����@vhh`Z}@w�Is�6�@xπ�B��@z���@{S�u0��@|�J�4P_@}��R��u@Ng�@S@�WĖC�D@���E��@�³���T@�}q�N@�:���]�@��ѝ1�%@��T���9@��])�}@�S�.��U@�#JL?�>@��S��l\@��,�Y�	@���S?��@����F��@�id��~@�PJ�ڝ�@�;h��9�@�*��ms-@��:�b�        ?c�����?���lݪ?ˢʄ'I?����Փ?��A��?�;rI�߳@��iL�@�4CF@7$F��@�	���@!��q!@&Z�Q��@*����el@/���ލ0@2�� be�@5����@8ޚl��@<u�Kπ@@/��R�@BPbz%J@D����)�@G��\�@I�_�Wx@L�%	�Z'@Oշ�@��@Q����{O@S[��1<�@U@7����@WCFu�~�@Ye���y[@[���f�@^	��xS�@`FS~� a@a��i'l@b��T)@dp���'�@e�R�H�@g���e@i@�?�
�@kQ��_�@l�1���@n�8?Z��@pg$��KB@qu�i�N6@r��Ǔ�.@s��b�= @t�A��zo@v1=�#�X@w���;|@x��@���@zH��_�@{�)�	�~@}A��.֬@~О�c�@�5� �?�@�	yr�QV@��O�栲@��gW�E�@���'�aU@����_�@���X�}�@���?@��|� �        ?7���k�?ps�?��
?�m?��3m=�=?��aK�U�?�s��bc�?�E��Z�C?҅�mkD�?���V�� ?�R�aPc?��X�gs�?�9�zi�?�H�e��?�	~ )�\?�y�/HMA?�����Wt@���r�@���O�@	�u���m@�����@T5��@�����@��%G@�T�ť@!���Ѽ@$u�.�6�@'���0@+d�� @/~��DT�@2��e[@4�gB@7Y�ѯl@:k|(ݓ�@=�J�#1�@@�	���@B�b���@D�3]@G<�|~�$@IĘ��\�@L~����@Ol���Q@QI����@R�l9p)�@T���J@V��*�:H@X��*�l�@Z�N�I@]L̃6Zw@_����[@a9�>��@b���[��@d {)���@e�\KyX~@gdFE�i@i+3ʼ<�@k&���@m*����@o Vյ��@p�����@q���!��@s�~��@tY�AP�i@u��^��        @
�����@K<��@o}�vX�@��j���@��#N�F@�WFSB�K@��iCm<@�T Y��@�{3|U#3@��W$�h@ù����@�"��y�@���G1f@�"�pX5@��$�Z@�)�Ui@�U�.s�I@��[�ą@��G�� @�/˃@3@��0��@���N�@��X�*B�@�y4i�@�I���g�@���p@��}�d2@�1�^y��@�m#�:�@��x)�@���I_n@�D3����@��A/�-�@��}jb/@�Y'͏��@��xS6�@�7�!��@����;H�A ��6�\BA`���A)m��O)A��A�1�A���G��A����Au�<�'AR.�%ܽA2���DA���A�L��2GA	���!XnA
��, �HA�9"��#A�;�=]�A�����}AΝ�<�A�?	5�#Ar~���:A��'S�A�(��A�J�;A������A<�d;�%A��&�6        ?��kp�r?���ţ�?��uTK>#?���C?��@k�"Yk�@��	���@���]�@#
Q*���@)g�;X9@0P�~{�@4[�#J.F@8�����@=�*��h@A~�7Ot�@DU۬��@G]X*�8@J�D��@M�M�t��@P�6c�#�@R�&�7�r@T�{���(@V�F��@Y���@[[xI;J@]��]O�@`1���D@a�nM�@b�Z}%��@do�l�@e�d�h�O@g���@�@iA�o�k�@j��B�)V@l��i�t8@n��[	n�@pK��E�@qJt`��O@rP�B�O{@s]���V�@trs��Ʉ@u��ǧ��@v�:˱�'@w�f�cő@y	f֖��@z@?KE�#@{}��nCT@|¦�Zٷ@~OB�jy@`�8���@�]H`� �@�xK|��@���* �i@�w�X\@�1z*c�@��q����@�����k	@�q�W�)@�8UuUC@��酋@��&ov��@��{M� U@�sc�&�@�Jh�S{        ?��!���?�]$T�4�?��*�٣@� B�@c�6���@"�`��@,`3҆&�@4
�o9�G@:�aN�I@@A���XX@E9%�@I���<�@N�ver�@Q�[�l�q@T������@W��8�i�@[t��I�@^�4^�@a$�	��Y@c��T@e2NZ�o$@gf�:K��@i� ��"@l-D1�ط@n��&h�@p���2�@r%�ʳ��@s�i�bn@u.�	�i�@v͕r|cN@x~��i@zC�}9�@|A�@~Oo��@�_�@�*B�A�@�-5@��a@�T�����@�� �;�|@�п��j@�'�ۿ�@���-���@�	��6|@��f��U*@�7��#��@���-�9�@�\�=3q4@�M":�i�@�I�5hg@�P�[���@�dE^k6@�����@��o�7�@��*l/��@�1sų�@���ɶM�@��d�WwL@�\����"@����1�)@�81��7x@�	$o�9@��u���@��]�ouk        ?���G��A?�6{�b�?�%�gU�@ϙ�#�n@Q��C2@ ���S�,@(I�����@0u��۾@559��;�@:`R��;@?��_���@B��0l��@F5	��V@I���7��@Mv� 2�-@P�˴��8@S,��A@Up�>i@Xr����@Zܭ/�s�@]݊@`��iRu@b9��3�@d���e�@e��:dJ�@g���@i�J���@l$+r@n`�����@p]Q�@�@q���{��@r��\l�@t&���4X@u~`�5��@v��sam�@xK �KY�@y���*t�@{=nn�|@|��s�@~U�;1�@�	�og'@���F;�@�����@�}�W�@�^h\h�@�E[���@@�2M��]@�%��Z�@� ���A@�"�F�M@�,S���@�?�FuOq@�\���
@��Ƿd�@���8hC@����@�e�%�@��M��W�@�w:��]�@�-w�6@��e�J�@��kM�Ve@�y��tt        @)��*o@cҲj� �@��r}ǥ@�B�\�p�@��kW�"@�8x� ��@��5j�@� :�(�_@�n�wz]@���h���@ٜ�i�P�@��2�^J�@�=����l@�C��U�@�|�s�©@���;�6G@Ì�a@�����@󫦢,_@��m�]�c@�U��~�@�WD�yL�@�����1@�]�iGkA+�opAo5�3��A�F�'�Ao_)�uA��S�A�\��RA
h��01�A1�nJ'A
����A��Jq��A�/t���A��ZI�A�O��A�9U�A/�`���AOڟ�At���A�B}q�A�8�Y�AǮ"#�AMYjA��: �kA��H�� A �{���A Ǒ�%GA!wq�>[A"*/�Fx<A"߫�է6A#��۟�A$Rh ��jA%���MA%���eA&���`�4A'UDL�|A(�eLcA(�+b�!A)�kL�l�A*~#X���A+N.�e�        ?K8��Ia?�yҏs��?�R�ήƩ?�pi
��?��D��6?��C@ب�?���kn�?��_B�?V?���Kd�@$g�C{@�$:_G�@1�1��@{��!�@:;A3n@��!�*�@r�o��X@vM1TJ@!�I��%@$%t
GR�@&�jE;j�@)����/@+��W�@.��]R@0��I��0@2D�&x�#@3���Y�@5�kqT�@7>��lu�@9�,@:����@<Ч�Ou@>�9�v`@@p+��@@A�N~;�@B�P�^M�@C�z�l��@D�!I�@F0a)+�@Gv�Kۯ�@HȁZ%�	@J&�W�@K��P���@M"'F6�@N�$�q��@P���m@P�+y�o�@Q�n�� z@R�c���@Soi�<B@TXG��N@UH~�
j@V><�q�z@W:ŧ���@X=�2��@YF�WB7�@ZV5E`�~@[l	`��y@\�J��@]�,+4D@^�Z�@`3�!�+@`��b��@a<�Z�        ?#<�@�?g=Ah/��?�����c�?�@w��@@?�R��yG�?Ê�#��?�y� 5�C?�����X?��H&A?��"��a�?�j/�.�?��d��$?����P?�	Z�şl?�)�"�@m4���@���Fd@�ȱ�6�@.7�Gk�@2��t@6ZP@���9�@�6��V�@ !6�}��@"��M�@%�=l $8@)��*O�@,���o�@0�r��W@3z�=h@5˗�7�Y@8܏=�Y@<J��,@:@@��L~s@B1��i��@D��L�=�@G2݆sa�@J5gG�@MV+��@Pr H(�e@Rg--M}�@T�玚@V�>�O�@Y�r�W@\U���G@_mLm���@ag<'b�5@c?Q���@eB*bb35@gsW�%@iֳ�^��@lpk����@oD�q3��@q,�u|g@r�T��	@t�c���@v�i�V�@x��8�G�@{B}}*@}�z�ן�@�%'[�@���F�	�@�(P��W�        ?+%d�]`�?e�����?��a��,?�,e.��?�����L?�t���?ɍY���?�X��
K?����t?�]b>��?��i��?���I�U?����i?�~�|5u�?�rЭg�?�����7�@ �gh��@��R���@�h��@
���� 3@�gSY@0D�7�@���K�@)�F*h@�$"eHN@ ���@"d��b�'@%�7~ga@(Y���@+c��NK2@/bb̵'@1��.;��@3����@6w��}�@9FtiLR*@<_+9��@?�ѿh{U@A�fjX�@C�^i��@F<�+�@H��v�cy@K4��ت@N��4�}@P��Ξ?@R]y~�
�@T9WS{�?@V:�U�S@Xca��s@Z��S�'@],�_[�@_��~~i@aM:�Ab@b�?݆��@dV>W(�@e�����@g��h��@i�u�[@kc��H5@mZ�?�&@og�|�@p�&6�T�@q�3�&y<@s���#(        ?Ә�<*6�@�
���@6I�YF�@Or

	�@`��=?@k�ˊ�qt@u|��3@~����>@��3$G�@���^u@���>m�@��P
*��@� ���,@���1>k�@�hR�-@�X�Rw@� xX4Y,@��:�}@�V��u�`@�dR���@�4���j�@�E[��@�&��ڜ@�1��H�@�`޶s��@��mw���@�	7��@�����e�@��?�L�@�e@���@�˸K�@�A*6	�?@���a
(@�Z����@���oSR�@̵�r��!@�}G��t@�+O��r�@�!4�>)�@� ���=�@�*
�@~�@�=��Y2j@�\�+u�@օTj��@׹��q�@��+ ��@�FJ*�U@۞~v(�N@���,@�s�LfS6@��|rm�S@��kU��@�{n��@�X>�nb#@�/"A~z@�6�&��@��J��W@��]�71�@�ɱ��)P@����,�-@辑���@��u�0@�ϥ��a        ?�k+x��?ȧ5��9�?�9szd?����D]@Zu^@@�Hu�Wy@"T��|�+@)F�~7[�@0�B(.�@5���k�@9�F�T�@?DX��$L@B�[��I@E�R�gC@H�͘k޸@L�Y�="@P��!�@R��kH�@T+8�D�N@VWpe$C@X���,<k@Z�"}�@]va��_�@`�q��@a^�d���@bŪ�ǉ@d;9L��g@e���2G�@gS��>�@h�.Y8G�@j���uT@lnWz���@nB�M� @p�p0Ԓ@q�җS@r�"r�@s���@t&�� ��@u=k��k�@vZ�_`Wa@w~�O>��@x��9V<�@y���1<@{��h��@|J/�*�@}�Ո��@~ОGMh�@����q@��|3���@�_�G�s@��_��@���C�@�k� �R@��&S�@����	@@���v���@�C�;*��@��2��\�@��ug>w@�xep�P3@�7���=@��B�g�@��,���o        ?W?��!�?�o����?Ć��ƻ�?�T'��?�zܮ��?�9b��M @ ��w�q@0C��X@��<�@0���6�@9.딉@"xc��@&,�O�@*=O&�G@.���@1�9��mB@4S�R�@7�n��@:�:��@=F)��N@@T=�q��@B s;��@D59l{g@F
i�Yo�@H*X4�@Jg� ��@L���E�7@O<4@A�@P�)3�	�@RE�3t�@S���b�a@U+_̓�=@V���I�g@XOY@�'i@Y��	��X@[���?�%@]|�Ѝ�@_XQΜ�@`�`ۆ@a��f�u@b��
�S#@c����E@d���a@f�]'&R@gK%E*�@h�zsJ=�@i�`3�6K@kGYzQ�@l����D~@n7���Nx@o�����@p�c�RzD@q��J��@rmD<�@sX#m�@tL�;c@uLM*��@vV�Pd��@wl��X\5@x��^�x�@y��%�;@z��9�_@|C�0/        ?z���OI,?��|�R��?�fh�1�?�!ǜF�?�~��w�%@�R$��1@H�R�@�x��k@#'8>��@)H�5��m@0/B52�@46m�w��@8��sa@=óYZU@A��-�s@D��2c�@G�q.z�@K�t~:��@Oj^&�@Q���u�@T�3x�4@Vj� �@X���Z�o@[��g2�@^��V.��@`�2T�EH@b�a���?@d[�mC��@f>����@h>��+�@j\��@l�`��c@n��Lf@p��ɍ�@r��uh�@s`��ۢ4@t�Y�Q��@vO�����@wṮu��@y�4z*\"@{=�_�l8@}Q����@~���*o@�mC#�n�@�q��o�@������,@��+�v>@����Q@�򪷧��@�03��&@�y�_��@�ϱ��c�@�1���^A@�������@��j�$�@��O����@���2�p�@�oK�}�D@�G���az@�'VU(@����@���X�{X@��>����        @m�[���@P����@rx`�K�[@�I�(z@���zP@����c��@��v���@��yw2�@�%�n��@����q�@�F�Y�e@�]�Y�)!@��ڀam�@п�@�B�8���@����=@ؿx/G@@۷s�!o7@�Մ���<@����Y�@����]�@�̀6��@�g�nf��@�X��;\@�^���TY@�z���R@�W�ѿ�@�z0��?@�T3@����n�@�+�� �@�~t�P*�@���X_O/@�GJ�wZ@��@�/@�<=����@�Ɠ�@�Z���
�@���A��~A ���#d1A��#�[�A�U8�</Ae�ԳAJ7���A3�Q=�FA!IS�īA>���A	|��A	iuA
˽q�A�%��A�?'AV��A'���F!A:Ԡ4�sA(��w3?A�1�$AD���A�3+�%%Af��b��A��1�NA���$�9A$,��H�        ?�Ax.'o?�B���?�^:JrA/@��
w,@�R9,@(0Z����@2���*f@9P4�u@@٠�hl�@E��6�@J��L�@Psl�XNP@S�4F�|a@W"|v�@Z�s�S�@^�e�Փ�@ao����Q@c�[� 8�@e��*0�@h-h���@j�Y�޵�@m�,ƪ�@o�'�x~@q">>Q/�@rzj7r/�@s�
�@u@����@v�0�T@x!���@y�7��3�@{Y�� >@|���w��@~'���G*@�O�99@�����0�@�o�r]��@�>����@�$%���@����d@��|&��W@��:��@�pb<N�&@�Q3Šk@�5��Z�K@�x��0@�����@���1�ќ@��F�߰h@��ˁ�;@��@9N8�@�屩4�@��=g��+@�y��E�@� .�T@��-�~��@��6��z@������&@�3.a`k@�ƋQ�P�@�\�h��@��[n~9�@��Ub�T@�4�U�s        ?�D@{��7?Ԯ�_?���-@�r*�@�fӴ@&�v�DX�@04/<�"�@5h���@:�WېC�@@l
e�&�@C�fv|�$@F�X�)�@Jyw�@M}k���n@P����@RQ�0A�@T)�dk;w@V(-�Z�@W�#��@Y���L�@[�>1�|�@^��e�@`-�
�t@a*�|6 @bJ����D@csa��z�@d�����@e᭧Y��@g(U�8�@hz�_��@i�`�t�C@k@�M\�-@l��ّ�@n:NH��@o˺��A6@p� �D�@q�:M�C�@rn�a6�@sXɑ#�<@tL](�Q@uJT����@vSd��n@whH�U�]@x��-+4�@y����uD@z���9߷@|B�%�t@}�*����@�As�@�D�<Bγ@�����@��(�r�@�� ��j@���b�@��/�!�(@��3v�c@��ܰp�X@��c��_$@��� �6�@��R��0@�=�RP@���X��@���[��4        ?pf�^ �?��%�2qX?́=I���?� b�ڒ?�E�9@D�p��@
U�h­-@���@� "�@ ?.�f�@$s�6�d�@). ����@.s�m�� @2%D0��p@5\�=`�@8�[,L�W@<�SE�>�@@u�~�d@B��Y�I@E-�'�g�@Gӛ���@J�qm(@M�B���N@P�q�ӍG@Rj�i
�*@TlX�6�@V��$�@Y���41@[��0�z@^�
�@`م�O}@b�wOhtV@dp�z�@fw�_�}�@h�#XS3@k1�k�@m��x��@p5&�$9F@q�� #�@sV�O��@u-�Θ @v�}~l�g@y3Jy�5@{7�Hļ@}�Y�|'@�l]��@�my�S�.@��O �x�@�|�e@�0���}@��<	�@��H���@��n��h@�`z�wW$@�e�Tk@��x����@�s,sdk@��	~�;@��fr�a@���*�R4@�L�,�r�@��a�0W@���$�=        @2wL��7@uU7�h>�@��[;�2@�'a��E
@�A� "�@�x�<�-0@ұ}���@٣��(�@�Ƕ�ǋ�@�74ƨ@�����@�n�P��@�"��@��C�Z�9@�ܼ�eQQ@�@���T@��ҏ�RA�K,��A�@d�`A����wzA�r�H)A	��y��A�5��*A꼯	��Aa�0�A'�qI�AG��8�Aj��]2A��-heUA��B�PgA����$A�EG��AJ�K�8RA���$QA�⣶��A��z��A0 b/W�Ap���PWA Z�?[��A �4��(A!�8�y�nA"P6��A"��0mA#����t�A$cc�]t}A%>ԲA%�1/M�A&�N b}A'_���A()@(���A(�8o�2xA)ɥ��A*��OO�PA+|z}�ҠA,]U;x��A-C�����A./�S�� A/!�??�^A0{p�e�A0���v�A1�yE�{A1��_;�yA2&���
�        ?�x3�,?�(ف�,�@��G���@0����)@?��qL)F@I׍�7�_@S9	�ch�@Z�zh�=�@a�E��&�@f����Zo@lKk���@q:��CW@t���B�V@xAt�*�1@|2o�S�y@�5z+IU�@�u9�E�@��qMq��@�\O��@�Ag$�@���W�K @����Y�@�`Y;]m@���|��@��*�e�@�O�T�&@����2@��ri��<@��
Z
�@��t�bz@���3���@��Dd� @�����0�@�.�-��@�&`vF[�@�Le�Y��@�zL�yD7@��-��=@��!��L@�4A_	(�@�����­@��[F)@�7��؉�@����jA@��B뷨l@�A\���=@� WV���@��0�g�@���8;�@�T�m�f@�#(�%�L@����;P`@��k��Q�@��1
f�@��[(?@�i9j���@�P���@�<"p�[I@�+�c��@� )���@���N�Q@����@�j��c�        ?PR.x�?�V��*�?��z���?�]��(�%?ն�=�s?�mg��V?���_u?�
A��?��gb	U@@�EJ@�M��ݒ@NK9���@\��G;�@�@d�O@b^T�p@ 齔�3�@#���s�@'T~Ly�@+v�|�2�@/�b4!��@2���<�@5^��G��@8��E��@<"�v��?@@���Y@B9z���@D��}�Y�@G6���(�@J	�@M%A���@P%�O�V�@Q��e�F�@S� ?��@U��V��@W�sYJ@Yٓ��=@\���a"@^�/����@`�cOߧS@a���Qr�@c5�y��@d����@f*j�<�@g�z+0@i\��)@k3:F�@l�?x�7j@n��,P��@p.r>��@q�y*�k@r
�����@r�z�$B�@s�W2�[B@t�S;�@u�q��I@v������@w�uTS{�@xƢW���@y���!@z�P~!^@{��ҳx@|��� ��@}�v��        @ �b�K�O@4J��� t@T	!l�w@h��N���@wY�vJ
@�����@��F.�z@���|��@��9~}N�@��Z��$@�Z�W�_@�<����@�e!|u;c@��
���3@�A�>FV�@��z��D@�Q�eA@���S��@���^� �@���h�1@�q���1@�?d}ݽ@Į���c@�bB�K�@�$�隤K@��C��n�@�ӱ��G@Ϳ�z{`@Ϲmn�-1@��!�@�� V��@��";��@�Lf��@�,?Y|�@�M����@�t�I��^@ؠc��1Q@��2���>@���R��@�A6P�@��J��@��%kz
@�Zl2��@�:n��4@�S#���@���Kj@�����@�V��f�@���Y@�<!��@�j�>ke@�i�FS�@��'�c��@�)�Yɕ@�CK�!z4@��jf"�@�`G=�@�ql�#,@�,N�.>�@��
 M�@�$��
�@�`�i��@��ĵ�        @��G���k@����%@Ձ-sW�@�^q�v�y@��U��uA%oe��AnQ"���A!Ɗ�^pA?�)�۬A ������A$3��W��A(-�y��A,l��o�A0v�I�IA2�*�uAA5N�}P�"A7�'런SA:�k�N�A=^���%A@ Qܕ�AA�H���4AC#�K�aAD�IO��PAFSo���AG���)AI��|��AKh��n("AM/ "�AN��<��APle�qPuAQ^�[��ARTUnV��ASO/�N3MATN{PݲAUR,�AVY��|ٱAWf�zm�AXvc���AY��
/vAZ���$H�A[�I�u��A\� gQA^	[&�A_4�hs�A`1�7Z�A`˟�J)�Aagޥk�KAby��oAb�}|J�AcJ��Ac��^gۢAd�|�v+AeD�=��Ae�rdH�Af��XƢ�AgV�B�Ah68�-Ahě����Ai��ʮAj=Φ9��Aj�T)\�%Ak�_�w+Al��*��4        ?��]���+?��\W��?�9V��^�@
'I� �,@�e6�$
@$b�4��`@.U�ph�@5!@�IJ�@<����@A�0��	�@Fq!̾�@K^���q@PdX<8��@SWKo�Q_@V�֝�zT@Y��A��@]�XV84�@`�%�@��@b����S@e%����@g�m:�#�@i�p���@l��d�@oT���,�@q82�l@r�]���@tIC-�@u��x�X�@wPE�F��@x�袀��@z�W hU@|�<�� @~Z(���@�KtUV;@��}xI@����H%@�${���@�j��}/@��fA@�-��ĩ@�B���@�\�� �@�{�_	@�����x�@���E��A@��cs��@�%	�݈P@�Y��"@�I�\cW@��M�H�@��e��Im@�)bq�ϣ@��EE�s@�sA5��@��?Z��@��xn��g@�p1@�@���\�@��Y��<�@�~�"6��@�2��>v9@��-�g�@��g%��        ?��"^�|a?�\��YMz?�˓{HZ�?����@���w��@�1�8�+@ �/n��>@&xdGD�@-&�r��@2J��HA@6`����,@:�m9�@?��UQG_@Bec���@E'��9�@H;f�@K=t��>@N�J�"@QF�@R�+�N@T�V@WL�N:@YDDg_�+@[��uiu+@^�:i�@`S���@a�ܘX�@c�ٿ�@d�N�TDE@f!MU�Dk@g�. Ҡ1@ili�ܖo@k,���`�@l��ս�@n�(Z���@pq�Md*Z@qz��� @r�c=��X@s�އպc@tܤ��m�@v
y��@w\J�!1@x�����@z�)�W�@{}%B�(�@|��h�w�@~
�^��@�	���j�@��%��V@��K�CH@���`gt@�z�6�\9@�j�C>A�@�c��ĞS@�f�.F��@�s����=@�����#@�����oo@��F|U.@���٭^@�e_]�@��%m�*�@����        ?�����G?����?�M���u?�����@�@�U�@�^zn��@���7�W@"�5R&@(�D�Ї�@/��ޏ@3�%r�@6�
�rE�@:��i�@?WU�+.@B��7�"@D�>4�ܼ@G;�_��=@J�ιF@M,BC�#@P9g���@Q�B��@S���:x�@U�#4@�3@W��0�@Z3�c��@\�, [@_$�ۡ]�@`���b@b]�&��@c彎{f@e��%�;�@gG�9��A@i$�^�U
@k �g-3v@m<9�a<@ox(	��X@p�g��@r)F�b	@sx�Y��@t�x���M@vK��}@w͉(!8@y`�p�@{eC�8@|�Th��@~�)cҦ@�+F��\@��(�)(@�8���@���C�@�)�t�l�@�=����.@�Y����@�}��Y�@��s2��^@��a�5�@�]� Fp@�]tW���@���1!��@��)%��E@�-r޶�L@���u��@�����z�        @:���`�@t�u�2�9@���?��@����ƍ\@�@��r��@¬L�1nK@�I@*15r@ұi���@�t�,�*@��ևv*Y@������@��1��S�@� ��p-e@�>�u��@�B����@��(�6�@��� [�@��8>��@������A f<�{BA�r���AٺT���A����W�A�v_�c�A	�'($?A��m��A�����A�KwMA�3U��Ag���A8�)M��Ab� 3A�����MA�gǑ"�A�ݶ��lA9�^0C	A{�`A�{ �w�A
�@�AW�.sҒA�%�:�A ����A!-&���A!����3�A"��,�NA#>����A#�!��A$�R��A%]9��A&��yt,A&�>���,A'���ܭ�A(A���@A(��S��xA)��Խ�A*y �.�A+8Fg�nA+��u�A,�9�1�A-|�R	��A.@�B5��A/fR�A�A/�T0        ?\��'�k?��B�e�?�Z�3t�?�E/X�޸?�{ݸ�u�?��� ,m]?����*�@5%����@�x��}�@�t-W��@fbk��@�q�}*@!;�����@$c�=_@'�$D�C;@+}�B'�@/o7Ѓ�@1�Pǰ�@4
�r��@6_����@8�T�w2@;Y'�;!�@=����q@@V���^@A�jA@C*e:���@D��>��U@F'"�Yi@G�/��Z�@IN x�#`@J�D�@L�����V@Nh9��9@P"�,j��@Q"7�=J�@R5,��/z@S\k^���@T��>���@U�`�<Z�@WG�o$�U@X��5�<�@ZAL
��@[�:=��i@]�ɺ�@_7�]�@`��P� @aj����@b\�?�T:@cT�7�m@dS��@eV�й-@f^�~�>@gj�Y��@hz�<�>G@i���0%@@j�,מ�@k��M#@l؎��@m�4T�@o֕���@p��]%�@p�G�\��@q?�
3V-        ?(W��/��?m���?��+k$�?�u�7�/�?�� �w-?ɓC\t|�?���^�-?�̘t�I�?�0qt?���<8?�#SJ?��M4�
?����k7?�;�~�hF@˪��T�@e����@
sbA��@�aT���@��e�@�e�m��@���w@z���;!@[�>��F@!�n��7@$-(��p�@&���|�@)��5�*@,�6�l��@/�vS��@1�3��5�@3�Wr�D:@6	D�!�@8k�q@;���Ɇ@=��!�Ѐ@@n����"@BM���R@C�� ��@E�LW��@GΊ��%@J�@s%@L`7R�[O@N�[c��<@P�^��l@RD�Tr&s@SҮ;�@U|O���@WCtD�@Y(�j�Z@[/ȦX�@]Y�7+��@_���m�@a�4�M�@ba���t@c���1' @eG:L2�?@f�!gX@h� ���@jQ�~���@l1h��6F@n+����@p z�#�@q9p��        ?z�?��?����x?�=I�x2�?�����?��:(p��@�z�@:��o�@'���*@$?z�>�@* �/@0O�c���@3��ژV�@7�{��O@<5W�
�@@J��F��@B��rBIQ@EK�ʛ�}@H�U@J詔Q��@M�h���G@P��̦I@R<�r
!�@S�X6Zo@U��4��@W�vS��@Y�a�U�@[�[uj�@]��4�8�@`	�<l�@a,L�WfM@bW�5r�@c�d�%��@d����?@fVe�Yv@gi���|@hˌu���@j:7�i�@k���o��@m>�b�� @n��q���@p<}���@q��|@q�Gт�@rޚs�j@s��R�@t��c}J�@u�E��n@v�֝r�@w�i��l@y*uO#�@z,a��2�@{]�VLM@|��:N�@}����_@/�4�AS@�F	�Gt�@��؋� %@���OE�@�s`* 
|@�9Y���@��ȸ@��.`�@��.tZ/        @q��>%@;a���8�@_�YPNH}@vA�a	vs@�p�ߚ@��ij�U@����(_@������Z@���U�Q@�����L@�9�P��@��Sʤ=@����^% @ì��
H�@�����Օ@�-ì� M@;B�,
@��pj+.^@ҹ��@��'H�@���/<}@�X%���@�^XA'*�@ݰ���:v@�	_D�ԅ@�B��@��i�@��x]W�1@�Y�_Ǻ@�u�-��$@��I}��@�BG�o��@�k5���@�=x���@��W&��@�|�od�p@�s��e�@�SFbQ�@�rX��v�@�h�nN��@�f��G�i@�k\�@�u���?@��6Ȼ-�@��:@��@��Ncàj@�� @��a@��ְ}�9@�"X���@�M�_��@�z��A U:7��A �*c��A����#A"r��Q]A������AYf^�7�A����ӃA�w���A/xFJ7A̕@�SAi����A�n��        ?dw2�`�A?�a��E�l?�c��x�?�BR���?�]�P<�?����6d@����"@���S@��$��X@_Mz��@�0G���@#L	�[&�@'Y,�@+&>F�@/�cڙ5�@2��ob@4���X@73� �@9��9�~B@<��æuV@?뜺bc@A��i�%@C?����O@E���A@F�v�m�@I�B:W�@K/8,|r@M{P!-`�@O���T�0@Q6��a&�@R��Q���@S���I�@USÿ�;@V�d�'=�@XNaf�@Y�0{��)@[tH(>8�@]�h�@^��qܺ@`:o�@a���@a���=�x@b��p6P�@c��st��@d��禵�@e�l�|��@f��4R�@g�@���@h�a|��L@i�KMN��@j�����@k�h#�	�@l��c��V@m��?��@n����p@o�m{�@p�M�J?�@q&��@q�ry4�@r?Hp�u�@r׷�K4�@sr�xJ�@t��&��        ?m�)����?�r�n��?��u����?�9�ej?���0�Z@�6L��@
�
��@�\�7�@knt5�@�&ס�C@��.8�@!�q���Y@$k��c�@' Uf��@)�]a�3@,�㨀��@/�A1ya�@1��H�@3E5/�@5��KP~@6�S_([@8�):�@:�l{h�Q@=4�z
n@?N���@@�(d�@B'����@C��p�y�@D�ձ���@F|�Uv	@H�j�_�@I�g�'�7@K����I@M����@O�a[�Џ@PՉdDp@Q�Q�#@S*��@@Tq�=�Oc@U͂��G@W?�I@��@X��<�f@Zm�P�Z@\,�	v�@^�����@`���@a���E@b/U�:?:@cat���J@d�X��@f,��pa@gs����@h�Z���@j����nO@lV%L
A@n*����@p� ��	@q,�~�@r)��F�@sNE}�"a@t����n@u�v���@w͵K.        ?G�83@z�?���7]�??��M�xY?�>L�+|?�uH��sx?�DA���?�JG�3��?��J�̌+?�F����?�MEjע?�!pЗ�@9:�L�@�7X�=C@���f@qO_U��@Dw��@4���B@Mm ~ݎ@��s��g@�[�?@!����|�@$%D�{�,@&�>"_�@*�m;�g@-n� �˰@0��@2�j@2�l��@4���/~@7z�BOW@:1h���@="�`<F�@@(?qg`@A��@C�we!@E���.�@G̲W�{@J�'�H@Lv��]
@O"i?��@P�\���@RP�|r@S�g�5�	@Ur�ް_@W%����@X�ޱi%;@Z�ž�E�@\��VZ@^�?Cou@`���%�;@a�H���@b���^�@d�$��@eb�T��[@f��y�F	@h!�խQP@i�ja�B)@k$`�f@l�ޱ���@n>d�#��@o偆t�@p̀y4=@q�Z��@r�=,c�        @ ��L �@B ����@ev��F�@|��w�E�@�8�;\�9@�M'��y�@�8ʡ*@��F�ؓR@��;g�B@�x���@��?H޴@��nj�j@�Ƨ�F�H@�n�/?�@�;Q���e@�*���@�<{F!�@�oHo�9�@�ag�B��@�y��@��ev9�@���I� @ؼ��3@���Fi�@�U<J�@�o�AM�@���3��@�HԄes�@�Pp�%�@��<���@抃��w�@�f֜��@��
\��@�2&�s@@��븄�@�|�*�}�@�|���@����I@�խ��;�@�M�,�@�j���@��A��?@�|����@�o��=L@�d��x�@�]@^#�l@�Y&��i\@�X*��@�Z5�j@�_/~��@�gg+@�q��I:@�L�v�A G��aLWA ���MLA]�=��IA�*GUGAz�y�hAA�wӔA���i�A6@�A�h'��/AiV�d�        ?�	��rڠ?����?�(�)�?�|�9{�@Ѡ��^�@y�>��K@#�9�b�@+� �N!�@2½�d@8m�`���@?.{0,@CW��0��@G��AFE@L�ruk�@QZ��&`w@T���ֵ�@X<�����@\<�=~#@`N���j�@b��=}R@eG�c��@h��\�@k���@nX!.k-�@p�U-)(@r��4@t���<@v�;�?�@y/{�@{v��R�{@}���@�>�]	S�@��T�7c�@������@�q�(
>�@��"Ļ1@��{~�k�@�,��Vz@���z��>@��(Y>�-@�pط1@�(Z��t4@� �$�[�@� ��zFz@�){�vr@�9J8 ��@�Q�݈�Y@�q�	sH�@��RAA��@��
-�e�@�*H��@�EY�1@�@���U*�@���
fy@�:�A?��@�N���@��n��@��6E�q�@�z���@�;�[ @�1ڃ�0@��jrǺ�@���Y$6        ?tj�}a0�?�V����?���b�?��	q�n@:nڂ��@���L�@is~>�@&0j��@-Uy�H*@2�T,h�@7G�:�r@<A���+�@@�#ds�]@C˘��@F�':�{@Jo��j�@N#�T�2@Q4셧@S0��e2�@UxQ�G�@W�I��@@ZN�Iu@]A�m�v�@`^]9�@a��� �@cI�����@e[��!
@f�GΘ@h�����@j���"�E@l�k6��p@o
3�'�w@p��|%@q�-M=�@sH�Tz@tn�۵7�@u̒�_�@w9]���@x�M����@z@���@1@{���'_ @}�DGe��@B��
�@���'���@�v:o�!@�m��'Yg@�n:ba@�x,�Κ+@��V��%�@���
�1�@��r̒Q�@��f�s^@�HׂX�@��'ֳD�@��Q~Ɨ@�M���xv@���:��@���#���@�_�9h,�@�*)9�&@��Q�'�@�ӎ�oz^@��9�?)T        ?�G[&��?�Ըq��,?��#y�@���~�@&����B�@3b=/#�@=�����x@D�s;���@K�x���@Q�kx�ӎ@V�Ou���@[�f���@`�T�_�{@d_�R�@g�	�[@kҚ��M@p%�%[H@r���'�@uE�����@x1�H���@{b�i�b@~���m�@�[����7@�y<��T�@�ّ͒�V@�Y��\@�@�]e�/!@����X+@��X<֔�@�D*�5�g@���e�@��Qc�G�@��ef�Mk@�� Hح�@���:�L�@���r0��@� �C?Rp@�Nv�ߑ�@���گt@��M[�@�%��+�@��`�:@������7@��b]]y�@��1V�@����}F@�wZË?@��ht@��� �@��ޭ�e@����(NU@�k�)Z�@�7]d�{@�(8�@@�Fb��X@�l���ts@�����б@��*V�#�@�1@�c@�T�b���@����JE@����	g{@��)�?        @'��Hc�t@eSN�c�s@�s��HxH@���O��i@�4�<�	@�X��D�@��@����S@��Sv���@ݚ�B0z�@❁a��@���$��@��t��Q@𸣌�|@��4��@�:)R��@��jY�@����3A�ļrrA�I?"A��5r�hA	d  l�AW]��#�A��M��Av�ƒV�AJ71��)A<���b=ALB�͆Ax�r��A����ҰA o��MA Mv<ւ�A!��K/�EA"�M�vNA$Ry���A%�:�;#oA'>��T!A(����A*]X�C�5A+�9���A-��k��,A/h��2U�A0�5�8D*A1�r���A2r��6�A3i��}=A4f�F�A5iS
b�^A6q�RQ��A7�d&��@A8�u�N~A9�GX�A:�,�J�A;��2�A=sYآyA>J���4A?~ׯ���A@\+�-�A@�|�f��AA�Uk� �ABA��T��AB�x�>�AC���&�        ?|���p?���j�]?��|�U;I?�N?�4W@@�5���@�؉[q�@ #�$r[@'3
��|@/����4@4�%�wa�@:&Q�3 @@��6@Csp$��@G����@J�Cرg@N�l1�h@Q�!vN_<@SүD��P@V�S���@Xyo�,��@Z��]�#@]gx5�"v@_���@aJ����_@b��:�A@c��i��@e^��'E@fŧQ*"@h1u^
;�@i�1�e�@k�)�;@l�=gC&�@n.6ue@o�A���N@p�~Ob�1@q_24\@r-����@s ��_e�@s�w��4@t�q�)1�@u��-�)z@v�Bk���@wn�J���@xcyO�@y^�-�e<@z`RZ�ĳ@{h�A�9@|w�,�s@}���9��@~�t�9@�U�/;t@�|�v�HP@���iP9@���TA�@�R���Zv@��㇬6�@��g�S�D@�Ib6�
@�����m@��n+���@�^n��sa@��1�4�@�ҳ��        ?�i��+S�?��[!��?�*�0?@t�L��Y@��Zi�@%Q
����@0Q�� ?U@7�PCyi@>̤�@C˹d�ԕ@H��`��@N?u�#�=@R1��U+�@U�A��)@Yh'^M|@]���9U�@a%�X��@c���!@f�^?r��@i����h@m�Lj��@pJ%����@r(�fN�@tDϔ�\@v*�˨��@xN��[�@z��5ڡ@|�JÂ�@Lٍ��'@��tC�6@�8��)�~@���4���@���Ί�@�m�J��@��e���@�yl��@�P0��!@���"���@�l|�('@�R�k�@����U�@���+~@����[@��A6Q@���S; "@��7��@��	��@�.�\v#@�R����R@�"�V�@��.n���@���b�@�2�H��@�~��Y'@�iqi� q@��4p��@�ɝh�z�@��lO@�@�9țB<�@���(	�@���g��@�� FED@�I�ok��        ?'<Dڭ��?b�}�� ?��H��:?�t��&�V?�Uy����?��|4�?������?�B�Og o?�=�t��?�Ő��(?�Z^�"�;?�/-�(
?�)M�#��?썐�Ys?�n� 14?�u4ru'?�e+�i�f?�Y5��P@����@LG�:�^@	c
G �@HG?��@\�B��@�KOx�@ޅ����@Z��b�*@H�8b(@!Y&LA��@#҉���%@&���@)��f P�@-w��7@0l��0P-@2�}W@4̽R�s�@7P��*@: ����@=Ko��r@@1UǝV�@A�#Cx�E@C���쯯@F$�^�@Ha�h��@J�q��Z@M��9���@PA��8��@Q�~&,!@S�L�ݖ@U]��^2@WT�I���@Yp�g�Ay@[�Q�O@^����m@`Z	�Q��@a����@c2ڻ\��@d��Q��@fkû�l@h.��ѿ@j��Q�@lT{���@n��y��@p(�C�        @�+kN@Y��6���@���Fr��@�����m@�J2"-I@��֗2�@�Ĕ
C�@@ɘ�J���@�p�7��@����*J@��6c�@ᾥey��@�\����@�=,��ן@�Veֳf@�θ0�[�@�US#�a@�D�=�H@���>A�b@��J"�c�@�H%�T��@���UDA ������A���8��A&���rAOՒ�AYA��5�ՉA�v0�u�A�r�2
A	KP��,A
��j�T�A�I/CE�A�&�7��A1.q��Aj�w��YAR�@TA���?��A�j&'�NA5ܻ��A�$e2	SA��΄�aA,��zA�7�ոA���`AB�vg��A��c�eA����YAy�Q��(A>��@g%A� �/A�aR9(�A�M�+9A}�酋�AYx���A8��UH�A�ܮ�TA ���aA z��A �� 2A!p�ݺ�A!�T��A"p�m���A"���o�u        ?c"�"}�t?�=r+1�i?�w���&�?�`(ާi�?�#dv��n?�]��&�?�T�m�@���o�@?TR�
@dVz��@�B�ª�@��G9�@�)����@���=�@!b])$>@#MHQ�@%�'��n@(-p�P3@*�p|q�@-����'@0Dor�T@1����1@3f��*�@5�0ѻ@6͎F�:@8�Kƕ��@:t�r��@<`B�B�@>[tv\@@2�w7�,@A?2�91�@BSE�J@�@Cn�<�b<@D�o7���@E�e܏��@F��Y�@H%Z�,l@Ie����y@J�l�^@K��o�@MS��Q�@N������@Pg��=�@P�Pq%?�@Q~*�0@R<���L	@R�8<�X�@SŻѝ�!@T�`4EF�@U__R��|@V3�B@W�2@W�v9���@X� �&��@Y��L�@Z��X��s@[��\��G@\��.�'�@]��~�H�@^��f[@_�V�
�^@`s&H]Q@a!��N        ?Nm�Mw��?�Pu�$�0?�XL�	��?�'@b�u?�-�?�D�?�R|w�2?�R�>�L?�����]@ *+5N�@H���\�@ß	�@��Q�	�@x�- �@b��T��@�J{e.i@7���"�@B�#ְ@!��`��@$q�,wWE@'G��~v@*ml��b�@-赚��@0�9�L �@2�}��r@5T)��@7� 4�R�@:�Š�@=���?c�@@�R=b�@B�e�tn@D���1��@G��C�@I�K�b�@L[�X�@Ok2:�@Q`���@S2NS^�@U*�O��@WN�>�L@Y��aEQ]@\+�"�@^Ϥ��O:@`۾�ξ@bl���@dsn#�@e�VӁ�M@g�%<�)�@i����Ӧ@l�E�F@noS�T�@pvr�86 @q��[��@s04�@��@t���SM�@v?�-���@w�˧۟Y@y��E7��@{�]>VF@}w����@�� r2r@��c��x@��!u�v�@��x=�;        ?0�6y?jq���?��VP?��AM�?��ݴ�&s?�*?у��G?٠pR�?�ő��[?�u�8�?�$OU�?���`i�k?�E*(�0&?�3ѳ���@ �2��;@��:C�T@m��Ș�@F��7�@��fK!@&R�r�p@Ɛ1eF@�uS�Q�@���Gp@\��m�@!n��@#1˩�@%y����i@'�c�t�k@*��b�Fy@-����|9@0\�4ʠ8@2K��!@3����ؒ@5յ��ʰ@7�Υ�p�@:%Zcd#-@<��l���@?X"��@@ڛ�Y0�@BFK��Z @CȲ��;"@Ec�����@G�?D[�@H�EG��)@J���@L�ό}U(@O5��@P��4i�@Q�h*�R@SNN��3@T��qc�@V=��H��@W�p��qN@Y�+)���@[b6udv@]M��."\@_SD���@`�ij@�@a��J�@b�[�%@d5hW!)�@ex4c�k�@f��Ns��        ?����S@2j�J1^�@UB�#�@l,�e��@{�D7Dj�@��^�<L@�ƙ���b@���/s@�϶�r�@��g1 W@�����&�@��n]��E@�	f�k{�@��G�TX@�, 0c
�@����ĭ�@�V�cJ��@�(���7�@�'R�'#@�)���@�ז�-~
@ĜpCaz:@�xF��9@�j�8�=�@�si�/r�@̒�k��@�ƀԡ��@Ј<ˍ<�@ѷ�k"�@������@�66�O)@Մp�]#@@��>�h�@�=6V>;h@٦�]���@�5��di@ܓ�&�W@�k[�{@ߡ n�@��͌?�@�f�= ��@�7�p,@��{X�G@���-�@����@埧�CT�@�D~K�k@�j�P�J@�Vc��"�@�F*ҫ�@�:d��I�@�3^��X}@�1r`��@�5���@�>�z��R@�N�"(�@�2�/?>H@��˓��@�T�+
n@���yjwt@�;pӂ�@�'o�Ͷ[@���̓\�        ?m$����?��r��?�MHs�?�J�7lM�?���.�^�?�Q���gh@�J "Р@喺` �@�.m��@�Uc!S�@O�c /@"/P6���@%o1�+�@(����@,�:�rN'@0:M��]�@2F��=|/@4n���m@6�k>J��@9D�g�@;�L�c�'@>&l{0L�@@nBƾX|@A�˂���@CO���1@D�1@��@Fk�C�,@HIN9�:@I���
T@K�5te�@MM��YH@O)쏳�@P�쎞�@Q��p�E@R�D[Z�@S��9+8@T�B���k@U����@V�z��@W�D���@Y�k��@Z;aW��4@[n����@\��_|l@]�)|�Ux@_2��y�"@`A�A0�K@`������@a� �"�@bR�[��B@co� �@c��@��@d��<5�@eR	*:�@f���d@f�ej�f@g�\��@h�T�ӯ@i�*���@jk�N�z�@kX�O߫@lKs[<�@mCƞ�10        ?MA;�|w�?��H�T?�v݂�5�?�m�B�N?�%�).?���{F?�ő�@?���qM:?���k�f@��(�y@����(P@
P��+@R�*EH@d�g@��@`�՗d�@�X۽�@6ۧ�1�@ K�v�@"4ť��@$��g�'�@'1�C@)�8�t~�@,�����@0��8@1�2լ�@3���dG@5�%Nw��@7�/���Z@:P����<@<ҘJ�Q�@?�J��y@A.]'ī@B�ik\{`@DV����@F,�a�&@G����i@I�=��S@LLX��@NA߳��@PQ�Im��@Q�Z���@R��W��@TX&���@Uط�|U
@Wo�rb�I@Y�3��t@Z��i\R@\�Y�Em@^����_�@`j8\�@@a��Z�$_@b��N4�@c�u��h@e6r@άe@f��%�F@h	�[�_@i�ʅ�k@k/�� N@l�n�c7�@n�����r@pJw���@qIC��5�@rU��4%        ?a�F��P�?�c��2�`?�"qb�?�
�%7?�Q7w?�2�i���?�"��P�?�_�x�;@ ͐�8ր@���j@ܰ�Ө�@UӶЋG@O@�����p@i�s}�@epj�@�@����@ 
u��|�@!���L@#�|1�@&%��w��@(�����@+ {8�vq@-��D7��@0�1��`@26=�OL@4���� @6ފ��@8d�+_	�@:�!��@=���4W@@h��Oh@B#��2l@Dƀv�A@F7�+�_;@H�K��@@KEx;�H@N95y���@P��>JA@R��8�@T�fݬ�@V��/�3D@Y1+��@[�5��?@^�$�̚@`�i��)�@b��+@d}z,�$B@fy&�E� @h���;@j�w_Of@mPKD���@o�eY�@qT�����@r����ʀ@tW�AJ��@u����@w����@y�����
@{~pT?��@}����K�@���O��@��vƔ�        @@d�X�@@@�z�&2@b3XW��@wϻ�Ʉ�@�Sl~��@�<N� �@�lB�奋@����dK@�w�V��@�{���g@������4@�k�[�_e@���T��@��
�,�@�?LE=7@Ĭ�ɘ�Z@�:cl� �@��m>�@̵B,Su@ϣgt%=�@�YBY�ֽ@��z/Uߘ@Ԛ�h{�h@�T�K~�@���*^@���ڴ�o@��<�iB�@��ԭ�=�@��r!�n0@����=�@�$O-�.�@�D�ï�@�l־=�F@圁���@��vUȈ�@�yI)B@�VP�QBF@�ƣ��@��xk��@�K���u@@�V�-ެ@���b6�@�mG+?�@�vȃ�jj@�3�㥢@���x���@�6����@��ٵ�@�RT�xi@�%ϵC]@���3���@��V0~}@��z�@��k'�Y@���`�x@�������@����ae�@��<���@���u�y@��V3d�GA s�	��AWp��A�!�~0        ?/�v��?p�  q�?���'.�?�qFP��?�%��K�?̈~�z�?�t8����?�\�T���?��V��!?�x�W�?�U9_)3�?�N�< 5e?��Iq�1�@%�q��@��7�t@	�3�a!{@�~��(@/�i%c�@�G�!K]@R��%z�@)�ISJ@-��ۙ@`b�`3@!`�F3@#(��h@%�G(�@'MR�:�@)����H@+=�}��@-��Ah�T@/�%�@1.	��V�@2x~0�P�@3І��@564TVKh@6��I}o@8*��#�@9�<��:�@;W��u��@=s�?�5@>�,�@@E�T6J@A3�C��@B*��#!�@C*5� ��@D3X�-��@EFXo�p:@Fc��Zg@G�S�v@H���bi�@I���\@KCRp@��@L�i��@M�L8��@O\ۀ�@Pg�����@Q&�hy+�@Q����@R�~��@S�����@TTŃ��)@U-1���@@V
�����        ?Qr(#��?J
�Fb?s�y���?�9Z>���?�EP��-2?�CqБ�J?�n��U�?�ސ��%�?�k��M?�P{��88?���n��=?�F��5�y?�'\;k�?�)m��ƈ?�Zq��?���H��?��*�Q�M@�`� %@�`d��@�dvw@b�<��@�y���@�2�_@�Gg�@ 倫�٬@#��:�@&�d��@*LU�|��@.7�[#@1K�O�@�@3��ʰ2�@6n�
.K@9j�$B�{@<�y�s@�@@+;�R�@B'M2�F@DR���B@F�<� �@I?���Y7@L&Y^-B@O�r��@QE�&�@R�d~�b@T��o]׿@V���W@X̂� ��@[�]lZ@]n�2@_�!)˭1@aQy�A@b��ׄh@d6����@e�����e@gg MM��@i�ˉ<@j�`gwm?@l��spF�@n�����@pFےR��@qGt����@rN6'~��@sZ����	@tl�}�        >��LV���?9aJ�b	�?a6�ZL�d?{�i��B?�N���Z?��,tZ�?�}���m?���zL�?�H3vL(�?�O	}F?�-��s�D?��`��?�N�OR�?�I'�?��?�E.�9�?� ����?������?��s\%�D@ �o�)@�Y>�f	@g����6@�����@�8@z�ɐ@�(|�9@[���-�@!�����@%�	/�n@(���=1@,�E�0�)@0�l�D@3>5|�@5�ެ��/@8�=��x@<sR�w�}@@%w_]��@BB�=J�y@D�:~�=@Gd2A@I�f�uA�@L�ßbq@P(~U��@Q����8�@S��\��@U��N%5�@W�;]<�%@Y���=@\ UQ�-@^�!iCi�@`�=l޺2@a�:�;-@cI����M@d���*r�@fC~U��1@gج7ͻf@i~��W�s@k6 j��@l����0@n�H�W@pf�K�@qhU��^�@ru;N���@s�;��*o        ?�>i�2�?����*�+@ w�, ��@7��0uo@I�Z�>@V��(r@b�2�@j�0��@rj~�6�X@x��x��@������@���p	5�@���i�@���;�k@��`lg2�@�3�׀�@����#�W@�sظ�o�@�M�tel@��5m��@�� ���@�x�U�I@�-J@�@�
r�
:e@��)|�@��)M$�@�O�E��1@�_,@�&@��E�;
@@������<@��"�b2}@�l�T��@�TGj	�&@��xb�7�@����V�@�V	o�f@ĩg@�}\@�

̭.�@�x=�̵�@��_��"@�~�k�B@�U�Y1@��s����@�{ �j@У4�P�@ђ>�	�*@ҋO����@ӏl0+M@ԝ�c�e+@ոb��+�@�ެu���@�Ћx�@�N��i�@ڗ��?�@�� �~L@�K���^@޴K��~@��B�W@�ҏe�~[@�A��b@�^�b\y@�,�� L�@��[�3