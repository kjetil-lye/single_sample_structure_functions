CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T102531        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?����?�9���Io?�m1z^�?��l��?�E	-w%�?��2���@
s4<.@	��'�@��)�"�@Wv#�9@`D_�Uk@��S�9�@#BY��@&j�f��@*�0��@-�z>��9@1YC�p�@3WT�=�@5��\��@8BFq��@:�.G�B'@=�e�G��@@Y}6.��@A��V�@C���b��@E5��J�@F��M4��@H�OX}�K@J��NP @L�S!�>�@N�����@Pl7#<�@Q����3M@R�)��1�@S̈́�;ޜ@T��5��l@V:��t��@W~��PŅ@X�<��0@Z ���,�@[5���@\�F[���@^V_��	�@_�a�J�@`���>6@an�|�^@b7��W$(@cg6a��@c�S^�@d���fK�@e���U@fm����@gR��s
@h<��:@i+���@je���@k�^��@l.�/f@mb9���@n~+��3@o*��|�@p��Q�@p���/�        ?fH!q'��?�����\�?���젻?��Vku֠?�p�C%4?҃�}��?�' �wH?��>�7?�Hጇu(?�k|�O�?����7��?��\Id��?��H�3@��9@�ťTi�@
��h���@"E�NA�@�2I���@�em��@��W��P@�5�!@�	Mg6�@ �:]��@"����l@$�[���n@&��j2@)Y�� `@+��ќ��@.����d@0���!6�@2.0pw@3�WΪ�@5t@�@7;��:b@9�3��@;��{�-@=-���5.@?_��ۇ�@@���W@B�\��@CR)O�0N@D���}��@FD���@G�%���@I�!M�@J���s�@LE�C-\@M�����@O�]����@P��u��@Q�?-�M�@R�A9��c@S�$��'k@T���@V=�PQQ@WBɉi�@Xx�6�Z@Y��jy�@[q����@\\;`��b@]�>��o�@_+�!\@`RI� �        ?j��� �?���S�D�?��"�.L�?����x�?��IQh,?��ވ�JQ?�4����?��^��?�kq:?��&K�Y�?����K@���2t@���m\@
FnR��@F�g(-�@l�i�y@��ղ�@愄�+x@�y��p�@ Y}8�H@"���B��@$��A�R@'�yK�1�@*`Vž�%@-d<��@0P�k��@2
���Lf@3�����@5�X	U
@7�<L�@:*6��
�@<�$Ǜ�j@>�$����@@� ؔ'@B.����@C���Ag@E'.����@F���r}�@Hk/ZӰ�@J*I䐗�@K�'�I�^@M�
�]	4@O�4�oC�@P�uQ�׎@R	�@7�@S&���2J@TN��>�@U��:��K@V��]$@X���L�@Y[<ܝ�Z@Z�_�|�@\'�|<6�@]�0Z�@_%!_�~@`[���1J@a+5s��@b�?9Hy@b����lN@c�]S��@d���@e�	�c�@f����"R        ?�n�Z���@����@/@$���(u@4�Ԕ��@A��wO��@K��ϋ�@S������@Z��D�G@ap
���@f��g<>@kG��jG�@p�u���j@s���A�V@w$Y��@z��)s�@~�;�Ӗx@�/G�n@��$DNZ�@�*R�!��@����QP@�a���4@�1� ���@�����D@������@��e9��@�e��s�@�#�^2?�@��qc�_@��!��:@�����4�@�Ȓ6���@�n�N@��T"���@����Z @��B��n@��s0{�@�B�Z�/@�Yu$�/�@��g�Xx@���x�@�@n���l@��F&ڦ�@��7���@�sl����@�ui�B=+@�5l��n�@���J@�@����s@���?�1�@�a3R�k4@�7<`
Z�@�ŀ6�@��։XF�@��v���v@����_v@��|u��@���q#�S@�� �f�o@����K�@��-U�_@��W@��@��I�?.{@�S
[��        ?M)Y���k?}�l���?�@���HN?�=���?�VI����?���d�?��2���g?�8"a�1>?�ۛ��?�Cqh�?�D�i��-?�efNN�?��˝?��V|��o?��|r�,Q@ !�g��@z��y�@��s���@�o��/@
���h@�(>�I�@\5���-@
�	[#Y@�r��}�@����@���@�@�/�g!�@ā�� @��(N'�@ $5�幘@!V��@"�\�8��@#�9W �@%7'hZ��@&��8&�[@(%�E�@)�zz;v@+��/|�@,��F\`,@.P_;2�@0�&C?@0�Ң+�*@1��l5kL@2��{��@3����e@4��9T��@5��k�yz@6���_\@7��W�%J@8�s���@9�r���@;���@<>�u[e@=mf�"@>�-���@?�nS"�@@�9Or@A5Ǟ�7�@A�Ǔ��}@B�"ڊ@C7����@C��b��@D�����        ?3b�Q�:?g�W]�~T?�	�gH[?�
8f�?�Y��N��?�^��+k�?�_S6���?�b
�e�?ѽ��@r�?���$i�1?ߔXG���?�Y���|
?�¿G)>u?���P'�?���Ƀ?�e���?�޽1�
�@1�t���@N��Z��@�D�xL!@�d`ߙ@�B"a�D@`����@�)�p�@� ��[@;� BH@l+ҹh@!J���@#��{�@%@��%@'�#W��!@*�n�3�@,�H�J�@/��]l�K@1b
����@3�<�p@4�nlC�m@6�N%(@8�d˧-�@:�����x@<؄5���@?(5c{�@@˶�]�x@B��[�@Ck��!�@D�9xʔ�@FO�kAa@G�e���V@Izꩱ�\@K+��l��@L�e�1�a@N��eE�@PW�Q�!@QVa�*�x@R^�q��T@Sq���@T�X�RA�@U���UL6@V�Sn��@X/,|	�@Ydh���w@Z�H+�@\K�+e        ?+2>ZV�?Y�f��GI?w`�`�A?��`���?�Ƶ�>?��e��C�?��g���?� �����?Ƈ?����?�x��o�?�Z�E�P�?�Jڎ]�?�\d��?�i �w?�bI�z��?�/��GT
?�;�o6�y?��6�o17@ ���,@����@n"����@
-	����@U\]���@vk@��%@�����@�	��$@�y�:�@	����@ Jl��i�@"3��u?@$Bc���X@&w�/��@(�$�lL�@+W�I��@.����@0om�ͺ@1��sb:L@3��k�Ҡ@5:ŠnW@7gݮ�~@8�=ojã@:��4��@<��M�h�@?��]c�@@�f�oʑ@A���;Z@CqAv�)@Dj�7��@EŽ��e@G/-���@H���RL�@J.���B�@K���w�J@Ml���@O#n{d/@Pt�����@Q`��~�@RT��$ؼ@SQ�0˗@TV ���@Uc�y��@Vz�v%��@W�q6״        ?���Շ`,?�t�Ӆ�?�e�$;?�0:�Pd@
�w�[ix@��[@ 3љ}�@&���3Ѣ@. ��n`t@3Z�"���@8.n{�j�@=�J\��@A�;��آ@D�/5G½@Hjk1�)�@L*��j@P4�R�@R<���@T��Q'�@V�0��l�@Y~�+��@\2|`ԋ@_Ts��,@a�����@b�M�0�@d:��r�:@e�`e
�n@g��,��@i�FHS�@k��9��B@m�Zk$
�@o���,�@p�����a@r04��@s-_��T@ta)�h.@u�V˶�_@v�8���]@x;�ve}&@y�k�|}�@{�C�u�@|xyG�'�@}����&@���֚K@������@�\.%�&@�1��$��@�wHpX@��²k[@���Gh�@������@���>��@����3�@��T4��o@�����]@���x��@����|c�@��t���@��T�qR3@��v�@��¢9�@��b�&0�@�,ص�x)        ?hX��?�rB�)O+?���:'-?�����?վ�/
r<?�k�>�
_?�^��9?񭝐���?�_,��͝?��=�?��@���E@�X�$o@()�ѣ@zO�u@���e]@�X�_@�NK��7@!�5�S@�K����@!���o�O@#��h4P@%�W�+�f@(ɝ��f@*\P�߅#@,���DI!@/b�%�+�@1	+���(@2o� ��@3����-�@5k[���>@7 �w���@8��[T֫@:ZA���@<���f.@=����@?��fi�@@䟱v�Y@A�>�O@B�X���@D ��7(�@E���JD@F:�[2U@Gc����@H������@I�aN0t@K�𨤨@LV6��Y.@M�䳖@N�[���!@P-�CW�@P����h@Q�7�&s@RQ�ԛ�@SYW@S�
|�um@T� �/ڪ@UZ��#�@V%wr���@V��U#@W�n²E@X�����6@Ys4�&��@ZO[e�p        ?Y�Ck"?�MD5�?�}u?��X?��l K�?ȣCd?��f���J?�H���B?�e�%��	?�9�XFz?� �iZp?�+�m��?�`^�	��@ �$Gi@�[�y�@�ae�9�@�h�ZE@��w�d0@iy?�%@
�}S�@出{F@����u�@P�*Y@ �a��~@"ޥ��,@$��p��@'" ��@)|Wܡ��@+��(��j@.�cMmM@0��m8�@2B���@3�}��F`@5�j.��#@7V��j@98�r��@;5�_�_@=MD~�i@?�g�8I@@���p�S@B�@�@C^���@D�J���@F��S��@G�@��@H�1��a�@J�'�!�@L)�U��^@M���P�-@O�����@P�I�̳9@Q���i�7@R�K�B�-@S�}缟@T�=iԉ@U���Qx@V̝�+�D@W�W�r!@YѶ�D@ZO�*A�@[�'/h�=@\��c�@^ �,��@@_xc��B         ?d�.�{��?��*X���?��^I��w?���t�?�WA[��?�lf3�¢?�.�שm?���@��?򝖎׊�?��M�w�?����s@{��o�@[/8�L@
�'�o�E@t����@]�\!!�@C��5]@n�V/�@��A'W@���p>@!כz�p@$���X@&b�����@(�`D��@+�l �@.���I@0�$%c�@2t'0�}$@45���|@6Xzc�@8���@:(�2���@<b�fP�@>�Iɖt�@@��NizC@A�"��8t@CMo�wʇ@D�-�>3�@FG�&#A@G�+2�tk@I�s@�@KS@�!1�@M+�.@OOR
�)@P��E¿�@Q�v��@R����@�@S�I�8t@U�|�N�@VAu��<�@W�bؗ�	@X�԰E�9@Z>��Q�<@[�����@](	!5��@^�1�cW�@`"�9e�@`�"F� �@a�)�|�*@b���{@c�g�j��@d|�ޠ�@eo�8<2�        ?�nѩ#פ?�bMBh��@1�Nݯ@#U��tȉ@1sU.���@;��Ԅ�@D`5\)�@Ku��_�@R`=�@Vڭ�~�t@\G\�ωB@a$Vw��@dpC��)@h�b8��@k��b:@pt��C�@rU̹7�[@t�7(��@wX5��:Y@z�N�@}���ih@�
��ނ@��kw�:C@�\����@�#��Dh@��4+nC@��`Մ�@��T�&�N@���J�@�2�y�.	@����5�@��sqR@�z��B�@�P�*���@��Y�(	@��L�33�@�=�����@��v�¸�@�
���o@��0[�@���;�W@��Y�*��@����*>,@�[H��c{@�.�0��e@���"1�@�㻮 {�@��r���@�����ԩ@��b�e+@��G�U:�@�x>�`�@�o$���@�i���@�hN`�5@�jd�OM@�p T��@�yL>�A�@�����@�K=��@��@ d:g@�a}��@���/Sk�        ?V�CՅU�?�[Ukt:�?�
i��%A?�=�~?�h�ٝ*S?�-��R?��3���e?�g�wT�?�� � K?�ᐈ_?��O;��?�d� �p?�Q�vF�@[�>�<@K]Ҁ �@xy���@
�q�Qa�@�����@:&	$�[@M;���@�t�/@��t@Av[�ȍ@��0�]P@\w�%x@!&\m%�@"��`���@$"&��D�@%�G�GF@'[�_;$�@)��jts@*��a;w@,�rA2��@.�ʇ�}�@0=A"�6@1=ɴ��@2E��	]�@3U� %6:@4m5S�\#@5�#̈��@6���`�@7�G��W@9O���@:Q� {��@;���6��@<��M��O@>/���@?�}N��@@rň6Jp@A$�1!CH@A�B���@B��3���@CM����6@DE)&*�@D͋���@E��'�d|@FX�m���@G"��<�@G��`�~k@H�����@I�6�/��@Jg����f@K?�Z5�        ?<_ͳ�[?q=�Ե�?�O�9��?��,�J�?��&v4�?�|��Ee?���9=!?Х��U?��3�3?��5�]�?�,��L?���=%�?�5�:ϡ�?����{?�����%?���]U�@���:Β@gu':�@��#X7@�,��fp@���x��@>���;@@	�gz�@H���@qB�b�@ 
\7Daa@"iP7@�@$%Q�д@&q�wl @(�gN�R@+��䵋j@.b��.za@0�H�w��@2Mڍ2��@4�Ί@5�{��>@7��pdEH@9��Yf@;����;�@>���I�@@6Bk��V@Ap��n�@B��鄼[@Dڀ6ܭ@Eyj�W~@F�θ��@Hw����@J^��*@K�N�'E@Mo�v�H@O9cE���@P���Ā{@Q�`w,@R~P�U�o@S��l]@T��T��@U�p���@V�;�3�*@W�
��@Y.��h5�@Zl�x$�@[���Y�I@]���;�        ?6���`?f��is��?����#?�� � @�?����j]�?�;�Ŗ?�9ķ��?ģ���@?��*Z���?Ӣk|C�?��w�w��?��Vp�9�?�K����?ꙿ��w?�aQ{H�1?��@,'�?��vK��?���ic�@ ՇscXD@���<@�᫈e�@
b�>�M�@<��D@8æ[̆@�|i�>@���W�2@�ǹ�s�@�K���@���Bq�@ �'���@"�A=��@$��	��@&�Klk�S@(����t@*恭���@->�Iɜ�@/��� �e@1'�y(�@2��Y�KE@3�sΩy�@5qG�d� @7}���@8�[�A�V@:W'���|@<&����@=�����@?���=D@@�c��V@A�A���@C
�X/��@D'�V�@EMU���@F}��GI�@G��R.z@H�f����@JK�/�@K��rz}@M֏��Y@Nt[��4@O�18;@P���y�@Q|��g@RHG�_\        ?�yU��?�y�Y� �?�J\��c@JWj��@i����@!3�u��@)M�h:@1�B�y@7$ϗ�H@=�EG-��@Bh�a���@Fl�c}H�@J֚-�y@O���l�@Rnׯr�t@U=ȹG��@X@m���N@[v�3�4@^�&6<@a?�Q9��@c(I ���@e*�@K�T@gF�A	�?@i{�%W�j@kʐk��@n2�;�@pZ���@q�t�K�@s�T�j@th[�(@u��5���@w[�%!
�@x芔 	�@z�����@|']�2��@}�mY��-@��HTJ<@��@����@�������@��|�:�@��g?�@@������5@����*�/@��0�P�@��0嶖@���w��@��y�t�@��e�R$@�	SID�G@�1#�@�]�% �a@�����u-@�bh�8�@����&�@���z��@�@���]9@���q@����W)@�2Ч�4�@��*��@������U@�81�8(�@���Ü��        ?o��^^�?���*ʊ?��oR�1]?�m$�N^�?ܙ:ۛ#?��M�ZK�?�)[b/?��e��?��7�]�!@�V>�u!@G<�(D@��gD@�\}B+@�bk%"@`N��3X@���Q@ C���@":���D@$��C�*a@&�4��D�@)��v.�D@,F�Q)'@/&�@��X@1��s$�@2�&�^^�@4S]�)�@6�2f��@7�˾۫@9��n�J@;�M3G��@=���ܪ@?�b�1��@A�7��S@B*�PNX@CY�M��@D���Q�@E���4=@G*(� �8@H�ܻ�{ @I�1��Gt@Kc���@L�}b�<[@NmLq�M�@P��k�@P�e&=�@Q��=	�q@R�v��Q@Se�I���@TL�yoU�@U8�!�# @V*8�J�@W!�Sr�@X-���@Y�y6�@Z%?R�\�@[19_{�@\B�H�@]Y)Y�;�@^u!��@_�kD�o�@`^�Uk@`�mO��@a��4�k�        ?V� ˔͂?�����c�?�d����?�\�+dߦ?�"��9��?�uw��g�?���#��?�y�R�{�?�[�A�l?�քO�S?�<��@OՂ?@��(�F@P<>�H@Xz�O�@Z+��@��~z�@d��cd�@wnsW��@!wV��#@#�}�|s�@&�O����@)m��$��@,�!q�@/�?�">n@1��S�H@3�8Ñ��@5�<�
�@7�N��@:5F(�B�@<�(�e�@?G�Y�͟@A����{@Bx�Y�_@D �9֤@E����@GM>~�@I�r�x@J��QRY@L�*/�@N�#��(V@P΂�>@Q�z�ۦv@R�Ә�@S���G�@U-�v^�~@Vwca�;@W�����@Y1QE��@Z��ٷQ@\���6�@]�֕@e�@_C�#D@`uG��9?@aO��hJ�@b1ZWm��@cB:���@d
��yI@eh��]�@f���E�@g	#��C@h@[4�#@i/PI�\Z        ?O�f��=!?~��Q�=�?��?���?����<t?�Hl18�?�.��@ؘ?�2�nMy�?ۑ�x`o�?��X���[?�7�ݼ�?�XT��?��v�ИW?��V���?�˘ I�@JUw@Lf@&0���@�]Өq�@3�	E��@��V��@�1t���@Q���q�@ �J�"v@ ��C,E@"��W�w@%�`�c�@'���[�N@*s��n�@-q0ۅ��@0S�Q��@2
Z�j`@3�3�wr�@5ҙݸd�@7�t�O0@:�c�@<m/؉@>�o�� �@@�H�mË@B��m�:@C��Qc?@E���7@F�O��K�@HM�\�}@J	����]@Kغ�~�@M�{���h@O��O	��@P�%9"@Q�BA۹M@SZP	9�@T)r@��@UV�D��@V���ܽ@W��B�@Y7QG�@Zoe�of@[�ŚQh�@]8B�|�k@^���y(@`� �z�@`� "�!@a�R
2!@bp�A�Ȯ@cD��EP        ?�*�hF�Y?��n0;@�3NI��@ f9�E;�@.&����@8=��� @A�*ƶb�@H����n�@PVe�T>g@T�N�Wi�@Z��(��@_�F��-@b�#�,��@ff�� �Z@j�\�>�@nkZ�7@q6!����@s��H���@u�9�Ӧ@x�\K�H@{X���L@~E0f;8�@��_�v=�@�L��1�@� ���_@���#���@���5��m@���zm+V@��M���Y@��^M6�@��Le�&�@��!��@�P���@���$e@��G�.��@�&���5�@���m���@��r_cg�@�iĺ�T@�����@�|ۚĝ@��!���@�`R��@�:'I��@�أ�t&@��])=�g@��nq�n@�۸�_��@��y��R�@���O���@��૝d�@��o�f�@��r�0�@���g�=@�1�_@�-��!Xp@�P�qe��@�y��
�@@�S�=@�@������K@��4��a@�)�@y��@�ˎ>d�        ?g��T�?����\U�?�3e���?�0*!6�?ГVy��-?ڋ���!?〱NQH?��d�z?��U��?��'���?�j�&��)@R�Z'��@�+���@�tOXM}@�'�i�@|�{�]@�`�r~@_�;�U�@'��@�����@�H�,D@ ���V@"<���Ye@#�6��Q@%�nD�@'�]�9P�@)����z<@+�^�Ex�@.
���@0&%}�J�@1QAվh5@2����l@3ƆeZQ�@5���@6d��8ܮ@7�P ���@9+���k@:��xB�@<�ia6D@=����k�@?3u�	��@@g#c1	�@A9e$�Hn@Bd��`@B�%�$s@C���C@D��ּ�)@E�(��@F�{����@Gu�첧M@Hi����@Ia#ӂy
@J\IW̲�@K[	-��@L]��OhF@Mc�zQ�0@Nm�T�n@O{b�C@PF��hzo@P�Q�N��@Q^&��k@Q�񉙫�@R}����        ?F�	 ��?r�2�B�?���FaU?�x7�ÿ
?��4zR�?�~-T�F0?ƹ����?Ѐ
���?��ᛙ0�?��T�6%?�7pc�[�?����r:g?�V~Y<6?�F�%��?�הqW~�?��ɂF@	̵1Q@nW
,{P@	@�7�|�@�[�f�z@&�
Y��@�RF�%@�O�z�M@�i_���@n�U~@ ���}G@"��F�@$�O��@'jZs@*6�*q�@,���|@/�j]��@1�a��CB@3Q� /@5,�u@7$�����@9<�x'�@;u5C���@=�~Zŕ�@@&C���@Av��w�@Bٚ���@DO}x���@E��Q���@Gv:�ӻ'@I(
��	�@J�����@L��9�F@N��
9ւ@Pb@^�M�@Qqv�:�@R���@S�]�8��@T�d�p\2@V"Y_ù�@Wl`�bl@X�hl�@Z%3����@[�>��w�@]�Z�+@^�&�V��@`�G!J@`��k6        ?e��aL�e?����u0�?�!�[�)�?��l����?�}s���-?�rԸ�z�?�%15mv-?��MFƑ�?��,�7��?���D2Q�?�}c�Ƃ�?����V��@ �eJ{@�CK�@p��lx�@Q��R�@�/7y.�@\k�p�@����#�@@	{Rn�@#w1�@;����@ E|Y��@"	��&s@#��Y�@%��^�>z@(	�
]�O@*H��L�@,��U1��@/*z����@0��	H�@2K�T_+@3³P�P�@5L<G�+@6��m!�@8�y�洄@:]����@<6�^_�n@>$���8e@@5U&�@A ���!�@B8?3��=@C[U����@D�"Z��@E��jǍn@G�qA@H_����@I�Ǧ��@K/��s�@L�U��.@N5�`��@O�����@P��D[�@Q�
�i��@Rz*��\�@Sd�3�T�@TWoQ�p�@UQ���@VS�*U��@W]LU���@Xn��q[�@Y���k��@Z�[���)        ?�:��z)H?���\`@q*�ۖ@�}9ׂS@"�Y�o�7@-��4p��@5�S�ͮ@=����^@C�W���@I4�1��@OM���@S���@V����ޑ@Zǻ#]��@_(�x]~�@a��ʲ!�@dvɧ�R�@g)�a�@j��\;@m}p�g�@p"Ђ,f�@q�5C4��@s�h�4;�@uua|篧@wg	wj�@yn8�R�@{�����G@}�Pѡ��@�fI�4�@�.��R�+@�f�
]�@������<@����@�K%9yĘ@��G`��a@�[w�1M@��[���a@�D�f%�@��"4K
@� ���[_@�^ ;Zg�@�0����*@�%�)f�@��@��h@����1@��ӏ�@���L�s@��ͤj@�r�=.�@�g��No;@�`��0�@�]Zr�[�@�]�ޱ�6@�ay���@�i��L�@�tmjڣ@����Mj@�KT���6@��֪>�@�d\��0@���'�@���jWȫ@�h載�        ?d�Q&]�I?�����:?��$l�2?�F���a�?���R�?ܴ�!8?�.��Ehj?�_M�t�?�tɠ�E?��`�d��?�ǟQRz@�L�Ta�@�B�xb
@
���z؜@��5�@��߰@p�'U\@$+6�]~@W6^�V@*��.b@ %�*�E[@!�x%Q�@#�{W��@%��Pe@'���Ԟ@)�L~u�@+�;�)�?@-�፮j�@0-���@1g�p�K@2�L�%@4����@5as���@6�(/���@8G�%G�@9�-�o�@;a��LV@=玶�@>���<
O@@5#x�<@A�TE@B����@B��6�@C�~�X@D��z�Y@E��	�}h@F�t��h�@H�J`c6@I&	��&@JD�k���@Kj9�B�@L�Ԣ��@M���G@O �_��@P	9P�@P�H�XL�@Qh�Y��@RQ�ߗ�@R��-r�n@Sp�9u��@T%��_�J@T� K�V@U�2�Z�        ?O���?�� ̩�?�����kM?��?.�C�?ť�,�V�?���ᖀ?��F6�6?�?UmRb?钙<�?�l�Ѫh?�����?�
HT�ۜ?����dÙ@q)G�@����@
�ߔu�@@u�r0�@�(��	�@���
PD@�2�g�h@��
��@ �Ӊ�@ �G�C^@"�G�6�@%t���@'X��ω@)�>�dr@,c�.���@/&:cq�N@1	J�X�<@2����;�@46.є@5����%@7�����D@9���sh�@;���Ce�@=�9L��@?�o��m@AQ�)s�@B=K6 �@Cw�x@D���Z@F�˃{r@Gp��j��@H�o���@JW`��h@KޒGE�,@Ms+��@OP1��n@Pb��P�@QAg'�,@R'7c@S�{�j@T�q��@URp�փ@V��J*v@W�t�u�@X!TGg��@Y:t����@Z[V1�zr@[����@\�ۃe4�@]��Ւ��        ?P�m�X�?~ԡV-��?��?h��Y?�-�|F�?��"�E�?ȍu���?Ү�)+?ڿ�kc6�?�O�1�H�?�<��-T�?�>M!PS?󶗨���?�q}>��?�����@���@|�FD�@	bw�r�V@�ə��s@F ��G�@�E�;@�Z���@C�}��@��.g@ ���ij@"�[�+�@$�KM�9�@'G���+@)��bZLJ@,��j�~@/u2�x�@1F�i�&@2�h��@@4�P�[��@6��"o_@8rá+\�@:660�@<��8Hy@>�un���@@�����@A��vml@C,Y�C^s@D��@��3@E�s���@Gcz8��@H���_�@Jz��Pm�@L?�M�@M�7�#>@O��8�� @P���ζ�@Q�����@R��;s=�@S�V���y@T��ۥ�@U�@��.�@V������@W��f�%@X�SJ�F@Zj�$ep@[B'@@\z���l@]���U�@_��5o
        ?��}�<?腟�'�!@�
4�z@��K��@'mQ$��F@3 �%]�:@<��C��@C{���3@I��s�L@Pr�e�F�@TmN6{t@X�1�z�@]��2�@ai���E@d8Q��[@g;x�Mf@js`�]xZ@m�z�1�@p���#�@r�ki�=�@t�����@vڳmݨ�@yĻ���@{wMS;U@}�Ǖ���@�B����y@��wË�@��؉�Z@�x���z�@������@��u�o��@�0�g��@��Z&��@���s�iK@�k0&ak@�#!,���@��3w�&@��8?H�@��WP@�!c�g1�@�3�w�P@�Lx�9�@�lN�" H@���i�S@�·=��c@���ü�@�5����@�z�F�?@��Y.7�@�s;�3�@���|H~@�gxEV�@�� �J�@��>'�ps@��~6p4�@�I�_�;@�j�;�@��\����@��p��:J@�i��:R>@�<6����@���� �@�����:        ?}������?�_Y	j?��6��:?�\�(O?�R�d3B?��$�e�n?��-��UY@ �����E@R�� �;@{rװ�@�{=��@@���'	@�[Dgo�@``+[�c@!�Ǝ��@$aaA��@'E�R�l<@*]��m��@-�hDE�@0�'���@2r� U�N@4j�z��@64�8T�@8���]9�@:�4�j��@=gj�A@?���4�@AJe�%@B� ��@D%���@E��EA�@G3���l�@H�DmS��@J�ul���@LS�ς/E@N+3�N��@P
����@Qv~�`�@R�(\�@S��@T5e0IHy@UV�WL��@V�2�ޑ@W�����X@X��vϘ@Z6�b�yq@[���C6\@\�[� @^<�^�%y@_�TҊ�@`�w�?-%@aJW}�G�@bΌm�@b��(�~\@c���W�K@do�+~��@eE�&@f���|V@f�)�s�@g�Eo���@h�����@i���{�@j��-��y        ?U���r?���D,?�?���|a�=?���p�?���]d?���m'�?�S�`�P�?����O�a?��-�,?�`��y}�?���&��?����?���u�'@��?�\P@#�
y�@
1���I@�s_@vN@�z���@����@��ua�@�����!@�O>�f@!Adq��@#a�z�0@%�g"
z.@($��s�l@*�k��m�@-���6F@0U�{��c@1��=�ho@3���T?@5���d��@7pɅ��@9}�	�&�@;���T�@=���c�@@-wwi�q@ArW�,�@B��C��?@D,��4�Y@E�G�/U@G+����@H�-���@Jn�NG��@L+@t!N�@M��ՔZN@O�+�[��@P擎t�d@Q�e�!S�@R��"fKh@TtD�|}@U*���o�@VT t5G`@W���@XÕ�%<X@Z
���@[Z���ǰ@\����t�@^�K���@_�΋��h@`I�}�M@a@Ͱ. @b�&�	        ?l�2���8?���6��,?�0[�8�?��� �?ׄ��+C?�fG��[?�8�/8��?��
�!yB?�ۛ��q@&��Y�@���5�@���:�{@r����^@�9ﻛ@��EW7�@L����@!��m�p@#��)R�R@&�l����@)Č�w�i@-4-�l\o@0v�#G�]@2y�P�=�@4�-���@6�ռ[U@9v��z�@<!۴���@>��p\L�@A�~S2@B�H�4P@Da��^
@F=Q�:�_@H8��R�F@JU2�,�@L��ɵ��@N�����@P�ҡ(��@R B�p%@SpH_��@T��1S�@VnK��[�@X	x,mp@Y��ـ�S@[wF��@]J����,@_1ya���@`�ԥ0&p@a���RJm@b�x5O�@c�5<�D�@d��@f� !@gUKP c@h��Q�@i�89��@k?���P@l��a!R@n����@o�_�Q@p�i��n@qM��`�+@rF.,�@r�%o�e        ?Ѩoa@<�?�C:�DN?@|-���F@,����@9�|?RQ�@D��v�n\@N�3?��@T��f�K@[P#�o@aezhG@e�_�m@j8 ��+@oN�{س�@rl��M�@um9��eI@x�
P&�@|!��O_�@�i���@���Đ�@�KS��@�B��~�@���6f�@�(q2��#@�д|��\@�N�Q9u)@��?>��@�R#�Y,�@������@��Q���@�f�(e�@�A#wԑ@�0�fq�@�5�����@�'ҿ(]@�?�[G�b@�bF�)��@����U��@���8s�@�2��`�@�\�R�2@��T�=�X@�^�5�/@�� �?(@��I!��@���v�q@�]mݝ�@��(Z��X@���n�a�@��=����@�~��@x@�f�N���@�T���=@�H��nW@�BrՒ}@�B+,��@�Gʖ�@�@�SM�T�@�d����@�{�BB�`@���"��@���T̥@��T����@��P�E]�        ?����dF?�k�5�Z?�����m?ڶ^Ku׆?� 5Q��?�Z����?�m"i�-@�o��t'@y�M;��@�4Aa�M@L�r�@���@A�@�4@�PKGV@!��]��@$Y�p]C@'�W'�Q@)�vQ9��@-%��@04B
=@1ȗ�*O�@3��|s��@5]�f�@7ElV��$@9@�K�N@;M�m�E@=n�H_@?�$ml:@@�p@��@B�d�y@CT�٣�@D�yc;�_@E�<$�@G+��#?�@H�[�t'�@I�j�i@KR�	� �@Lƌ��K@NB��L)�@O�f?���@P�1Y]�@Qt�r<LK@RC��E@SZ}��.@S�"a8`�@T��`��$@U�R�e5�@V��M��@Wne/h��@XW˩�S@YD��X�@Z4�ڲ�8@[(�D�`@\�`]M�@]O���@^/V���@_r���@`Q7v�@`�q�g@a�r���@a�*�L��@b);dL�@b������        ?L�0s�b?�E�j��?���&�}?��XH�?���0 �_?��y"�:?Ӑ��o[�?��YJ���?������D?�����l�?�y@*#�?��(S�R"?�d�(���?��U�8�@��P�'@��Z٧@�8��xk@��&���@|Q�j�R@��=k~@��}��@[��K��@p�h^@�z-_.@!,��l�@#�����@%'�zKXN@'Z���<w@)��p "@,188�!@.�"�}@0ҍ��p@2N9�x�\@3��J�p�@5�&���@7A)2�;@9L)�3@:���Z��@<����v@?�m���@@����F�@A�$ �>�@B�x��V@D%g�R.�@Ei���@F��P�@H��d�@Iw�95��@J�O� -�@Ldh:(�@M����@O~����[@P��"�_@Qd.~�T�@R?��t��@S!�Z-+@T�c5��@T��f��~@U� ,n�@V樇cl@W�d8~O@X�МL��@Z  %�U        ?hW��u�?�$�$��?���52�g?�'
�pu?�.>���I?ُ>�o@?�2�A�m?�ƪM{�I?�����?�u�)��?���2]@&@�O��@ۼ�y#�@	
0=gY@�u�K@x�^���@\�_ly@�����@Z�z@�%c���@!�0�u�@#���@&2�t���@(�8��@+�W�3�A@.�ĸ��W@0�L\Q��@2��ۭ�g@4o��� @6Z�|���@8a|���q@:��N���@<�fl-�@?#Y�ݑ�@@ϟ���l@B�B�MY@CyQ��o�@D�|"А�@Fav,�T@G�r
���@I��>�2�@K6K�R�@L�֌y�@N�	���@PP����@QI��+�@RK���@SUʗ�@Ti��;x�@U�	��;�@V��H�j�@W�I�j�@Yr��`@Z\o]3`K@[�W�-16@]E:�M�@^dPv%&@_Б����@`��n*�@ad\��@b)�筑u@b��ûR@c�E��:�        ?�N����?���0�@@��Ғ�@)�[��@6���~��@A�&��r�@Iwc���o@QO[T,@@V�̇�Y}@\y��hX@a��}�vV@e���r�@iN�/�@m?Ƌ2��@p��/�{�@sIr:�yR@u���i�@x�v�j8@{[4gE�@~SiqG#�@����i��@�V�	��p@���y�@��H���@��}!@��6,�vm@�y�	~��@��|�ki�@�����{�@��t\,�@� @��l;@�&�X��B@�U�=ɓ�@��Vq���@�͒?묦@�b�U�h@�g��p��@���U�&F@�$l̃�@��	@�d��\�@�?liR^@�L�wK@��AVM>@��u��[L@�_��)nX@�1��~+w@����.�@��B���H@���kz�@��R���?@���r0��@�ka�Q .@�V���]@�E ����@�7%��?@�,o��s@�%)�w�@�!D1���@�_��־@���5@��֘�@���Ex��        ?^N$�=%�?������?���J��?��j�"� ?�pO��M?�$�O#?�T4C��?杆KQY?���!pF<?���2�q?�����r�?����1�@@F��Ƴ@M����@�B��@ 'sپ�@��z�Q@s�1/n@�Ϡg�@�m�F��@(���z�@���
�@5�؉73@�e@!\;��"G@"����~@$W�r��[@%�|�)n@'��	���@)=�+EJ<@*�� �U@,Ɏ�9�@.��$I�<@0F�TD�t@1B�Z�y@2E3�8�.@3NДsE@4_q���@5w$�Y@6��8Zy�@7����@8�P���@:����@;Y����@<�Aiy�h@=��~hw@?:���@@I��R@@�X�y/�@A��fW�@Bf}3�)�@C"��t@C�^+V/@D�R���@Ej����m@F5MF�	@GJV��@G�����F@H�D{��@I��|�Vo@J_5��3@K?��@L"S��߁        ?N��&?����G�?���i�l~?�VM�OA?�(��v�?�KB��h?Ӓ�{�$�?�i�#N?�]�Y7?���E��?�C��%�?�c�?����Kd?�R��=Z'@ =���@hc@R��ބk@	݃��� @ŏ�5�h@���@a����+@�q���@�gH>�a@�|+/��@
B�]�@!Iݑ�K�@#1|�$,@%=�ìz�@'o���iX@)���\~@,Kqf#@.�6�w�@0�,!G�@2j�	�[@@4N�Ǧ>@5��� t�@7FU\#@9a\�v@�@;]"k���@=r��8�$@?�W���@@����I�@B+�[$Tt@Cn#��G�@D�P���@F���j@G�CkQ.@I�өC@J�)�Qo@L=�,�*�@M�xVu�@O���d\�@P�$�=%�@Q����@R��� g@@S�8Nx�@T�Y�9��@Uҙ&�~U@V�۷d�E@X0���@YH���<@Z�H~��Q@[�&��|        ?G����?uP��K?�&�әf?�{��qE�?�yӔU��?�鋝�?�i�y��?ҧ�2��?ٕ=�5�?���<^�?��o�aX_?뼢�U0?�?ŵ{I�?�$�૽�?���ʄQ?���H*��@,��۔�@^�]2�@���H�@�r�_@�"���@��tv�@�t\��@t�(���@�D�/8�@�,���@!=�	e�@#-�f�hk@%A� �@'y�u���@)ئ�%`@,_<�9��@/���#�@0�4s��@2v�Y	i�@4pд.@5�N�B�.@7��>��@9fǰ2,�@;_��i�L@=rCp2�@?�#EU�O@@�}P��t@B%:s2@Ce7��@D��3�2�@F��=_�@G}I\N>@H�غo�@J�gW�{@L �<{�@M���k�@O�p�N��@P��0s<@Q��o �@R���	`@S��1��@T�P�DW�@U��6��@V���8�@W�f���@Y�ֈ?q@ZW&��ǰ        ?��yv�y?��@c��n?�b2�9�@��=]�@,��$��@'|U�!@1DJ���+@7�쌾�2@?hƌ�x�@C����@H�*�^6@N�3��@Q��t I@T�ڎ��<@XG�!ML�@[�ԣ��+@_��?1��@a���~�@c�1,�qB@f"��hR@hv��[�@j�_?5��@mq�ݵ�;@pI�.@ql�8)�@r�l�X�
@tWge��h@u����r@ww�t|ڳ@y����|@z̻*�F@|�გ�r@~U�M���@�λ�4�@���IT@�Pӌ�`@���]��p@�}b�Ǖ@�=fB]�@� |��@�7*��@�T3(��@�w�ǏQ�@�����j@��䪋P@���Ȣ@�Clۊ!@��7>�ѓ@�g����$@�x��Oi@��j���@�h����a@���p��@��/��@��np#w'@�?�cS�@��`2��@���i)�7@��6U�oi@�Gz���W@����s@��}/�η@��&zGi�        ?b���x�?�E��n�?��M3d	?�⹲�T?З�W;T�?��tu�³?����=��?�|�z��?�b�rzx�?���7� ?�k�t�H@�>Ꞽb@��'T޺@	q�R_��@��߮5@"l�n<@������@;N�&�y@
�>�,�@�ʈR@0�2F�{@!D7�{3@#���,�@$�෱.|@&�1�c�@(�)u#!@*����@-5#��@/����a@0���wي@2:+���@3�s9i�@4�vݖȭ@6KR���@7� X��@9A�\�Z@:�黎�@<mI<�@>Ru#�@?��.L�y@@�@��@A�a�~@B�A pK@C��QC�@D���@h@E�<�~.b@F����O�@G�`n��T@H�*����@I�Q��W@J�?K.�@L��#D�@M<͌R�@Nm�֓��@O��6@Pra�,�@Q�#K�@Q���K�@Rd/Hf֞@S�(S%"@S��&̈́e@Tt��+�G@U+�t'd~        ?D�Nix8�?z= O�T�?��A@ht?�D���D?��h�}I�?�G_×�-?�f�3ǟ�?ݦ�F��?�����?�gs�+u�?�ƼC{?��?����?�ٵ��@@'r����@�@��'@�C��r@'?�j�@`�4�@Ò4�@��v2�@���4��@�t��&@ ���WI�@"�Q6��@$���N*�@'XX�c2�@)�� ��@,�£��@/���m�@1M��h�@2��r:<@4�E�1�q@6��A���@8y��0��@:�w$^�x@<����#@>�F�s�(@@���v�@A��e�L@CI��ՍT@D���寈@F"�[���@G�8E�@�@IAc>P�@J�<��@L���O�.@Nx�'Oo�@P.��!�@Q)�'�&�@R/�i��@S@�cT\@T[ ђ�	@U��KIB@V����o@W�;�֚@Y6i�� @Z��sc�}@[�/�i@]T�r�3�@^̴�`|�@`(�1��f@`���d�@a��+v�        ?TF&:?���OY?���g��?�F���K?�����?�AJ�?����g?�xO:�6�?�/�`�?�u͙~��?읾�6c�?��.WR?��/3@�?��2.%-
?��xj��2@���Rs@���l�@	xRт�@[zY�{v@�RG�@ Vh�5�@���2�@d"J<v9@\J'�v@��=��@!��L�@"߫$��H@$�^�� �@&��x�#�@)A����@+�u��?e@.8yg�E�@0vl"d/�@1�>uʱK@3f(y�D@4��tåk@6� ���@8i.	
�@:@O�}��@<.f���@>3T��~k@@(�ȵ/@AD!����@Bl��|0�@C�P,9o@D�R3wx @F9=��@G����^@Im�Nu�@J�?��i@Lm���@M�0k�CN@OL��<	�@P��M�2z@Qd�kD�@RO���@SA�"GM�@T<���@U>����@VI���E@W]8��zc@Xy0��
I@Y��"�|{        ?�$���?�e@��@w�άgU@ ���J�@"�&w���@.��@G�@6(7�$K�@>�n�!f�@DT˸bo�@I���)@P-�-�\�@S����U@W�j
e1@[�H�/�@`30��!w@b�bx,��@eTE�OK�@h+[[�@k2?��@nh��4�@p�R��@r�BA���@t���@v�@����@x�����V@z�p,�*@}�}FЇ@{d�<+�@��(�Ǐ�@�Ch9�x�@����\ȵ@���i��F@�l�Q��)@���}��P@�tj�ʭ�@���{�@���dN;@�cg��tR@��W�D@�����V�@���k�Z@���r"�@��pO�^�@��Ɗ�K@��-s��@��b]P��@��x��l@�
!A�A�@�'���_�@�KBC�"@�t��S��@����4\@���P� @��!��@�����7@�Qe�9�}@��)�ڰh@��:��RP@�R�c��#@�p���@���8X?�@�rRV�W@�.q
Ac        ?rI���/�?���; ��?��{�W?��M`O�?�^���??�����6?��ҧ�?�����?�ds��?� �^��@0����j@A�v@�@c��@@d�0��@հ�� �@�t��@��Yt�c@���9�@��5�o�@!+�bИ@"�M��8J@$ސʳ �@&��\��@(鉜���@+{c�U@-M�l�@/������@1��|V@2F'�C�@3��}X�y@4�ϝ%@6I�7�@7�ay1L @9.��(8@:���gr@<>m��8�@=�#��@?z��
�@@���Z��@Aq�,qm�@BTf� |f@C<�8&�@D*P%6�@E���Q8@F��R@G�͟��@H��a*m@I"W��ް@J12Qʜ�@KEz��@L_0c�A�@M~U�}u@N����B@O��f�*|@P~G=�d#@Qѐs�@Q�"��ҩ@RV>�~��@R�)�o@S��L���@TGy�:��@T������@U� �fj        ?Uw����?�����;?����]�@?�m��"�?���	��?��1,¤�?���l_m?�C��J?�f:���?�JA� ?��W��=�?�Fmf
?��/��8@ 9/�"��@N��d@���ᝇ@
��d�L�@�(�1��@��憨�@#9D��@�q���@�	�/�@�����@ 4P|�D�@"a6tT�@$��wJ/@&$��1:�@(gtҋ��@*�`�ޯ�@-`ˏ��@0"�<x@1~�/{�Y@3�򞤔@4�մߣI@6ZgRX��@8'��io@:!���c@<��e��@>'!,*�@@-����E@AUm��!4@B�?o~J@C�u�q�.@E"gi 2�@F�k��W"@G�ړ��@Iw��1@KYr�T�@L����@N\���@P7�
��@P�ڍ�U@Q�m��"�@R���E@S�YU9�@U b���@V?NN�@W;�� @Xh ���C@Y�	I�@Z�85�3�@\(l��@]|�݉!�        ?ct�P�?�d��?��w5X�?��I�S]�?�)ϗ]͉?�g,s�X\?ܵ�q6��?�(�$�?��C7?Fs?�u��;O?�"�h�?����'�F@ ���$@M%/�@4�q���@�h)v�(@�(��@izz�ϭ@`�/o��@��1�m@+U>��@ ��h��@"����@$я�^7�@'8lX��@)�"N;�@,�M|�x�@/z�b�p@1M����@2�g˕�@4���;9@6�SG|�@8���:@:�1��mS@<��ڵ�@?J�-���@@��x�@B2���A@C���#r�@E갊)M@F��d0�@H&yq�N@I��S�@K�nN�m�@Mn2���@O\45��@P�e�@Q���xo)@R�	s�
V@T !��wv@U4-�2&v@Vuph�n�@W�%����@Y ���X@Z�����@\5���-@]��VJ��@_'΁��@`a�Z �@a:���x@b�jU�@c�4�@�@c��~/�        ?��<o��,?�T�3}@�/�j�e@(�?I��@'��J�v@2��q	�A@;&��Ѕ@B�Ћf�z@H`nĶWg@N�O��@Sx�Hy�@W��H��@[e�5MǺ@`
T���@b��x@e9��5<�@h^�f`�@k��
�%@n8Y�C��@p��7c�@r���c@tT98�5�@v;lן�@x7����@zI��kN@|q1���x@~�!�$j�@��L���F@��E��@���!�/@�<CI٥@��0�l^@���@�W���c@��]!��t@�I���@��L�\h)@�e���5�@��ж�@��@��?@��Î@��8ڠ�@�s�6w!�@�]�;�G�@�M4�}/�@�A���g@�;���N@�;2]�o@�?���j�@�I-����@�W�- �{@�k��L��@������[@����T@�����R@�w-G��@�#�.�@���B�<5@�C�} )�@��s){�@�����F@�(:$��@���P:aa        ?s�ޤ�y?��۵ ?�r�⪘X?�^���~?�|m�?�[y��Y?��I�_�?�Ze�O��?���D��P@�yR6L�@B�NF�@|0aK��@���!�@�����@&B�y�@Ь*;hG@���ٞ�@!�hu6�u@$8�]��@&��<^�@)��^|�@+ʺjo��@.��w}#�@0ɨ�޳�@2Y(5���@3�����@@5��j���@7��؝n@9b}^���@;X�l���@=d�3�w@?��7�=�@@�FCW�@B�]d�r@C5��Ֆ@Dr
����@E���|�@Gx���q@Hj��b�@I��_��@KJ�r���@L�Z4{��@NZ-��@O�5�֕@P�Ep��@Q��nzX@R�#*$��@Sk�1�A@TW�L�`�@UIq�Y<K@VAJ&ng�@W?��[z@XB�b.L.@YL��s@Z\!��@[q�a�}8@\��@��@]���8�@^Ե=��@` ��O7�@`��Q��@a5�/y�@aԸ���        ?=���Y0N?p�z'~�H?�6���6s?���x�?�cn*C�U?�j1�?���b���?��YX9�w?׉�/���?��B��x�?� Y9���?�P��rd;?�U�'�D?���H �?��9��@ 5����@�0��Qb@=��	k@s���@�=��W@�{t���@�[�i�@����@jk�3��@ 'Ǐ�@"H�1Z"@$����@'z#{N@)�WL�DP@,�?q�U@/򋨱�u@1��u�M�@3~ׄ�2@5qc����@7�8�!��@9�g�ܟ*@< T�^�@>�r��@@�V����@B t�_�@Cyp�Es�@EڦR�l@F�E^���@HaF�Ť�@J/u�O.8@Ll9#�E@N���I�@P�n�̍@Q)	�'��@RL#\�0@S|+3���@T�o�ܚ@V?m�@W\�N��@Xø��>"@Z8����@[�-�?@]P-��C@^�#[1\@`R|S��@a3�n�2@b����@c�f%�        ?p�p���q?��)����?�C�2��?�	]����?�}�4?:?�0�rǡ?��R��1�?��Y'�s?���9>@M]��@���E7Q@
��P��@c��Wl�@�ݲ�@A(:[@>xp�z@�� [;@"4�8�@$ϩ��|S@'�F�\W@*����@-��|�<�@0�LK�@2��q[n|@4�sGj�U@6ɝ���@9g���@;|�����@>Ax(�@@`j����@Ä́D_@CM�1�M&@D�s��
@F��^��h@HBhz@J�&:2*@K�)s
�d@M���X@O�o���@Q
���@R%�z��@SK�8�j�@T|M�;@U��uy�@V��-��@XQ,�&e@Y�͐�Y�@[ ��V@\��B0@^��=Pq@_�P���V@`���@ak�+t�%@bDW��#@c"�f6�@d��#��@d�\�M�@e㽍e�@f�/I��@g��?f@h���@i�y�@j����M4        ?�����Y�?����3�@���`@!N9���@/3�j� �@8����t@B'A4�S@H��l�j@PG�����@T�cNK@Y��%ݎ�@_O��=07@b��a��g@f��T��@i�ʡG�@m�U���t@p��i��@s5m�X�@u�p���@x5�0���@z�V�,P @}�|��i@�v�Eh��@�~��F�@�̙5�[@�����1@�~uX�u@�{���@��7K\=@����:��@�&p#(@�1ª�G|@�n�*�Q@�����@��U���@�o�2T@��7���@�Z^�HX@���n@�z��|@���Q@��Q��`�@��<#��@���
�@��/�j7@�����w@����ͼ@��V�CS@��s����@��G�G\@����L@����I�G@��d�d��@�'r����@�W�X��A@����
t@�����Q@���E��@�,ѮIi@����2l@��:�wӓ@�.��m$m@��7ߔE�        ?Q6?��?�]�Rr?�����?�1pH�?�^��ٮ?��9Qh�?҂a�N��?�����?�E)��?�<��T�t?��Vf�i?���f�S?�;�T?�P.�2;V?�q
�`�@ tC��Pu@��P���@ojC�{�@/�?S�@����T@6���,@�I{[c�@zA�;�@K�"j@4ÿ��@4��n@L[c=@zR(���@�ą��@ �;�$
�@!�H�"(b@#�7@$_�	3��@%�s,k<@''���p@(��UK��@*x��p@+�UO@-FZTwĽ@.��VQ�@0Oy���@1.��k�@24r>��@2��ɐ��@3�|�>J�@4�g��p@@5�LQ3�@6��1�k�@7��6���@9�*��@:{'�@;<ù�`t@<`����@=�$��*@>��wa�~@?��@@��6�@A9���@A�AG���@B��Q+�<@C0����@@C�'"Aa@D����(n        ?De�s�?pQ+��?�ڛ�?�w*��;?��C����?�"X���h?��鹦��?����A��?�麈��?�����h?ߗ\�2%P?�G�0��Y?�[X�R�?��[w��?�~2w8�]?���uܝY?�W�w���@ �OD�z@�V8zh@4��"W@
�i,�x@G��U@Ե6_�@W|���	@��@���`q@Y�A;lr@ qu@���@"Z�o�p�@$j���@&�ʳ�[$@)XYQC�@+� � @.Jx̨x�@0�r�i@2$��Û�@3��W���@5�AnمZ@7]��Ō@9O��1�@;]�v�a@=�Y�@�t@?�M�])�@A�b�1�@BXX�e>W@C�5J���@E�J4&2@Fw�>i@G���>b�@I��&8�@K'p
� �@L�<���r@N�K-���@P8m�>�@Q+�mEr@R'�����@S-g�Ɂ@T;����@USb�'y@Vt�=��@W���JOg@X�#���
@Zi���        ?J�,�O,�?x� r��?��衵c2?�G��_��?�7�i���?��]�݃?��dy�?�.=d?ߦ�ËE�?��k$W?�든��?����S�?���BQyE?���,W?����=B@G����!@��85Be@	.��{3�@6s��x@�H�w�@E��d�@�e��@�
�2@y�1q@~4����@!����7@#�Ø���@%̞-��1@("7Uր@*�[��8�@-Qի7�@0����%@1��w��@3?>[��@4��\y�6@6Φ��k@8���}�@:˅Y���@<�ׯ��@?:���@@�:	m@B1U�^�@C`xU"7@D�Ge�n@F/�[��G@G�N���@I>��OT�@J�۾9&�@L�N���@NPsn���@P:���:@Q���@Q��̒��@R��{���@T��if@UDP�І@V<Z�w2S@Wb]�.��@X�`���@Y�u�&U@[
�(���@\U�m@]�Ӛ��        ?�,���?��Y8	,?���>�\�@bvA�]�@!�v2��@��G9@$��+���@,�燗@3<�e��`@8�^��_�@>�l�[>I@B�.��h@F��r@J�u-��@Oam!�+A@R#�$:�@Tƌ�7#@W�-I��@Z�/�D@]��DlO�@`���:pV@bm�K���@dU����@fWexP�@hsd�莎@j��S���@l��Hs �@od2�;s�@p�_Cd�c@rCΛތ@s��J]jg@u
�ɋ�o@v�5:� �@xq��=`@y�iO_�@{;1J�H@|���@�!@~�|�r�@�8�����@�$��%d@�+���@�x<ˢY@����c@�L���@�+W�D�@�A��Z@�_
�u�8@��l�c@��Ћ4�@��Pi�@���L;�@�\�\ )W@���k?�F@�y�xF�$@�%-�f��@����r�@��&v��6@�;��c��@���z�G@��V�P��@�q���@�4$I<@��C�`��        ?|RS]u<?�!rh��L?��爌�s?�F���L?�d�[�2?�R�U�?�9Q��[I@����#@a�YV�l@=«�@{�7��,@W�~vN'@ V�>��@#>��KԤ@&b��%@)©�R4�@-^:���@0���m@2��>���@4��4��@7��-��@9o0ɱۆ@;���|@>��ٞ|�@@����@B,�"�@C�㹾�@E
�oH��@F�h���@HCt��0�@I����@K��[@M���9Q�@O_�B=�@P�V-�O�@Q�.�GO�@R�K(p3�@S��$2��@T�'�F��@U��ݡ�-@V����j@X&f��k�@YUH��I`@Z�6�i+I@[�1"+�~@]9��@^WS,ν�@_�>�&@`�`G-)@a1���A@a�A�� �@b���IS@cWJs��@d�t<�@d�s@�r�@e�����@fe�َ�3@g2n¤�@h�FR&u@h�D�9�3@i�.��%@j�N�TQ@kc�kSӝ        ?u��jK�?�c�*��H?�Mx-ǣ�?�{��o�?�~����?��~o%F?��C$��@d�6)��@`;���@@&ǫ'@��N�r�@��G�o@��{��@!�
��@#���1-�@'�
6xu@*~����@.-Y1.#@1[,y;^@3,�T{@5lؔ�b�@7Ј���@:X\�}��@=�y%ˀ@?��V��@Ae��.V�@B����h�@D�\, _@FG���	�@H�11,@I�}˄a�@K���/�@Mֱ>�j@O�R4.�m@Q	��cA@R(J��h@SP�D�9@T��m�@U��{�%@W��;�@X[Y6ݢ@Y�ݖx��@[!~��ѷ@\�oX[w@^��,�Y@_�<S@`��J4��@am
7� @bD�}�.R@c"��7�.@d��~1@d�}iIk@e����U�@f�+�zl(@g�D4��@hۥ�H�@i����"n@j�++�@�@lO��ڑ@m2�AC~�@nY��n@o�h�M��@p_&�f%�        ?qG��g�?�r�BqW?�L�W�?�8ڏ�y?ٯ����Y?��;1�#?�+,�&[?��%�=��?��T�
NZ@Ͱ<��^@PƮ6��@mԐ�@��	�@ˡ��F�@\R�*��@M�(@��O��@"1�_��@$�^V���@'�l䨝�@*�B��@-�L�+��@0��]��D@2����@4�T��@6���|�@9@� W�a@;���=F�@>_�y:�,@@���̚g@B�]�@C����q@EE�R9�@G Š��@H�I�ʩ�@J����@@L��Co�1@N�)@)�@P�>�a@Q�u��Q0@R�]��KC@T�p�8�@UfU޽X@V���Te�@X$��@Y��$Η�@[J<�U@\�b��
@^=�e��@_����@`�β���@a��$��@b�ӧ�@c��9p�O@d~-�7t_@e{�2w�@f�G��T@g��n�F@h�s$rea@i�����@jؚZý?@l )X���@m.�cw�        ?ׇ���e@Gd�ݖz@$�,qf�@78���36@E��><�@P�m�~��@X93eX��@`��3�@e��/ +0@ky��P�L@p�l�j�6@t{�%�]5@xT.��	�@||T��:k@�yo,_.�@��c@i^E@�c���ZU@���e��@�出&m�@�޶SYgp@�~�k�ls@� a&G�@���l/�@������@�qs�
�@�Z爭[@�U耴�@�bR�M@������@��vE��0@��{W
7�@� � �X@�Q1��b�@�����@��(�M�@�����@�kK���@��r#٥@�+FP�p@���(��r@����ظ@�D�,�en@�x.pM�@��,G(X@�����ڪ@�g�y_�M@�:���2@�l��%a@��;��@�����@���5�h�@�� ؈@�~r11�o@�l�jU1�@�^`b�)�@�S�>Μ@�M"�$�:@�I�ნ�@�Jy��H@�'D��l�@����H�@�0�:�@���6h�        ?i���:�?��*R���?�q�<L�?�$�T�x?��O���?�w���?�%F^*v�?��J�dT?��n�b��?�ß�3Cj@�c0 �@mv&�@�fg��@i�
y@޵���@�# ��s@1g�)Ƴ@�r�v%�@ ���WZ�@"���!@$�W�H@'�_�O�@)j&U��6@+�[�,�'@.�����e@0���^��@2	�]��@3��
B@5+���@6Ө]Id@8�,%���@:[��<�@<<0�rV�@>/��%�@@Jִrb@A(G��y@B>��Q�%@C_H���+@D�xMw(@E�����i@F�֛�K�@HDR��2@I�2'�Ii@J�U2v@L\~@���@M����@OL!�� n@Pi�~�U@Q2�/�@R �d-�@R�#@S�'XkÁ@T�5�ś*@Uk1ّ��@VRF><@W=����@X.�&��@Y$=6N:�@Z�z��@[=�@��@\"�G1�K@]+��x`@^::�F$Q        ?N�i��V?�j��0?��gt�8�?���r.?�����?�X���O�?ԇ\���?�
<���?���ڣ_?��kU -?�{���|�?����m?�j�c�?��v�E9@�ZѬ�@��(���@	�����@X7�@oK��Ԏ@Q�=��@��D�}@
G�x%�@qHA��@ ��#��@"�G�]{:@$�z��4@'����@)0:��P@,%���@.��ln�@0���N��@2�\e��@4KB@6+U���@7�l��'�@9�iR�2@<�}�?�@>S��(@@S��pn8@A��9�@B���j�@D,���@E����M9@G	�N&@H�Nz4=@J%Њʧ	@K��2�[�@M�X+"�i@OL��@P�)B�@�@Q���v�l@R����Ri@S����=c@T��>�)N@U�{�]�@V؅$���@X�RNi�@Y8U��� @ZvR�a2@[�֠]S�@]�3�.@^i�5��	@_��j��        ?x�3�@ZS?�F� g?�f��J�k?Ԡ�^�?��7D23?�����X?�������?������@}��Z@ʖYZse@�}���8@�sNo@O%�x/
@L-�G�2@��7/�@!�=`@$?[0g@'�zU��@)��$���@-/@���@0N%Z�C@2"�G,Q@4����@6+����@8`�Q�@:��2�o�@=0p-�:`@?��[�N@AH4TB��@B�zh�- @DD@����@E����@G�dF�@IT���Cp@K/!�"Al@M��`q@O$��o�E@P��$׈�@Q�K����@Rߪ��ۿ@T�]�"@UNX�ń/@V�~��@W�E���@YQ(�v�@Z��̗2y@\=�^�=�@]ǭQ�@__$�)�@`�' L1@a[�X�@b<ULSu�@c$*5̼�@dO��@e	�]�@f3l��@gՠ��b@hv\g{y@i1	�4<�@jN�)|�@kt�Ix�@l��/�ǁ@m�}�]K&        ?ǐ�_k��?��t5�@�@ �	�0�@%�����@3���'9�@?O��C��@F��	�_F@Okq/�@T�pd��@Z=ϼ���@`=x,G�)@c��(�M@gpPV
9@k� ���@o�G�@��@rPM���@t�W�;�@w�K�W�@z]���.I@}b���n�@�J3EqI@��^�~��@��>� �3@��	r�s�@�����s@��m���@����w�w@����@�(@���%@�_컷��@����]��@��R�r�/@�U�Z�[@�����@�9���:�@��w�A�@�R���@���P�Ug@���g3@�-�%��6@��ׇRL@��ޣ��@��!J��@��jNJ��@��B��j�@��4i(eC@�2�N��@�%U�d'@�4�I�Y�@�X_O��U@��b�y�l@���F;`=@��Ƃ���@�'���V@�5W�V��@��V���@������)@�-�'� @��u�ԯ@��>�}@�CA�Æ�@���ò~@��	M�m        ?P�X��6?}8�y�?��� ��s?�P��[?�e�ԃ<?�2��_�?��(�F?�%D`��E?��B��n?娊��ڲ?�(���8�?�G	]I?���kx?�˩�v��?���y�H<@ %��@�a$g��@h��@��2-��@
����1@��C���@��)�X@Ol�3b�@#�7�@@gZ�!@�d@.َP��@b�fP?@���� @ ��}Nhz@!���R@#M܃Z@$oP�N@%�1K�$@'G�B}��@(�#Z��e@*R�F/�@+��1h��@-�s�]��@/:WP;�@0y$��[�@1Z��d�@2@��U�@3,l�R%�@4�c@5�vޚ-@6�J��Z@7
��٪@8M�y�@9ς��@:$C��Q�@;6��^@<N3�WN�@=j�&�a�@>�{#o�@?�`��Z@@o����@Au�L˄@A�Ҿ���@BAثl]�@B�x'd@C�֓��^@D+ĥ��        ?&<5��j?[\��1?z�� �`�?����K"�?�)YKM�?���xgv?�d9��d?��@1�"?��� ?���� ,?����?�J�,��?��8�?�Wk,L��?�n7�f}?�V,�&��?�u�*�JE?�+�P@ ��E�D�@ĸ�\�g@$%.�@
��{!�'@�;O�w@ӫ\�-@YI!Xݧ@y<Jx�@3�#@`����@ t�Tth@"\�d�T�@$i�YS�@&���oLD@(�h�x]@+z�c�H^@.'��n#�@0�!�4@28�� )@3�!J=fM@5K2R6Z%@7��y@8���`@:�iE��@<�.�&o@?$�^/��@@���V��@A��~[��@C�`��@Dd�7'��@E�r�sk@G�S���@H��R6Hq@J�t�B�@K����@M*.��G@N�W��7@PA�㹋@Q"�A��o@R
��5@R�,���~@S�9v(�@T�T�~�T@U�e�^�@V�ޙth�        ?9��/@�?gY���?����I�?�9E�<�?����߉�?���*{?�rv��/�?�!����W?��"Z
?����X�?�%�xa�Y?�hNk�?��m��?�y���?m?��O?���^��?�����@ ,���=@�����@ �_,��@	v-p`�@B�͹�D@�H�s�l@�=d�1�@k��~@��kh@���f�@�H���	@ �	�x�E@"]T�|@$82�f��@&0JWJ.�@(F>���K@*z����@,�bF\q:@/B��K8@0�W��@@2F�ԕ��@3�/HYo@51�Ֆ@6�)��@8e�+$�@:��ɬ�@;�v�^'@=��'�\�@?�\�İ@@ْ�x��@A�JZB@B���1q�@D����@EH1(>M@F~f/x�@G����3�@I�7�o�@Jc6�"p�@K������@M4%��2�@N��x��@P�Y�"W@P��/�pn@Q�6�p�	@R�^h*@S^qH���        ?������?ˏ�|�?�@�bg�g?��Um��@+ u���@U&���@ ���[�@'u"�t/M@/`���s�@4>?Ƣ �@9e���}d@?(G���@B��a�6�@FC.�(@JE�d֭@N5~��">@QU�ӆ��@S��ٷ�@VKO]�@Y;�_Ra@[�U�P�@_��h�@a!¨�{-@b�=k�}@d�li��@f���%@h���^�@j��oz��@l��P��@n��Z���@p�_��Q@q�yD�8a@s&��@�@tw,5�}T@uӼ��@w<3���^@x�7}��@z/W<Yˍ@{�,�M>@}MiJ�?�@~�����@�J>4e@�#'VrM7@� ��	bS@��vfo��@�ʎ��@��8�ǌ�@��t�kF�@��H���@�����B�@���4O@���A��@��_���@���\��@���qh@������@������@��'A�@��;I�F!@�-3�Lm@��]'�@�^%��@��9�?tp        ?qP�7nf�?�}d�^?�e7{+zf?��-RP�?�j���?�^��B	?�eh���?��f���O?��W�?�@�:b[�@�$p��@�����@P�Y�\@k��y�@��U��@h�o���@J���Ƕ@!���(W@#�Љi^m@&?=2�eM@(���V�k@+K?I4��@.�h�h�@0m���8�@1�YfF��@3w�|+hM@5�3J�@6�r�߄�@8����@:T�����@<5����5@>(}���@@?��@A x��`�@B3~P�@CO&v�7�@Dsu��}@E�p�K�7@F���m@@Hq��Ǭ@I[xma�-@J�-jjvr@L���@Md�� �	@N�q���@P zCX@P�<v�0@Q���u�@Rfw
4�k@S19"��@T ^C�z�@T�����@U�ʘ"`@V�
%lJ�@Wh�N5�h@XM��ި@Y6�O|J�@Z$c��t@[��x#@\�o%�@]��\��@^�$��P@_9�4�S        ?d�."�?�hJ�O�?��bT�g?�m����?�P!&��?�'�	���?�0�f
�?�H���f�?��Y�Ge�?���&��@7���@�y% �@	dĤ��v@,랐��@�W7�Y@��\15m@� L�8@7���׀@��@!}�;��@#����W@%�0	$?K@(H4DNI@++5�UK@.-��@0���4M@2!$���@3Ԥ��� @5�/VL��@7�=t�O�@9�g��M\@;�C���{@=�b�O�R@@'^}@ALE��TH@B���}s@C���u�@EIL@F�1�j�@H<���'@I�� �@Ko�+�@M B2��2@N���|�@PZ��E�@QKe�#�@REkj��@SG�~@TR�2�p�@Uf:�7^@V�<^Ami@W��t�gI@X����S@Z	��[I9@[G�V�t#@\��uu@]�G�q7@_6cQ�@`K���@a <��f�@a�:oQ�@bv�I�w@c8&;ؙ        ?k\�R�?���t�^;?�Y|`-�?��D����?Ѹw����?��q̠��?�UnӀ�?��k�=�?�a���L�?�u����?�7�u���@�L�`�@t7�) @	tSn��@�_'�Nd@Zl�|�@���@�o��#@�}5�y@^��.�@@ �k$�Ո@"v���@$�C��@&���97@):�+���@+̙�[��@.���O@0�p��X@2E!�z�@3��PI-@5��'!��@7z]y�>F@9jM�q�@;uw�r�@=���o�~@?�k,�P@A!�����@BbL��/j@C��7T�@E���@F�1���@H��S@I�#!g�@KBBQ��@L����[@Nţ<��}@PQ��W�w@QJ�B���@RM@�y@SY��Pm�@Tp���x>@U�1J��:@V�q��̂@W��c�O4@Y8.���@Z�'�6�@[����@]E�ȫ��@^��AY/@`�|2�@`��廚@a�.=�(�@b�?��        ?�I�zGx�?���4M k@�Q5�2@%
����@2���ؿX@=��:'}�@E�X����@M�Y����@S�G%�@X��'#c�@^�0�a!@b����4�@f.�0!�*@j
 +�L4@n2lς5@qS����@s�H��\V@v:���3�@x�az��@{��Ǆ@~��,r�@��J�s�@��`3bS@�=;�x�@� 5�hT@�ݫ���@���s��x@�ȑOW�s@���@��@����+�T@�Γ�|�@�>��Uy@�kVh��@������?@��/.�E�@�)�Gq)>@�{����@��]h<,z@�8�S}8�@����/��@��kp�p@����$�c@��"i�F@�V�ksNj@�#*=R�@�����O@�� ���K@���Sa��@���*�_@�c-�RQ�@�Jm@�5w�݌�@�%5�<M@�S}[�4@�̝;�@���3.@��3\�#@�.�{F�@���< d@�ne��j@���n�1�@�*�)B@��F��w        ?j-DjO�?�:��l�?�MS�Q?����;�?�l��0�?�an��Q�?��O�Zz?����� P?�m��!6�@���ج@�C�MU@
�V�Ď	@Q6��@�!�:�@� 	,c@v���@]Y�cH@ ���!�@"����&@$�U�B�@'�H�r@)�z�2�@,Ot,�3@.�E�V�f@0�d���T@2:a@3��́�q@5Q�QDx�@6�yC��@8�@��#�@:gV��@<7��/D@>�I�L0@@�4S@A���K�@B9W�9@C�?la�@D2��'�L@ER�	5C@Fz����G@G�j�b�@H�9��R@J!���@Kip���@L�����^@N��@�y@On�'�d�@Pj���@Q!���Wi@Q����v@R���#_@S^����@T%�E�5�@T�A�F@U�A��'�@V����s@Wj�4���@XF��Y�@Y&vy>�_@Z
�X��@Z���Iot@[߶�}�{@\����        ?U�׹��0?�e�B�[�?�i��y�4?�1���?�?.	І?Ԃ��R�?ސN���@?�t�.s�?��H����?��xSƫ?��8S@?����z�@���%@�����@
	��Φ#@�E�F�@� b���@��e�*@�����@gP����@)�o��@!�����@#�[���E@&9���m�@(�W�j'{@+����R@.�i�%9�@0�[H5�@2����B�@4H�S�Q�@6+�Ǩ�.@8+�5@:F�5O0@<~��)X@>�E����@@�Ԃ�p�@A쳦]�\@CEk$rd@D�X� @F%'����@G���D��@IF�K*@J��[ݕ�@L�^;n	@Ny�Y���@P,e��N@Q%�F&@R&��P�@S2� f3@TFV��@Uc�3E�g@V���k�@W��nw�p@X��*���@Z6��h��@[��Kڿ@\�J�E<�@^7Z���@_��)4�@`�!*L��@aG  ��@b
/J�8@b��Fpm        ?=ѐWt{Z?j'�� W�?�.�UhF?�	q.u�"?��r���?��tJ,_�?�N���e�?��9����?���Ņ�?��F�<jB?�pg����?��`\���?�1�z�h�?�x�?�X?��X)�?��Q@7�%?���� %@C���@v8'�Aq@/?���@���/d@@�t�s�@�)����@hG�ɳZ@\䍓�@��Q��@�Z�n�@!p݊�\�@#}9�a@%��nk��@(�D��h@*���
��@-Q�yPb�@0���*�@1��� �@3JDr�O�@5����@6�rІ �@8�y���e@:�� @=Z��w@?V�Z��@@�Il�M@B"T @Cv1t��@D������@FNl����@G��+g��@Ij�+��@KyaUj�@L�'�Le�@N�4��Sy@P=x��1~@Q6ׇ���@R9�7���@SF�J��@T]�}_@U~��C@V����T�@Wߺ���@Y G{��@Zk�?h@[�L���T        ?�*}�ؘ?�"���e�@���Ŷ�@�齯�@'����[%@2�o��@;�qQ�~�@C&���@IM�����@P*z����@TUá��@X���]�@]W�H�x�@aN�7�kj@d)� �[@g<����9@j��X��@n	�á�^@pቆ�3�@r�=���"@t�����@w�7v�@y`,�꧁@{�����@~<ł#n�@�hʽ��0@���̢9<@�#����%@���0`3@��P�}�@��B��4@�0��Ia�@���h�!@���>Y@�Au�P�@���m5@��)}�_@���6w�@��x���l@�޶���@���o�@��D��%l@��;t��@�"X�Q��@�C�}5�@�k���D�@���NJ,�@�����9�@�
H����@�L[���@�J�� �G@��Jg
�@��j7�B@�K�ڸ�@���^G�@��g��ny@�l_���#@�(��@���n<�@���
�,@�s�s_��@�>ܼ��`@�t\.�        ?qU���?�-!�)iR?���Q?θ|<~��?�"�k�[?�1�_i?���+?�����o?�n^��@u���q@;���~@�����@����C@�]��[K@O�\�@  ~�@  oQ^54@" 1񄖨@$b�|��@&�8���@)QI�,��@+�G ��@.ϖi�@0�ʗ���@2pJ�h�@4nzT@5�Rm�i�@7�}~��@9a� 
��@;MJȉ+�@=K�b'_#@?]��\v@@�6��@A��?5Ex@CEh"�*@D0����i@Eh�4�c@F�%�i��@G�s��9�@IG�B�py@J��\�*@L	V�Z@Mww���@N�{깐�@P71��B_@P��9Ҷr@Q�o<�W@R��h�j�@Scnx^c@T9�Z�]�@U���@U�^���@Vմ��@W��M�6$@X�WmL��@Y����%u@Z��Ȯ4�@[��.#qN@\�Z�$M@]�")�@^�i`~��@_��V�J�@`Lfk��=        ?h�\�V?�`5��?�o}�{tZ?�Ùm7�;?������?��_!4?�#`n/?�'�ע�?��?�F�@"���ő@	l��$�@o8�}f@\��@��5�@����@��Tv�@"mh"ц�@%8�񌷙@(C.^C؎@+�e���@/==|V@1zT+s%.@3���o��@5������@8,�~��@:����*�@=8K6Y"@@�5��@A}goR:}@C�'U/�@D��t���@Fi�;Z'@H82��,Y@J��r��@L_��CO@N(ŋk@P(��7	�@QH�ÿ�~@Rt����@S�+����@T����'@VC��T�O@W�AWEi@Y�#pdZ@Z�+�@\��+^�@]���O@_C�V�(�@`yլ��@aX��@b>�rY�y@c+�[��w@d 7ZJ��@eǤ^J�@f���@g(�t�d~@h:�7�+@iS���@jtE�" p@k��q�Y@l�_�qH3@n��G[@oCJwp©        ?fM���%?�`����?�!u�� ?�d��\8�?���,�?�>�|���?�����?��
۫��?�AHJj?��<�k��?�����5@s�!�)�@U�՜�@
����.�@~6�
&�@h��.�@Vϒ嬆@���0+@@#�J�@�]��@!�q ^��@$0멨-@&��i#�@)����g@+���vT�@.�O,[6@0���f�?@2��]��@4A-���@6}����@7�Y늳�@9����@<ؼC�@>P's��@@Oq3+a�@A�����@B�tA�9&@D^�j@Ep�$���@F��z#;@HR��\�`@I؃ 
�@KlzJ�5@M���@N���ͯ@P?}+W_u@Q&�f�@RiV��5@S���5j@T
���@U7����@Vv2�M@W4�OS��@XS��cl@Y{4�.n�@Z�St�?@[�X�y�@]&t����@^q�eip@_�����@`��E�@aG(S(�@b ����N        ?�znm֙]?�v�1j4@�y�"�@&�d9>n @5"y*�@@��* 8+@I5��W�@QG^b�>l@Vѹ�+��@]:���D@b�]��@e���u�@jE~
p�E@n���!@q�bH4HQ@t���f@w�Hb�4~@z�;�%"�@}�bdPɛ@����e��@��lqi�@�y�裸@��:�cD@��,�^6}@���Cĭ�@�5m�{!�@���0�K�@�{i2[@�h�u��L@��8��	�@�2�q�=@��ѿ�$^@�/����@��`vi�@�_w�(��@�	ݴ`]@��a��-�@�Aj���!@�(�AS`@�}:I�9@�;�滮@� ���	�@�����}@���}@��'�Cw@�)́>@�1Ai3)8@�K�A���@�l8I�o�@���� 0�@��CpI@���%�~@���B8@���&�Q@�N�^��1@��[��B�@��K @�=���\@��zr���@����x�@�B��^@��ΧM[�@����\��        ?R�V���.?��G�<�?�^XA��?�b�z��?�1./?�0PZ�9?�>����?�A����?���z�?��#E�2?�@�Fw�?���/pw?��e�ￌ?��C����@��mH�Q@ï�#O@��J�� @�C��@�I�S5�@o^���@
	�'@�m̚�@C1oH]M@���m@�H���@m$����@ ��v4@!��H�{@#Mm��m@$���R�s@&Q�Q)R�@'�6�Z�@)�#v��@+K�o"?@-��v@.�_�Ζ@0j��3�@1gi0h�@2ll;�^@3y�_Kt�@4�����@5�,����@6�5���@8��6I@9=3��@:~1�ҧ�@;�ܤ�.%@=1)��@>u(1�I@?ض<R�@@�g&2�u@A\�p��/@B9Zp��@B��[ԫY@C����v-@Dp,����@E?��~��@FX/�@F�S�(H�@GǛ5ޑ�@H�8U�~m@I�:(�s�@Jv����/        ?9�s��*?m���U��?�t��:?��_S˻?�Uy�]��?���ٻ�?Ŕ���+�?ψQJ���?�����?ݶ褀��?�'�?����.�?��#r�?�3Dc�?�c�N=�?�7˷�� @�G^�@ь'U&Q@�	P�W@�+����@��+���@9��Y�@̼!�@+��h>0@���r��@ &ȸ�@"-�2f�@$_G@��P@&�z;�f�@)O�+�~�@,��mM@/W�B�w@1b6,=*@2̟}��@4��l�4�@6�%[+ּ@8�hf�|�@:������@=���@?~� v@@Aqi#W@Bc(i�@Cб���
@EQ9���@F�C�k�@H�R�K�;@JI�%��@L�@N�8oI�@O��T�U@Q	���'�@R`p�O@S@�	N!=@Tn-��[�@U��j�@V���@XBP�En@Y�>䨨�@[��V^J@\�+���x@^���7,@_��J��~@`��}�D        ?6�o\u�?eV,1�bn?�s��?���=��?������?�e��e?�n���P?�p��P�?ϟ?��?Մ��޹?�}� R�?�qNh䝮?�nQ���?�K|&fA~?�xCw��?���lЏ�?�� ��L|?��;��Q�@�0=Z�8@�J?f�+@	����U@�4- �O@8(��@�>-Լ�@2B���1@$T9���@Yy[��@Գ��(F@!̃lH��@#Խ�
�@&�l�zg@(]� j7�@*�8{?��@-�&Z�!@07n�A�K@1��X�hm@3\��Vs@5�iSt-@6暢��&@8��W\�@:�@�:C�@<�hh0��@?<�i�@@̺��kt@B	ÅD	�@CU�R�@D�<�:*@F'����@G��+;� @I!Y|�?<@J�󐆎�@Lf�K���@N!�\���@O�g��K/@P��$G�@Q�.�,j@R�ov�W@S�]4k�@T�EL	@l@V	�ɲ��@W+^k@XU"A�fc@Y����        ?�[Wi�}�?�*����?�xCcB�Y@�)pLa@��s:|�@���� @$�#�ȵ�@,���AcI@3Z1�K�@8�jL���@?M��@C20?u�@G�(\�@KhJu��@P
1ev̆@R����@UI-bBV�@X2��>�@[NqS��	@^�D�(�@aWP݆@b���U@d�z��~:@f��,�@i�O:_@kSQ�,)�@m�
��D�@p1���)@q_����@r��(ʿ@t ��:��@u�^�`��@wB��@x�����"@zW�{�c�@|���@}�W�Q�@��4�@��/C�~�@�¹ciUK@������9@��`�lF@��UVJ	@����t@�-�Np�H@�]�^���@��il�`@��F4�K;@�#*�y��@�w��L�@���*[@��6���@��U���@��43�@�P��zG�@�U��p@�ޠH���@��m���*@�~��D}�@�U��J�@�15�L�@�g�[Ue@��UI"��        ?wq�UU�f?�;�@�$�?�L��
?�Zw"	?�$�U�`�?�u�2�?�r�BU�w?�4�M$��@ ~u��.@�\S�@	�k��U@-Y���t@�|����@�&1�o,@(���@ԩ� �@ _&zu!~@"r>rPx@$�m��a�@&��֩T@)_�'�T�@+�w���@.�o���@0� ���@2"���vx@3���8]�@58��i�@6���@:u@8�3�%��@:OIX�r�@<!P��*@>O���i@?�BЖL@@����ֲ@Bj8z$@C$7�M)@D-�E�;~@EM���st@Fu����@G��as,@HܻU8pH@Je9��@Ka~�e�w@L���.a�@N�p��@O_�{ �+@PaT: ��@Q^��p�@Q��?j�z@R���49@SJG�ۣ�@T��$g@T�(��n�@U��d�&@Vi/�HF
@W9ʔf)@X JA|�@X�(�[�@Y�X墲�@Z���
�@[wdip@\Y�Jޕ:@]?9�_�        ?Ip)�?�Y�f�?�1,6�K?�a���'?�q?H�T?�V�,?�[�!?���j6�?�w8��i?�z���k�?�A*��N?�Q��]�z?������?�DWkl��@�w���@u��T��@	/hvM@OL�99�@��d�V�@l�|�]J@'}c�1@ 8KG��@Y�Y���@��~L@!�:d�@#�Xq�/�@%��6S@(QÆ!�$@*�lOi��@-p5�;,�@0���@1���@3.k�Wj�@4�ȷ�Ʊ@6�M0��@8p�JRJ�@:`���@<j+5��|@>�����@@d����@A�6^�F�@B�X�9f@D`8L��@Ee��wМ@F�c��@H<�3�<@I���yZ@KO���7@L�����@N����
@P1l;��@Q Tt@Rbh��@ST��O�@T�`�*@U�Q֒@V(g���@WFii���@Xm��y@Y��_T8c@Zٸ|�Ƭ@\w��nl@]mMɜ�        ?hwG����?�`m��?�����?¿!T��?�9{�T�W?���u�?��.?� ?���9��?�n��I ?�8}r6��?��¢��@����@n��3@@�
b���@0Y�@����@+��L@���.g�@{f�vT@!N�d*�@#��9��@%󩍨�A@(�c[ɷ@+T�E6&@.O�.?�@0���u@2q�8 p�@4?��)@6*�g�@@82����X@:X�7I�@<�B��K�@?8���w@@V���@B��@Cw�G���@D� kT�@Fq`��Z�@Ho�!�q@I���l��@Kl�_��@M;.��/�@O�Z/C@P��+4,1@Q���״�@R�_��&�@S����h@T�L�˺@V����F@W<�+�1�@X�KD�@YͿ���@[&�8�@\�H� R@]�"t�;@_s!x3�@`|,�F��@aDnJM@b_f��@b�mh�@c�}C�N@d��:�dZ@e����K�        ?�P�mt�?�n��/l@�9�=�.@ �l&[P
@-�ߩ�@7�fͫ��@A �~���@GdV��8@N�\	0�@ST��A�@W҂B�|�@\�ـ'6L@a_}[�@c�|yu��@g$�=zu@jd�T�0�@m��,�@pԑ!؄{@r���M��@t�^�mw@w��̀A@yQ�l;-O@{���\@~,3��@�`A(�o@��~X�0@���f@��S^HY@������@���ӌW@�0����K@�֮��+}@���:�i@�I�5z�`@�B�V�3@����w�@�����?@��!tN�!@��j���H@���wj�P@�����g@�t���P@��//��@�9�cBD@�\�b�[�@���$�J�@��%<�$�@��_��U�@�"F�k�@�0��;D@��toD�;@�x���H@� ���]@�˓Ar=�@�x�����@�)&�[�@�ۥ��@���5R�@�H~�$�V@���A��@��O��i@�~i*TWn@�?�&v1�        ?o�R�g�V?���!ݶ?����OPI?�Yf���?�k����0?�BΣ$?�p-iz?��yA=��@ �+��P�@���;� @�Q���@q��/�@�U��}@-��{A�@�ٮ;a@Н5�@!�7HIh�@$@ښ��@&x�Y���@)}z�� @+����<h@.�
0�4@0��a��@2m%A$�@4׹S�@5��&nQ@7��òK�@9ptu� @;^\�K@=]��J�@?ob���@@ɓ���<@A�t�3@CÖS'm@D6Dw��@Em,�؈�@F��y")@G�k���@IJ�W��8@J��R6n!@L�T��@M~�[���@N���;�V@P>j�8� @Q9㨢t@Q��j
�]@R��x~�u@Sv��3&�@TQ^ e��@U0��\�@V�T�q�@V�BF0��@W�D��@X�	���:@Y؞�O�q@Z�a�p-�@[�W����@\�N(@]���X�@_q�u@`��W(�@`�{��@a,&�5��        ?`,Y��?�2�3m�?�������?�*W��M0?�O�Q���?�.�^pB?��7) "?������?���8,�&?�-��o&?�
԰К@O�՝Q@���I$@
��G;@~�d�Y@����@a	�� @L|�`�@xL����@�F50@ ����5/@"��~�u@$�a��g9@'D.2�	@)���q@,`���d�@/1�y]�@1�����@2����'N@4abz)2�@6+��$�1@8��;	@:�a&��@<-��n�@>fF�mC�@@^�<��;@A�Pr��@B㳿��@D>#f�\E@E� j���@G$���o�@H��R{�@JP
�"�@L ���e�@MË�:6C@O�h�8�N@P�J"b�@Q���0Z@R�@���@S��	��@T�CS�?L@V 9u��@WRß�-@X�S��+@Y��oF@[,���x@\��-Jv2@]��t�'@_ly{7@`v�A$
�@a=a8��@b	��%�@b܈�ʿ�        ?a<VT�n?����M?�b�5���?���8�X?�j�Iq �?�2?��| ?�\Ob���?�x5����?��:����?���(���?�l�O�t@��%&�@�F�f�@	J4���@,�?�2@����C@���[��@,���Ы@�@���l@݀X#O@" ���@$��C�C�@'�4�@)�z䝧V@,�
ں6�@0
H�1�@1�%�@3�J]@5���U7P@7�ɑ�@::��@<�+�[	�@?Duc��@A���>Y@BuIP�ٝ@C��rP@E�׳+N�@GM���K@Iu-V� @J����'@L�"K�@N��/%@P��:�9�@Q��L��@R�[6�g@T�2L]�@US��#��@V��X|1�@X��'CO@Ym�>��x@Z���P0@\l� 6�#@^ a̣@_����H�@`�K�&u�@a��o�ӕ@bk����@cWx&�DC@dI�¯��@eC D�0 @fB�<�&@gI�4�@hU�(7>        ?�oج.+5?��o���g@�.w�1@'����@5���w@A2:/�=@I�&��@Q1�3|�@V�GXn�@\��cv�p@a����dT@ed��"-9@io% Q�$@m͆XQ�S@q?;��@s�f�j.�@vi�/4�@y:�k�0@|2�0ǅ�@Q����m@�K�Lx�@��|��#@�ʑl�IT@��AD�N�@���MdC�@��t|N�@���´LZ@��V�N��@����m<@��4y�@��m��¥@��@eL@�N^=f �@��1t��@��b3ڰj@�H
'<d@��>�p��@�ޒ�@���=���@�	5�@�T0��@��Co�@������@�Ɨ�J��@����@������o@�gO�OYO@�Q�˔�e@�Akj@�7.H2y�@�1�ܜIz@�1��m^�@�7!�@�A��ϴ(@�Rc�u4A@�h^$]!y@���@}M�@�R��M��@��(n�!@�|�bmS@��"�Lf@����7'@�Q�D�)        ?��u��%?���D���?Ԯb�ı�?�v�Vv.?�����W[?�i�wG;e@��8���@1g��;�@z��.�@	9���@ "��;��@#�HDaӅ@'b� �n�@+�76���@/��7��T@2g|GTL�@4�F�5�@7���m6@:����u@=�別 @@����@B7J�i|�@D����
@E��{��@G�UJ��@I𦪳mH@L�R��@NQ�X�@PQ��W�@Q��a��@RŁ�ɸ�@T�RG+�@Ugy�=9@V��|�@X8����@Y�]�tY@[9�	��@\��ۍ�@^j��^sx@`
�|�
&@`�4���4@a��.V�@b�{*4��@c�Ht��@d�3D�p@e�>���@f�o�L�@g��֘&�@h�j��0@i�P�#��@jʒ�-�}@k�D�^�@myG|��@n=@�`0�@op�
�@pUW��@p���#<2@q�XP��@r@U2(25@r�Η��@s�Ou��@tIQ�a6<@t��S��>        ?N~ v�W/?~�5�ZC?�B_ea�?���kq�?�����8�?ɽ��"5�?�Ѣ��ֵ?ܸѷ?��Ň���?�b�]]?�S�RTA?��$?��G|�*@ �2U��@��4G�@����@J@4�:6�@*"B�@�m�N@%��|$%@�7Bj2�@\��	;@!:�a���@#rl�2�<@%�XiAa�@(gF�"5@+%ҰH#M@.p'�@0�����@2;o��b@3�r���@5ʷ@�@7�-w}�@9��	�A@;�Rt�@=�ˆw�9@@"����k@AP����q@B���<�@C�T����@E~�N@Fy�Q곭@G��P_@INh�v�f@J�IV���@LL6�]��@M����@OqiY�/�@P�!�f�(@Q^*�%��@R7�i�^@S�S^�@S���9r|@T�j��w@U�}���@V�ʆ���@W���3@ @X�G?�@Y��T&3�@Z��>6Ls@[���x@\��`���@]�4q��        ?��oS��?�0[�?�!�?�Z��Ϭ`@�6fR��@�B��E+@L$8�hH@ �%�8��@%�8m�&�@+d����@0��j� 7@4u����@8XO�oz�@<�z�07@@�ӥau�@C�7�	g@E��A�@Hr���@Kl�Ѝ��@N�ދ�?"@P��-��d@R��?��@T����5�@V�R)��R@X�efl�@Z��o�N�@\�3���@_FFq@37@`�(A�b@b��>�x@cm��}||@dʏ^K	s@f3۷6�6@g���p*�@i,�<�@j��\�@lVBb �Y@m��Ġ+�@o�a�D@p�<ں� @q��A]KA@r���D�@s~�-f{@tw��@uu���6a@vz+͢@w��&;�O@x��	y=@y�[ϔ@z���pEx@{輙i)�@}/�χ_@~=GI~}�@o�`,2@�T����@���4��@��LMA:@�8_���@����=�@��1�t�"@�3���&@�������@��x�"\�        ?�����]@~�E7y@4�t��M@FU���V@S�@�l�@^�,$ �@fHI3*�G@nR�N��@s�Z���@x�ٷ�8�@~�[�;�E@��O�E�@�I�Q
@��.��M @��7�2�@�څ/3=@�K�H�8@��X�@�=���4"@���Ƴ&@��(�u}@�R���¹@��nC��@�sؼ4�Z@�6�wT�@��48V@���=��@�} �U�@�i��np@�e��d��@�9�k=�@�H�F� �@�`h܁@��r�%�q@����Y}@���r�]@�o;���@�Uu�O�@��\sa%@��8$5�@�N�H��@��c8\��@� fc�^@�K�N�@�
+�O��@�ͧ+g*@{�8=/@�a�ݳW>@�2E�i��@�HC0@��͊�5@ƾ�����@ǡ&5(�V@Ȉ'��(�@�s��a^@�c���5@�X�؁r@�Q�4�@�Ok���@�Q�o��@�XV��^@�1�5\x�@й����,        ?uƐTr;'?�r9� ~�?��3�
�?ѹ��8l ?���5T?�>��ݵ?�ƭY�S�?���\�@]ː��@׎�14r@,V���@��ߜ�@���\�@bm%�e�@B�Y�@rtK��@!�;���@$aȳ-@&�Pq�|@)�9�h@,�̷�x@/�%tj4s@1l�Y���@3VS�*�@4���]�@6���S$�@8��c��@:��F�3}@<�S]�@>��Y�@@��"e��@AÛ �@B���V3@D8ZG�<S@E�]�jS@F���[ �@H5ޞ�%_@I�����@Kk�d.@L�]���@N���AL@O����q@P�mQ,�A@Q~�N�p@RY��ZZK@S9��S@T�M�3@U	R���@U�+~>$X@V�U��B�@W�ׇ�x,@X跷I�v@Y���8{@Z��`���@\��p��@]t�p�@^9�a�'�@_ZIf�@`@E��@`�2���@an�����@b
s�}d@b�Ŋ)�{        ?a9�.9?��T�qs�?�'�Iv]�?��u.��?���g��?ՠ� �Sy?��A���?� rߩ&?�*���?�#4,��?�o&V?���I� 2@"!��@�f���@	Г]8�M@O�@��n@�f;��0@^��?@Zٺ>�@�����@'H�NV@ ��н��@#�;)�%@%Kΐg_@'�G�� @*B�L�R%@-��e@/��I(�@1��\E�~@32)�1�*@4�2��Й@6�z䑍�@8���ݛ�@:��C�@=�h.�@?sbzf�@@����@B=[{q{@C���y|@E�Zn@F~܏^�@H����@I�)��*�@K]�.b�@M"9�Iס@N�_
M@@Pqڽ4�|@Qp��Dh	@Ry��f^n@S��"a?�@T�I���
@U�o��d@W|�fj�@XC�Q �X@Y�Z�m�@Z�F���@\D
M��@]��|��8@_+�p�	Z@`YH��@a#9�c��@a����۴@b�&qY�2        ?ky�
��?�梠P+q?���D�R?���,o�i?���{�!=?�K��!(?�=�<	?�ȖB9�?�i3�j?�5L��U@ h���@#�:s��@P^B��@��M
�@J4
�@��a�@�/:t�@V�LW8�@!����@! �����@#)0�  @%}K��"�@'��}.}@*���Q�k@-��y��"@0PC�x�@1����^@3���6��@5�V�ak@7|���Ks@9�?Ǐ�@;������@>��x�@@<>"�Г@A�|3}W@Bؼߑ�m@D?9^0�@E�-�ep@G=��	�@H�asp��@J��T�@L:�1��@N7P��D@O�K��.@P�Fi���@Q��]�Ib@R�ʶ�@T*�%�@@U"ն��@VG��E.@WutDÛ@X�xf�0,@Y���@[6���@\����L)@]䦭��]@_I����@`\7���k@a.۪�@a��O���@b�>Ĭ��@ch`�]�R@d7Dm��I        ?̹dr�H6?�����C�@�?x�[p@&��βq�@4�74.�@@L�v���@G��ֺ�?@P:��fʽ@UK����y@[
O>"@`����H1@dGi��@h*�vlI@ldܬd%>@p{Q��F�@r�5z�l�@u�YEY�-@x^���I@{Y[Qm�u@~����@��x�kMq@���lF�@��&��@�o8y�s@�ri��c'@��~e���@��_嵕R@��*�`:@���D���@���!�@�(F2��!@�v�֢�&@��ȇ=T@�4�B>�@��7�� �@�Y��n�@��q\(�5@�2�-�M@���\.�@�:L&.@���ޜ�@��2|	�@��
Ӊ<4@��S8ߘ@������f@���L@��'m�ۂ@����Я�@��F�:n�@��&���@��;����@�ƅ���@���po@�����@�����@�#�x<&@���ۈ*@�TS$�@��X���@����}�a@�0���@��N��@�z�J��        ?T��:��?�ٓ�J�?������?���32r?��W:�0�?�;����?���+<m�?�C��r��?�w���?�7��Q�?�̧N�2?�C���g?�0�@I��_�@5Y�C�	@\���U�@
�Q-h@[�<��9@
�^	j@ �c�G@CՋ_Վ@�o��{@���ؖ@O����T@�=P�W�@ �Mk��@"$r�˸}@#�����@%}z7�@&�d<�ȉ@(*D��,�@)�?o��:@+{���H�@-8��wh@/��w�+@0n�*u��@1b��Q�@2^R/h�o@3a#�n�@4kf�B1�@5}.��^@6��Q?7�@7���g�@8�:�a�
@:��j@;H� �V@<�o���w@=ϸ92M@?k�z9@@:1����@@�p;9k@A����@BP;N�f@C	Ct��@C�\�k@D���(@EG�>aq@F),��8@Fף�9�/@G�L��4�@Htl�!�@IF�G�n@J�֑��        ?2^-�(?fg�9M�?���]}R�?�L5�0�?�+��Uƽ?�lSf��N?�_�>��?� Y_(
?��6���?ٗ��K	�?�����?�x�4�p?�Qr�ˎM?���rD	?�ƀ��?�"N���&?�0�g@��O�i�@��b�@h�	��K@@^��O�@>=�y�@�1��@%����@���в@�%��
�@z�9+�@ ��iYq@"��&%�@$�!��0@&�l%"��@)9E���@+��D�*@.W��쟩@0���F�+@2���@3������@5L���@7Hw��@8���ސ�@:�W>ʍ/@<���һ@?�Dk+@@���^k@Aӳ2�˕@Chʻl@DYt{��@E�97�
�@Gd��@H���w�@J���@K���BW@MY"k��@O��I,@Pn�{�x�@Q\ԍo�@RS�=C�@SS~����@T\,Ao@Um�K�c�@V����N@W��(��@X�,Sr]A        ?`K �x�?�� �
�?�����k?�n�+�?ʖq��,Q?��M{�>?��4�Q�@?�M�H��?�d+C?>j?�k}���5?���WSl@ �nI�]@��цs@m�,N�@Ɖ�j�@J x_E�@��A @��?��X@�04I�o@_�m�9@ O�ߦ@"S4�}@$((0�ke@&q�oja@(���	@+~A�l+@.B�ި	/@0��i�@2&�,�bU@3�m�"@5��v5@7W��g@9@�z�@;C5���s@=^��/}@?��)3@@����s@B'P1�@Ci����@D��'/��@F֚W�@G����N�@I%.t�@J��	y؍@L*����@M��tB��@O�M�}0@P��ː��@Q�[(X(�@R�,y�#@S��I@@T���gJ�@U�V����@V�(V�y�@W�d�=�@YOCj_@Z?悟��@[}�J�l�@\ũ�5��@^��0@_r%I�ɍ@`k���ө@a"��BV�        ?���`�}�?������r?�e̸��>@�a#��@|FN��@&�3�C�q@0ݴD��@7�ɕ<�@?Z��@j@D$���@IP�=Y@N�~�FA@RMٸtMP@U�H���S@Y n�z@\�`���@`~��T�@b���v�@d�	IB@gVSÑ��@i��|6p@l~��{�@o>���\�@q��͂@r��zD\�@t���@u�� 
@wQ�4��h@y�КT@z�W�h@|��T��*@~p���@�-W�x��@�)N���@�,j�S�1@�6�C�@�HWЁ.#@�a6,�a�@��]�ǹ�@���"��[@�ז5�v�@��I���@�K�0�%@��ǘ��@�۽a��@�.�P��o@�D�Ψ_�@��(���@��*�E��@�`�r<��@�!]qޒ@���Q5��@���dǺ�@�^�˟�@�%B7���@���IJ�@���Y���@����@�`VS���@�6e��,@�7��2�@�교�б@��Ȩ��        ?ZkԸ��D?��~Js� ?��S���d?�gh¦f�?ɈMҥ~�?Խc��A�?��H�L�(?�nc���?��t�9�?�K��kVZ?��L�{
?�썴U@ �lE��@�� ��@�h���@
��BR��@�μҋ�@Tj'bl�@���o��@ٲ(�p�@QM�2@�Y�=@�j���@ Iw��0@!�+�I�/@#h���W@%�<�%�@&��N�@(������@*�xd���@,�$�亀@.��� ��@0c
0�@1
;�e�@2�ɀe�@3�6I4�8@5?y���@6O�ezb�@7��:+l@8�xpF�@:Px�7��@;���,Y,@=*�Z�R�@>�����@@\��@@�]��b�@A�$d$�@Bxd��1�@CMj;ъw@D'�
�@Eu��1@E�y�.�@F�,��V�@G����E'@H��3Y@I���>�@J�O����@K��D��@L�?���@M��x(?�@N��B�H@O� U���@Pr��(��        ?I���qo�?}���=�?�{P[
W?�RJLj
?�ז�|?ƍ�_Y�??��s�PC�?ד��顎?�ɇ��z?���w�m?ꄏ^�4z?�Z���?�s�N�Ju?��AgT�?�ޡ�`a�@�"`�@�f���a@y�J�;�@h��^��@`�P�:�@� |�A�@d\���@@�a%�@]�'Q�@�� ¤@!1�%:�n@#(s�<{@%D/W8G�@'�7��q@)�i��(�@,�5��_g@/<�����@1��e)@2����;@4:�����@5�̃0@7���_A�@9��X�\@;�����J@=�|�^5�@?���"�@A%Pz\�\@B[��(1@C���!�U@D��I,+�@FT|���s@G�%���@IE46�*@Jԡ�?9J@Ls���|K@N#s�gw�@O�G���+@P��L��@Qʉ�s��@R���؃)@Sųڮ%�@T�ny��@U�88)'@W �:�on@X&���L@YU��t^�@Z��L"�@[ρ{���        ?I ��]�?w6/!���?�8:]�2?�����Y?��d��b�?�h����?�/Y9�m�?������K?��q(!�C?�!� k?�D:]TU?�R�Z���?�z���?�޵D�=?�����@F�E�Q@xz9��@M�߁�@\H�v@6E�4(@�T��;U@L��r�@5j��H @`���*@�,`'�;@!B�:���@#A���'�@%f�[�ҕ@'��-@*$(�f�@,����A�@/��dP�v@17f�:&R@2�3���@4d��@6m.�G@7ꪐ�ݠ@9��^�5@;�F��W@=�T?"%"@@&���@A(>�04�@BV��w��@C�N?l��@D؉�fݾ@F,g�@G�@��f@H�}��&�@Jt�~��-@K�j��Z@@M��b�S@O2�X��@Pp�@��@QO7Ê@R3�W�~@S�ˑ�@T ��:�@U	���@V��Zu�@WyN��O@X�[��@Y-����p@ZGF�	�        ?��rh��?��Rݒ?��)t�@߭(�@�=up��@'�����@1��uؙ�@8b~��1@@�'���@D���8,@I����@O����@R�u��q�@U�ʊ�pC@YM����?@]v�Y^@`� ��
|@b�Ŏk�C@e��f0@gn)B���@i�3�N[X@l��al @o~g1�{�@q;KB��@r�U=_�@tk���@v <�<S@w�!z&�@y���"�@{��H8j@}�8�T@�Q��$o@��c��3@���i�v@�2c�@�_F�;��@��b��d{@��K����@��`c��@�l\M\:k@��{��7@�'U���@����A@�*�Ә�@�@�N���@�ְ��F@��n��@��PT���@�cz��u @�6�LrO@��tP*�@�����@���]�؂@��RjR��@��(j�5�@��VU8w�@�v��F@�l�J��%@�g<F���@�fڕL�@�in+N��@�qG���@�>ҡ�eo        ?tw�):J?��N��[?�d^�W@?���1H��?�X�9>�a?�\{`�>Q?�vrYh�?�X����@I��@�]�
I@�n;�D
@�����@F;����@D .`�@�N��f@!162�8o@#���S�@&��s��@)~j��uT@,�,���@0���v@1Ѩ%UC@3���ՙ@5��}^@7�i��S�@:��WB�@<y+Q	͙@>�Gm�@@�d��A#@B�N��B@C�S�$�@D�ֿ��i@F�:��.@H���MB@I���u@Kj��j�@M,��r'�@N��'
��@Po@Ĝ~q@Qgf��@Rgo4��R@SokS^�k@Th0T<@U�nr�m�@V���N�i@W߹Ƈ@Yj5@ZH�K�\�@[���͕@\��+F�R@^$o+��@_~��sY�@`p�;��@a&.��+i@a����@b�<C�ȣ@c`��@d'�CZ��@d�۝mU@e�ZjG@f�׈ʣ1@gm턥B�@hJX{�z�        ?]��~{?���(!�b?���??��-6��?ҕ�I~2�?�GO�`c?�5j���?�li찢�?��$*�k�?��Y=�T@ ��F�@�@�6AO��@	%�(/+�@����:T@����g@���|��@ŨД�%@E��Y�(@R��n@!��A�]-@#���5�H@&A-�h�@(�`�|@+�+<.#@.�2�o#b@0�#QW@2�qe�9@4e�L��u@6O5)��f@8U��i�@:z?�0'@<��:�=�@?16���@@���{�@B"���3�@C�Y��� @D�e� �@F)V�?K@H
��&�@I�o�+@K~�܊�/@MO_���@O3��ZX*@P�Lh՟@Q��!�*@R���z�k@S�Z��h@T�%v���@V".n���@W_���@X��q$��@Y����@[^�W��@\��ي�I@^E<�+�@_��g���@`��r@a}����s@bS��S�[@c0!���3@d��&��@d�m�B&@e쐭��f        ?t�&}2�?��D�jT�?�r~$�*�?�;����?��,{��?��)�?��B��?��E��@S{�df@	hx��@���>@�1����@���$jE@}Xڅ<@ �>||�@#�Ȍ��@&��*I@*k3j�J@.1����@1%f�4ά@3\�%ȏ@5��1��|@8V�Ŷ@;��$x�@>ҹ�1�@@�r[�@BZ�fD$�@D+��@n@F]�o�@H jz�*y@JF��7�@L�9�+0@N�X���"@P�i<Z�@R	����C@Sk*q���@T�L��w�@V`]�SD�@W����+@Y��`[�a@[R��{W�@]+��1�@^�Y��ߍ@`uB��R�@av��&x@b�:��d�@c�8��@d��d��X@e�l�)��@g�.�� @hL�맥6@i�)��c@j�<�x�m@l=q�qZ9@m����{+@o?2ot�@pDw��@q�U�Ѻ@q́�&"Y@r�7vdc@si��f�@t>�C_�C@u(�%b        ?�v�9�c5?�ыe�Q�@q-Ҹ�@*�h�T��@8łʕ��@D	jd���@M�5�k
�@T�و^]�@[<��KU+@ar���H�@e�5��@j��: ��@p ��z_W@r�^�5@v,*�pa@y���ǝ@}j&E\	n@���8���@���\]�@�*��E,�@��F�ZX@�/%��-�@��O88�/@�̠)�
�@�kNZ9�8@�-�x�m@��Қ6��@�q,q@�D���@�+�� |�@�&i��t�@�4X�/�@�*��/�@@�EM�<�@�iv��Z]@��S�K�@����4��@��}�;@�[�<@�������@�X;D�@�v>�P��@��5���@�c��C�|@��Xy4=L@��6X�@���!{��@�Y���^�@�/�Q��@�
u�=
�@���{�@��V<Q!D@��m�e �@��F!(Z;@��ޙgq�@��6e`0
@��MP�QL@��"�n��@���Ƌ@M@����{�@��	G�Y@��̭G�G@�k��K�        ?f$ղ�ɱ?���Ӧ?���3m�?������?�-۰��?��HPu?	?�o�S��[?�Vlx���?�Lݸ?�?�ej�T@X;�y9�@�n���@oLf4�@�\�8@,����@��Q��@���5E\@�/��|@f�0�l	@!k	v%�@#5^GkXS@%e�窓@'v���@)#��s&@+����@-?���ס@/yYfx�k@0���_�@2DT�_s@3K&L4Lc@4�q5@?@5�\��`@7.'�>�g@8��5@9�$h�d@;e�#�@<�F*\�a@>b��Ț@?���@��@@����@A�%�؝@Bh�»@CA�a��@D �]@E�+k-@E�@%>��@Fܮ#n!@G�R�7`Y@H�1%�@I�L�J�:@Jʩ���k@K�PԐ+@L�JV3I6@M��Ҩ+	@OT\��@P�X̍�@P�wso�@Q;��<�@Q��H�y@Rl　�@S	l�I��@S����i@TJ���[        ?_��C�A?�Q�#G1�?��V�Y�j?�v����?�4��۫6?�\�+G^�?��V$�?�%��E??�I|�?�l�.�@�A�E�@w>߉�@�A��	�@�g!g6@�'�3E@���$�P@�G`���@ ��#Z@"�Z�'��@%�	ns*�@(v~TyHs@+������@.ԼhsSB@1.`�IR@3Kr�@5Ӝ˖^@73��(�@9v���@;�,�E@>`~�Tq�@@��f��2@A�x�b�@CdWT[��@D��A_X�@F��>/�@HA�t��@Jt��@K�R����@M�$^#@O�e��pr@P�J��@R�T��@S6b��|}@Tf]�_lv@U�GPT�>@V�Z�f�@X>� .�@Y��z.@[��4@\�����@^:S#{N@_��.#�@`�^����@a~)?�pK@b^�O��@cE���@d3E��Z�@e(�ՈpT@f%�z̏�@g*?p3�@h6M���@iJ�ȵ�@je���`>        ?4I�Z �?c^���ty?�WԎ;?��9����?��7&h��?���o��?���N6��?��KO�t�?��I�s�4?�{�m��?�Z�g[�?�s���?��:9�Ͻ?�3f�1a�?�(�����?����R?����T�?�>����|@ �	���@�?��V�@�l�ǍC@
@�)[��@$��r�@4��f�X@��1�_v@h�F�@݃�gG�@��Y�h�@!cR�@!Rn���@#6��P@@%>���mZ@'kۏR�@)����@g@,<B�'y@.�ޑ�ǋ@0�^�wo�@2X`t�|@3��Bܑ�@5��� L@7`ҟ�Lp@9?�l��@;8i!�ug@=K���H�@?y�ϻ�`@@�Ѡ�
@Bܳ�m@CVM����@D�nړ��@F��^��@Gs�(��>@H��O��@J���T�@L�_�$1@M��^���@O���Y&@P�/-��@Q���Op�@R���}@S���8�@T�_թ7�@U�#��@V�� 7
�        ?��L�On�?�Zh�n�@
d�X-�@�0�\@,ýEY�@7L��r�@A:�ό<�@G��@�@O�Xt�z@TBv��7@Y0�U'�@^�府2@bB���؇@ep�}���@h�̕oQt@ln@��%@p���	@r�89/@t"K[��@vDp�"�@x{B����@z�yK�r@}%���+K@�A����@�'�~^a@�]t8��@��v�T/i@�#�ӷ�@�z9�t�@��~P���@�q3��)@����݁@����4�5@�$�pP�@��)���@��ţ��@��嘔��@�x��z�>@�_��՗@�JH��{^@�:��3��@�0#�m@�*�E�e�@�+6�y@�0�e��@�;��<d@�L!�[��@�b0�Z�z@�}ͪ��@�� 38@���Ҡd@�y%�!e�@�=_��@��4!{d-@�M��N�@����38<@��sc[:�@�;PG�?@��x�;�@���#��@�CT�jg@���k�@��E��YE        ?U�z� �?�"�tjom?��$K��?�����?ĺL��
?Ч�݋�$?؀��>��?��ߢ��?�^�c\��?�?�w�	?��gf�?��'Me�?��T>��?�;J�;-+@�n;�Qq@5�"�@	9
�+F@
�0���@E���o@Wxu�@%F�q)�@N�߸P@�;�ς@%�k�Ē@XB��@�@��>�.�@q{i��@ �;$jF`@"��fW�@#g�kK�@$��!$�U@&?K4� @'��=���@)J��D(w@*�e���E@,��"*8@.?%����@0 U@X�@0��7��@1�)}j�\@2�8�i7�@3�!���@4ɍ�u�S@5��׋��@6��0[�Y@7���|r@9S��T&@:;�0q=/@;gD���@<��$F��@=�cQה@?Fh�6@@.D�@@�%
y@A��U�3�@B1����@B�-^��x@C����c+@DY|x�@E�K�@E�t%Ȱb@F��O�@GvB��lh        ?A3D?E!�?s�U��?��^G�?��w��;?��.E)28?�lO�Ȟ�?���7+�p?�Y���?���gI�?���^�P?�S�4?�?���[��?�b�/�?���,r>?�'�E~]@ �Ƭ@Mrj�,�@KK�T�@A]ֳ��@z7���@�H�ݶ@�)j�k@(���]@��F3�[@ ;�m2W@"P`��M[@$�����@'����r@)�����|@,�:9�@/�t��f)@1n�O��!@30v��4@5|���@7�:Xw@9.�Y��@;nŉ�:@=�e&�3t@@*?�hN�@A}���K@B���:�4@D\�@E�k�<��@G�'�e�@I8��f�@J�/y��@L�RnN��@N�X���#@Pgͷ��7@Qu:ae�@R��S��@S�)�`�r@T�QƍT@Vd�+*@W`m�@;�@X�N�ȓR@Z.͍�@[z3��@\��G�
@^s29��@`5C��@`�$���F@a�z=Nl        ?:�=U/��?h��Ǯ2?�)�$�f?� -�7|?�um��?���k-uo?��NT�F�?����2��?�.�W˩y?ؐ�,���?�!�&�_�?䳮q�o?�-T��?�"��o�?�� �-�?��ٌ���?�Jb$��@ ����@���&�@��!!�@
�Y |@��e6�@����]@8#��E@�\1�(�@8.M�@	�A��@�M�0��@ �����@"G��5)�@$w\g@�@%�؉]hs@(*��D�@*!㵶c�@,_x�r�q@.�a=à@0��0�c@1��K�@3@	|�A�@4������@6%�]U�@7����.,@9L����9@:��I��@<����2@>�H���.@@6$K4<@A0�=��Z@B5Fn4i�@CCX��sh@D[Q��;B@E}X���@F��A`)�@G����@I �N*�@Jl�E�@K���9�@M!�r�7�@N��!b�c@P V�3@P�׋�Ft@Q�~�Њ�@RNG�a��        ?�D�oy�?�j��MO?�\8��0@����n@�Ɉ��@!�hu)/�@)�R��q@1�����@7��'�́@>H+_Y�@B���!�@Fʜ���@K,_�|�@O����b@R��^�@UJ�<�}I@X?�0\g@[g� ѹ�@^�3^���@a*yL�m�@c5G� �@e
T1�P@g!�A	C�@iSl�5y@k�8��;�@n-�2!@pB��VV;@q�����@r�{��V)@tRJ7ɷ&@u�k.+�"@wI�JP'�@xٳ�s*@zvޘ끕@|!m7b��@}�p���@��R\�6@��k��@��}�&1�@���"\��@���x-��@����tPN@��RQ�\�@��ʴ[@��]�s@��R�0@�"q9D@�P���\�@�����'�@��Φnڤ@�+SB�@�'�7s3@�����[@�}��r�w@�.70L��@�⼄F�P@��P9�M�@�Xy�N�@� S.�@�ޝ=8�w@����B\2@�wcd�OE@�J�
�z�        ?[�z1���?��)n��P?��(3�?���#�#?�h����p?�w�5j?�#�SE�Q?�׿t,P?�oΞI?�2�?��wu[?���!�͡?������E@�%ј@��|�8@��!g@v��,��@���e@�S�<�@-NG���@e���@�?�ֲ@0rPw�@�l�7�@ :͇U@!�Z�;�@#s���@$�.���@&:�j�m@'��Q��@)���ޅ@+_]�y@-5�tP�F@/�9��#@0�Ձ���@1��HN{�@2�rM��@3�eo\�>@4�;�3@5�g�OR�@7T�g�@8?}o+��@9x�
�-@:���r=@<>}� U@=R��r:%@>���PX@@@T_�v�@@�&|�'�@Ap��	ϭ@B,|w�@B�Rv��@C���e7@Dw e��@EB��6�@Fm���@F�E�@G�KO,�9@H��}7��@Iz��p�	@J_�NӴ@KH�$�p�@L6 >�cC        ?C�y��?v����,?�R
��[�?�3�p��?����u�?�/Gc�3?�;ߕm�;?��Φ,*�?ܺm�B��?�9�9'e?��=��W?���r@F?�Q���<�?���� ��?��:"mf@@�=�!3@E��V�B@Ͽ��.�@�=%�$@1bA�@t��3;@�ڠ��@�;�?@�ׂʺ@v�z^�@!S^��@#V���@%���qJ@']��S@)�q6.��@,P'�{q@/S�9x@0���Z@2u�U�E�@4z�ẇ@5�V�(ܢ@7��>i	@9c_�pɶ@;X�:��@=e��g}@?�uΝs@@�y@��@BEA%+@CJ�J��@D�9��4@@E������@GD���@H�
%�MW@J1TL��x@K��eD@MW�y�� @O&،��@P]@�'�@QA8�[2�@R-Z�-�@S!��gQ�@T�)�(@U"f��f@V/M?wE?@WD�$��@Xbz�n@Y��M��@Z�S�ce        ?Gď0Z�9?t���V�?��DYE��?��[���U?��5��?�*���k	?ȑ���?љ�5=j>?�-'ݙk?��dHm?���'�?�#L쩆?�G��?�v���?����AC�?��!�$�f@��09@.�v*@�a�K@�<M���@�_5�6@#La=J�@��G�B�@��UA{y@+Cj� @�rT�:�@!ұyc�8@#����@&7.���X@(�8�Kd@+S/�7	@.+(�_�O@0��bł@2<��m7@3�,�rp@5��O_W@7��a	�g@9�I�ٷ�@<<���@>y�6�
@@{hz��=@A˹���@C.J"+d�@D���8v]@F+�Z.�@G��1�5T@Iw����4@K;����@M���3@Oȱ&fc@P���[@Q���:��@R�w�,K�@S�p��-@T��I���@V2�0�=@Wx��v�?@Xʐ�"�@Z(�1�0@[���@]	��r��@^��.�#@`-����        ?�|���?�z`b���?���@&�D�T@��{���@'����@0���^(k@7J,r��{@>����&�@C�L�(�@H,VT��@MP:����@Qwbj[@T�Lf�G@W΃$ �@[W%��@_N;!TJ@a�]U[D@c�r���@e��}��@h\:$I�@j�N�ĉf@m�7�>�@p%?�i�@q�k��{i@su߹l@t�V�Չ�@vU6M�Z�@x
�|� :@y��	+r�@{��N}��@}�k��@��-ԡ�@���/S�@�Ԣ�ul@��_zȍ�@�C�>@�+C�cB�@�XYpOO@��}T<Ib@�ʫ�Le�@��e�=7@�]-4.��@����^t@���S�@�u�#T&@�q�+s@�,��|�@���m_@��ʷs!@�v�n�FJ@�B[[�'`@���#�@��2 �t�@��Z���@��{g�V@��q�\_@�gsR���@�S���@�CqZ��@�8k�k�@�2
7S�@�0IV�;�        ?B cLg�?t��1�ݤ?�_ࡦ�?��ԟA�s?���)?�I��8�?�\	7u�]?�㰂'n�?�L��p�@?�x9>(��?�kc)R�?����I?񡂪كk?������?���'�?�d����@ �٨on@3|��=@���@��+��(@�*2fL�@�Z�j�@T�,?W@�/�͇�@����Ĝ@���2�
@�e�g,�@�y�Z�V@ �M���@T䦮ϼ@ ໕ߠ�@"#_I�`@#re��e%@$��뗅u@&5�=F`�@'�"^�F@)+$�Z�@*��q��@,Sm����@-������@/���O5?@0����>`@1��.�k�@2�m)��@3�U�@4��2*��@5��>��C@6��z]�@7��j�@8�4I>�}@9���F@;!��?2@<4��y��@=k{���u@>���y@?�1V@B@@���Nz@AH��@A���k�@B��_�О@C[����@D@&�v�@D�R�&}�        ?'���?^t�O�?~=���d�?���D��?��{��o?��s
�I?�T�#շp?�Wȧ�gZ?Ρ��[?�-9��?�lkzV�^?❾=���?������?� J!�D�?�p}� *?����f�?��r�ِ�@ ��\' T@�PY��@�-{@
�)�j:@%�o�@�r��L@j ���@)�����@$��eb @\�4���@ i��B�@"E�gLc|@$C�w^�:@&dB��/
@(��S�)�@+�7���@-�5�z�@0*se�@1�.�$^@3��a@4�l�2@6_l,uB�@8!@M��@9��l:I�@;���	 @=�t:���@@t��$@A�qaR@BA��9P@Cr֡"�@D�ϓ��@E����@GN,�#�@H��B��u@J�䗆�@K���yi�@MHn9ݳ@N�."-�@P(6�#@P��Dx�@Q���$I@R�	e�;�@S�>����@T������@U��S�"�@V�����        ?(<:�?Y ��O�?x0�F���?�w�E�"�?�X]Q�CG?��kS��7?�8���3?�Z�\�?�!��P?�
۠��?��Q�#G?�)|*�EK?�Bmo�Ry?�VƵO��?��p��
?���ц�?��cX���@ �ڵ\�@<}�t�1@� ��9@
�_a�J@k5'�@�ɸ�A{@��j���@��++��@���B�P@7�Y�@ ��� �@#CϪvJ@%7���;@'�9�E�-@*>���p@,�up.:�@/�4�ɽ@1Y݀�1c@2���[��@4�̵�-D@6�XF�@8i~&�2�@:l�~�@<�#Һ/y@>���h;�@@�r	d@A����f@Cv�/t@DU�Ƞ@E���X�@G!�� �@H��
9@J$9=��@K�:u[
�@M^D�5s@O�aa�@Pg�RLi�@QN�x�ԅ@R=�9@S2Pֵ3@T.�Ԓ�@U2�ҭ��@V=�3��K@WP�Ce�@Xj݌fg@Y�t���        ?��1��?��n ,�g?����?���:��	@O�V�ә@��{q�@U�$�@#{�Q|g@*o*�,dc@1E��b>@5��,���@;-�h�@@��o��@Cɳ�l��@G^�X�m�@KH,1D�2@O�7�G�/@RwO��|@T�EXg�@W'���l�@Y�)���Y@\�0�CS6@`#WO0@a�I�v=@c{9�"@eT�}��@gC���)�@iKS��@kiq��-�@m�_%P�@o���I@q)2`��i@rgڡBɻ@s�}��*
@u	$��Y@vk�W?ҫ@wڻz8c@yU�+���@z�b�18@|qn�50@~,Ś�@�Ʋ4ZA@��3�Ѩ^@����$�@���c)��@�}�*V@�u2"煉@�t>`|�@�z9���@��,v�y3@�����@����@����4#�@� ��$��@�0b�1V@�f�t�-@��'J��@�s�<��W@�@'��j@����2@�m���)@��d�@��G�(��