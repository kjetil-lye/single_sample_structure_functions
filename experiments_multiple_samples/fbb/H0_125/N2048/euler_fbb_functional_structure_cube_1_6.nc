CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T113708        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?�P�]��r?��Ž�?�"��N{ ?��v��!�@=�!@��}Y��@���D�@��U8�z@}�x^��@[\
�C0@!C�-��@#�<�E@&ݙ?��@)���"i9@,��W��@@0� ><�@1�|�@3��a���@5Z~�D՚@75�K}�@9�WoH&@;�guQ@=��e e@?*�H�@@�Nݍ�M@A�~�g��@B��M_m�@C� �Ŗ@EO��o�@FJM��=@G} �D�}@H�NН��@I�����@K6Z2� @L~�_k�@M��eII$@O�<��@P;�*2K@P�%8a@Q��Kk8K@ROB��@S66��}@S�����@Tx&91��@U5O�@U�B�ЍS@V���Q1@WyV����@X?-Ly�@Y.��@Y�Vl3�@Z��{��@[l��&@\<��nD@]2���@]��F�@^���!�	@_�_X�e@`7d,
@`�jU�@a�����@a��6�:@a�6��K        ?��e&���?��[��7?�C���A?��,��v@"�A�[@��&�dL@�3fK�@i����i@���@#>;J.<@&�T���@*��c$�@/8��ȱ @1ᒅ�A@4H�>�5�@6�u4I�@9x����@<@iM�@?'�Mg�@A����@B�\x�;@DG-�q��@E�5#p��@G�'&}��@Iz���b�@KQ���b1@M5�_�@O&�� �@P����6�@Q��(�/�@R���4�i@S��1R@T��Ba��@U�wPx��@W��TY�@X0�q*p�@Y^2�+�b@Z��@[�H�8�@]�h@�@^I]`-��@_��8��@`n���	@a�~x�<@a���8m"@bp�!l~�@c �C.p
@c���@d��U���@e>�d\�]@e�����3@f�_'[ו@gp�B6R@h0��^�@h��h�@i����I_@j|�.��,@kD��N@l����@l�Uʿ��@m��5(�@ny�%d�Z@oK��U�        ?�hs12t?�~��,�?�f5}�s?����9@���iM@�<�
�@M�>���@Z9��@!	S��57@$���>@(����8�@-	3)�"@0��g�6@3F����@5�#���C@8��d��@;{�P @>~z�}n@@ѡ�e4@Bt���;@D(G\̍�@E�� �@G�y̈@I��m� �@K����@M��$ߗp@O��a?�@P�
�+U@Q�ɳ!��@S�����@T<�V��+@UhT�~w@V��̾K@W�`�0�~@Yt�*٪@Z["��p@[�T��X@\������@^U���s@_�Q���@`�p�lQ�@aD����@a�:�G� @b��C��@cz&�p@d<mn�er@e�N�)�@e�����@f�����@gbt1��u@h2��=tB@i.�s��@i�s��s@j����p@k��X���@lmգ�@mNL�1�{@n1V�KS#@o�H�@o�
��'@pt���J@p�_=r��@qc#0��}        ?�ӈAy?�#�w��@��=�L<@�li�w^@��a�/k@���50�@%h����@*�_��R'@0�]:��[@4-��@@7�&R��@;�8���4@@�TEp�@B[(Ԇ?�@D�<��1�@G/:j��@I�E�D@Lo��R@O6_Q��1@Q\�J@R���@T��s��@U���2@W@Y�S�_@X��
q@Z��6��m@\\x�{�@^%Dj��@_���f!@`�Q���W@a�e�!^�@b�+���k@cы���@d�n¤n�@e׾��h@f�e|!�f@g�Q�r��@iq�V?M@j��t�3@k2	��W@lPa3�Y@mr��v@n��=[F�@o�̏o��@pxC3͊�@q����@q��t?)@rG���@r����4�@s��4���@t'p�۽�@t���L@uo�p5�3@v{�?�@v�����@wh��2@x���c!@x�ќ�f�@yp�'Ţ@z!+"�Q@z�44�L�@{�Ɍ��`@|;�S���        ?�R��7�?�>P!���?�A�"1?�_����r@ a���@X+i�@u����U@��愤�@��^�v@��J^�@ B�k
X�@"����Ĝ@%�2L�0u@(���:��@+�ǐ�%@.���6�@0�!8���@2��l��@4r΅@6B�.>�@8"QW�N@:��e��@<*H|�@>�t,�@@	=?6@A&Q
@B>;�P[)@C\�+̚@D�
�@E��QY��@F�dW%˸@H�L��@II����@J��P~l@K�܊}�@MA?j�@Nk��	;I@O�Ss�r�@P�8@K�@Q=�6��@Q�Uq���@R���P�@S\D/u@6@T��_@Tј��@U��v2Tz@VO��X@WuI��@W��NH=@X�����@Yfy�3y@Z1:���@Z����@[̲g�g@\�^�b��@]o�eB��@^D���*"@_�<��@_�B��@`f���G@`ԧɷ+�@aCT�
�@a�4T��        ?ï���!�?�"�q%?���*�?��:φ�@�ȻY�I@�ְ��@�?��=@�9M�@ �X���@$-�*	T @('�!�@,X�B��@0qSZ�lm@2ܘY�ۻ@5mҒ��@8"	q�~@:���mi�@=��f,�@@��n�S�@B*�9&�X@C�sЭ`�@E��dU{�@Gm����@INҖ)�"@K?W>Q�@M?��{@OM�(�N8@P��8�x4@Q˛��ζ@R譨So@T�]Æ@U7����@ViB��@W��E��r@X�=U��_@Z%^V_��@[pɿ7�@\�f�ӡJ@^�]��@_w�br�@`m�d��@a"��B�@a�+��f@b���0�;@cQ���˿@d0�A}@d�ɜ���@e�:#ȷ+@fbJ��)@g,���4@g�$^�MS@h��G��f@i��]��@jp���{Z@kG�R��@l!S���&@l�4�鎣@m�n� @@n��T�&@o���b<�@pA��!@p����@q*_�ڞ@        ?����Bx?�閔tR�?��0�3�?��[��D�@���ʭ@��N@��>��e@���HL@ �m�},J@$8��kޔ@()��G��@,jX��@0|C�$@2�* Ù*@5{wTb�@82?vM�@;�m-8�@>
u��e�@@�J�X@B6Dr~M�@C�݊�6�@E��f�@G{�RT�@I]�H13s@KO���@MO���ML@O_�@v�@P��L@QժD���@R�kz���@T=mK�X@UDQ$�\@Vv��z��@W��]0@X�e#@Z6�Oz<@[���/�c@\����Z@^0�{/@_�[�J��@`{m*=@a1	��0�@a���@b��)�(�@cdU��2�@d%���|@d�!�@e�<���@fz�A��k@gG)h�}2@h4R��@h��E��>@i����5@j��v��@klA��@lHk^u.@m&f��[f@n'�@��@n�S-�Z7@o�ߏG:�@p[���(@p��o
��@qG:�v�        ?�ط��Y�?�Ië�~@ d�ä�@�Ń/bA@,��\DC@��oTLa@#�nD ��@)?L�4f@/K)�p�@2��f��@6x`؄�@:=���4�@>=L�I^�@A:7��&@Cp�/�ټ@E���b�6@H)����f@J�ߢr@MD��~@O����Ό@Q\��L�@R���W�@TCX���w@U�!�]�@WR����*@X�l�ڣ@Z��!�@\3hX���@]�1�-�@_�����@`�KpH�@a��BA@b��^�@cs�C	�@df���2@e^"�s�4@fYH^g�]@gXT��p�@h[7�%9@iaߤxtF@jl=�:��@kzA�\�@l��4:�@m��`��@n��@*�E@o�Ž�k@pz����@q�8�@q�!�*��@r3�E.�@r�"�/}�@sb�v�@s�t���>@t�n�p��@u2���@u��J�+@vpn+��f@wdp�@w���>6�@xW�� Z@x���e�@y�]`{�@zKBT �y        ?��S��Q?��4�� !?��*:�!�?��&}?��n]�@���(�@+]�B�Y@�c|%Ej@��M4��@r"3���@ 3<xdPy@"�^zx�@%���D��@(�֮D	�@+�w�D�K@.���/"@1��ӣx@2���%��@4�4r�I@@6YXԔ�@8=���;@:.�r�4�@<.�����@>;���q@@+?/A@A>�q�@BX�p2]d@CxeE�
�@D�*�啈@EɯQ�=@@F��SZq�@H1g
�@Im_�klE@J����ނ@K��K@M@���@N�6`X�@O��^�g�@P��6q.M@QPT4撕@Rf���L@R���s�@Sm����@T&�5�Xr@T��|��@U�Fp�=�@V^�}oL@W |�#D�@W�4���j@X��-/@Yq�D��@Z;w[O��@[*;q:@[�����@\�Y�1�@]u�eȔ�@^I�Y�@_-0=��@_�X�!M@`f�o��@@`����@aB5��y@a�'o�H        ?ñ�B�L?�+�Bո�?���pƷ\?���(�@ y귱7@EpB7@�4��@�ǌ@ ��1�@$;?m;�@(*ث���@,i�oj��@0{�\�v@2�v�`@5x=V4�@8-�6��@;&O��P@>����G@@�I�f*8@B1���>�@C���[w@E�`���_@Gvz�:�@IW�ED�@KHʬ\�@@MI^��"v@OY%d�M@P��4�3�@Q�u��	@R�F�A�@T,nQp�@UA	�&�Q@Vs�>���@W�8,R�@X�Tpݕ�@Z3��f'@[�,��@\ԆZ�@^.6��C@_��*Θ@`y��-;z@a/�-�@a���#�@b��ġlt@cc2���@d$�ˉ��@d����|@e�خV@fy�}�!;@gEը"��@hȍ_�@h�QR��@i�d��4&@j���?A@kjr<#@lE�C
�@m#dbH'5@n��$V�@n�7G$��@o��ط�@pY_.gZ@p��e���@qC�w\<L        ?�랧p?�+�+^`?�옞�@y?�����i@��"��@��V�@�R&\�@�����[@ �>��s�@$5�QV@( *�(��@,X13�^�@0m�(��@2��^ti@5_�����@8�.��@:��;++@=�o3P!k@@t6[]�@B(>Á@C�C��ڍ@EuA:�ϒ@G?�i�;�@I�>u�@K���&@L��+:?@O �G���@P����b@Q�:���@R��X���@Sӥ���@T�q���@V%��Nҏ@WX�'�=�@X����T�@Y�I���@[���@\b��D1@]�N���@_�=:@`4��g��@`�8M�U@a����G�@bQ�`�2r@căw��@c�q�x	�@d��/M0-@eI�8��@fs��O�@fէ��(y@g�d���@hk��d�@i:X�C��@j�1�o@j����C@k��ke�z@l�F�Js0@mg�/� @nD�7*�@o#��-�R@p��)��@pt[�I�@p�1_ȱ�        ?�`G@�ׅ?�� ��Qq@�T��Y>@.��5�@ތ �Eh@ l%@%Z�	�z,@+M��$�@0Fo�@4��&�f|@8X�c�@<tsq��@@h1X�X�@B���X@E۞�Sb@G�iT�y"@JJЯJ�@M	.|�C�@O�h2�?@Qi�Ή�@R� -���@T�6&�'@V(��K@W�D��o@Yx�X�8 @[6wP�@\����D@^�t��6�@`V���)�@aJ���@bAԕ�Rn@c>8��)@d?��r�@eDb]�.=@fM���P@g[�:���@hm��Hk@@i��1�v�@j�nu��@k�0q/�@l���q�m@n�k>�@o+4�l@p+�a V@p��O�e5@q]��ws@q�p�d`@r�Gy���@s5JZ*Q@sՔ5T@tw��1(@uV>��@u��iX�!@vgcq�Br@w�N��@w��R�{
@xe�bsf@y�^a�@y�J�! �@zp��@{!a���@{��:&@|�m��t        ?��wB��?�K��X�K?�S�{�B?��1ȸ��?��{+�@�u�;ou@��r"�n@(�r���@`-���*@���V��@�K�&!�@"| :.?@%6�=�<@(��d�T@+��u�@.6�@0�� �0�@2k�:<@4+=�v̢@5�q�A��@7��	�@9��.V��@;�]��%�@=�\��x�@?Ґ��4 @@�\�|R�@B��C�@C,q��,@DO/��}�@Ew�<rA�@F�waF @G�����@I�>��l@JTJ���@K�Fzb^$@L㜌�5@N3.�g�!@O���Ts@Pp�U}��@Q ���W@Qѷ.��@R���;�s@S<6��@S��Vo �@T�^7�t�@UlY��Z�@V+����(@V���U�{@W�9hp@Xu��]�(@Y=]b.�@Z����@ZҷT�J@[�cF�ƪ@\pL,��@]A��z�6@^� =@^�_�C�s@_��.�@`MU�4I@`�˯�q@a)-�v&?@a�y8vl        ?�{p�Cb�?����2B�?��2���0?��T"�P@�;ݕ#�@��R���@�ZÆ@gv�ts@ x{��w@$�Kp�@'�Ȳ48t@,2+̇"�@0[�� �	@2ļ>u@5R�����@8�c��b@:��"�	3@=�+�|M@@w�b=a{@B��Z@C�BU��@E�16�*�@GVN>R1�@I6[�b
X@K&L�`@M%Z�0%@O3�,]:�@P��_D/�@Q�ܱlO+@R�Z�7x�@T�L��@U,�����@V_�r�X�@W�����@X�$��(�@Z!��]��@[o���+\@\�hZ;�@^8z�t�@_��*un@`tT���{@a+m�n@a塩3�=@b��2��@cc4�%I@d&���mD@d�ōFߝ@e���Ok@f�19Б@gP�J�1]@h"����@h�R�E@i΢�2g@j��g2��@k�gs��_@ld�=�D�@mF���5@n+tظ��@o�{��@o�l���?@ptZ}1|s@p���+2@qd]6        ?�7.��?��ͮ��?�L�$��?����!b@A1С�@�'�(K@
O��u�@s�-@ E%_�@#��=�@']T��@+v�L��@/ڠ�@2C��!�A@4�o�*�@7Z�ȯ�@:��#��@<�^��h�@?��	��@A�1X��@C.��>R@@D�T�@��@F�T��@Hn�o��@JK�h���@L8jj�
@N3aBJ�@PF��+�@Q)ځ�i9@R<N@�@SU����@Tuf�$�@U��ʹv@VȾ0?uI@W��N@Y5� �;�@ZuB�k�(@[�y!v�@]�5�V�@^XX��b@_���c�r@`�X�E�@a7����%@a뮿��@b�o&5�v@c[ۏ��b@d��|@@d֕ ��@e���6Ű@f[�:���@g!؂rKb@gꑏ$t�@h��_�R�@i�@�m��@jS%�f�@k%\�"7@k��63�Q@lЮ˯lu@m��|�?�@n�B�]{@ob�)�
)@p!bź�@p���)k        ?��"fO�?�oؤ��@ }�A���@"��@Q�n%A�@��(N<@#�ߡ�@)m�����@/�fRh�E@3#8�R@6����:@:n6)ӵ�@>uLއ�@AY�ķ�k@C�*�P��@E�^��Vo@HU�~��@J�D���/@Mxw�J�@PL^^�&@Q{��o�*@R�+��@TfTHu=�@U�_ԗ�@Wz~/կ	@Yp�~c%@Z���0<�@\a�̥$@^��zC@_�ԓ`�:@`ͺ� h�@a�ND@b�샀@c��v�]g@d��%���@e|���R�@fxM�D�A@gw�j���@hz��@��@i����Q�@j����g�@k��L�va@l��@�@m�fW*a�@n�1n��@o�6�Z��@p�4�E@q�1-@q�p�O@r>�o�^@r��_�U/@sj��J,-@t�6syh@t�^UV�@u7]90�@u��`C��@vq�;o?@w̰��@w�d�C�R@xS[�D=l@x��B��@y�\�4v]@zA^B̓        ?�����_?��^��N?��H��E?�*��?�̹je�l@,�f�]@MNе�O@��M'z@�F���@��ӒL�@ J�~��.@"�鎏6~@%��2C8�@(�D��@+�e&��y@.�4�>kA@1$�ƨ�!@2����c@4��L�o@6�g�\ߏ@8m5�*f�@:d�*�f&@<jx��M�@>~i����@@PN��@Ag�N2�`@B�+�L?@C��@D�_�u�@F��ӝN@G?�C�Yi@H}��T�!@I����7�@K]���a@L[�Q�@M�gw��8@O{�6n�@P6IN�@P�/�8ܢ@Q��Ö�@RW�}�.Q@S�����@S�Zn�n�@T���KI@US[v��@V�R%@V�@�?e�@W�R(HE�@Xv�Z�:@YE��#�D@Z�5���@Z� �I@[���[>�@\�x�ޅd@]q�X�k%@^M�ć`<@_,	L�
m@`=|��E@`w��`�@`��0�Q�@a]$B�z�@a�~�G@bFٲF�        ?�!�,?�x�YL?�;��T�*?�m퐊�@[�&�Z�@U �#"@
�*�@H=7��@ ���SuM@$��w�.�@(��*�F@,�'-�M
@0�e�f@3''w�@5�R�]0@8~t�@;`�xR�*@>f��f/\@@Ǿ�~Fa@BmQ6���@D#�{LU�@E�˖[%�@G�(�"{�@I��e�]�@K��8��@M��G�s�@O� 4U4I@P�'[�@R�yc�4@S-\'@TV �ͦ�@U��(|�@V����@W����@Y?��Sx@Z�e[s��@[ݹ��8@]6�ӱ�@^�5�t�y@_�3-ꍑ@`�J�."�@am��Z��@b*�/�@b��Ѕ^@c�N����@dq��;5�@e:��.�@f>�E��@f�����@g�Q�b��@hz�2 ��@iQ�}di@j,����@k����@k�Y��D@l�����3@m�"�?"y@n��CRq@o��L�@p7����@p��vcn`@q)�0[�@q��ّm        ?�bD�:<\?��v��W?�F����&?��|p�ظ@.��v@��28w@����x�@�J��N�@�0��V@#l:ʽ֍@'.���i@+;n����@/�z.-p?@2�R>@4�j��'@7�G��@9�ı��@<�r���@?���*�O@AR�K2�}@B늗��@D�Fs�B�@FI���@H�$��y@I�<�7��@Kë�\+�@M��a�h@O�ӂI�D@P�^�H~@Q���L!�@R���df�@T�����@U2t_]�3@VW�]<#@W���_�@X�҇ox@Y����Y�@['����@\j�I�:'@]��}B�@_hX��@`*Rt�c^@`���q�@a�*�
��@b8!i�m@b��_��@c��r�@d]�M��@e	���@e��sS#�@f�
bx3@g]�}��@h#����P@h�F'���@i� �h�@j�߭��@kSJ�g�5@l$˷�'U@l��t�@m�^��N@n�c	~��@o���cOB@p.`4���        ?����.��?�@&��#@����}@Ԋ1���@]�0�5n@ gqS�gY@%�f�RF@+뜹���@1Q�b'�@4�O'8��@8�X^ψ`@=!���80@@�K�]�"@C)��U��@E�ڥg8@H=̪�a�@J�|M;}@M�`�9@PY6���@Q�֞|@Sm����/@U���@V���Ð@XjRoZn�@Z+���@[�fV�@]�U��1R@_�3Νf�@`�c��@@a�h�I\�@b͎2�-�@cӷɷ�9@d����7@e�"��@gC�K=o@h}иǅ@i:F�]u@j\�W!f�@k�@J8d�@l�P�H�@mݯ8a
�@oPW��@p$�ٞU@p �o@qb�%���@r���F@r��~U�J@sN�C�mR@s������@t�ob�@uL,g��@u��[��C@v�:2(�6@wZ��Q@x�0"W@x�k;|H@yy����@z1U����@z�Zg�e@{���o�@|djv�@}#l�&��@}�:T��        ?���u�>?؍�{Tf�?��k\�?���n�_9@ TΗ�@�'fL�@���@
��I�R@q�?Ni�@1���8�@ ��2W�n@#TM�̄y@&,���W�@))�z�Q�@,K6�&5!@/�f�a��@1z�a�o@@3>C$G�@5�n�a�@6�L(��@8�%!U��@:�"�2@<����~@?i��@@�q���@A����r@B����L�@D�����@ED���?@F}�V��@G�D��{@I`M?h@JO7g$-@K��mC� @L��Պ�,@NXdy�%g@O����@P����@QK��12@R��	�~@R�N�@S���8��@THTG#�@U�{�@@U�{_��/@V�'C}�:@Wq�C,�5@XB}���@Yh�I@Y�<��@Z��T�:@[����@@\}�"�v@]]��U@^@je��@_%QR��@`G��,�@`{���6@`��nLaT@ah{���@a�(��L@bYh�I/.@bӾa���        ?�	X<���?�8����?�X���"�?��@dI��@:���*�@���޳�@��"�@���NH�@ �^���@#��66l+@'T��)�@+n��A��@/��G>�@2B��k�@4��ŀ~�@7_8���@:"+�)�@=����@@��T��@A�HY��&@CAL��B�@D���|��@F���~~@H�����@Ju�5g?@Li�����@NlԷ�jE@P?�t��>@QP;b��@Rg�;@~@S��I��@T�-(�i@U�k��F�@W��	@XI�/��@Y�x��a:@Z����e@\#�`~�@]x�\(J�@^ԙ�M<@`u����@`Ͼ/�X@a��M̔@bA���0@b�����@c�W�H��@d����C@eH鐙D�@fc��i@f��_F�'@g��t1H�@h~Q�on @iR�C<,@j)���R@ky�6��@k����[@l��u��@m����l�@n����@ok�R�@p*�~��@p���͛@q�w`�\        ?�5�g�Q�?�S��)?�<�);��?��&Ah[�@{u	B��@�2�o�#@4L=�q@C��%X�@!	5��@$�sP��@(��ϊ�@-��m5�@0�ɬֶ7@3e-���)@6
u��{�@8���M@;�x@>�M����@A��,I-@B�P�v�W@D|Y���@FN�l{�5@H2���x@J'FQ�O@L,�*@NBǊ+-�@P4�)�4�@QO�����@Rs�y@S���&�@T��B\��@Vy��$@WM��� �@X�H���@Y�c��Z�@[@�EZ~@\���΀{@^��$��@_u����0@`upF�+@a3��x��@a� =�e@b�&N12@c��W���@dNa���@e���*�@e������@fŬ���@g���ըo@hzҗ|��@iZ3��<�@j<�i%,$@k"o�[�@l<i	@l�!��@m����@n���@o�+s9;@pb���Du@p�$��.}@q_(�RA@qߦ�p�1@ra�!��        ?����?���ui@oc�_�@�����.@�F�ŝz@��3=N�@%���l�@*����V@0���l%@47�-b��@8�v��@<�I��@@1�uA�@Bwߧ�j�@Dܽ�i��@G^�Y�:@I�DW�=5@L�c�W"$@O�}R��w@Q=�Crn�@RJ�Z�@TSƩ��l@U�M.*�)@W��+��*@YPR����@[_\�1�@\��k�C@^��8\@`L#Mbk�@aB�c-�L@b?&T5)�@c@�o_P@dG^�h$�@eSEܙa@fdGӳ=�@gzV#��]@h�^+��n@i�Li�d@j���M@l��ߠ@m1�y??�@nd/���@o���$Ī@pk��@q�S�!@q�4�P�@rR�ԏ�@r�9S�m�@s��zVv@tL�� �@t�v"-Q@u�Jg��@vY �XTO@w�W^�@w��YJ@xw~1�j@y0(q�@y�1�{+@z�)5?��@{euѰ'@|%��K�Q@|瑕�t!@}�XA�e�        ?�����?���RE�r?��ĦJ��?�]nʷ?��v�!��@i(�B�@O�ĥ�@�����z@-���;@�ʨ���@�����@"X�IXB:@%��0]�@'�_���@*�1�u}D@.8��G�@0�ñ'�@2P���*�@4��56@5��[If@7����yX@9�f�Q@;�2p��@=������@?���VU@@������@A�-�z�@C�z�@D>�a�C@Eg��Y��@F��>i�/@G�#�@Is�c�n@JEX�H��@K��)@L�z�}@N%�1��g@Oz�%���@Pj�=���@Q��H�@Q��S�@R��?Z[@S8��
b�@S�Z�@T������@UmFk���@V.(R�@V�`N	:�@W��N��@X~����@YHǜ5un@Z�-�@Z㎻���@[�;�ض@\�ɡ��@]\J3C|@^3.���@_ne���@_��B��@`b����x@`�g��u@aC5�g��@a�
O���        ?�V/V�?��G$�^�?𬎃ąT?�{�h�\�@��k�(�@}QH�Z�@]"��wV@'�*�C�@ L$�:g@#��E��@'�%(�@+�����@06�@2x�K���@4���r��@7�:;�vL@:Y�����@==f��X@@ �+i@A�#-6@CT��0k@EUt㵊@F��q�t@H�@z]��@JtT��*Y@L`��Ǻ@N[��`��@P2�j[@Q=B���@RO4�&�@SgБ�i!@T���~�@U��XJ�W@Vح����@X�?@YC�㌂/@Z�O+�S�@[��+��@]�>�@^b{ۻq@_��]�%|@`��[���@a;��mED@a�:3�[T@b����	X@c^�w,$�@d�,�^�@d�5⣪�@e�J%�-�@f]�.��8@g$�ϔ.@g���պv@h��Ô�/@i�t�=��@jUl֊�U@k'��!a@k�x��K�@l�{���@m�ư��N@n�P�̧@of��BZ@p#/�@p�e�        ?��S�m�?���_;�m?�σz�O�?���;��@�u�'�p@���D 0@����C{@�����r@ ���dw�@$4�&'^@($ ͡\�@,b�G�)@0w�D�b@2��5@5u�0 �@8+	M�c\@;�L��@>��t�@@����X@B1�ʀ@C�ʹ���@E�!�A�W@Gx�F��@I[w�i�{@KN���@MP7I���@Oa٢��@P�Zr@Q�H��@R��F���@T3�x�@UL�;V�@V�Ξ��b@W��Nq��@Y ?�A�4@ZI��&f�@[���~߶@\�d��.t@^M����N@_��C��@`�e�#d@aE`�b7Q@b h�,7
@b�s�/i@cw���`@dCif��>@e
?U)�@e����wq@f�r{��@go�S	)R@hA���r@i�X@��@i���J�O@j��K�i|@k���u�@l��k��J@me�����@nI�k�u@o0����@p�|&VR@p�Ѿ>5�@p��۵i@qrZv�F        ?�Y�K�I�?��&q\��@��k��@Vmx$H�@�8�!@ %�v8�@%|ԯ%o�@+{����@1y��l@4�JP��Z@8��?~d�@<�k4
ٺ@@�b�2$@Bݦ�@EOj�$@G޴�/��@J��r�u@MRL�r��@P~�8�@Q��hjjZ@S$CR��k@T�U-m@V_��^F�@X�N|q�@Y�M.��u@[�#�t��@]dyI=@_@抂��@`�)sm�s@a�NL) @b����@c�	����@d���9R�@e���7.@f�&�!0�@g�Y���@h�-���	@j��v��@k(y��@lP��Ί�@m}���k@n���i7�@o�M��@p��\qc@q-�սe�@q��U�%@rq�t"��@sߺQZb@s���/�J@tf��@u���c@u�ǉw@vm���@wNh�FO@w��9��@x�U���5@y;��1��@y�>�S�@z����q@{i�p��@|&t��d�@|�q^Hc@}�W��o        ?��d��?k?�5���߄?�Mw{���?��2��@P�"A��@
�.�\}@�*~`I�@���V�a@�6��H�@f{�h/@!I�C@,F@$�
��@&�R@)���-;@-��{�X@0%;^s�@1�S��[�@3�G'>�{@5a�� �U@7=Q��Q�@9&���@;�4�^@="&G��@?3��W�@@��i4�@A�n�,>�@B�)bL/�@C��T�@E#�]�~@FQ���I�@G�^vP�@H�����:@I���eT�@KA�OM\@L���~s^@Mڜʔ|@O.��D��@PC��q�o@P���' @Q�`��h�@RX0d�=@SUx��@S��&��
@T�|�#�~@U>m��@U�����@V��z=@W�G]��@XG�bS�9@Yn9�r�@Y��,F�@Z��yB""@[ri��֤@\B�ʌ�@]����@]����@^��SJ[@_���P�@`6��U9�@`��X+v@aqXEÎ@a��f�2@a�����        ?��KU��?�F�R�?�7n�1?�����j@h�t>�@'�C-@���'@�� �@ �C�0�@$HAt};@(8^C�0|@,w����@0�B�f�R@2�@5�S*�e�@86�p��@;�EF�@>�<�2�@@����.�@B9�<��@C�{>��]@E���fg�@G�q#\�@Ie�=�_�@KY$s)��@M\C���@On�a]K@P�1���@Q�x���c@S �R2�@T'��@UU�D�@V�,��>d@W�?U:��@Y	+���@ZR�>�u@[�#1D�@\��5��@^W:RL��@_�����Q@`�P!1��@aJJ�H�/@bLv9��@b�Kn���@c�=GA''@dH0�@eѮb�~@e�`A.@f���C�@gs��Q@hE����@i5\F��@i�h�g�@j�??mlm@k�����@l��\'�@mhUӲ@nLp�bD@o3�i"�@p
fW� @p������@p��T�Tu@qr��ēL        ?�������?� �ւi|?�ߣO��?���]*߉@����c"@��1V�@�7�%�]@��Q�3@ ��L{��@$'�Zٟ@(�x�Z�@,I؊?�0@0g��t8�@2�8s�=@5]��&1@8��Ď@:�d��6@=�X���@@|�LOX�@B����@C�K3
*�@E�Qq
d�@G[�\�o�@I;���j�@K+�j?I@M+	�Ŵ@O9��gP"@P��F��V@Q��O�J�@R�J����@T�L��@U/��þ@VbN����@W����:@X�#(���@Z# U�"�@[p�63I&@\���Z)�@^Z/1v@_�:]�L@`s�O�r@a*Qd4�@a����[]@b��rڎ0@c`<�q�@d"���	�@d�7���@e�H^�+�@f{A����@gH��!�`@hb��W�@h�t�_��@i�"����@j�b8��@ku(/Ƣ@lRja;�g@m2$u3�@n<��#a@n����b@oߎ���@pdYdQ��@p�M-l�@qP�7�E        ?��		J��?���.�@d>���@�L��u@y����@�@
��@$��݀�@*��RKgU@0�Ⱦ�6"@4$4�[��@7ꠍ�@;��j���@@����@B_��f@D�O���@G9�ԇ�!@I��P��q@L�t��,@OM�]�@QO�DE�@R��!rT@T"_���@U�z��	/@WY�.�+u@Yc&�m@Z��Z_gM@\o0�x0@^K�}��<@`�$�f�@a �x���@a����M�@b���W�@c�	�\~2@d�ޤ@e��8��@g\@V@h�.a�@i%��M`�@j=��3c@kY�)�c@ly��d�@m�۬Y�@n��0��@o�xC财@p�w�^$Y@q*���@q�oc�E @rb�'��@s�B<.�@s�&`��@tDy�&�-@t�x��s@u�/Գ�@v5`2��@v�>i?�@w��qc�@x4��F�l@x�?Wļ�@y�T��
�@zA�O�@z���G@{�ϵ�9@|]�8        ?�6;Ol,�?��W]�4?����-?�ݬ��7@+�#�F�@���@*P@m9��@�t^�@k����@J+t��@!<^�Q�x@#�����@&ڰ#]l@)�V��Z�@-!��p(@0#���-�@1��p�m�@3����K�@5f��mW�@7Dp_љ,@90I�u*�@;)���u@=0i����@?D=P�@@�;搥@Aȣc��t@B�%�@D�g�J�@E0 �z@F^'�J�@G�D�Gu@H�{��x�@J
|��R@KN�6��@L����)�@M�u
�@O;�.飣@PJ<y���@P�  ���@Q�f,��@R^��@S�h�45@S��@T��>%�@UC�!6@V��@V½�(�@W�����@XJѤ(a�@Y� �@Y�R�^@Z�?��{@[scΦ��@\Br�VA@]��J�@]�:.@^�k��L�@_�88W5s@`5u��@`��u�F@a�%�jr@a�v�3@a� aX5/        ?�R��W?�Џ%��:?����?�r�>��@�V�oY�@m�*Jh@P����@�ٲw@ @gF/Zh@#�,�d�@'��ze�@+�"��҆@0LM�#$@2k�,��@4��3΂@7��>KTG@:J�p\�@=-��l`@@��NW@A��
�aN@CL�ی�U@D�.��@F��VT�@H�6-&�@JlH�e�X@LY����@NS���7�@P.�7O��@Q9���8�@RL��D@Sd�K��@T�]���^@U�@���@Vր�D��@X	�s1�@YA�����@Z�r�F��@[�-�N�/@]˩7{�@^`4�>��@_�Q��s@`��O� @a9��@�@a����-�@b���0@c[���:8@d��A0J@d�����@e�7\�@fXŮ�@g+�a@g�S$Z��@h���(@i|3��@jK/��d@k�:�S)@k�L\*@l����-@m�����@nxu(v@oT�d:�9@p�@�2P@p�2"�(�        ?��Î�"?��8[���?��-���?�ě~B3�@�U�Ef@�X᠗[@�����@r�>6@ z���e�@$�b6�@'���,�@,!7�@0N�@� @2��˒E�@59l@���@7仄��7@:�$���@=�+�J�@@[q����@A��x�h�@C�׸�r@EZ����@G% d�@H�C�>��@J��0�v@L��2r*@N�RTB�r@P���@Q�}�+�@R�C�m{@S�(�Y��@T�C�U@V#��ۊ@WY�N��@X�2�4?@Y�f/�D@[#90to�@\s���@]�u�(�q@_'���o�@`E���7@`���Ze-@a���0W�@bm��ڎ�@c+��#��@c���R�@d��i�t@exU"ŧ@fBh�(C@g��1@g޺��a�@h�bU�v�@i��}c]�@j_<���@k:f��b}@l^�G7@l�m�n2@mܥh�H�@n��c�@o��%k�@pK����@p��j	@q;��u)�        ?�� �TI?�y��@�ޙ &$@������@���4@�ґ�t@%;��@*�t6RRJ@0��$O�4@4+�k��F@7��b��@;�|<� @@�2"�@BX9m�l@D�v��@G)�Z��@I��޾�@Le�U��/@O*�E1�@Qfg��@R}�a�q�@T����@U���TV@@W15?v;�@X�D�M�{@Z�����@\E� ���@^��VR9@_�*Ճ
V@`�9El@a˓���J@b���@c��]�@d��F�@e�L\�-@f��3 �@gѯ*�(@hᛲ&��@i������@k�+�Ǭ@l)s�,��@mI5pG�@nl�%z�E@o���ظ@p_���'g@p��%1A
@q��b(�@r*�ZD�@r�N4 v@se��8]�@t��{��@t�9�_�T@uJ�6���@u�oj���@v���B@w>Z���@w���i@x�;�t@y?t��"@y�9�P@z�)��j@{N+���@| ���z        ?�6�;>��?�|r���?�"��>P+?�JAv��&@ 0��=@L8'\�@lP�&ڏ@�ºx�@�v��P@�''��@ E���<@"�=�G�@%�]a��@(�T�d�G@+��c!
@.�y��@1G�5[�@2�pK��@4v���7�@6F�T�@8%]����@:�T��@<�ۣk�@>��ɛ@@YR�3@A#��&L#@B:4�^@CV�fz@Dy	J<�@E�fm�@F�͘"9A@H	�%@I:��X=D@JxІ��W@K�:-�U@M�����@NR���U5@O���*
�@P~��8�@Q-�6��@Q��d��@R��k�e�@SFFo:L*@S��Ց{/@T����^@Us�@W�~@V1��;v�@V�Ů���@W��� �@Xx#��@Y>Js�y@Zb}C@Z�c�D#l@[�G�\@\j
�T>�@]9���"@^�� w@^�h�@_��ʨ"@`E3�`�l@`��tǽ�@a����@a��\N"        ?���V9�?�M�V�Q�?�*�|?�����@�X��a@'�g�EL@�s�3�@����p+@ ��rU �@$H@�0�@(7ߍ��@,vjB?j�@0�<��b@2�Y���@5};�Ŕ@82K(s�@;
��+�M@>�f~��@@�髳��@B1�`�	@C�7<̊�@E�(�ܖ@Gt��=�@IT�G��@KEhX�>�@MENQ��@OT_͍u@P�0����@Qύ%s�@R�*D�%�@T�'C-�@U=�m���@Vp�-��@W�!��yk@X�ǳ�@Z1�']M@[[�.[@\ӗ���@^.H�� �@_�Xܪi�@`{Z��	�@a2%�
=n@a��"1@b���'�@ch��P�i@d+��D3�@d�e�@e�I�x@f��I��@gTE�L�;@h%uƌ&2@h�c����@i��b[?@j�Te�O�@k�Coé�@lc��hG�@mDݙA�q@n(u�BT�@o���@o�Wv��@pq���@p�w�J(@q_��M��        ?�Ob
 �?��g��F�?�KM8�L�?�����@<�M�7�@�l���@��$�@���A�@ ���0@#���X�@'Z�TG@+u4�x%@/�/�H�@2C��D@4����.�@7\����@:��(4@<���qw@@ �Q�@A��2�=@C3���{@D�:1�@F��9+
�@Ht��eK@JRW���@L?5�sK*@N:c_u2@P!�߭Q�@Q-WD�2�@R?�Oɡ)@SX�J���@TxF
�	�@U�Z�ᔩ@V�����@W���R@Y6�}C@Zu�CmF�@[��y^�E@]��!��@^Vxƌ�0@_�
���j@`��O㞕@a5�-T�+@a�5�ʠ@b��0�E@cX�u`�@dV�+d�@dң��^@e��A��V@fV��i<
@g��r�@g� ڰ�@h��!|=@i} �n��@jL�R�ڰ@k\o7Wq@k�Pa�^@l��x���@m����
X@n|s�x%.@oY�\���@p_"��@p���        ?Ӫ�V���?�G7G~�u@
�>�k�@
D�@�+�EY�@�|��Si@$��lU�@*2z#y��@0;�P�q@3�u�TA�@7O<���@;9,�R`�@?_���G�@A�Jw��@D,e�2%@F����R�@Iy����@K���a-@Nd�����@P�Pn9@R
>��@S�a�u�@U�z�cG@V�&6��@XAW,Ԇ@Y�\K��@[��%��@]W�	<=@_�:lS�@`v�uX@ab�Z�2@bS�{�M@cH�C��x@dB�qo�@e@x��d�@fB��p��@gH�A�χ@hR����@iaTӗ�@jsƋ8\@k��H�a@l�Hy:K@m�`̷�@n����@pBt�@p���k�@q+E2b��@q�S><��@rZ�%Y��@r�.��0�@s��JUy�@t.1{k�@t��S3@um0�Egv@v��^@v��@wV�-Ҫ@w���Kg�@x��M�a@yL�n��@y����|@z��	Qa�@{N����        ?�8����?�#=`���?�#�ĸj�?�Ev����?����?@6\֠t@B�6��@�_�\@�;�U@N�2�Zp@ H��e�@"���Q�+@%T��@(%爏��@+E�P@.&�|	��@0�űƭ@2N��f��@4��k�@5�b5(y}@7�pWm?@9k�ƯG@;STx�
�@=G��2�?@?H3�s�t@@�b�99�@A��B;B�@Bȗo���@C�P��QT@D��^���@F ��$��@GH��?7@Hv�apYa@I��� tV@J���S@L8�#�8@Ma�J�h@N��n�#2@O�JI�@P��l�5@QM(��q�@Q���8�@R�>��@SZW��@T�����@T�KB��1@Uz��@V4��� @V�Q�B\<@W�(t7b@Xm�h��@@Y/�'�]&@Y�-(�p�@Z��bj`�@[�B����@\I�$��G@]�W���@]���c@^��Vl�@_�X@`)�@�vX@`���l+|@`�ȟI�        ?Û�ţ?��j(�?��aTqN?��W�=a@���.Z@��/k1c@l|�"@;��Q1�@ YG�P�_@#�?&P��@'���r@+�O_�̉@00� ���@2���D��@5��ʶ@7�%�2y�@:���d(3@=sG�M��@@@��O�'@A؁���@C�v���@E8j����@G  ����@H�Z@ 7_@J�ۊM@L�m�l�@N��CK��@PezLY�o@QvBd5��@R�-�$e|@S�$6f�@T�h~��@U��^xW-@W3N]3r=@Xmw���@Y�1�8;�@Z�fT�Ի@\B�:1Es@]��$u{@^���.H@`(����@`۽��@a����@bJ�.�@c�.=?�@c�լ�8�@d��qa�v@eLk��@fjLֺ{@f�{50�2@g�D
v �@hy����9@iK��+=�@j ���@j�����@k��Z���@l�O�xs@m�@���@nn�d!RL@oR��3�@ph�ǯ	@p��^�]�@qA��         ?�:�5?ޱ��H ?�(�!�m?��늅	�@~O�/@�c0��@�4��F�@ke4��Y@�j���@#G6��p"@'���q|@+
?�`��@/Y~�5�@1���RA�@4e�ܷו@6�I�C@9�T��T%@<x�ᑜ@?iৱ"@A=����@BծS��6@D|�]�{@F3��@G��0#�h@I�p5�@K�a�V�@M����M�@O����Z�@P�wV`@Q�N`d/ @RﰛSʵ@T�����@U'��4/@VM$�\>�@Wx�G�L@X�g
.~@Y�
���@[�B��@\b��P�@]���R�p@^��܃D�@`'aE�?@`�2;p��@a��l�>|@b5�3�t@bꐴ$��@c�݄uI�@d[��AD^@e	�@e��]X��@f��%���@g[�Bo�@h!h��@h韌���@i��(�o@j�۝��P@kO��u@l �6U<�@l�J��@m������@n�Sܪ�@oz�f�/�@p+_4$Q�        ?ӆ%X���?�+| 7H@ 킨��b@ց5�@�ۢY͉@�����@$T��o@)�C�䖒@0ޟ��@3p�F�%@7��k�@:���b@>�K�g�W@A�
��d@C�g���)@FA�g>BW@H��)�Py@KC��@M�㯏r@PR��ʢJ@Q��)�@S0����@T��2!m�@V9��b��@W�ǧ5�@Yk���yA@[&?�>�@\��왱@^����5�@`#<a�@a
T�B'�@a��m@
@b��\�k@cڣ��L@d�z4$��@eЇ��>;@fѳ0��=@g����_@h�\ӿ0@i�&q��@j��֍5�@l>�x5�@m*X�E+�@nF���d@oe)s���@pC�*q�X@p�լ�I@qkszn��@r�i@r��-� �@s2�.Rt�@s���/�@tjm8��o@ul���v@u��kl��@vH�VtL�@v�5Y���@w��>�q@x4#.�@xڦ�"�'@y��e&�A@z+���X�@z� �9�N        ?��r�L\?�|��y��?�
�Y�v?���f)-p@ 9Lc�4�@�Xnm��@�����@��kU@�䯤@�Rl�g�@ N琍��@"�%y@%����r@(}<�F�@+x�.��N@.��C�k@0�UN~@2�>���@4I2�@=�@6 7z�L@7�̸
�~@9�	��%�@;���I�]@=�{���@?�E�6�@@���p@A���?�@CMA��V@D18��	�@EU*z�V]@F
Z��+@G�����@H�$6�d@J&���@K_�G�@L��|���@M��{@OA�l��@PK�4�AZ@P��_@Q�(֎'@R[�b�[�@S��r
P@S��9�r@T��ܢ�@U>p��@U��?ͩ�@V�t�e@W�~䵙�@XE�Y�!@Y'v1�`@Yֹ@(��@Z�n7�%@[pAmӭ�@\@-����@]-�{��@]�;1Jփ@^�P�|t@_�j�#@`7CX&pR@`�St��@ae�g�@a�z�0�        ?�I��|	?߫,$��&?��K
V?�O>��@�{	%܄@Jg����@:���a7@�l���A@ /�x��@#��̤�@'�
eԓ�@+���^�@/���se@2Uՠ�@4ε��e�@7i�Mǡ�@:&�љ�o@=&�$إ@@>���@A��p��@C.Nn��@D�Wڏ5@F���w�V@Hd���@J=�E� �@L%�T�@N׹s	i@P�6�@Q+V�	*@R'7���@S<����f@TX�2��@Uz�"xy@V��N��@W��1o�@Y-*R��@Z?2t+@[~���i�@\�
�T�M@^�=��@__�=v@`ZF`��@a���h�@a���6*@bjw.9�@c��5�@c�j��q@d�<��A;@eLo�w��@f
��H�?@f��
b�1@g��d��#@hTZ��V@i�F��@i�݊�c@j��l��@k�""x@lO�R��G@m!�c~X@m�*���M@n�`Y?A@o��L7/e@p?X^"�j        ?�K��?ߛ7&k�`?�p��a+?�����@��=Zj�@����O@�-z�zB@Z&���8@ n�~���@$Su��t@'���y�-@,�=h��@0M,��4�@2�?�n �@5;�I�
�@7�QD���@:�ҥ��$@=����@@`��8��@A��J@!{@C��_R��@Ea���y�@G,|�n@I��_��@J������@L�Bg�G@N�ʺ�-@P��O��!@Q�{�b��@R��͔N@S�7�%�@T�%:�d�@V�I #�@WP�e�u�@X���ne�@Y�% ��@[�歾�@\Z�sG@]�s�n�@_��@`/��X[@`���4�@a���69@bK#z�=@cDr���@c��qͭ�@d~)���@e>Ե��q@fꤻ��@f�`�V@g�+l�w@hYAQ+��@i%����@i�&h[f^@j��Ҳ��@k��.WX@ll�҂�@mC��4@n�#�qp@n����M@o�3 ��@pZ#�w��@pʤ��        ?�6䡚��?��;$!�@ �IJx��@��^g�@��.�C3@M�V��@$%�7��@)��
 �@/�IM\@3N�Iz2t@6頃�W4@:�q����@>�q`�~�@A��,{��@C�~�*!@F/��[�@H��܍�@K5Q���@M�9mq@PNj��-H@Q���Cd@S1.-���@T��JN,�@VAIxz
�@W�֤�6�@Y}�X��@[*��:��@\��JC�t@^����A@`8w&$F�@a#I�EW@b��p�x@c@�U�@c��^��%@d�.fű*@e��rW�g@g�T�B@heۙ�@ii-��o@j/�ZSq@kFT:�@l`��6�@m0�+�@@n�x��m@oǔ���8@px����@q�V8��@q�.�aD�@rB��$WH@r��Ǖ��@s|��C�3@t��n�@t�!��+@uaS�h5@v6T��@v��Ҫ�@wUp��3@w��A��@x�c���@yW����\@zA���M@z���VTB@{h�$щI        ?�E� �?��V��k?��TLt'??��:��@�D�:�@��ʰ@P#����@�~a��@\�kT�@=Y��{@!7}���@#�T��@&۷�8@)���g�@-�����@0-BN�v�@1�}��Ƹ@3�~ق�@5~�kl�@7c�� @9U���@;V~�ϻ@=e���@?�q�]X@@��e �@A��\M�@CZ��b�@D8�M���@Ef4@1�
@F��#�h�@Gү�@I~�
�@JU٬O �@K�����@L���@NB�}�	@O�5��Ȫ@P}?�9��@Q.�l�p�@Q��9mp6@R�>�'^@SQ���@T����@T��;?Ӭ@U�HY���@VJ�%��:@W���V@W���a��@X�3iw�7@Yg�@��@Z4�%�g@[�0G_�@[�x�Z�@\�B|Ⴐ@]{�<qu@^Q�����@_*�CK��@`�l�q6@`qb[}�@`��׌yn@aQT%�D�@a��.u&�@b58{?>        ?�%�P<@�?��c��&�?�S ����?�����`@{t�D -@�U$Y'@@(b�^�@.*��U@ ������@$��T��G@(��<C�[@,�մè�@0�N�A�@3;G���@5Ճ�.U�@8�=�"*�@;v�R�i3@>|i0��*@@�H���@BwLiG?�@D,�G|��@E���u@G����P@I�͒�uH@K�!��@M��=�b@O�M(,�p@P�Q�C�8@R��a�e@S'DR��@TM�٥*@U{2�]��@V�YT�7�@W�!�A�@Y+n'r@Zs#t��@[�&=��3@]^��@^o�=�J�@_�B�-�@`��k�"@aQ(Y�'@b
��7�@b�ң!M�@c�b�(y�@dE�:�@e	��&<�@eЎbp��@f����ƀ@gfg&��@h4�.O�@i�W7}W@iٗst��@j��Z�@k�Y���@lcR��c@m@�9J��@n A���@o(R_,@o�O���@pfXRǑT@pڢ��O@qP��0�        ?µ����?ߐ�s@��?�	�)��?�x	4?@�0	��Q@�h Zk@gb��i@8>i@ X���L@#�jol��@'ÅW�8�@+��K�$@01�����@2�\-�@5�Fo�@7��Q�f@:�rW?��@=p��@@>��ܵ�@A�ha�6g@C|〚z@E2�� ��@F�i��@Ḧ́2��5@J����
d@L�L�i.d@N�w�s�8@PZiM�#�@Qiq���@R~��V�|@S��}��@T��m���@U���Sn@W�_p<@XL��Z>^@Y��L���@Z�--~�@\\D �@]abdo@^�$�p=�@`D��R@`����@ah�;��@b��v@b�I�Q�@c�_�[@dL �?��@e"!��@e̸#$v�@f��;r�P@gW�0a�@hͮ���@h�К�-�@i�%���@j���69@kYS���@l-6لx@m=��@m�_��@n��	?F@o����@p8	����@p�&��        ?Ӭ�YR��?�WF����@o�Q@0�e[�@�1`@��� @$���
�<@*]<](�@0W}�p��@3�^ܡ@7y�0%��@;l�!2r�@?�"�zo�@BO��
@DV�n~��@F�me���@IMRH��@K�뺝W@N�T4�@P�����@R5�']��@S��ݪp@UD��J�@V�<[�@X������@Z.{�a@[�����@]���" b@_v��S"@`���zM�@a��P�b�@b�RL��@c���c��@d����+@e���TJ@f��C࿲@g�o��<@h�1^1��@i���g�@j�(�.o@k�9���@m@�8�J@n5-<�W@o\�V^
@pD>{$7@p��POU@qu[5(�@r�jPJ@r������@sL��MP�@s�@
q)�@t�����@u3í��@uٝ�c�I@v�.NGm9@w*r�[�@w�gM��@x�	��M@y0Wnm��@y�K�fV@z���#֪@{E���s@{�����        ?���yJ?��5�˝�?���.��?�A�/�?���W�;@�)��	@%�0k�R@~��&��@�~���b@c�r�@ (�v-�9@"��&|�@%�Y`D�@(k�x%@+q�@L�@.����qp@0�aYi�@2�����8@4c�Z�P@62�%q�@8��L�p@9�l���@;��hR,@=�����'@@��y�}@A��`�\@B-�u�@CJD���@Dl�1Z�@E�����a@F�����~@G������@I/�!ic@Jn��+@K���*W!@L��q��@NJ:���U@O���m�@P{e֦8@Q)��0�@Q��B�]�@R�~��i�@SDb�M��@S��r �@T��e��@Us�����@V2p��Mq@V�Z��/!@W�\Q䊲@X{n�c@YB�K�x#@Z��N��@Z־I@[�Ƒ�f�@\r�J?�@]C���'�@^%��@^�����@_���C l@`LS�~��@`� z(Lt@a&�Wj�:@a�9>�;        ?ùT����?�.\ZZ�?�񉍙��?�����l@��@@ �}�r@��U`Kw@��`S�-@ ���s�@$6����1@($���u�@,a�W)�@0u�]���@2���o@^@5p�*n��@8$�9j��@:��܊�r@=���z@@���;@B*C|�@Cښ�@E�`����@GlX��7�@IMG0��&@K=��x�@M>#�c�@OM�Ð�@P�ؿ�3@Q�ݚ�C@R����u�@T^�KOw@U<��V��@Vp����@W�>�_�@X�ե�Z@Z5BUE�#@[�lOڣ�@\�<�\Np@^6�7h{�@_�~L�"�@`�bv�Zl@a9.�գF@a�/;�@b�ӣ\@cs�
��@d7. ��@d�,�ȇ@e�ۅ{��@f��3�T@gd��9(@h6_�}�@ioX�c�@i�6� d^@j���F_�@k��sF[j@lz����@m\�`[�@nA����@o)6�,@p	�ڢ%�@pŞB��@p�/d�Cx@qo���@        ?��Ew��/?�̿�?��K�n�?����q�@�g
Vl@�-M�9�@�P���a@�ݜ���@ ��}}@$%�3@(b���@,L�~�@0j	ݽ7@2Ӷ�T��@5bI�*�@82KI"@:�P�Mo$@=�qT���@@�\4�`@Bg��A�@C�r�KXb@E��jH��@G\��j�@I;'
0�@K)��Y�@M'��?�@O4�Cf��@P�.�j@Q�hRi $@R��i��@S�q���@U(ׂ @VY�w�Й@W��6�L@X��W(3@Z�
�@[c�� @\���=5%@^�}#�@_n<J�-�@`i����@a�;�eQ@aؙ�/�+@b�n�`L@cS2�y��@d�Rۖ�@d�^��G@e�����@fjͮ0,�@g7�
�*�@h8�G�@h�u�l@i�V��^�@j����@k_��tw�@l<����?@m����D@m�@[��3@n�Oeb�l@o��nfC�@pXT��m@p��s�1@qD��mw        ?����?ﺲi[6�@ �� 3@W��Vi@x�}6@[�e�@$X[`Y�@)� 3_ �@/�jb�8�@3..�}�@6��g.4y@:�o+��^@>�Qp"�5@ApZ!0�@C�Bs'��@Fd4�]@Hq��l�:@J��Ǌ��@M���T��@P&�Q�;|@Q�S�Ծ�@R�Ԋ�q@TwɀʠI@U��l���@W�Zx\@Y$���@Z�8�+�@\r�>49�@^'l��+@_��x�w@`ՋW�/e@a���L�@b�[�=?@c����HI@d�gF� <@e�ɧ	��@f}�
�[�@g|�ݴ6*@hl�#\2@i��&|�@j�C��g@k�o�]`�@l�Mܴ@m���ޣ@n�.�@o򜴵�]@p��@qw����@q�_7�@r=�ݛ'�@rһ���@si&��~�@t	�r]�@t�_�=�R@u5#9�@u�MQ�I@vn��Ρ�@w����b@w���LM@xOo�}!@x�:X�D@y�I�9M@z;�b��        ?��/��|?��y���M?��]?61?�Xa��?��޷�@bF���@D�1$@�,�,��@"��d�@�1c�-�@t�ko�@"G�3��@$��R�$�@'�yG��@*��gBZ�@-��� �@0��D�@2'��f�@3�钓 h@5�!o nh@7p�)���@9N����g@;9�\Te@=1��C3@?5hG���@@����i�@A���:j@B�*ɋ<�@C�~��@D�d�{�@F ��g0�@GJv D|�@Hys�a\ @I��`�^@J���X�J@L%Y�j�@Mh�� ��@N���b�@O�,B�M�@P���@QS�_��@RHs\��@R�]��6u@Sc��k_@TRC1K�@T�#B@U�'_��X@VCU��	�@W �N��B@W����@X��v�,@YE[���@Z
��c�P@Z�!��\C@[��$)��@\fبa��@]4`x �@^�ybp@^��\�	;@_�xnw�X@`=mɓ�{@`�}�N�@ahƒo        ?�
��Z1?�&kP
?�K�K@ۻ?�մ�޾K@( 7�@ё�,C@��a�*�@��*xk�@��=RC@#t���0@'>�=|@+T7��W@/�)���@2/���<�@4�ɒBX"@7E n�k@:!A7@<�$O��@?�g���@A�U�8@C'(3Qu�@D���}�@F�t]�d@Hk{�n�@JK�J�1�@L;=W�@N9�f�J�@P#:�[:�@Q0�j���@RE�l-��@Sa�����@T�4Q-"�@U��ה�@V��7ۘ�@X�K�3�@YRD��U@Z�2�)S9@[����@]1=X�z�@^�7%��@_�h��z@`�aLT�9@aY2���@b�FTw�@bˑ����@c�B��1*@dI�q�d@eq+ �@e���QF�@f�1iR@giX���[@h8T����@i
T�}-@iޱ�1`�@j��:]�@k���@ll�}u@mLD��z@n.Y�
p�@ol��@o�]���@pr %U�@p�Y�hL�        ?�fV�J�"?�P۩�?�,��'s�?�bs��N�@W!�=@y�p�cn@J�w@�;g�>
@ н dye@$t���Ƞ@(h����j@,��|�X@0���CO0@3���z@5����
�@8I�'Y@;${�U@>����@@��-v~�@B4o�}Mj@C�+S�f@E�� >�-@Gi��\\n@ID�� �@K.�L�b�@M'��:@O.��	;@P�L�0
@Q��f�1�@R�Q��cP@S똇��@U�����@V=����7@Wp�"Zg�@X�#b<|@Y��x��@[/N�4��@\{
��aC@]����1�@_$X���@`@ݵ��@`�i�EE@a��ǚ��@b]�I�\@c��}ݯ@c�M��@d�����Y@eUQ��j@f�"�@fঋ�6@g��J��@hv>QW@iDY�k�@j/%�@j�'xD@k�����>@l�3���@mo��@nK2�+/@o)u^�@p�Ɖ@pv)�xi{@p�p4s9�        ?Ԗu��v�?��ޤ}@���*�@��o�5@%eQj}�@ A���^@%�B����@+�A�I.@1/�vq�{@4�|'zh�@8�#M��@<���@@���^�@Cɕ�y@E��Kz�@H �Z���@J�հh��@M�1���@PJ�sū@Q��HCm�@S^���'@T�8BW5@V�?͑N@X\tr�6�@Z�u�T)@[�pa
��@]żG�+e@_�B4*l�@`��j�u@a�"��-@b�{U��@c�+��@d���E��@e��P�@g	3�Y�w@h$����@iD��Z�x@ji���/C@k�z�h.@l������@m�5܈�}@o+6�_;@p3H_�@p��W�@qu�>�f@r3�@r���<�@sg�/�@t�U�[@t�0��@uj���ʥ@v�h��@v�~}A)Y@w�.�v@x5c�&�g@x���[@y�sz<g@z`�!@{t��j�@{ڀa�F�@|�8�0��@}[����,@~����        ?�4�����?�b�����?�mG�)GZ?��=K\L+?�>�=:�3@�BJ�&@�M����@N�H�@��\�uL@+X!Oc@ R���8@"��y��v@%i0��;I@(ND��@+U
�k@.|��NJ@0�A��T@2�o�QA�@4W�>�g�@6(:�K6b@8N^�@9�ѳ��l@;�3}H�@=�����@@�%�@A��䅛@B,�;��@CIo��@DlO����@E��h;�@F�|�t��@G��ΰ��@I1@:LFn@Jpb��%r@K��g�w�@L���s_�@NM���C@O��[f�C@P}R]\t�@Q,B�h@Qݜ�t�@R�X��I�@SGn�[Q�@S��e@ �@T������@Uw�W�e@V6��@V�/��T5@W����@X����@YI���@Z�2�c@Z�e7�@[��/_�@\�J�8+@]Rl��V�@^'I����@^�2XwB@@_��#�@`Y�'�@`�ud��@a6�)�2�@a�=�NB        ?�̵!YR?�H���0/?���%�?�'#OH��@(���@:n��D�@ݭl'2�@ϓi�@ �����@$X�#�K@(K^I�|6@,���K�@0���9#P@2� �r��@5�o��@8@���
@;;�x�@>NEsi�@@��U#�@B7� �}@C�-�K��@E����e@Gu�f$�>@IT�W/�1@KB�S��@M?i�UH@OK�!@P��M�N@Q��}��x@R�<�ȥ"@T�e0�6@U-�6�P�@V]��{��@W�}Q��@X��v�A�@Z�z9�K@[`,�5@\���X�
@^x��@_ekNIe�@`dp���@a1`4{$@a��z}�@b������@cI"4�>`@d	�欦�@d��X�@e��Lv@f[��KBI@g'DhN�@g�1 ���@h��䆺�@i�l��X�@jon���o@kG����@l#�P$�@m �w��@m�b���@n�$�
�@o�
�";!@pG���@p��w�B8@q2���`        ?��r��'U?���|Xʿ?�3��~�?�G̬��@
�ȧ��@>�'��@�i��,@�Fu��}@!g� �X�@%1x8�@)O��GB @-�,�,z5@1@��g�@3�`�i�]@6v��@9J�v��@<C�b��S@?a+�r@AQwB]�@C@��@D�se[r�@F��g��~@H���@JuS)!�@L{�p��@N������@P[��z@Qumb�x@R�p�-8@S����Lm@T�����@V)�:}"�@Wi$���@X�P���@Y�x�AJ@[Pr����@\�&"�QV@^{ac�@_tZ}ڔ�@`qV�&�@a+���@a�+���@b��?q�V@cml��a>@d4�S-@d��虉g@e�vO���@f����@gl~��&@hAω5��@i�Lq[�@i��I�@jҕ��m�@k����u@l�(����@m{���y@ndp4A�8@oO���b@p��K�4@p�����@q3��~@q��#��@r�9�z�        ?� '�(?�sc���@LD�P�N@7�Ο��@�\�9J@ ��bcN�@&Ռ�(j@,J��µ�@1��Z�҂@5C�섞=@9C�V���@=�����1@A
��tfM@Cp����@E���J�B@H��+_(@K[��(�@N8���[@P�Yr�}M@R#�Ԉ��@S�Y͂S�@U_�V���@W��Q�	@X�l�{Q@Z�iB�;�@\ly(�@^M���@`m(R��@a�G�'�@b�Mr��@c�1&{@d*9�L�M@e:�DC�@fP!L�ܫ@gjy×�@h���]�X@i���v��@j�y���@l5#���@m4�N@��@nj�ˈ�@o�km_#@pr��R5@q��=@q�@�p��@r\�գ�@s�X���@s�h��~Q@tZ!D`��@u��i�@u�r�2�@vi�x@w|-j'@w�ڻ���@x�A�U@yB1�J��@y�D�"�@z���c�_@{xe��gD@|8��K<@|��:��@}��M��/@~�4���        ?��z��|?�
-��P?�?Q=�.?�8�8U�.?��o�&Y@6?�L@N+��g4@��f�F@߰�É@�#��@ 8)�Og�@"���'�@%��ǉ�2@(�=��@+���$�@.�&�l�@1 o���@2�d<�t@4y��qx�@6Loc4ȍ@8-�gA�q@:0�{�@<Z���2@>$����f@@\ѧ�k@A0���m@BI[�o@Ch8|���@D�.h��@E�#Bo:@F������@H�:�iu@I\mQP�@J��s@K�lKH�@M2G��@N�p>j 
@O��[ן�@P��+@QL���TU@R e%s
@R��W�q"@Sm�*�*@T'����}@T�Z�mQ@U�-P��!@Vd8O�}�@W'n��܌@W��]��v@X�0Jմ@Y}�EX�@ZIڃ]n@[��'c�@[��D�b@\� ���@]�E�a�@^_B"F��@_6F�T@`P���@`t{�<ɰ@`ℾ���@aQg�i@a�nESE        ?ÂXi�OG?��b��o?���N�N?��Φ��@ɑ��=�@��ʃj�@�^��^@_�"P�x@ rG�'��@$q��@'�@���@,!�v$�@0Q�8�7@2�ߍ@5C��W�y@7�;f�!@:ƌ,�N�@=�۾��@@j��tHH@B�M�@C��!;�@@Et#�]�@GBy1�Y@I ��ʱ�@K|H���@M����t@O&�G\@P�� �U@Q��'��}@R�(���@S��kg@Uj���@VK �Yi@W����I�@X�I��eh@Z	�L���@[V���O�@\�!gL&@^>�ā4@_d��j��@`e�'R�@a��BH@a�S�/+|@b�7z�ز@cS.cE��@d/��h@d�2ԙ�@e�.����@fq��@g?�ީ\@@h�T�@h�?� �@i���{ǩ@j��@	�@kt�ү�9@lT���x�@m7��w�@n$�g08@o��p�@o�\~]ɧ@pm�ш~@p�~��@q^�@[�R        ?�~3��T?�S!�+$/?��s\��?�OԬiZL@�8Ц�@f�^h�@T^�_�@#�����@ N�6���@#�|D��@'��6�@+꘯�@02�� ��@2��*��@5Y���@7�zs�:@:�M�<*@=�@ZX	7@@P�p(@A�G�l@C�Boe�@EV]L��P@G#�փ��@I6�<@:@J�.R�:@L�{.D�I@N��3��'@P��E�\�@Q�o���@R���@S����hz@UH��q�@V=â>uH@WwO�r@X���96�@Y�J�ĕ@[M�\��i@\�����@]�Jʊ@_`�&��F@`d�����@aY�`�@a�-ȧW=@b�)^:l@cVCu�7@ds��g@d��.$�@e��M�]@fy0��u%@gIeӨͅ@h�z@h��]@i�z���@j�6䄑@k��
���@lgC�@mKX���@n1���=@o)���{@p�Y���@pz�Ԕ�@p�xs@�@qmSV	]�        ?��Z�آ�?�=c�A�@ _=���@����(�@&}��H0@�p#El@#���y�@)9v7	)@/EU�ZX�@2�%�+ԯ@6u��E�@:<h���/@>=��}]@A;e��k�@Csz��@E�چ�>�@H/����@J�b���E@MN�ћ��@P u�R�@Qd�J��@R���@TM�[�[@U�G�C�@W`��U��@X���m_@Z�K@E@\F��im@]�t�@_�n����@`�/����@a��vi@b�B����@c��Y�}@dyQ.�H@er0��@fn�ͳ8@gorFÒ�@ht�Xţ@i|j[�ķ@j��o��@k�`��C<@l��c�@m���L]�@n�S��G@o�IC^@p�S>�	@q �Qb#�@q���.n9@rJWؙ~�@r�I�O�@szv
�@t�8��:@t���s0�@uNo�x��@u�~ro�@v�	�L�@w02g��@wӄQ���@xxj04�#@y�TD_*@y�pa�L;@zo��Ѐ�        ?�}���?�_om�?��1�6?�:���m?�紥KZ[@1�
��4@Bc�N�D@�C+~$�@��d�T�@b�e�.�@ #�|�;(@"� �<��@%v5ޞ�@(S}��;�@+Q���`@.p%*��=@0����U@2�����@4A=bt@6 �rk7@7���)��@9ˆi�-@;�ls��@=�i�]3 @?�=��@@�P'
W@B�s+J@@C �8@ V@D@3@>p@Ed���[@F�K���B@G�"��r@H�K�2M�@J.�Q6x@Kn%sZ�2@L���ũD@M�]w,�@OJt����@PN�?�~@P��9��Q@Q��`op@RY\Xe��@S�q�5@S�?��&@Tx$j��@U1p�O٬@U��I��@V�pP6�@Wj	{{N@X+�Ǿ.@Xyi]@Y�T�%�:@Z}
(:R@[F����$@\�1�@\�ei.�b@]���X�@^��*߆�@_T��VF@`(v�
@`�y�M��@`���!�@aZDe��        ?�B,�$?ߢ�l�cK?�͆n1�?�O���@�����@T���@Dw���@M�7	@ =֗�I�@#�[��W@'���<�,@+�{K��@0F�Ͼn@2|t��;@4�z^�7	@7��M��@:q3���@=^T'��@@6�~F.~@A�&�<G@Cx	�K�@E1*�Bo�@F�F���@H��ag@J�x?tj@L�Z8&�@N���8E@Pg��8P@Qy�厠@R��q�@�@S�@Q���@Tڕ��@V��f��@W=����@Xy���k@Y��z��d@[�@xd�@\S���S@]�:��F@@_�d��@`3UR�J@`�<m{`�@a��x�@bW�\�@c�!U��@c�*v��@d���7	L@e[��n�@f#�a��@f��A�@g�Q�c�@h�,6-�@i]�R{�@j2��9�@k
$�̪@k�)n��@l���y��@m��r3o@n��!�0�@od�R{��@p%C���@p�l�C'�@q����        ?�'�ꖯ�?޶j(�q�?�2.��k�?���WS�@~�%�@ɫ��j�@�N�@����8�@﹑2�S@#r�<�T@';>�_�@+O���N@/���-�@2+����@4�8�/Q�@7<#�c6�@9�j�n�@<�w\ú�@?ӍKA��@Ax�O�(�@C��ɐ@D���j�@F�}����@HO���	E@J*���@Ldk��@N �(P@Pµ9%5@QY8vY�@R"�d)@S9��n��@TV�ϗ%�@Uz�@�&@V��*(I�@W�آ��@Y���@ZGU�q�@[�v����@\�c��t�@^��q@_rMH^@`e��3?@a�z<�@aƐ����@b{�O?w@c29�
��@c���ֶg@d�=��@egn��@f(V�Y�@f�A�@g�E��@_@hz� ��@iE�I��J@j�5 �@j⯖���@k��ؐ �@l��Z->	@m_$
��@n7���E@o8	���@o�
>�Yj@pf�YSb�        ?�K�Q��?�
��p�@ �^�hP�@��՘4�@���rU�@������@$M��/~�@)�[viw�@08�1e1@3y�A�I�@7�CѮ�@;.5�c@?!���@A��t%�@Dv�K��@Fi�.>{y@H牾�*�@K~L`5�@N-�5�&@PzHe���@Q�bmu��@Sc����@T�'6���@VyE���@X����@Y�Æފ}@[g��
\*@] ��2Ȗ@^�kN�|@`Ww�m#�@aB��@b1)���@c$�I�lT@d���� @e�ϭ@fd#E�@g�w~��@h%��@i2m��I@jB�;0�@kWw���@lo8ެ#@m��ahu@n�Z�~�y@o�yI5�Q@pz��!D@q21XZ,@q�@��$@r>���'@r���m@st�c�y�@td(��@t��  �@uRq2x�@u��yt۽@v��u�W@w>�`�g�@w尯��8@x�]Ȓ@y8��J��@y�1���#@z�Q=��F@{?�^K5#        ?��Rt��?�~x����?�%�P��?����\�@ B���@�����@�@�M��@�M-H?�@F���@�e<��@ }���_�@#%�q+�@%��<Z1@(���$�@+����/:@/*�EE�@1?��K��@2���=+�@4��9�@6�Y�)�@8�C�-9@:w�A�;_@<z��/��@>���|]@@U��@Aj�n���@B�#$�0@C�~tq@D�e��S@F ��H<i@G5as��@Ho���Cd@I���^@J���5@@LAZ���@M�ť�?@N���8R�@P!�>1@P����@Q����k_@R:4��@R��8YT"@S�H����@Ti�� @U(9J��n@U��9�<<@V���O8@Ws�~@X<kct�@Y�֐�@Y�oW�@Z�Nr�@[sF\��'@\FR"٘y@]m�+[!@]�y���@^���?I�@_��Xh?@`B+i�Q�@`��'sl@a"�^2�@a�1o1��@b�u�E�        ?�PN�o�5?�ė�ߩ�?�(�?�l��ѥ@�Zb@p���h�@VI��U@!Fꢅ@ I�v���@#Ԉ 8 )@'�V�9Q�@+�flX��@0#��I�@2�5��;@5��R�@7����޽@:sMX�@=^:�L.�@@5]����@A��l#Z@Cs ߼H@E*�c@F��G�@H���#2F@J�Q^+�@L����3l@N����@PZ��4o�@Qk�`��@R�E�CY@S�w_�;@Tŏ��E@U�tPvdk@W$A�[�@X]E_.��@Y�����@Z�0`b�@\/���@]��
�=w@^�~.wX�@`F^b<�@`�̴�<@a�F��n@b=��A�@b�����@c��M�y@dw���3a@e;���1@f�X�&�@f���@g���8�@hd��-4@i5��~�@j	dF�@j�h�a5@k����L�@l��>�)�@mpS!�J7@nP&�̤	@o2]��[C@py���@p~���@p���ݳ        ?�Gw "��?���qL�?�M�/A??��hd�	�@?���N�@��x1�@��L]@��<3�0@ ���@#������@'Y� $@+s����@/���A��@2B��Z_�@4��{��N@7Zk��+@:G�:�@<���¢P@?��$��L@A�7����@C3���@D���DV@F��7���@HvtP�J@JVMV�Q@LD�����@NA�_�@P&�FU��@Q3j���@RG=ƶ�x@Sa�	�b�@T�[��"@U�nI@�@V�	q~�`@X9�5@YJu���@Z� m	�@[��3��D@]!���T@^u~!�@_� >G3�@`�@�u�+@aI�+_��@a��Su&@b��H�@cqϮ��@d/-I�yw@d�&�3��@e��+=�}@fv�*ì�@g>SK��\@hX����@h�ʄ��@i��:k��@jt��5�G@kHJC�y@la�B4@l��O&a@m�I��q@n��N�Ǧ@o�Br�KM@p5��B\!@p�^�v�v        ?�s��.��?�*����@ �t��A@�$��j)@��s@��L�@$q��>��@*#��Ӂ@04���g�@3�
V�|[@7J�/��z@;7+&%<@?`�2�@A���~q@D1��.�t@F����:@I Ĥ8]@K����@Nwa�<�@P�� (%�@R�-M�@S�ү�9�@U"���.#@V�=��0@XZR5PO�@Z�ǮŬ@[����+C@]| (�'c@_F0W��@`������@a{�r���@bn�$��@cf�k\D�@dcB�[@ed~\�@fii�z@gr[�7�N@h��GX@i�;/4�@j��0X��@k�Ͳ�@l�I���@m�R���a@o#����@p%́�1@p���H�\@qSå%|@q�q��@M@r��D��@s&Yg_@s�����@te��+�@u�mZ��@u���_,@vQ����@v��]�y@w�����}@xL10&5@x�U���@y�c8�X@zUqx:=@{e|�s�@{�𳬾�        ?��Hv���?�J�T���?�m����V?�?(a�@}�DE��@^O�q@��A1@eڜ�wM@6=Oۀ@*�o(��@!ȓ�{w�@$�s�eY�@'������@*�*x�?@.��i
@0��4@2��3F @4a1�:�@6H�>Ho@8>D�M
9@:C\�*'@<W"���@>x�	rU�@@TmXZ�@As-|~�@B����@Cā� �@D��v��O@F/[���@Gn�^h@H�ߒu�*@I���QW�@KN=2E�<@L���|�@N ���א@Ob--&�@Pd�*��[@Q�i��q@Qӗ6���@R��M0!@SL����@Tw�!��@T�m�$�@U�Ӳ��@V]�O���@W'�`���@W�C9w�@X���lu@Y��EV5@Zgu/�{@[=9p�l@\�+4�&@\��'K�'@]�9�?@^�m)�#7@_��Hb��@`69�n�@`����W�@a�"�wi@a�YQ[�s@b�F�@b|U�oOf@b��W1��        ?�{����K?��k?g��?����a�?��v@Ƞ�g��@	<��r�@g�s�5@y���2s@!��#�@$��c�Z8@(Ғ�q��@-%��_@0��[܎@3W� R@5�o�RC@8��%�r�@;�{��.?@>��B��X@@ٱ�O/�@B|���@D.{��J@E��	�+�@G·��.@I�欕[�@K�����@M���vO�@O�X�F��@P��c�b@Q�	�L@SC��8�@T0�E�q@UYn���@V��_��@W���'<�@X����ҹ@Z<�f���@[��}�j@\�`*{@^'	��8�@_��a��@`p ��@a"��gIb@a�ݫO�N@b��$z��@cJZ$BaF@d�śˠ@d�5w�@e�hE�|�@fN���@g!Sv:$@gޑ��e�@h�WnSM�@ixg���@jH�q$+;@k=i"��@k���VB@l���~��@m��+��p@nzȨ��@oW���)�@p}�H�P@p�D��@p��~ �        ?�& ;>R?�(Ft�-(?�u0�V?�%��@,t��%�@Bi�:��@��	�hK@�)$N�+@ ��|4�@$_.�m�@(R��.�@,�7�oj�@0�
�@~@2�ю�V�@5�+�@8E���
@; ��Q@>0�+�@@�zE���@B7�8��8@C�Su���@E����@Gr���2@IO�?�P@K;�s�z�@M6��F��@O@Ci��@P��3�@Q��A�4�@R�iǼ@S��֬z#@U���d@VMl$�Em@W�cMgݽ@X��D\��@Y�#c��@[B��&IT@\�L�~:@]�Ǽ�ک@_:縬�@`L	%���@`��jT7$@a�kN��Y@bi����@c#���b�@c�J��`�@d�|iD͐@ea:����@f%{CU�@f�3���@g�ZA2C@h��)�9�@iŃw��@j݄[@j�c(�z@k�[$<+�@l�c�6j@mv�=	��@nR%r�u@o/�D=�@p�.=�/@px�6J@p�F��        ?�< ~��?�s�Y�]@IY�k@-��Î�@���o��@ ���$�W@&TK��v@,5X�>�@1~����l@5/_}�I@9)آ�(@=hj"f�@@�>�ǣX@CVY�9�@E�a���@HtO���O@K/4��7O@N4��U�@P|@�}�@R��j@S��4�wQ@U5�8�$@V��M}e@X��t�I�@Z]�zd��@\,�,��7@^� ��@_�g��=�@`�n:���@a�Z�/=/@b�`����@c�h�Y�+@d�[��E@f#[�+i@g%�j��@h?ًQg@i^��nU@j����@k���|�@lճcơ�@n��>�@o:�i)Q�@p9��ޛ@p���G@qxy���Z@r���#@r�(<�@seb9�f@t�{(��@t�{�k�@ucM�}�@v��"��@v�U[�]�@wq���3@x$iV�5�@x�2��@y�V�/T@zGP23u@{ �Xṛ@{�7T��l@|y ^�@}7�O�Ǎ@}��N+��        ?������?�����V?��d�)1?���=�@ �cw4�@�&eO�Z@R�#���@<t�؞U@������@z�k�V�@ �?P�g*@#�J���@&c�x�\;@)f���z�@,��['p�@/��4���@1��n��@3e�6�]@5:����@7���@9�1�$@;��u�@="!)Z�@??��#{@@��dKf;@A�?4Ρ@B�J����@D��Q�_@EI'ԠG@F}�J���@G�A6���@H��iT @J>�6�TQ@K��@~��@L��1�@N3@P��@O�fؑ^@@Px���&9@Q+��H0@Q��ɢ�,@R�t՝v�@SUiV���@T�ߊt@TҡXt<A@U�՟ST@VYdBċ+@W D��@W�k?��@X�κ,Xm@Y�a�V.@ZR��+}@[#��hd@[���X��@\�q�Ⰹ@]�,d�}�@^~�zdͺ@_Z\ǂ��@`����@`�{dPD7@`��w�q�@amX_f�@aߖb�g@bR�ni�0        ?�n�VQ�?�#+Կ"?���3?���Gx�@�.�5�@�Tp�%:@]�.m2@qr�;�@!a�6�a@$�-�]f@(��۪��@-5#Df�)@0�#�Mj�@3j:����@6�	č@8����@;������@>�8�*�U@@�SF*�@B���ã|@D_�U�O@F*�<5��@H�6烘@I���)@K��
@M��B��@P���U@QuU���@R8.ɺ��@S['�x�x@T�A����@U�\�"@V�X���@X-+)Ym@Yr�n�)�@Z�vʈt�@\���h@]i��$J�@^ȩ��Sj@`��q݋@`̌��'@a�*z1��@b@�i��@b�9'��@c�����@d�џ��%@eK�6%T@f��22�@f�-y���@g�g���@h�K֦�_@iWн,�@j.�?m�.@k��X�@k��Q�+�@lÄ��@m����2@n�NVf#�@onU���x@p+`�@V@p��$Z!@qP�aI>@q�*���        ?µ�qn"3?߆)d��,?�H��1_?�k��pS@����@zM���\@^F-��@,ǝkP@ Q�>M�l@#�|ST�$@'���%��@+�Uq��@0,�y�1�@2�[��E"@5%Q��@7�j��L�@:�{$�3@=m�	���@@=�¤�@A�����@C|xf��@E3�ڂ6@F��|�V@H�G�R֍@J����f_@L�'���@N�*���@P_�_��N@Qo��Ni@R�h~%d@S�'�@TȎ\l��@U��1�&@W%q���@X]��`�@Y�K-�2�@Z�7Ls` @\,XӢ��@]}����@^��
���@`	�d�:@`ʎ��e1@a~��
PF@b6(}���@b�'�>��@c��gЙ@dlX�m�j@e.w>=��@e�7>�@f��[��F@g�r�b@hP��t�@i�s�Q�@i��#@j���U9�@k� ���@ls�$�w�@mNZs�@n+Ӄ��@o
�a0y@o�%��@ph?^Z@p�I����        ?�Jè�ب?��^��l�@��F@���Q@���,�m@�Z��@%9i�q;O@+ �]/��@0��ң@4Z_� !Y@8(ޱC�T@<9G��@@D�b1)@B��~��]@D�Gm���@Gj��2�\@J,�$ͤ@L��Y��@O�c�գ@Q4��`��@R�K�_v@T=^Ô@Uҵ�Yr@Ws�G0�@Y�ʗ�@ZӈOɇ@\�0�:N @^\̝�Q@`ۇu�@ay�5��@a��$h�J@b�(
-2q@c�:҈-@d���]��@e�a�R�e@f�I�@hM|��@iY���|@j.[q�h@kG?M]�&@lc�k�Q@m�f[��i@n��wi�m@o�K���@p}�,tY�@q6N�v@q�V�,�7@rI&�Y0�@r�&��@s�����@t#l՚=@tı;*w@ug����@v�)d#W@v��A*U@wX��p�@x}�It@x���orW@yV�p���@z�_�"S@z��׎@{aX�st3@|��.z        ?��/32g�?ذ���?�ݐ6z?�����@ _K��@�p��f�@�J�\�@�~^�@nβ�;�@)5c��@ �
�)�@#I��?�@&��@)	�� @,0�*�@/nrb��@1f��wD@3&�VQu�@4���\��@6�r�5"@8�a7z�@:�E�ZqC@<��(D�M@>ꏭ���@@����O�@A�њ#7s@Bƭ����@C�֚��@E�8�@FS!dU�(@G����H�@H�'�D�@J�-�@Ke��R�]@L��NJ�@NDr"�@Or��LX�@Pl,���@Q!�E�߰@Q�"[;�@R�H���T@SS(	h�'@T�2.z8@T�����,@U���2*�@Ve�D@�@W/�'~��@W�T�+�`@X�.���@Y�u�ri"@Zt!9�O�@[K(F�Ǣ@\$��@] #��hT@]�
�QPD@^�0��@_����@`B�f`�@`����T�@a*V�e�y@a���A�@b_�Ү@b�����*        ?�_d��/5?������?��}�e?���q:�=@���-�Q@���??�@p���_�@F��]+
@ c�ea;�@#���n @'�T���i@,�<~v�@0G��T�@2�5��^@59�R��b@7�6c^�]@:�����@=�O�A�@@@hv�ãm@B�W�Ʈ@C�Q=8�@Ev`�w��@GF��}�g@I'�$��@K^�@M��ҍ@O)�0��@P�L��N@Q��H�A�@Rڗ	d�@T ퟂ��@U.����@Vc���;�@W��L�@X��j1Z@Z,���k�@[}�޸��@\ՠ�&P�@^4 �nd�@_�Ax�S�@`�v���@a;�c�Qz@a��5�@b�/m�-9@cy����@d?P{��@e� Uak@eөdA�@f�U�*�@gs���@hH�trN�@i WP@i�fG��,@jס=$�W@k��^��<@l����φ@m�+ Y&@nh��K�@oS�[5	�@p �wn=@p�ګ�E@q[�!�e@q�)�
sT        ?�~�ꇡ?�3
�Ʃ�?�oj� QI?�"�<i@g�H�@,�yNS@*�|@A�@�ܕG��@ )�k��@#�2��*%@'��I�[@+�/�C;�@0	&�`�{@2d��J�@4�o,o�@7���X�)@:M����@=6Y�&;r@@ 1;�@A����O^@C[|�&7@E;��I@Fָ����@H��Q�M@J����@L�Vv'�@N���	|@PK%o��@QZ�+
*�@Rqv<1�@S�-\��@T��Ѐ�@U�7ݾ]@WW�ϛ@XJ�L�s@Y�Q���#@Z���Uw�@\�Ԣ5@]mG2c@^Ź[��F@`!�u�@`�hϣ?�@ay��'H�@b1��u@b��jT��@c��H]�@dk���@e/s�8�@e���@f� ���@g�fdR`@hY��@i+����@i�$�s_@j��V��@k����@l����@miD{�@nJ-bL@o-��a�@p	�	�y�@p}�Yѱ7@p�F�#�        ?�����9?��5�
�@_�
���@������@ys9�JD@�sE�FD@%4�J4�@*�б��@0�L�Dd^@47���#@8����;@<��g�@@6Ж���@B�E���@D���b�@GmIDO@JP��Q@L̏.o�n@O�!�)�@QL��[�@R�HD# @Te�)�@V�z"@W����@Ye�K@['�oj�M@\���P�@^̞H��@`W�92�!@aN:��M@bI��W@cJ�31g@dP��#�@e[O� ��@fj�C�&@g=/=+�@h�KH���@i����)@j�@ y��@k����5@m*%|��@nY���@o�RI�"@pb��	�@q �*��@q��\|Һ@rB~i�1@r�aՃ�@s�-��]�@t3��z�@t�[����@u���*�@v5��7@v�L'5�@w�FI�?@xG��Vw @x�����@y�R�,�|@zh���1@{!���ۄ@{�;���;@|�d�"�@}VaB�        ?�� �_�?؁���X?�W!VY�?�������@ +hyO�@u�^߂d@�((<�@�;���F@�멏4�@��\հX@ 7Ӣ�G@"ˌ��! @%�Xv�*�@(Y���S?@+Q�Y@.f�sH@0̹�g��@2tc���@4)���Y5@5��.�@7��G�K�@9��ހ�@;�D���@=x�t�=@?z`m��@@���	=x@A�j
�%@B��o�\�@C��S�f@E��~@F7��o@G]�e���@H�����@I��2�@J��_���@L'`7j@Md��,�@N���6r@O���.�3@P����o@QB�H۠�@Q�u�@R�7��g@SDK,H�@S�@s9¿@T���9@UV��2!�@V
�y�@V�%��@Wx�Ҋ@X2T�t��@X�d�O;�@Y�
?�֜@Zh=ÙV�@['��:@[�3��@\����@]p
P���@^5�YsC	@^���AL@_��X�ȶ@`GZ���&@`��3        ?��<��
?�l�{jq?�.��o_&?�W����@L����>@m�up_�@��_@ <�Pw@ ����'@$��� @(���ێ@,׈ɳ�~@0��@!�@34�;��@5�I��6�@8�u^UV�@;���τ�@>�+��@@ߺ`	u@B��wqz�@DEw«)�@F/M�o@G�P�n�o@I�$w��@K�=pעv@M�^/K<�@P�l=}@Q`,��@R8��t@S^Ő1�W@T�<ܱ�z@U���3�@V�>��`@X@�d�@Y�U��@Zܓ��@\5 L�@]�E���U@^�Nʚ�.@`3�����@`�.yw �@a�Vŏ@bjC�pM@c-�m7)�@c�^Ə@d��:�@e�Z�#�@fZH��@g,�Um@�@hh�}�@h��:+�)@i�{4@j���@kv	��#@lZ�ؐ�@m@���@n*i�H�@o����#@pقE�.@p{���s�@p���r�@qqX��s<@q�#Ժ�        ?��R}�ȁ?�C!�Jd?�ބ���Y?�GIN���@��Y�5i@B��p!d@��[�%@"���·@Xѱ(O@#�gW'@&�ŧ���@*�2ZƆ8@/m�Y@1���|�@4>;�@6�6��@@9y����@<IQ���d@?8�R;��@A$0�Sy@B�#��&5@Dan�}�@F��T�@GڅT�c�@I��IV^!@K�'*?>@M{fl7p�@OwB��6�@P�=���@Q�i�&��@R��"l@S��([�>@Uj�T@V7b��G@Wa�P�5�@X��ZSz@YǮ	۷j@[<� �@\DX�Ɔ�@]��.�\6@^���j��@` ˞'�@`�/<���@al�.��@b&���@b�א�Oq@c��ި��@d<p��(y@d�C�ܓ�@e�ca��	@fp��xץ@g1b)�-t@g�.�$I�@h�#��n�@i�8~Ym�@jIeC�d?@k� a;-@k��~1��@l�*���f@m�f|�r�@nU��� @o*��ם@p �O�s        ?�(|ʇ#v?��3��_@ �³�R�@Pz��3j@o���@J�X@#���DO@)�Cs_@/�&��E@3O��TF@6��ڶא@:q���)q@>smo%��@AU���@C�9�5��@E۸'0@HC}n�h@J¹y��q@MX��j�@P\ZC8@Qc�In@R�E����@TC��,A}@U²9X@WK`M�D�@X�Sء�^@ZxH��`Z@\��Q��@]�3Ki@_|�� �L@`����!�@a~��QS@bd���I@cNq�Ws�@d;��XZ\@e,����@f �N��@gb��?�@h;��q@iF��r@jt�u�@k����E@l�C3p�@m(8b=�@n5V�%��@oEJ�%@p,ㆁ@p���9S@qB�s��@q�.��om@r^܂��u@r��Z��L@s�*@��@t{�pc�@t�'c�@u;�x1@u�4���@vh@A*��@w �b�x@w� W'�@x4��r�@x�'e�@ylǭ�d�        ?���KS�?פ\����?觟y �?��p��?�d��o�d@�%�[�@�V�w�@@:�Uh@q����@�ǈG��@ō����@"p*��g�@%!�R��@'�i<�@*��Dh5�@-���!u+@0��\a�@2Bw0,@3�	�=@5���9�@7���At@9w�ez�|@;g�<��n@=e 9���@?oMk�3@@�'�:ť@A���J�@B��y�@D
�&S'@E.F� �5@FW�O��'@G��F�P@H�����j@I��G9��@K5U(Ip"@Lz6���@M�S���@O��y@P4�ή@P��ѭ�]@Q���LE@RA�Ԧ@R�$;�@S����H@Te�g�w @U!q��$L@U�Q8�n@V���ȱ*@Wb��_@X&�E�S@X���)�<@Y�P��&
@Z����M@[P���>�@\ ���@\���G��@]�$ߝ�A@^����@_vC=yy@`(��i��@`��S�@ag�hC�@av��"�        ?��B�	r?��1�ܧn?�;\�A�l?���C�̸@F�Q��@�DW�.<@8j�@����@�y$��@"�T��#z@&@��p�@*(��1��@.W�/>V@1f=�w�@3I[.@6@;���?@8ޓ���@;��<-�@>zݲ%�@@�Ͽ#�@BIU��@C�X�K@E���l�@GJ
�S�@IrRt�@J�XP�i@LɈC�`@N��r���@P[�0�@Q`�n�8�@Rl%J��@S}����@T��<vd@U�����~@Vנ����@Xjע��@Y0��E�`@ZfJ��@[�4� ��@\�t	T@^'�|q�@_rٝY0@`a�A�2 @a����@a���β�@bi�}��t@c\h�P@c�8����@d�{�D�?@eB��Gs@e�*��>@f�P7nw�@g|Ӊ�@h?�&Yt@i�XH��@iˣ���@j����;R@k`L z�4@l-���l@l�\N���@m��3�y�@n����$B@ox]��"A        ?�?˰S�?�M��⿅?�/�1���?�j�
��]@]�\@�^@��L��@�{i k@��=�@ ذ�?5�@$�g(���@(yV�O�@,�w�2�@0�{Jg@3���,@5��\��x@8k�:^@;I�>OB�@>J��%�@@��p��@BY����G@D��cp@EЅD��@G�B���@I���B��@K{&��<@M}�Ixv�@O��g���@P�n�?Ã@Q�\;2@S�㣗[@T6yZW�@Uc�'�Cp@V�4�Ħ@Wӷ�x<�@YДQ@Z_(}��@[��2�~@]>�ے�@^bp��@_�T6Ͱu@`�t�AjC@aO^�,��@b
_I�@b�k��3@c�|���P@dM�k�@e�?)�@e�w�;��@f�K�u"�@gz�ŭ�G@hM�v;|�@i"�T�@i����@j�8��@k��sf?@l�/G?�@mwO���@n]57��@oE���7X@pQٵ$�@p�'�RD@qD���@q����        ?Ӷ\���?�[��}��@%���iN@@�M��@,�y�$@$�[�(�@$��&��@*��`9�!@0v_� ŭ@3��G��@7���SY�@;��1]�@@{��:�@BD��?@D����.}@G"�}�@I���ʌ@Lr�<��@OCq
aI@Q�|{@R�+)�@T'�(�X@U�{��@Wi+n`��@Y�Sp©@Z�_Ǳ@\�m+!�@^vv�S�q@`*���@a@Q��@b?�1�@cǇ�s�@dt�Rx@e#���@f1#� u�@gB���@hYV��R@it/��@j�p�jB�@k����@l��<5Z!@n
���l@o;=u,��@p7�!�z�@p�V=��@qrO�L~@r���x@r��B8T�@sY1kw�e@s�uׁ	�@t���t�(@uQ��ק@u���
b0@v��Ra(@w[�/��@x�x�N@x�.���X@yv�_�� @z-�0��@z�R��@{��`�7�@|^�r	��@}�b��        ?�D���I�?�F�ׇX?�����?���yz@@ ��čt@�Nw�&�@4f�X+�@R1�v�@z�wuRc@,�[��@ �p	��@#>�a-)M@&
 ���@(�w ���@,���D@/9LQ��@1Dɀ|��@2�I�1�@4���3�@6���~@8{zY7��@:m��Հ@<l~hRW@>yp~�q�@@I���*@A]k�ks�@Bwd$j"@C���%"g@D��
�-�@E�Uu�@@G���&_@HT�~^a�@I�߮��@Jց*�!@L��f�@MnD��b�@N�<u0�D@P�"& �@P� [�S�@Qn�g9�@R#=���@R�-��N�@S��C�}�@TO��[?@U���2@Uδ���@V���+�@WW�Z�t@Xv����@X���~@Y�_ٶ��@Z�C�^M@[Vi���@\)����q@\�aG�*@]�)�(�@^��_�@_�)�t�@`5��"�L@`����@a��%�g@a��*-t�@a���K�        ?�&<|��?�_�` m�?�jQz5�?�H��}�@K-��Ϳ@�%u]�e@	�����@��jLwX@ ��_%M@#�i�@'SJ�E�@+jV�MY@/��pa<�@2;�/�I@4��3F��@7O�EF��@:0@��-@<�9^��c@?�ib]�{@A��B�H-@C)�j�{�@D�?q{I�@F���5�x@Hje0�s@JH��h�O@L6My��Q@N2y��3�@P��k�,@Q*���@R>g��6@SX��p�q@Ty�vT��@U��o}N@VА4�Q4@X�{�@YA��{�$@Z���Vt�@[�*ϠN�@]�܊@^o�7���@_��mP�@`�����@aI���|@b 7l�~@b�e����@cu��U9�@d4��X.@d��%E��@e�eW��@f�݂��{@gM|%��@h�.�_�@h��b@i��j��w@j��'�@kh4@�q@lBM�ɽ�@m�r�@m�1���@n�����@o�0ֺ%�@pUu�:*�@p�B.a        ?}g O�?�+tͺ�?�i�Ë�y?�OU7@^��ķ@ �A�s�@"n�G�B@�)o�@ "#5Pa@#��O��@'v����K@+�G9|.@/��n_Y�@2X��LI@4�OC��y@7vG�@::O���@=8>�P�@@Ԩ�g1@A�n,R��@CJy:!j@D���x�@F��9�`|@H�7��@Jt�[��|@Ld��P1�@Ndy�U@P8�$])@QF�k�m@R[�n��@Sw�ъl@T�U�

F@U�跜u�@V�-��z+@X+u�w�@Yht�5z;@Z�K��J@[�}�x�@]F�"� �@^��f2.�@_�^�e�@`���P��@ab�,|��@b@H�X�@b�t�a+�@c���o�@dQi�PJ�@e�aA@e��z�@f����p@gli�N�@h9Վb�@i	�ת��@i�pR��^@j���R�@k�+�>�I@lc@�^@m?ż�7J@n����@o  ����@o�ܪm(@pd��s��@p���yq�        ?�Jʽ߉�?��	���s@ ���}�@�8�-%F@��eX�t@c��Zϙ@$6OG�+@)ֲ�	�]@00�^u@3d=B��@7S!٪Z@:�7L�)�@?/�nm@A�k9z��@C���#5@FSx���@H��nz�D@Kc��a&q@N�[�=�@Pjέ��m@Q���;(�@SR+띱�@T�xx���@Vey�M�@W��
ԥ(@Y���V�5@[P/Ѓ��@]�5=�@@^�y��{@`Ib���@a3#�0�@b!hyg�@c�Km
@d+��W@e�n<�@f��@g	�zLsV@h���-@i�+Q�@j-�wnQ@kA��il�@lYk��4@mu%z�3@n������@o��V��@pos��J@q�(�bp@q������@r4�׹�1@rϢ��C+@sl��2F@t
4��~@t��0w@uKd)�e@u��j�|@v�IJ�D_@w9�T�ѓ@w�Y���'@x����To@y5u,<�@y�P�x�@z�c��4@{>y̑�b        ?�oAQj�?�Zgf��?�`A	P�?�z.D@�@ #�#E@t�y��@� �2@�^��.�@���-@���F)3@ \h��N"@"�.��W�@%Ƒ�8��@(�!�О@+���1@.�j�E@1�A�i�@2����N3@4���IV@6j~�&=+@8L�b���@:<�S|d�@<:'���@>E�ZFQ@@.���0@A@��Jb@BY]���@Cw�����@D��z�
�@E�����@F�Y%�2@H->�&k@Ih�Fi�:@J��nj@K���q��@M;1����@N�µ�\-@O�Z���~@P��?�@QM����$@Q��PP�@R�;��@Sj�6J��@T#����@T��{L��@U�A��+@V[���wY@W6|��g@W����@X�E�#�N@Ym�&]<@Z7$�L$�@[l@�9�@[ώ�Gc�@\��P=V@]oFeZ�@^Aɀ��@_		�@_��P�}@`a�o@`�N���@a;�*�@a��c�        ?� 	S^�
?�O��WQ?�b&�o�?���%f@AZ�C�i@�L��@ �ò�H@�p���@ w�ޓ�@#�ҾV@'H��� @+]�<���@/�4�s@22�H?@4�R�
_$@7D�#�I@:��L�d@<�nv��@?�����@A���$l1@C � 7�+@D��/C�@F�b���	@H_1�Ok�@J=�b�(@L)���7m@N$��I@P%�(�@Q"��Nl�@R5��;�@SOP�P�4@To����@@U����F�@V�8���T@W�>�;��@Y2��N@Zsf�T�@[�`/t�@]�Y��@^Z�r�4\@_��r�'@`��P��@a<4��4@a�ރ�@b���@ceP�`uA@d#`h�_@d�;	_U�@e�؇~s@fn0����@g7;	�.@h����1@h�G���@i�:��@ju�2�Y@kK��Vg@l$kAx_q@l���~�@m���@n�
��Ϸ@o�s���@pB!����@p��Rz��        ?�7���&?��(����?�=�+H�?��0��y@.Z���`@�,(��@�$LY�@�M�k��@  w�#�@#�X��v�@'T�}u��@+o�kI@@/֌T/��@2Cf�&�H@4��ƥ��@7_$��E@:!a{�C@=��{
@@�w���@A�	�@C<�����@D��=U@F��={6@H�Jg�F�@Jf�S�y@LW-�ܣ
@NV5a	��@P1�Gu��@Q?�(;A�@RTw�
�y@Sp+�̣P@T����	�@U��s��@V�����@X!�}��}@Y^���l�@Z���Su�@[�aC��@]:�(#��@^�����@_�Qz��@`�� `�@aZ27;@b���@b�.n=�@c���@dD�#\��@ex� "�@eʫ��A@f�5�@gZ�j��@h&勏�@h�g����@i�i|IQJ@j���W��@ko˲wƓ@lH�OQ@m"�;p@m��Mdr�@n�+�`�@o�ʾ�b�@pRT�^�y@p�`}:�`        ?���V�VF?�Sћ�y@ k'�s`v@ E���@7��e@E@Ǌ�8��@#��b³o@)P�?�@/b՛*�7@2�y�,6�@6��0 �_@:V�R�H@>\�P��@AMoJhސ@C���0�@E�!�/�=@HI��0G@J�G�ܗ@Mns����@P�nݔZ@Qw�0|>s@R諍���@Td;�1�;@U�;w���@WznC.�@Y��n�@Z��C���@\fZ��@^�?�g@_��;7@`�l��@a� �#=@b�<���u@c���c@d�BGE	d@e��7]ug@f�fF�,�@g���/�@h���W��@i��8t�@j�0�gH@k�#�Q�@lƌ��@m�X��/@n�yW�o�@p
oN��@p��+IS/@q,�>��@q��D7@rU�ݳq@r�sOq*�@s�Z����@t� ��@t�pu�@uS��d� @u��v�0@v��F��@w0'	��@wѫ��@xtx�A%@y�q��@y��?Xe�@zdg�E        ?��+C�7�?�a!qd0?�e<!�U�?���>u@ )hgO��@~�¨��@��y�.@��Y�@!��ۻ�@��J(j@ b2�"}@##�޻@%̴�(��@(��o�s@+�Z���B@.�1�{<�@1 	�ۙ@2֒-Y�@4�Q%��w@6p賓M�@8S�9��@:E$�G�@<Ds� e@>P�aV�h@@5o���@AH:)�+@Ba�@֭@C�U���Z@D��4@Eң��`�@G#��%�@H;mֳ:@Ixh�O��@J�����]@L�]MW@MP�ja9@N�Unݯ.@O�Ua�@P�:��@Q]S��S@R�Rt�k@R��=59�@S}N���@T:e��w@T��Xn7�@U�M�5@Vy?�L�@W=zd��@X�вX@X̥6@@Y������@Zd�(�@[3���A@\�[dM�@\�P5+�@]��y-5�@^�**��@_^���RS@`f���@`��F���@`���LYC@al]s6��@a�%�D�W        ?ÔXI#��?���)��?�-Ƣu�?���򠴋@�,`���@����	x@olѨ�@B�y��@ ^��ԫ�@#�٫G1�@'�ҡ32'@+�޵D�@0;�4ٿ�@2�%x��>@5%AA�No@7�;�|@:�ja���@=�-B0m�@@P��+�@A���\�@C�p9:=�@EPo�F�@Gr�8K@H�c d�@J���@Lֈ+!�@N�wꅽ@Pz-���@Q��n�?�@R�.�m@S��0x�@T�w���@V��{�U@WR9���@X�+qO��@Yв��%W@[���y�@\i"��U�@]��|_�@_�`�S�@`>j+�)@`�p_b��@a�k����@bcPL���@c �ݾ�@c߫����@d�����@eg0P]�@f/	i4�2@f�����@gƼ�kX@h���%D@ih�zt��@j=��탖@kP�_�@k�JEdd@l˻���@m����@n���9�@oo��S@p*�ړ;�@p��p�5~@q3��xB        ?�$�5��?ޔ��N݂?�Y'�"p?��hp�_ @��=��@�O��@�%����@a�b#}@��>DgR@#B[�Q�@&��F6�@+��ti@/T���}@1�[��^@4b�:� �@6��j+�T@9���4F�@<r�Á�%@?b�a�A�@A9�Ap@B�r ��@Dv	�k
@F*�E��6@G�� �%-@I�Xn��@K��T=�1@M����@O�[{��@P�Jfb@Qщ���@R�c�Ø�@S��9�?}@U�N=@V:TO��@Wc�p��#@X����}@Y�����@[�Kk�4@\C>)V�@]���d@^�`\�N�@`~��`@`�n��>@aj���.!@b
p��@b͡Ѷ7�@c���U��@d:0��"F@d����L@e�U�T�@fn����@g/�[	�=@g�=��@h�xj^�@i�$�U@7@jJ�Cρ@kC1M�@k�;��/@l��lƽ�@m�ஹ��@n[J�Y��@o1�[-I@pV���        ?Ӷ9�%3P?�N�8>�@@^f�}@+��5@
��1��@�zڦ��@$���Yx�@*J�\�4�@0L���@3��oL}�@7l��^@;^x}	�@?�$&]�@A��`�E@DN�����@F�����t@IE~�Ի�@K�X��)�@N��U|*@P��0&�%@R36LdC@S�#���1@UB�cg@@V�#�|�@X~��'�'@Z,��2~@[�nJ��@]���o�@_tq��_@`�tC�!7@a�~�0@b�Dh|��@c������@d����@e�.����@f��2��@g�i�_@&@h���Tq@i��t�e�@j���%�W@k��x�j@m�8y�@n1����;@oY�>��@pB�3�S@pڢ�E@}@qtGf'�\@r�Y�w�@r��(�!@sL/sha�@s�$��@t��dv�@u4���V@u�6W�x#@v�
׊�@w+��h�@w�ͮ���@x���-��@y2Q�u�6@y���A@z�{�S�m@{H�s�@{�,�M�        ?�`A#��'?אh}A(0?�u�?�ڑ��%6?�c��p/@��J!@�ꄓ�9@S���S5@�t��Y@$XX`bM@ ��g9:@"���44@%V�P���@(5���y�@+6@AwQ�@.Wj �4@0� ��\@2{�{/�@4:�G��@6\B��a@7�2'K��@9����i@;ň���@=�m��3@?�i��٢@@����_@B<�k�@C.���N@DP��}�c@Ex��@F�H��@G��F@IS�`d�@JM���;%@K��{�(�@L��� @N&Ib��d@Ox���t�@Pg�QYv@Q�gVh]@Q�VCZ�V@Ry#� ��@S.E���.@S�m�@@T�a�X��@U[K���@Vj�]ڻ@Vٷ�F�L@W�+��\@X`�1m�@Y'p�]-,@Y�2h�s�@Z�����@[��9	�@\V����@]'���M�@]�U�$�<@^�����@_��
�X�@`??�S�t@`��S��@a�֖^�@a��~~:        ?��`Z�q?�.����'?�W|q?��-*� �@=Lk���@�XA?�q@K	�'@�{Qin@ N�a,@#� \JU@'^�2�K@+{W���@/�@L?w�@2J_�Y�@4�%���@7g8�͙n@:)�6�>@=3A@@
0�@A�wX�7�@C@�@��h@D��k��@F�pحeB@H�<�!�@Ji �k��@LX}�WE@NVx	�+@P1Yݧ<{@Q>z��0@RR���v;@SmV�b��@T����^@U���p��@V�����@X����@YV
�Su@Z��1r��@[�d-���@]-1�Q@^��￤�@_ڝ�7��@`�
Tn&+@aO����@bc�.�@b�H�f@cx@�u�g@d5�3�t@d�K�ې�@e�N��c@f~��xN�@gG"��d�@h���,@h�)]�@i���B_�@j��.�@kU�<r�@l,�ƒ�*@m�p��@m��o�:�@n�ɹ�&@o�i'o@pAGM^tv@p��Pj�        ?���uE\?�(�Y��?���E�?�&��rE@+�p�h�@>��VYg@�`�M�@ς���@ ��Z�i@$T�R�#�@(D,|�@,���!�@0�~���@2�6���@5}(�ń�@8.���2@;��0ǫ@=���b��@@�MR-�@B$���9@C�栧��@E�q��f@GX��f��@I4�#P@K7��Q�@MD��p6@O�\B�@P�y��(@Q��C�s@RţcJ�@S啇�n�@UP�@V9��K��@Wm�3�c@X�ee��@Y�ycg��@[0�@�@\~��`��@]��'��@_,�H���@`F�8"��@`�ķ�w�@a���*�@bh���@c$�r,ғ@c㡕-�!@d�B�G@ei�\�@f0��1�@f����_@gǬ���@h���=Z@iiC�=M@j>��@k�*F�@k����@l�D���]@m����
�@n�R���"@oq�N��@p,A��D,@p��{<.�@qت��z        ?� �(��?�I��@�I&���@�w�ʨt@���m@�a�MH�@%>H"@+.���`@0�ǊDN�@4q|���@8K�,z�@<j�m��e@@e���"@B���@E$��Q�@G�G�|�@JZ6�>@M���@O��8M�@Q|�W4/y@S���B'@T�0b��@V?��K"@W�~�@Y���1��@[n�	���@]?P
�T�@_���.@`��~8b@ay��YG@bv~���@cx�;�@d�I�ӳ@e�i�@f�8�2��@g��y�Zb@ȟV�YF@i��KCЅ@k�I�dP@l4��-$W@m_�"�X@n�4d��@o�U�@p}��x@q�`�W@q����Ȫ@r\x����@s 7�w��@s���H=�@tM��#&@t� 6���@u����K@vO��yZ�@v�B$��x@w�e`S��@xce�U�@y>k�o@y���m�@z�q.Q�@{AŽW�@{��ct�P@|����@}{����        ?����5�?��P^�?�!֍�_q?�N�8G��@ 	�:�@X�Z��J@�G�B@�a�_a@��	�@�)%�e�@ R_��7�@"�h_Z@%�B!s��@(��3�@+��M�F@.�w܁wF@1it+�*@2�>	 @4��A��@6Z��U�@8;�2�_@:*/�i�@<&KkUS@>/��9�@@#Z;ם�@A55,���@BMi�u�;@Ck��aր@D�lb���@E�	z�a�@F�s-R�@H"�؝	@I^2nx�@J�
/��6@K�q�}x�@M4O�;�{@N����Q�@O�I�@P�lC��@QNZ3p>@RʃXQ@R���[%E@Spȸ�F@T*��;@T���!�@U�D6S�M@Vh���3�@W,���1@W���C@X�]��n�@Y��6�fB@ZR�f}�@[!K�pƼ@[�"�>�9@\�'A�@]�����@^p�b��K@_I�;4�@`S����@`���D@`�g��@a`g,��@aѫ�/'        ?������?�O5fB�a?��lX�Y?�<p�x@�>f�@ ��3C@ǡ� �{@��?�E@ ��ʺ�@$8�Ջ�@("O�%�$@,YƱ�{j@0n����9@2�_���_@5`�(5�Y@8>��@:��͛@=��M��P@@uU���@B�7�~:@C��2���@Exs�7�
@GD!���@Id� >�@K
��7@M��6��@Os����@P��A���@Q��j��n@R��Y;@S�>��1n@Uq�'M�@V7�#��@Wmosi�k@X�	�*�@Y�A���@[6�[�[�@\�-I��@]ݶs�`[@_:����Q@`N���4e@aP�)n.@a���=�L@buql��@c2�@c�T���{@d��8��"@e|�C��@fE��pu@gK�2@g߻+�`�@h���?�@i��a��@j[@�U��@k4f�5��@l*L���@l�9]@m�k�C�@n���n��@o��W���@p@���U@p�\A�o@q,���D        ?��I&X1?���B�,?�x:ƚ�I?��;3��B@}�%�%+@��l�Z@M���@�e�-��@룟��f@"���j�@&xS�&�J@*g�>zp @.��<�]@1���i;�@3�e�*@6l�q{e�@9|���@;�V�6�@>���G�@@��J_@Bf����6@D�j���@E����K@Gm8c:�@I6��l; @K��H�@L���C��@N�?!x�@Pt��V�)@Q|���@R�P2Y�@S�{۠��@T�hP��@Uڰ���@WAt5{@X0�H@Yc�0�=@Z�����@[���s,�@]#�i
PN@^o>ΉA�@_��y�@`�٪��@a:13�,7@a�M�~/�@b�%�iD�@cU���&�@d�͓v@dʻ����@e�)�0]l@fJ&�+e�@g���_�@gӧ���@h�LSg@if�S�j�@j4F�v?H@k�@�@k��?�@l�Ej�>@m����>@nYΒF] @o4�zA�@p	,-�        ?�ǳ���?�l��X/@6�V���@Z��|*@>q�?� @9�F��@$�ͭ��@*�2q2��@0y�o	��@3�����@7�ѣ�-�@;���ɤ@?������@B8p��V@D�2��@GE���F@I��Q� @LM��M��@O�j��@P��ݟ��@Rxl���@TOcT�|@U��#ܪ�@W6�2��@X�Z���@Z��+	V@\X����@^$�5@�2@_���F��@`�|˯`@a����)@b���?�9@c��+�Ƅ@d��ÜB@e�DJ9
@f�YY��@h��[@i�МV�@j7N�ЮI@kU�ژZ<@lx��I@m��!�@nʰY�
{@o��aK�@p�P��u�@q1�0�1@q�7t��@rnR�_@sn��cr@s�c���@tW+��PF@t��n/�Y@u�b..�@vP@B��g@v��4B�@w��lެ�@xY��6W@y	�����@y������@zp��}�x@{&�vU@{ތ��*@|��1�`�        ?��pǩ?�}O-�s?�	}?�� �Q@ M꫖b�@� ���R@U+
�m@�6�`�@|�ގ��@C�V�~�@ ����@#g���J@&D��D`�@)HGK��@,o�[�u�@/�E�E@1�R�}	\@3Y��!��@50���@7��L@9p�O-@;͜�81@=#�����@?D��W�@@��Kmj�@A��:2'@B��Gd@D'�2��@EY_R��@F���q@G��K�U(@I��cw@J\bą�@K�gs���@M Ys�I>@NZ����\@O��}6?�@P�� l	@QEo���I@Q�i&��@R���!G@Su	�R�E@T4�aq�y@T�u֧L�@U�����f@V�"�DS�@WI�&7� @X��d̙@X��Iѓ@Y�����U@Z��6-��@[UR�@\*7��3�@]j�\��@]ړ�_��@^���4O@_����Z@`8�~�d�@`�,H�z�@ay_�w;@a���y@a�ˁ�Z�@bs��hr        ?�
Do�1?�w�����?�A*�;?�|��p-@k���Vy@��$B�3@!��n�@+&�;�@ ��Z@$�P��@(���+8�@-}5#{G@0�/����@3R����k@5��w@8����@;���$�R@>���E@@���}�@B��|�@Dar�-*@F/��j�@HѳvQ@I����b@K��qb�@NO�	%F@P�����@Q.O�5�@RMV�쀲@Ss�Y�ծ@T�����@U��� �g@W
 ��@XVPr��@Y��ښ@Z�8'@\I5��@]�y,G��@_5t#;$@`;���D@@`�V�N�@a�{�j@bn�N.�@c0��{�@c��:J��@d�/*
k=@e��E�=@fU�u�{@g%B�
d�@g�*N��6@h���I�@i�
�N74@j��e�kQ@k^f���F@l>j����@m ��$"@n��)�U@n�uD'�@o�_��K@pa� �
�@p�3S�n@qQ�u��@q�n����        ?�> ��i&?�J�	�?�/ccW�@?�p�T*�~@h(z0��@�a��a�@!N�U�]@*�֩E�@ ���E�@$���qW@(��k�e@- ���~@0�k(���@3Ms9���@5���d�@8��)<X*@;��jA �@>�I���+@@�u���@B��+'�f@DQS��>@F;�t�@G�a��@I�yG�@K�<ۉ�@M�j��!@P `:���@Q~�mq�@R/�7I�?@SR�'rZZ@T|Z�z:�@U�N�$�@V���W�@X"���@YgӮ�<E@Z�<X�-�@\
w&@]]#v�0@^�m��>�@`�jD�@`���@a}=s�g�@b8ID��@b�0���@c��*9�g@dze<|1@e@�t�p2@f	�t��U@f����^@g�DE�r8@ht�A!U@iGR��y(@j!�8T!@j�iY�+D@k� �!�@l�@�@ǧ@m������@nn�K��@oRŚ|�P@p���}8@p��NJoe@qo>�@q}�:�        ?�Q5�!e?��P.�Gf@�
'hY�@!���t7@Ӱ|�ӽ@ ����@%N	�&[0@+<�E+B@0⺃0~�@4q	`(�@8EA��=@<\F�F@@Y�j@B��4@E�ͺ�@G�Va�Q@J0�C��I@L뭝�+)@O����b@QW���8I@R�^��݃@Tk���@Vy}9_�@W�]T�f@Y_q��=@[p8*@@\�_�@^��7O�@`I"��-�@a<3j�3�@b4$~iN�@c0���@d2DaA\@e8D�\#@fBˡDyE@gQǩ�uR@he(7�>�@i|�3;O�@j��
�@k��ER[@l�<k9@n����m@o1ͦ@p0����@p��*N0I@qf���8@r�<�E9@r�6�V%�@sE���v�@s���?@t������@u4D܄Q@u܏*E@v����,@w22<>�@w�:㨚Q@x���
�@y>L�J8@y�*\�!>@z��U�M@{X��\�@|��ٖ�@|������        ?����h?���0IW?�������?�&b�?��C(N�@'���@<��֖@���\��@� [�w�@n·Q@ ,� $�@"���!�@%�ʼq�@(g�@��@+jBŰ�z@.��_�[@0��m�@2��	�v@4U���@6"��ȿ�@7���O�@9�V��
@;�isg�V@=��j@?�Iˢ��@A�Y�a@B�Qݗ@C4.��m�@DT?�߶�@Ez&���@F��U̸@G֗<�@IZ�@JI�MI�@K�,m�!�@LЀ�l��@N��Xy'@Ol.n�T�@P`�0�x�@Q���`@Q���v�@Rn(���@S!�?٣�@Sך~�>@T��6�:@UI��/�@V���hW@V���@W���g�@XE�-'��@Y	����@Y����P�@Z���͒@[a�*���@\-T�M��@\�і��@]���0b@^�5t��@_nO]�@`![c��@`��T]"�@`����H�@aetQD�        ?�I�
��9?�轖=v?�mW���?��#/��f@�r%䎳@�x���@T�v�h@kL�<�@!p�3%�@$Ӆ���1@(ုڀU@-AN�%�-@0��
��@3w�c�@6���]@8�b�U�@;�D���@>�a��@A+���@B�A���@D|�6T�@FK�=�(%@H+b[�+�@J��ԏ�@L��fy@N,��om@P%�}�N@Q=��u�@R\�S{��@S�x����@T�|D|i<@U溟�d@W#�ȡs@Xf|NY5F@Y����Z@[�'�6@\Y��^rH@]�D->e@_Q���@`Dmj@`�c�j��@a��wM%�@bx���M@c;_�L@d d�Ԁo@dȻu�J�@e�
��@fbHB%�[@g3m����@hrb�˺@h�O�X�e@i���q��@j�x|UB�@ks�^n�@lU�<�
:@m:`{�O!@n!�3�=@o�Tě@o��_&�@ps��9w@p�ۊr70@qgZXz@q��k�        ?�oO�d��?��S?�]�+-*?����hP@R}�#3y@�AM!@���@*@Ի&w�@ F�BE�@#��j��@'l|G�Uf@+���m�@/���o@2N��FD6@4��	�P�@7gnx|	N@:&��Bx�@=��R��@@����@A�6���P@C5�GN4@D�R`9@F�6��~g@Hq��!@JNNTI<�@L8�Kj�@N1�Շ��@P,U#�l@Q&I=�)X@R7��@SN��wC�@Tlg��@U���jm�@V�;���@W�����@Y"�e(�.@Z_�k�a@[�.�@@\�[E�@^8�I,@@_�hp�F@`r�2;�@a"��V�@a���5�@b����~�@c?�A-�@c�����O@d�ϗ���@ety�}fR@f5��8ׁ@f��:��@g��%��l@h����;@iQM�u]�@j��л5@j�Æ��[@k����G@l��eӏH@mf1[��@n=�sd@o��/�7@o�Z���@pg�U
��        ?�[�c�C<?���jB�@ و�w~@�K���@6�k@��9!�t@$K�"��?@)�^p�7@0:�>�@3o�8�v�@7�0U@:���Gl@?ߴ@A�0?r3�@C��"((@FHSAe�@H�����@KK�ޓN]@M�/s�L}@PV� _��@Q��(U^�@S4$a��@T��1��@V;�(T\�@WΑ���@YkF#6��@[}V@\���A�@^y����@`x��"%@a���@a����|�@b�Jt9Z�@c�Ӌ�c�@d�XlX	@e���b@f���K@g��=��@h�t�8� @iē�حa@j�,b �@k�-;��*@l���@nr�u�@o�J�^@p�A�@p�d%��@q>b��@q�ܦ#��@rd˙���@r�*c�B�@s����M�@t)%�'&�@t¹���@u]��ψw@u��{�!@v����@w6M�w�@wָeū@xx7��4@y����@y�����@zd32vB+        ?��#ȥ�?׭u��?��0��?����aB�?�{����@����L@�T�P��@e|�@�gI�ۯ@I�:J��@ �C�2=@"����n�@%���>@(n�St:d@+|�~�;[@.����@0����@2��Qu�@4�i{�(�@6X���T@8?���c�@:6PTΈ�@<;L̟��@>N��r8�@@7�-1Ղ@AO���3�@Bm��~�@C��1@D�|)+-�@E�s#���@G(�V+	W@Hg-X��G@I��*�@J�F���B@LF��~{@M���ҟ@N�ͫ+�@P-'yk45@P�l{9@Q��(�3�@RO�s��@S}K�Li@SɶWX]@T��ˇLX@UM�l��@V�W�!�@V��+@W�ޑn�@Xt��y�@YC��E�i@Z���eS@Z��:��A@[�q�:
@\�@����@]tF����@^Qx��8�@_0�׺��@`	td�O@`z�N	�@`풣��F@aaQ�M7�@a����@bK�@Dҝ        ?��(�;�?�m�a�c�?�6Y�}?�j�*5�@^�����@�w�4ĩ@s��9@8=��r@ �#6�F@$�kw���@(�NNU�@,�ޖ�u@0ή$Q�K@3I����@5�ֵ�x�@8�GZi�J@;��X��@>��ڟ *@@�Z��r@B��`b�@DW�^�H@F%G���@H�����@I��)T�q@K�}���@Ne��E�@PDN-��@Q'�����@RF�vb��@SmH��F�@T�\)j�@U��'[�F@Wx��#�@XQN���\@Y�3j�\(@Z���@\F���P�@]�5�f��@_O�9�@`<z��c�@`��u}@a���0	�@br��]@c5���_@c�p�@d�Y��2@e�.�{pY@f^�|���@g0kf��@h�|�Q�@h���:�@i���@j��8�@kp��~M@lR�6<��@m6ͶyY�@n�	S�#@o�PE��@o�R)��@pp-�q�3@p�b`$��@qa���Y@q�K�N	        ?��0�>$�?��6v��?��|=c�?��}n�A�@�g����@���H�@�$��@���`޷@ ���ܿ@$J�/��@(A:��x�@,�B�
��@0�g��@3 �J� �@5�A©A�@8UY$L@;6��)�'@><�w�@@�����2@BXx���@D��/O�@Eײ�(1�@G�x1P@v@I���b@K� ŋ�m@M��OP�_@O��`�]:@P�;�\��@RJnY0p@S.��s�@TZ�@U�����@Vƚ$�c#@X���H@YP�!0@Z�r���@[���ŰK@]S�V>@^���0�@`�51Id@`ɓzT�@a���cw�@bD�����@c'x�<�@c̺�O=�@d�nxi^�@ea7�&��@f0��t@g�u|Ʌ@g֯oDM2@h�m����@i�[�I@jf��EÌ@kF�����@l*)L�h_@m!�a��@m��!s��@n�Q��|@o�zj(�@pa����@p�h��� @qVx�.t�@q����.�        ?�@6hNӈ?���N�A@ �G�cj@���Tۯ@�ͼum�@v �T@$?�p9��@)�����s@0���Co@3d�w0��@7T�#G�@:��7'@>��W9S�@A�f��K@C�2?�@FC��g��@H� �=��@KK[�*Y�@M��pd6'@PZݳ�O@Qő'B�i@S<]�v�@T�-�Xk�@VJ��n��@W��V�@Y����b�@[/a��:�@\�!�aJ@^���	�@`6�l��@a )ɹ֢@b�G��@c �8�(@c��nnf�@d��y��@e���E1@f��9�@g����@i]�,j@jm��K@k0��7R@lI.�A�@me�U4�H@n�	�g�@o�;��@pi���G@p��DR�@q���U�k@r0[J�	@r�gzr�U@shr�Y�@t;3�q�@t���Q�4@uI�^�y@u���(D@v�@�Y)�@w:_	j�$@w�"l�@x�cU��@y9=��R@y��_�@z����^@{E��)