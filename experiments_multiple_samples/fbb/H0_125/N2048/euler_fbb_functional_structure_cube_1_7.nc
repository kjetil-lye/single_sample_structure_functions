CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T115209        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?��=22��?׭z8�?賵����?��]4�_?�uĤ���@�}Q_�@��<��@L�ڃ%@�����@���"�@� ��,�@"|�f��@%.��@6@(���E@*�.S�N�@.
J�N�@0�j��.�@2G$ޒ�@3����M�@5��
��@7�]����@9|�oٍ@;l��Z@=j�r5y@?u�6r@@�4`�@Aٚ/C�~@B�}�T�"@D���1@E6�{��+@Fb_�ט@G����	%@H�:3�H@J���&�@KK�aZ� @L���eL@M�`�O@O7���]e@PH�����@P�up@z�@Q�˧g��@R_���g@SF�Z��@S�V1+N@T��0�|�@UL�7��;@V~���@V�w3d@W���z��@Xa��=k@Y,�Cp�/@Y�D�b*�@Z���r(@[�FV*��@\p�XW��@]G�2�b@^ ����*@^��zܼ@_ٴ�eB�@`\̜x�@`�ٳۘ\@a?�v%G@a�7�$p        ?��� �B�?�`�D/�?�j[���?��M�P�a@�/4I@ӿ 8;�@�'t@��W@�!oRA@"$xz+bE@%���P�@)zb��G�@-���,�u@0�dO�@3@�m�f@5��w�@8=@��`@:��Ae�&@=��iƥ�@@Q.x��@A�z�|n@Ch]�j�@E	����f@F��wW��@Hu�P��@J@��
��@L��޻�@M������@O��_x@P�H_a�:@Q��w~�@S�*W�.@TG�C*�@U1�4�t�@VOI�ȯ:@Wrb���@X�DX	�@Y�G���>@Z���ؕ�@\5�Q�(@]s��@^�28���@_����{E@`�m��?7@aO��CK�@a�z�|�@b����X@cYN3�	�@d���}@d��{�u@ew���r�@f1eX̉�@f��^KF@g��˃�,@hj����@i,�u��L@i��k��J@j����@kT�q�J@lI����0@m�6���@m��mx��@n��N��        ?���:V�?�����?�j���?�.8Ǘ b@���w��@&���@z��r%@���l@1>��}@"����@&��c"S�@*��`A�b@.� w�(�@1�� �n�@4�W���@6���\@9Ah�nR@<��P~@>��ą�@@�����@B������@D,�F�
�@E�JS
G*@G���۟@IgTw/��@KB ���'@M*֋/I�@O!E�Ԕ�@P���g��@Q�EQ�F@R�}�F�@S�0/�k@T�EbQ=�@U��7��J@W'DW�=�@XV1X@Y�է �@ZŠZ�� @\P�d�@]L�@�E@^�k���@_�	��U@`�MTM*j@aO�=� @b)�>e�@b�-���1@ck��$�@d%A���&@d�D���@e��[۹�@fa���r@g$�D�%@g�@X,L�@h� �P\@i��s7@jM]+�+=@k��x5@k�_�)5@l�w����@m��?�2p@nv��ʑ�@oR��y�!@p��5&        ?��1��?�?[' �@ �G�i�/@?9�8,�@h��6��@_Ua�w@$ r��/)@)���Q�@/�LB)@3:�t`��@6�0:�(@:�z5g�@>�弑K#@A��䙑g@C��j���@FE+!���@HŚh)*.@K`��<@N5+i��@Pq��n��@Q���9]@Sd?�"&@T�ƽ�@V����M@X'�<�"U@Yԃ�M�@[�O��g�@]N���4@_�l�6@`yZ3�q@ai��J+�@b_f��A@cY�2�c@dX�?f��@e\�j
#[@fe4L�7@gq�/ܞ9@h�WF���@i���6@j�2J;@kх�!Q@l�	=��@n��-o@oEee�'@p:d�r#@p�mp�TX@qn��4�@r)�+@r�7�ڲ�@sLO{�<�@s�G�G�@t�q���@u:�c�V@u�AQc@v��MƱ!@w9���j�@w�t��@x�t��9@yHbΉ��@y�o��@z�.)V,�@{f�w��@|��ۏR        ?�����o?�}7\H?�����C?�q=���?�;��5�@X��6�@
�!���@2�t��@��n��@%�2�Ǟ@�i�B�e@!6Z��f@#��#K�@&]���$�@)َT�@+��ރ}�@.���P#@1
��.3�@2����r@4K�.i��@5�� �r@7��G���@9����qZ@;f�U;@=Kp92B�@?;�<?n@@�ã#��@A�0���W@B�;�"@C�a6�(�@D���O��@E�ӝ��~@G �rO�@H#��S��@IK�!�S@Jx��gv@K����T0@L�/ɚ�@NV�g\�@O\��� @PP#�[d�@P�s�̸G@Q��&�n@RC��,��@R�PD��@S�#�J�@TJ���x@T�����@U�� ؓ�@Vb�����@WN쾼@W��*�_@X�m{�T7@YH�?`4�@Z���M^@Z���O4�@[��CB}@\LP�/�@]�ź��@]ظt��@^����-@_l�:^@`�]
        ?���1G?��e��?�Z����?��L?3�,@��RG9�@��zVW�@��ń��@�Dt��?@�u�:-@".�x�I@%��U%@)�eG�rp@-�e}�F�@1:��P@3W�=�@5�72�w@8]�sl�N@;�c��@=��A@@jw�F�@A�7���"@C�ȼY�o@E-��@@F�c�U�@H����\�@Jri-5i�@LO�O��@N:!�Λ�@P�ώ2@Qt�@R$Vɾ=�@S3�:}I(@TH���@Ud����q@V��c@W�� �@X�����J@ZQQl@[FƱ*�#@\��FDt@]����@_<^"P�@`0n#��@`�`�e-`@a��5a��@b6��}U@b���f@c���"@dRP�V*@eF�!��@eƜ�*E@f�G�?IK@gD@[�1B@h~)RL�@h��?Z�i@i��1�>�@jZ����@k%���	X@k�a�@l��t;�@m�^$D�b@nfƷǮ�@o<7�        ?��TwS?��^����?m�'�?�27\�@��	�@#e���@�ы
��@4r��9@3��`kq@"fI��@%��K�'�@)܂��,@.;'�@17�1F`[@3�)�y+�@6
�"d�@8��$���@;`�x�"@>:�g��@@��G�@B&��|@C�M;���@Elz��	�@G%.?�P@H�)����@J�1_�,@@L�	��!@N�z�v��@PI%�K*I@QN�?/��@RZ�T;��@Sl�ɥy|@T����T�@U�L,�V�@V� x��_@W�����@Y$�/�A@Z[
�-3@[�.��C@\��ՏF�@^ 1_�,@_l�ئ��@`_�k
H�@a4q-�t@a���a@@bjvi���@c�ټ��@c��Q^2@d��\��R@eG��&:�@f�*�v1@f��GϢ�@g���n@hK�d{ @i�gK�@i��#��;@j����ݚ@ku~j�!@lE�/�Z@m�<38@m��!��@në���6@o����ݿ        ?�F�)&2�?켬,� ?�!�`%#�@	��&wV@x�ㆬ�@TAaqw@",;Yc�@'9��[/�@,����@1k,�Ԭ@4�����@8$-!���@;�蠽�@?��
�Vq@A�D��'@Dѓ�s@F:28�?�@H��|�m@J�{�|~@Mb���@O��w��.@QFo�Q	�@R����@T�@�@UmW�Z�@V��@X^�6��@Y�A�n@[q���F@]�OS�i@^��Mzn@`%����@`��ĉ�@aק�7i4@b�:���L@c��욹Q@d~�@�@eh$�,v�@fUKq��@gE�m�!d@h:��@i1��!��@j,Oտ@k*bR��@l+���@m0!�9U`@n7�ЅP@oBjC9+@p(�ry6@p�v[�+�@q:U?�3�@qŬe\3@rRw�w@r��@spV�(�@tb�$��@t���S�T@u'����@u��4�
@vSa�N�Q@v�B�ҧ@w�w5ՄU@x���        ?��`E�Z?�%�g�,�?��,s��?�1�D�p?�2����5@�A�}G�@
 �n��@�>,�=@^.J8�@�VtHN�@����-@ �'J�.@#T�}q�@%򍚬�2@(���S6x@+��F?��@.�^����@0�!��@2dk�"[�@4
;T�|�@5�Hw��@7}M@�K�@9Jk���@;#2�@=@/�@>�8��ɨ@@z�>o�c@A~ș�x�@B�;:�E�@C�{�4@D�P�~,%@Eľ�Z%C@F�J0�4�@H�#�R�@I/V�m�@J\����@K��l�\�@LŃ�A�@N �hNa@O@�͠�@PB�4�E@P��˝��@Q�6?n}�@R5�#�@R�5�q7.@S��ЄKY@T;>i:�@T��(�@U�gl�@VR:z_�<@WA �l@W��=��@Xy�|�!a@Y5���@Y�2gO��@Z�ݙ�k@[q�����@\4=���@\�z�O2@]����@^�1���@_NBc՝8@`|s23\        ?�]����g?�z����?�|�F6f?�ꡚn#�@z��M�;@��)�@T�_]�@߈���@���4V@"��1��#@&��D�1�@*���Vt�@.�J��A@1����^@40K��:@6�ޙ��@9v$r;�@<L�Ο!&@?D�e��@A.��i@B��oni�@Dx�9��@F5��@HXa��@I�Q*��@K�z�i�$@MÜ�m�@O�}m�j\@P��Ҏ@R�]���@S�Y4$@T?��f��@UgZkɔ�@V��ݨ��@W�JΉ�@Y��]@ZI0��^m@[����Uw@\�ǐN�@^6�����@_�*-A��@`y�F&/o@a-��ܒ�@a�j`�@b����b�@c[L�@d���t�@d�Z��#@e��[2�@fj��FJ@g5kV�Q@h��@h���ɏ@i����@j{[��V�@kSf"<g@l. ��.�@m#Q�h�@m��/7�@n��c'�@o�p7���@pL5.�;�@p��5�        ?����j?܏l0]�?��T'e�?��q/�P�@�o�p(�@��[@�@q�oU�~@���RW�@��,�x@" ƄΣ�@%��G��S@)F���@-PͿ��C@0���d�@3&����@5}i��	�@8�|�@:����@=mB����@@'P���@A����	k@C4%�Ƿ@DϮ�o�'@Fy�z�;@H0�ԙ�@I�IE�4�@KŚ�H-@M��R-�@O�tIC�@P�Ä L�@Q�_%��@@R��^`"�@S�_�2J@T�O~�@Vb���@W#��ΐg@XG�����@Yp��YeS@Z�u��B@[�:�@�k@]!7cZ�@^J I�@_��z�gx@`j^0�m@a����@a�IHʐ�@bd>%��@c{ ��@c��!��@dr��{��@e&����@e�}�=*�@f����|@gN�U=f@h
�6�K�@h��h�@i�B��Ļ@jKZw޼t@kZ�.�8@k�<���c@l��Mt@mf�9�z@n1�}�,�        ?ҡۄc�?��,�G�@ %��5�@���F�@ߥ`��o@P"���@#���Zl@(��+g�@.�#z.8�@2�x4�B(@6CNJ�{@:��l�@>��xJ@A �g�C@CQ�?�O�@E�G\�@H"��"i@J���>�@M)�R�@O������@QR���U�@R"*N�@T=V�7k@U�����@WR���@X���V�q@Z�!��$@\>�c�@]�u�+�@_�a�;�@`�Æ�l@a�]��@b�j��@c�ԅr9)@d�����@e|d��B~@f{a�@g~g�]�@h�iLܵY@i�U�n -@j�zGN�@k�����@l��Lb�@m�ڡ��*@n�`���@p8f�Ӑ@p�~D�4�@q6{��-@q�,?m=�@rc�Nbu�@r���?@s�?N@t3���B�@t�rן��@up�9Sp�@v��_m�@v���O<w@wX� yrH@w�j��@x��~���@yNM���a@y�|�1'@z�"���        ?�}�����?�+#��p�?�qQ��?��L+�a5?�A��G�G@�N<��@
��ڔ�@������@h�ֳ�@�1ݺ	@*�em6@ �-�V�@#a�NfQ�@&S�O@(�N����@+��HE}
@.��U@0���C�@2uÃ.߆@4!�D�{@5���I@7����&t@9f<�$b(@;B7�K5�@=*U�7UK@?M���@@��5��@A�_"�4@B�WO��\@C�����#@D�T�EΒ@E�'Me@F���b)�@H$�e��@INB{�q@J|a�@K�Jv��*@L�Ě���@N"�&�@Oc�#f/@PS��,�@P�c"5@Q����u@RG��>@R�:�m��@S�݈�@TMv���@T��z]�h@U�r?�9,@Vd��>@W���kz@W��r��@X���7�@YHqQҾ�@Z�ʨ��@Z���[�@[�Ҩ��~@\H\rH�2@]��Zi@]�f|��@^��Cǯ@_b�YljV@`̑�&�        ?������?���C��[?�G1��V?����4@�dV@����@�����@�x1�&@�؁�Y�@".-0Q�=@%����a�@)�����@-��,��@1�B�U@3\M+ �l@5�c��`�@8gs
��)@;��!�@=�Q�!��@@u�Nt@A�bvP \@C����nF@EA{vf�D@F��x.@H��tZ[@J��U��@LuLL���@Ne�%Z��@P1��m��@Q7���6�@RD.Г4�@SWJ�S@Tp�'�@U����}L@V�Fk�#@W���� L@Y�Wܽ@ZOlݏ3�@[�=>�@\��\8O&@^�*s6�@_m��&��@`a�[z�@a��k��@a�@�j�I@bs��^�@c)v�%�-@c��ٿ@d�@�[�@e[���C@fU���@f�%v�z@g�l�M/�@hk#��C@i5A��9@j���@jГb2��@k��m�`@luc�.@mJ���0q@n"�6���@n��Z�1;@o��l�8        ?�$%�s?���js
?��Ǟ3u?�L&���@��;[�@H�rkYS@�ko��@[gԀT@hq�?�7@"��t�a@&(�"���@*z��1@.F�ů:S@1`��]v�@3��ڥ~�@6C��Unf@8�J]���@;�Lqa�~@>�*���Y@@�5bǋ�@Ba�t��@DZ�}@E��k�<@Gz1�KD@IKi~.i�@K+��43�@M��[q�@O2J�p7@P�s��~@Q�+G8�.@R�Fa>9�@S�Of�_�@T�0f.�@VҒm��@WHz��@X}�	���@Y�V�V�@Z�<i4@\F2<��@]���"�@^����@`#f��Z�@`�J$Ϭ�@a�0�>@b?ý~�@b��;@c�����@duK��w3@e7Џ�{9@e�,�"��@f�ZQ���@g�Q��=�@h^du>�@i.�U�T$@j���N�@j׋�A)�@k���x�@l�6�B�@mh��/�@nIV- s@o,B��1�@p�4��@p|�:���        ?�L���=?��J�?�>�?�%@	��7�@���#�@rPc�b@"@�8�%c@'T_=ʔ5@,��E�}@1�$�&@4��\o2@8@r��=@;�<�#��@?�<�5�@A���{��@D��2��@FS���4D@H�� �@K	�tE�@M�Ʌ��@P
5�� @Q\���@R��}4��@T����@U���܅�@W��KN@X�B���@Z�~��@[����L@]:F���@^��O��?@`C���F@a�'�@a�8꒤!@b�1-)^@c��i�@d��&��@e���)��@f��@�@gu�%!ln@hl܏[�@ie��|��@jbU�m��@kbc n-�@le��cr@ml��p@nu��˱X@o�e4�
@pI���@pҁQ��@q]i3
�@@q��z\��@rw��+W�@s��@s��-B��@t)��?�\@t��^MQ@uQ� @u�	-6�@v��w6@wQ'�JE@w�g�3�@xM�6۱T        ?�����?�R+t��?�>P#X�?�ݧ�"��?�lMIZI3@�0bj@
4҂N�G@��E�
�@��S�6?@��,�t@.5[w�@ �S �n@#y���K�@&���M@(�sy]��@+����@@.�ۏⲪ@0��8�@2��́@47� �@5���I@7�W �n@9�#�W@;j�~�@=X��b�q@?R��9�@@��|<0@A�./H>@BŊ�)�@C��S�VH@D���ǁM@Fv�ִ@G<�+S�@Hh���΋@I�g���@J��υ:�@L%�#u@MN�SSZz@N�x�*�@O�s"��g@P�Hj��@QDc(�&�@Q�U�`@R�&�{�p@STů��H@T	��+@T�`n�Q@U{P��Ԍ@V7�	�fV@V�aA=��@W�x�[�Y@Xz�3���@Y@����@Z�I�n@Z�"�2`@[���f��@\n�s��@]?��Rf'@^L;9�1@^��+��@_�͸@`Ma�[�@`�t���L        ?�/=�\?�ͮb�&�?�52_{?�����j�@FRr0��@�9ַH@��Ĉ�@�9�I�{@�g�@"�����@&R�6V#@*@��>�@.w�R��@1z�ϬY�@3��li@6a�Wn�@9�St�@;ͽ-DO@>�*X ��@@�U�� j@Bq帓��@D���@Eǘ0�@G�Lk��p@IY�R��@K9mZ��@M'w�Kw@O#��J9F@P�H��*~@Q��ѫ��@R���W�a@S��K/c@T��	���@Vq&28�@WG���s@X|5B�d@Y�D ~�@Z����Zw@\@S��]�@]�*�s��@^��x�i@`"��@`��l檹@a��*�}�@b6���k@b�"~T��@c��5�P@dh�S�@e)��%'@e�S�op@f����@g|����@hH3�5h0@iZ<54�@i�
�*&@j�=u��+@k������@lh�m�@mB���A�@n��@;+@n���x�@o�t7�i�@pb5�ݛ&        ?�T�p�?ۗ`��F�?�6o;;?��xV�5�@�yr�$@
�w�@ޖ�+�O@���z4@�>Uo?�@!p�	��@$Ԛ�C�3@(|.���@,e���6@0H�@2|�V;�Q@4��3�1�@7C$aC�@9�&D�Ώ@<������@?J�so@A�]��@B���E`�@D(��^^�@E�M����@Gn����@I%��:@J�+�mQ�@L�U�3�@N��X,�x@P?d�\d�@Q9�O�c*@R:ASc�?@S@�.���@TL����@U^Aw��r@Vu�{�@W�yҮ�@X�ՠ.x�@Yܛ?�}N@[	���n@\<�5@]s�p�|�@^�kZ>H@_�:���@`��7��/@aBj����@a��D�qg@b�~Ҳ�@cB��Y�C@c��p^W@d��Fٟ@eW��'�@fM�z�T@f�ߵ{�@g��pt�e@h>����M@h����t@i����I�@j�E$1[�@kG���@l �Q��@lؚ8 ��@m���"        ?ҫK���?�����^y@ 0se۰�@���J��@�v�/�@a��_�@#�M���@)��Dl@@/sT˧�@2����.@6UK�X�@:�%��@> �����@A/�T �@Cj�	�C@E�����@H2�t�@J���':�@Ma����@Pp'k«@Qy�?�6@R�*����@Tq��/A~@U����B@W�gH	�X@Y:��7�f@Z� �o�@\��\�R�@^c��\@`a=
�@a�a��B@a�Hc�
d@b�[H�@c�
���@d�P����@e���K@f��w��%@g�� @�@iR�.@j @>���@k9��=��@lW�Ų�@my��
�@n�����@o��j�gE@p|�H�h@q6�8@q�S����@rMh�Gޢ@r�q�4o�@s�kx�W�@t0S~�L�@t�&�߱�@u{��9�@v$��O@v��a�pU@w{O��ڍ@x)x�܈@x�r��M@y�7��)E@z>�:rZ�@z�Mu�W@{�6��~�        ?�=y`�7?֐c#H1�?猄��K)?��SQh <?���A@���_��@��W�33@�� ;�@��B$��@�r�v@�,[�z@!�(|NfS@$����@'h���@*W�n�S@-i��7@0N`$S_@1�r[�H�@3�~#��@5x��hCA@7PD�,)@96V
>� @;*��C@=-Cu�f�@?=���_@@���]vU@A�����@B�Ri��@DY_��@E)��.r�@FXŞ���@G����TS@Hȡ�fEy@J	���9�@KPT(p�@L��|)=@M�;���@OG.ۇ��@PRYۜ��@Q�s�A@Q����.@Ro��-�@S(�D��P@S��7%c@T��
�@Ue���f�@V)�qU?@V���l@W���)G@X��fB@YT���@Z$�`!�N@Z��g��@[�p�TF�@\�EH�@<@]h�Ӷc@^[��1�G@_:z�3e�@`� 9z�@`6eYB�@`����@ae��~jW@a�G��        ?�.$�#EK?���X^��?�8��F��?��tT��@J�ŕ<@���	��@"̛`z�@�Ϯ�@��WV�@"�;h7�@&]��4&"@*P85��@.���}@1�n)Wi�@3�5V�G�@6s���"�@9�p�.*@;�1
�@>�fq�@@��Ǖ}@B���%f@D+�Cx�@E�\�V@G�B�	��@Iz[���@K]v�J��@MOd�^��@OO�l[��@P�{�Zh@Q�&[@R����&@S�u)�P�@U�`��`@V>O
FqS@WoW���@X�N�u�@Y�7�Յp@[)��8�?@\t�3�G@]�C�A��@_���8@`=�逴Z@`�~݌@a�]&/)�@b\$L��@c�0�4@c�l�%L�@d����n�@eXɷ�@f.���@f��� �@g���O#�@h��.y�@iQ�$i��@j%yȗ��@j���yS�@kԦ�1��@l�"��\@m�.�K|n@nn�Y(�@oQ�?�E@p���@p��%�ǂ        ?�id~⥯?�p�Y~�/?��͉m?���]�CE@?C�n�@�<���X@~�F0~@��ѯ/�@��y�@"�f��Bs@&T���@@*EZ��|@.Q[JF0@1����"0@3�mM3@6kwM��m@9]�䁾@;��1ܤB@>�g%@@�I��0�@B�x��dl@D'��A��@E�T2�9~@G���&K�@Iw;��S�@K[�\@MMţ$2�@OO^�r�@P�ӊ�f�@Q�<N 3K@R��_�D�@S����@UYlD��@VD�0O�@Wv���T�@X�7�v)�@Y�na��@[7P`ߝ@\�����@]�̨³�@_3C5UJz@`J��
p@`���H�@a�]6�@bn/S\%�@c+V)�p@c� ���H@d���
�@esԢ-��@f<�i�Ԡ@ghb��@g��q!�@h�|���@i|»C/�@jS��*��@k-����@l
5��4�@l�zUϘV@m�m�tR�@n�$P�@o�C���@p@��s(~@p��uA �        ?��J����?�5M�%!@ ^����9@�`u��/@2@���{@ɭM6N�@#�@+���@)d����@/���o�@3�$�7@6���F��@:����)@>��SG@A��O,�]@C�7#��@F2���Q@H�P��{�@KP�����@Nr:�@Pl���a@Q���_W@Sc,`���@T���@V�;�K��@X/QS��@Y��5���@[�~�_�@]b0h�m�@_3����@`�����@a{1#�%@bs�wOq�@cq=\�@ds}��^�@ez�?1�@f���İ@g���D֨@h�kA��@iǞ��-@j�c�5g�@l	�&.��@m1n-Tqi@n]���qB@o�+��5�@pa��"^@p�%|S�@q���V@r=�,�8@r����U@s��RܛH@t,�˼�@t���@u�>��s�@v.j�*Ŭ@vݐ!�]B@w�����@xA�і��@x���s�@y�����@zf?%�B@{ �ͱ+@{�B�Y�#@|��(-�        ?�T�!pq�?� ���w(?��]u$�?�̾�.?��6K@���^<@	��bv)@y�x�@TX����@-�F@�B1�@ �
(�@#]��^��@&���@(Ƣ�-��@+������@.��q��@0�R[֙#@2��K��G@40����)@5� -Nf@7�w!䒁@9��1@;h���4@=V�޻��@?Qv�z�@@�ŀ܀�@A����mL@B�C�@C��2�@D�gb�wc@F~qtE@G9ꥼ�@Hdë��@I��b��@J�(��4@L��=�@MD���'�@N��t�@O���޽�@P�s��i@Q;W���7@Q�q
H @R�H��@SGET;}y@S��>o.�@T��>Y@Ug���@V!�1�@V�}�@W�lx�'@X\���@Yl�K	�@Y�
�aھ@Z��ųFp@[s`�/�w@\>ə�@]
����@]�Gc�	@^�� �@_|6��@`(B���@`�Y��=�        ?��;)O�g?��K�?�q�d���?��)��B@ǝ�ks0@�_�pm@����ܶ@���Z�\@�0>G�@"2�b۳�@%���ѷ�@)���բ~@-� ���@1O�e�c@3PR�Ċ@5��ص*@8Owl�j�@:�d�F�@=�)�t� @@\z��c@A�s4��@Ct�;K��@E�&��@F��ޯ��@H�A'�@JP�Y�:%@L*p��%@N>�06z@P��N�"@QL�@R	����@S:��x@T*��4@UD
Ғ�@Vc���,�@W�)~��	@X��A�@�@Y���Ay�@[�qʛn@\Y~R��@]��2���@^�걧�@`^x�j�@`���$K@am�?KS�@b0�,Ù@b�Y��O4@c�N��@d7K����@d���@e�/�S�Y@fhƠ*Jr@g(�ߔ��@g��.@h��A�s�@iv��;�L@j@�)�|@k�RE)�@k�G���@l�8�1I�@m{X\g6~@nO���6@o&t        ?�2����?�-���ܭ?�͵�}�&?�g���19@��s��@b���di@���u�_@m�^_��@}g0��@"��Q�!�@&4{�1.@*�����@.P���P@1d�����@3�J�#R�@6C��p/@8��af@;�)�]L8@>������@@ƟF�g�@BWd�6�k@C�~�Goo@E����k�@Gd�W��@I1Y�"@K[�>�i@L����P&@N쓁��@Px�#��@Q��Y|W@R�x�%��@S�����@T�\6'��@U�Xt�:@W��^�y@X?����@Yuk_}P�@Z��h�ɿ@[�?�('@]9utT��@^�m��3@_�/0�@`��Bb[@@aG����@a�2�ʶ�@b�����]@cd��Qn@d2d��@d�zn�Q'@e�Z�&�a@fZ���ю@g�+��~@g�J����@h�L"R*~@iy�@u�}@jG��,*@k?ɵ@k��5�o@l���}�@m��xP�l@nq��p �@oM�3�#c@p"L��        ?��9MH��?�\���@ tw��@ҙ#�p@Mo��&l@�n�qp�@#�]�G�@@)�
�¨W@/��荶�@35Ю�C�@6׌�0@:��t�(�@>�g?@A���EG@C��]k�o@FT U�R@H���K�@Kx�?�-�@N2�|D@P�.S'e^@Q�n*'s@S{�<���@U
J����@V�e���@XI��[:�@Y���)h#@[����.�@]}�7���@_O/%X[@`����;@a��_ˈ @b�EN�@c~��<l@d�Ϻ�r@e�l��	�@f��Ŗ2@g��)���@h�,c�H�@i�x���@j�^m��R@lѯ.�@m?�^��@nl4�n?@o����)@pi ���#@q��+�@q��9g�K@rE�Ý�@r�����x@s��uz"@t5 Y�Q�@t���@u�/U�{�@v62�`�@v���(�@w��a�x@xH�c�U=@x�$��G_@y�}�g�@zk���J@{%�70�@{�/�?�p@|���҂        ?�e���?�ZN���+?�\jܥ�?��;sB��?���cC�@�L�9�@k����m@?n�R�@%�g��@� �%p@]X�w@"4�;c@$�O4���@'�s�@@*�*E��;@-��#G3@0jM���e@2�um�f@3�_��@5���z�/@7]{#��W@9>p0;�i@;-S����@=)���P�@?4Q͇@@��w�@A�	����@Bй�Ecd@C�`�#J@E֔�^�@F@��c@Gq-A��@H�0��� @I���`�Z@K'�\|�B@Lo���Ȍ@M�u-�.@O���R@P4��@�@P��7f.@Q�[y�e�@RI��n_@S O�x�@S��	$@Tud��K�@U3��ٽ�@U�i�b�@V����-B@W}$�}�e@XE��)@YT��@Y��V\ޕ@Z��+��q@[{ͷaӻ@\O]N�0@]$�.��f@]����@^��'�q~@_�����@`G���@`����E@a(�K��E@a���N��        ?�|���?���F+�?�N��0И?��Q��J@����8�@Ʃ
e,�@�@���@�wU��]@�L�}�@""B���@%����d�@)z�QU5@-��-N@0�����@3D�
g�}@5�����J@8EA�V~ @:�����@=���Ի@@Y��/��@A�����@Ct���A�@E����@Fʞ��:�@H��̍I@JX�����@L4T_n� @Nd�ֱ@P	֛z�@Q}FzFD@R�6��@S!��)^@T6�6NE�@UQ:�2J�@Vq�����@W���,�@X�4}Z��@Y���o;�@[/�k��@\m"*� @]�F1i@^��gSM�@`#m�#�@`���T�@ayZ�&y�@b(7�y�T@b٢�-��@c���!OD@dC�׹C@d���r+�@e�-�W'@fu���d@g5���@g�H�d��@h��U�@i���W�@jM��P�@kpmYX�@k���:�@l��{�Ԙ@m��Ym@n[f�U�-@o1W���        ?�z��y��?ݴ�.F��?�]�3�y�?���$+Ճ@xjM���@┷���@RYkU��@�X�]�d@�Nw/�@"櫂�@&�B�o�H@*�o���@.ܨ�0�@1�E�~@4!�^���@6��|��@9a�-�py@<4�R�;Z@?)����@Aw�G�@B�^���|@De<]�&@F��w@G��+��@I�^��@K��\mQ@M�8=fl�@O�8Y�4�@P�Ӡ���@Q�'�5��@S~�=�C@T'��R@UM�s:w1@Vz�:�]�@W�f���@X�fd��@Z(����G@[o`�h(�@\���#�F@^�/Ë@_i��	��@`d�u+,~@alI���@a�=����@b� ��k@cA���oW@d 8�dy@d��SX�@e��a�6�@fL�gz@g���0-@g��_�i@h�V��ױ@i�?{�E�@jX�R�ɺ@k/����@l	��/B@l�$��H@m�U	��@n���T�P@o�v13�@p8r�@р@p��%��        ?Ү���%�?�+{�^X�@ \�<�t�@�WUD��@1x��O@ǆ�/�@#ӹ�7W�@)_���ū@/�ڲf@3_�-q�@6��L�@:�i�]	�@>�G3}��@Av����u@C��IGbN@Fq�<�@H�A����@K/��>�b@M���%l@PT���@Q��+|�_@SB�W��@T��6V��@V`Q��k@X '^�2@Y��Z:�@[aNfX@]!�?�{�@^�ׄ�ܞ@`a8	-|�@aQ����@bF	���,@c?��9]�@d>��W96@eB��|@fJB���@gW;�t�@hhl��H�@i~B]��w@j����#:@k�iEY@l���\@ntφ@o,K�[��@p-ԯ�M%@pǋ�)\@qcE���:@r ��r�$@r��y��p@sBOZ)�@s���]�@t�]I��f@u2�"t:/@u�Q���@v��_@w4���@w��KD�y@x�^�o�@yE��JV@y��jaT�@z��V�@{g�}��@| O�>�W        ?��Tu#?���P�?��_�W$?����?����h�@訚��@�^E��@k�����@��;���@,z:��@  v��C�@"�m���O@%>h�v)P@(����@*��Ļ>V@.�u�d-@0��"n@2?�s(�@3�MW�@5��Ԩ@7|��(@9U��ű�@;;U���T@=,��,��@?*/�'�@@��n��@A���5�S@B�M12�*@C�R�Ƚ@D�Dq�@F%Z�u@G&��:+@HP[*@I~�4�;�@J��.@K��0c6@M&�z�(8@Ng�N[
�@O�-�u<~@P{��S�@Q"�5f�\@Q�{x@Rwe��Z�@S$�u&�@S�WRm�@T��� �@U9lXͧ@U��vCkm@V�|o5E@W_�=��@XH��u@X�}��>@Y��I� u@ZXS�⠜@[�#��@[�4�b �@\�<^��x@]l�C�6j@^6iH�Dd@_�)�E@_�R���;@`N_�40@`�c Ӗ
        ?�<��a�?��]6T�U?�R�V�Z)?��C�՝�@TI��i@�j�_�6@$�v�@�صh��@�D���@"���u�@&O�YJL@*:�`*Ʀ@.n5եѺ@1tv�2@3Ӗ%�Fi@6T��j�@8�����@;�5�m@>��\T��@@���@Bb#��3�@D���e$@E�WV�%"@Gp�B?�@I>	@
M@K�6��@M`�p@@N�M��I@P�OUD&�@Q�����@R��
;@S��n���@T�C�W�@U�;|4@W#;�a@XL�x�%�@Y��X��@Z��%�	o@\U-�"E@]J�νۅ@^�\(�@_�|E�@`����r@aS�j]��@b�C=�@b�Ur��@csMW��%@d-���@d�)3��@e���
|&@fmM����@g2 ��d9@g�g���@h�C%$@i�,��@j]����^@k.W��̆@laLJ}�@l֮�m�@m�8G��+@n���K� @oc昌�_@p �\�!        ?���+/�?����E�?�p�y�U1?�|�#��@�}��b�@�/f~ �@����@�w���@ t�9g @"FaRR�@%�͍�@)�=�|�@-�$['O�@1�:lI�@3l���9�@5� ԍ�@8x�~��@;.B��p�@>��� @@|s���@B(�H	�@C��]��@EFn�sg@F����8�@H���@J�z�#�q@Ls�@�]@Na�`r�@P.�v��E@Q3>���@R=�4�@SOH�1�@Tf�4~��@U���5��@V�~2>@W�E�!@Y��2��@Z9�t��i@[u���;E@\�mN�\@]�܅^A�@_K�M��@`O7�X@`�5*�߾@a��4�O�@b[4��W;@c#t;@cţ�K��@d~�?M��@e:92	4@e�;�{�@f����u@g{�O�,�@h@�Z�S�@i[
�@i�B��)@j�uA���@kl��B'@l=���@m��>@m�����@n���B�s@o�F���        ?����SŤ?�d��#@ r�E� �@
��Ro�@=�!�	 @�<ED��@#���_�@)QP���_@/aj�Ï�@2�*����@6����">@:O�t��@>Q��f�@AE��	>?@C}�	�	�@Eρ|$��@H:ZL���@J�}�b@MX3Zd/@P�G���@Qh� �%@R��A�@TQb-�V@U�W1��@Wcv���i@X��/���@Z�P�7١@\H�t8�l@]�$n�I�@_��C�}X@`��4h��@a�/ �,@b������@c����@dw��K��@eo�ծ @fk��u�b@gkb4�u�@hn��	�J@iu� �n�@j�@;o�@k�LV=�\@l���[�@m��lE@n��p�S@o�a���@p���a�O@qys��@q��� �x@r:���e�@rЀ7��@sg����F@t �l7@t��0�1�@u5W��ͧ@u�):�y�@vpe�|�@w
G�Y�@w��{�@@xS~fS��@x�D�	u�@y�c�@zB�J/�^        ?�o���i�?֨<.{NL?�
�1�~?� wB�Z�?�C����@��6�A�@�z\Z�%@�`562�@��
Կ�@됞N� @��m@!�<d�{,@$T?m�ء@'�Bc�.@)�i5��@,��,��@/�!�y!@1��ա�J@31V���@4�^�}��@6�̙$��@8r_���'@:L���@<4 �s�x@>'��@@��͊�@AM��U�@B$ғ�5�@C6 �'_@DL��x9@Eh����@F�?J�Q�@G��~��@H�m���@J�L?@KBa��~�@L|{�5+z@M�0=�@@N�e�n��@P#Ӯ�@P����vN@Qq���@R2)=F@R�^�IL�@Su��Ϛ�@T%��S�:@Tת��@U��f@VALN�σ@V�ۥۋ@W�7��@XmVT.\�@Y*/�"��@Y����@Z��Af��@[j�����@\.i���@\���X�@]�u]� @^�f�5�L@_J�Q,@`
��t�@`p����        ?�f��Vϱ?��IdT?��R8�:?��'[��@r9h�C$@�m��6@>��u;n@��8u�s@�vr-@"���1��@&h�Z#@*W7�`@.�:���O@1��?g�A@3�7ܫ0@6gvb���@9
һ�(�@;ζ(��$@>��ˬ=@@��(��@Bk��N�H@D?c�+S@E�o[QR�@GyR�?/@IE�����@K N��&	@M�=�L@N��l9D@P���<+@Q����@R�#�Q�R@S�0��-@T̺LE�@U��|�@W�����@XHpchF@Y~��@Z��%)��@[��4�F�@]C޸.@^��I+�@_��
�D@`�4ҙ�@aM^#h�@a�G�l	@b��?{D@ck:i��@d%1w��@d����r"@e��@o؉@fb��A}@g&�t�P@g�pw��@h��E�E@i��ǂ�@jO�dp*�@k��!�@k�zht|�@l�<G��K@m�>xÄ�@nwz�l/�@oR��G�@pC�Ƌ)        ?��K1'�?ܻr�!C<?�Fl�F�?������@���x��@�ɉ�a�@��A�a@����S@�W7���@"2�]�my@%�����@)��
˅s@-�@R�Rh@1%����@3U�M_�@5���)	�@8X�Wy�x@;	���Q�@=ٲ��2@@d#q��@A�l��@Cu�_�@E# �a[@F��u"�@H���B�@Jb_Ԧge@L=�^Cn@N&c�|0�@P',�O@Q��V��@Rx��V@S%���@T9���@UTvN;H@Vt�x@W�_�E��@Xǣy+e�@Y����6j@[1Yt��Y@\n�i��{@]�k�- �@^����@`#����@`�����@ay��fr@b'��Eo�@bع��Z�@c�Oʽ��@dBY�_R�@d��n�@e�����@fr�<��@g2Y�|@@g�!3V@h�%����@i~]��r�@jF�6�:@kD���@k��jaE@l���};�@m}Lj��N@nP/w~�@o$��5/        ?ҧ=��3?����L�Y@ ++5��F@����<@�^�"�%@P`W�@#~��@(�t�2�K@.��`��@2��)�@�@65���8D@9�	�M}@=���#�@A=?٧@C@��@E��%��@G�M�ू@Jrg�.�@M�+�;�@O������@Q=�G~ѯ@R���T4@T"��Ƭ4@U��ַ@W2qcE�V@X�vc���@Zj\�(�@\���o@]�����@_�3�z&@`�<틪	@a�Ǔ���@by��1�@ci���@d]�撒2@eU��W��@fR��U�@gR((cE@hU�4��@i\��>�@jg��Q;@kv*��0@l���A@m��̢P�@n�J\k��@o��j�@pw�J�e@qό�d_@q�Zk��@r/n�Rg@r�����@s\t��@s��}Ǜ�@t������@u)��=�Y@uƛ���x@vd��ag@w��X�@w�}4�2@xFFZ�&�@x�B��M)@y�k{T�@z2�!���        ?�G0a��?շ�n�?�	�{C?�1���^?���$Oو@ �A��?@
���:%v@ݓ���>@��b4:@��~��@z�mF��@! �Op�a@#����+�@&Kd�o��@)��^L@+�? �~�@.��꼄@1	��C@2�H}SP5@4RcX���@6'�)�@7��wIS@9��'Oz�@;��$�|@=o�ي�@?h�����@@������@A�� ο/@B��z��@C��x9Y@D��e��@F�'y��@G>^�Ǹ@Hh]ֽ��@I��Y���@J�>� ��@L��\D@MDͣ�E�@N���5%@O�aQ" �@P�z�0E�@Q8��_��@Q�%8Y�#@R����#@SB�ʔ�@S�b/W�g@T��#蹛@U_�m���@V��^E�@V�����@W�K�m�@XPa�\3,@YߑGL&@Y�u�^w@Z��L��@[b�{q��@\,��%�$@\�J5�C@]��F���@^��� v�@_g<�^#�@`\rm�@`�
(X<�        ?��1�:�?�
`��^�?�j�A�R?����Fp�@�>>�7@ۅ�d�g@��<��~@��9O��@�Sd��L@"28��Q@%�u��@)����E@-�q����@1�W%��@3WJz4@5���}@8]$ZYMQ@;`��8�@=�<3:9@@j^F!<@A�d��@C�Y�.��@E.��F�@F�x��@H�J#Yj�@Ju~�`@LSn�P�r@N>�o�7�@P�Z�/�@Q���@R(%��O�@S7�u�m�@TM�7i@Uj�g@V�c�!V�@W���:v@X���{1�@Z�QWw�@[P�	{A<@\�&�y��@]�4:��8@_ɉ�Ȁ@`7�]�b#@`��g�@a�/j@b@Z�,@b��L�2@c��7�g@d_�\@e�*@�i@eր� �@f����@gWQ�sjg@h\1E�2@h��`a�@i��؀qA@ju�>o��@kCH���@lb%M@l�9I�Z@m��/	a@n�5�Fy�@oi��j        ?�����S?܃ |��?�~,�|?��1��<�@�� ��@�2Lʠ�@��٨g�@���)Z@�Ȥ4%+@" 	/�@%�� ö@)})&��x@-�<�@0����@3J���P�@5�*��^,@8N.,�N�@:��Nϟ�@=����`H@@`7�7�)@A��q��@C|�Z1@E �¬)�@F�	����@H�t�x9@Ja����w@L=p���@N&�`���@P]N^��@Q��p��@R̳��H@S%�	{@T:8�
�@UT�!�@�@Vt�c��@W���#\@X��P[T@Y���5e�@[0�uu�@\m	N0�@]�n�m��@^�=<��r@`"1��t@`�hE*��@aw8���w@b%�r��@bօ[$�D@c��X��@d?���@d�/,��@e����,@fp&�_{@g/�1�"@g�z�m�@h��"�K�@i|�~@jD�c ��@k��̝\@k�ů?eF@l�	� ��@m}s3�{@nP�W��@o&��pv@        ?�����?��ޖ�@�?�gS�8@
ȢD���@M�~��@���j��@"�@�?`I@(I=�8�x@.$\׀��@2B|u@5�.��^9@9`����@=H�''W@@���y�@B��M`@E%�7���@G�w�ep@I��F7�q@L��$U@O7��z~0@P��u\m�@Rg	6
�@S�~��|@U^���4�@V��5	Y@X����@Z"`I�G@[�b�1.^@]�\O#��@_A!M�3�@`�iU@am�~T��@b[;'N�@cMVz��@dC�!�?W@e>��U@f>A���@gA��I�^@hI����@iU���C@je�tp��@ky�̔��@l���ƹ@m�َIĒ@nͩ�1�"@o�Dh8�?@p�N ��W@q!����@q�,d�X�@rRTi�uQ@r�F7es@s�����@t(u�GEm@tȭ�R�l@uj�1k78@vO���@v��x	@wZ��ow	@x����@x���L�@yY�Ε	�@z����@z����\:        ?���6n�?�@ll���?�1���z�?�Y�31
?���ּd@��5��I@=_@��@&�	y�@O��t
@R1�`k�@խ%�@!Nz���@#�p�?�@&uf�,�v@)6A�>�|@,����@/"�s�@1����@2��mF�@4N��\*@6 3��@7��	(@9�Ֆ9&@;]�KѶ>@=?tiɆ	@?,_�� k@@�:�Dp"@A��{�Ѣ@B��1>@C�����@D����U@E�>\���@F�b9��@H�q�Ƴ@I1�S�@J\e����@K�����@L�(��*�@M��@O6�LN�@P<d����@Pߩ�(�@Q�.
|�@R,�D�5�@R�ph��@S�<���Y@T0���@T��}b�Y@U���L��@VE���i@V�?��\�@W��A=�@XlM̡�
@Y'�K��@Y��΂�@Z����:�@[dp�$ZM@\&��z@\�3��/@]�+�&A4@^x�n�@_B'�F�@`�`�%        ?�>4��?��W�u�?�;��_o�?��b�@E�.u@��o�'�@���pu@����(@��B���@"��i�/@&Dʙ?,@*/
2���@.`�C��>@1l}�ĺ�@3���VY�@6K/�,wr@8쩓�Ek@;��lU�@>����@@�d���C@BY�|�@C�]�Σ@E���@Ge@B�Lg@I1qҔU@K>�8N@L�4#8�2@N� �K<@PvV�US@Q~��P@R��~�!�@S��E���@T�ʧs�z@U�X�0�z@W:_9#@X:Zu�^	@Yo�n¥�@Z�A(�@[�ep�y@]3��+�@^��lT��@_���UH�@`�=-�3b@aEe\�@a�W���@b�)�@ccu��1,@d�gVSO@d�Hp��@e��l�@f[�3��@g���bm@g�ָ���@h�3�Sk@i{�Mn��@jJ&� �Y@k���;d@k�{�;u@lE}�@m��O��@ns|�z�@oO<���r@p�n�k�        ?��D��)?ܶjơ�8?�D��wk�?���N}�0@�g�[4u@���6�@�V�^|;@�6�a@⬓C��@"4�G��{@%�85Q@)����R@-�lG�`�@1
&�AU@3\2�V@5�n�b
@8c+F��@;�ɛ��@=��n�@@m΅9�}@A���#a@C��o�m@E2T�`�_@F�T~�t@H��R.�@Jx����@LV���]�@NA�/�E@PY���o@Q @:�BM@R)�ܣ��@S9?�p@TO$#�@@Uk+'*�}@V�<�.��@W�?\��@X���@Z�0@[O��uK�@\��4V~�@]�"��¨@_؄�Ul@`5��ɷ@`�t��@a�����@b<H�@b��|q��@c���i@dX�k�&}@e��4@e�����
@f���e�@gJ���\�@hێ[��@h�O�r�@i��C.eU@j`�)��b@k+���k@k����|�@l����@
@m��k:��@nk����@oA
�        ?��{>?����{��?��F�A@
�K�� �@韚�@?�n���@"��T �@(
v�W80@-�f�Ֆ�@2�OUEK@5t,?�T�@9+�d�A@<�F���L@@~�LEv1@B�3��@D�]=�@G2[�2@I�s壾;@L#�����@N�]�R�@P��* =�@R5)��F@S���B�@UB�+ݷ@V�+��Ϫ@X�Ak�@Y����nh@[J�i��@\����<:@^�ܱ�w@`1�ʚ��@a��q@a�xS�V@b�_�}�@c��<_��@d��=y�@e����%+@f��P�js@g��
��@h���@i����@@jա!�F�@k�7{�H@l���?A8@n��;�@o*KS�@p$n�ʆ@p����@qGs.�$@q۪���v@rq���9�@s	��H@s�5�1T@t<��]��@t�=�VS@uwCI�@vxn��@v�\�1@wY����@w��-�]�@x������@yI��6��@y�<O�        ?�#��d��?�W'���?� Y+p?�8�@�P�?��_[o@(��~��@/�Bo(@y��N#@��Tk�@9�eDJ@ "��7�@"���B��@%Aw��@(D���@*�_:�q�@.]r|h�@0��#�2@29�N�{@3����f�@5�H�c�@7q��&�@9IR�T�@;,��d��@=N��$&@?��m�$@@�P��Ŵ@A�\7x9<@B��F�@C��G��@Dӹ�Q��@E��N��n@G?	i�@H=C,��@Ij� =S@J����eL@K�?iՊ5@MHb���@NL��8�x@O�ͺK,�@Pl��ޒ�@QݢOI@Q�I�H�@Re�V�*@So)�@S�&r���@Tq��� 0@U$�=@�@U�� ݜ@V����]I@WJ���?@XO{g;@X�2#}�F@Y�7)<@ZB*�D�W@[	��n @[�̔	��@\�m�A�@]X�U;��@^#,nH<�@^�?�ގ#@_��N��@`FV�p�@`��=w        ?�G�z�?�h]��?���e�?�.��
�@�a��m�@�eN&�@p�.��@��9���@!+�]�@"�h|>@�@&��( ��@*�~Ǭ 
@.�"5�$@1� &J�L@4�i�@6�W
�S,@9?�|
��@<��3�@>��,�	_@@�xDO%@B�a�%ԙ@D0d��@E�=���@@G���̎@InnB2BI@KJF��;@M3��He@O+K��DY@P�=K��@Q����+ @R�p�=c�@S�G\�>@T�d���@V�;��@W-|I�D@X[{�@Y��,\>H@Z�����@\	�VD��@]Otm�@^����/,@_�^#�*@`�Ŗ��7@aN��_ϰ@a���OC�@b����@cg�*̮y@dɃ�9@d�r:�
�@e��:4x+@fW'��7@g%I+�:@g݄u���@h�=��s�@imJ08ѹ@j8�y��@k?��(�@k���J@l�,��l�@m|o�J\�@nR݆mD�@o+pT��@pZ�[        ?����O�?܌��s�?�a�5�?����z�/@�a�@� wds@��λ�@����@��y8�@"��y�s@%���?@)h^��[�@-zI$��R@0�轲�@33��'�B@5����@8+�O۟@:�����@=�kg��E@@C�Z}O@A�6�9�@CV�� @D����}�@F�Y"�8@H\����@J$>�߅�@K��nv@Mڳ�� �@O����@P��c_�@Q�u���j@R�����{@S�i�(l�@U��*�`@V.�Ek@WO	���s@Xu&QV�@Y�l��"d@Z�ti�3@\	�k�@]B��1@^�.��@_�>���@`��{QU@a/���8�@aټ����@b����@c47NrV@c��z��a@d���N�Z@eL���@f�9#�@f�v�qO@gx��	n�@h6{D��@h�����@i���p��@j{%Q��j@k@�ɖ@l�����@l�=��Ӓ@m�X�!�@niFjw��        ?�א6���?���].�?����S>@
Zͼ�+@�[��@*��H@"�?�ξ�@'�@-�m��9@1�Q$�g@5K�h��@8��h��@<�v��"@@SNoI�@Bk���;@D�E|M@q@F�}�@IC��?_@K�����@NC�z1BV@Pq�U%��@Q�W�Z0�@S0�A��@T��B�!�@VئkQ@W�q>6�@Y"�f��@Z���E8�@\R);@]�l�p*@_�R$x�@`���!��@a�ϖJ@bn�|���@cUclD%�@d?�	��@e.SI3��@f d��v�@g�y|�@hj�cr�@iEc��@j�X�ۤ@koR�4�@l����@m"C�è�@n01d�@oAhj�3�@p*���@p���#��@qD+��@q�$ h��@rc��PUE@r����;@s�2i�A�@t6�*!�@t����Ga@uL���L_@u�3�à@v��Dg@wV�#C@w�YS�@xZC?g@x�ԕj�        ?��y����?�\��-?� �_���?�-�uI�?�_W@y�w?��@��n�@-���?@*��Z�6@x��`@���@!yw��t�@$ro�b @&�@�Ӌ�@)���A#h@,�R��i^@/�|A��"@1`q�ǅ@3�uL�@4�/H���@6s�Di�@8?#P�^[@:+g�1@;��vNz^@=��y+��@?��*��@@���!�@Bfs!�@C{�,r�@D%x�l�@E>�8�-�@F^ A+��@G��iBP@H�l���@Iڒ�D@Kˮ:@LFp�J~@M����E�@N�{���@P��6F@P�z�s�P@QS/���@Q�<���@R�&@`l@SW+}��@TU+��@T���:�@Um���@V#�x�=e@V��q�!@W����3@XQ�M	`�@Y'��5@Y�zЎ
�@Z������@[RI�S@\����@\��;�t�@]�ot@^m�z5n�@_8x�#��@`f�"�@`iQ�l��        ?�8�m>S?��s��?�ZKpium?�͍��f@cܰ`|V@�'&��@<ե�S&@��a�b�@���T�@"�P�G@&�3��g�@*yZa��@.�0�L�@1��8ۤ�@4�K��@6�i�h�N@9Ft��z@<.��y@?��=@AG8���@B�{�P@DM��JU@F�􅵓@G�rw�J@I��B\�@K��r-C�@M}� �lj@O��6p�@PȼY�@Q�9�Ae�@R�|@T��A�@U/��f$�@VZ�eN�@W���4h@XÎ(�S�@Z�/��@[FDS��@\���T@]�=�@_9K��G@`KE;/�@`�����@a�|��j�@bi��9@c#vGc(#@c���jv@d��-��@ec�r��@f)����@f�K4��@g���{'@h���Np@i\E�b]1@j/�v.ݎ@k�,�v@k�;�R@l�=ʃ[@m��B&��@nw%��
@oY�bp��@p��:�@p�Zg޳�        ?�g[� �?���p�?�]�LJ��?������@��	F@��e&�@�Cn´@o]���@��׆@"Iqӊ�7@%��v-�@)��B��@-�g� �@1����@3r�|P@5��:%b@8���p�@;6���<@>+O"�@@�sX��@B�Uɳ�@C������@EL�u,S
@G���_�@Hȅ۔5�@J��"d/R@L|���x@Nk����q@P3���U�@Q8��[~@RDO�2K @SVF�O�@Tn����@U�WH�Q�@V�E[m@W�Z����@Y� ��{@ZE��a@[��w{�j@\ńU掔@^T�\|@_\I�̜�@`X79$r@a�=g^P@a���' @bf$\�x@c��mH�@c���hh�@d�Ԭ!CG@eH6�$$@f�q��@f�oml�g@g�3����@hR[���@i޺I��@i�uuAt@j��À{@k�7����@lS�+�7J@m'�e?�@m���8@n��߳�w@o�2��
�        ?�����?���"��?�bݸ2A@
���q�@Hw?ҁ�@x�>��@"ﱴ��I@(4�����@.��d��@2(�T�@5�Cs��r@9+߮�@=�	K,@@��b�+@B���1�@D�j�t�]@G,��-JI@I��.:#@L�\�@N���5~@P��vpٗ@R.@�Ŵ@Sl�:��@T���r�@V[��j@W�|����@Yo@7
�@["��0�@\����	�@^Q��T�@`���@`�r82-I@a�a�!@b����3@c�|�	C@d~7�Y=@eo��( @fes �1a@g^ԩ��K@h[���X@i\�J�8�@jaK[�Ê@kiZC�W�@lt�'a�@m���=N@n�c(@o�)i��Y@pb�o�N�@p����R�@q�����u@r�;	�g@r���E
@s9�-�;@s��.ER@tfk����@t�C.&�@u��P�6@v53�o�T@v�?++@wp���T@xYM��9@x�]a ��@yS���ږ        ?�VsHń?��058?��Ԓ6ݑ?�;��|?�*�I(�v@��3rI�@
/o�\V@����!�@k7yc@�D�a=@Ǒ�j�@ ��hF@#h�Zǈ�@&
F��7�@(�2�\Q�@+�k��''@.�Q[@0���ȼ@2zt�;'�@4"d�n�@5׎QϽ�@7��<�e@9h��
�U@;C�<��@=+�P��@?b�BǢ@@����j�@A�@8�A�@B����{@C�ƈT��@D�g|@E�z���e@G�\�@S@H,����@IX��P�u@J�T�g@K��t�K@L��r��@N:x�R�@O?��i@Pdg#��}@Q�?*�@Q�{^@R`��gZx@S����@S�S�8/P@Tq��,�8@U&߾�r�@U��d_2�@V�H#f�@WR��	&�@X\���@X����/@Y�����@ZU�CHِ@[���7@[�gb�@\����:�@]y���V�@^G,	B @_Z9��5@_�!w�5@`^h�u��        ?����@x�?��� �?�6�*���?��I8`�B@�&w
�@
ĥ����@�Z��H$@5mu�6@�KO��@!{���B@$���}}@(�22�j�@,������@0ZL�:>�@2�
S��@4��6�^@7fY/$mD@9�П��@<�n�p��@?��Bw.@A;����@B���4�@DV�hv&�@E����]
@G��K�@If���ԕ@K1.�g@Mގ\�@N�a�)K�@PoD_�'c@Qn잳r@Rs�$6@S~&eq�@T���@U��pT�@V�~c�D@@W�޿��c@Y��7��@Z:n���W@[mr��g]@\����JS@]�a��X@_&aJ�!@`7-��w+@`ݮ���6@a����$�@b2���h@b��1@c�T��-@dB�0<��@d�����+@e���3M(@fhKKF@g#�Od��@g�a_�R�@h�L�3�@icVy�s�@j'u���'@j���(�@k�Ԧ[z@l�W�@mL&4ʍ�@n4�v)        ?��\��K?ރ*p���?�
�K5?����5P�@���&�p@�����#@�߆���@o�}�x@�]�`@#P⩠��@'i�P�@+a��F@/v: �@2
�#� @4}l���@7��m@9��c���@<�iR#�@?�<�B��@A\j��b5@B���g`�@D����>�@Fc?a0�F@H/�r�@J
pً�@K����5B@M�Y@?�@O�T��+�@QM�zɇ@R���z@S.���J@TN6EGT�@Ut��v[�@V�����@W�:݊��@Yf[��z@ZP��R:@[��6(s�@\�5a�$B@^7��w1�@_�%~>d@`xY��9�@a+X���@a�ʪ�r�@b�`)�!@cTЌ��w@da��@d���d8@e��m�I�@f^f�^6@g'��R�@g�f�I��@h��*x'm@i��
��@jft�_6�@k<�E���@l86�0�@l�W(2�@m���@X�@n�쵐@o�Uֽ�@p:�qȲ�@p�!|8        ?�F�� 	?�Q$t�@ ��p-�@h</�)@@��b@F���4Z@$)h�Ͽ@)�V��X�@0��[�@3m�����@7�Z�h�@;�>�@?5�mF�@AД���`@D#ێg��@F��ă*@I�Rz��@K�Q]T�@N�͓���@P�(��+�@R,�x_9�@S� 2��@UE�b��.@V���C@X���&�@ZC�I@\"F@]���`@_��=�r@`��w֓@a��v�@b�,��|@c�*�a�@d���T�@e�ׁ�ǳ@f�@y8w@g�E����@h���}@j�h�@k-D�UŔ@lQ�R@myJK��@n�]����@o��I9U�@p�>5C@q!��P	@q���i=�@r`am��@s��.�@s�
2��J@tMC:���@t�bUm�	@u�b��&�@vK>��g4@v���[�n@w�tŞ��@xY�� KT@y��~W<@y��G�l@zx3evv�@{0w8�6�@{�ll���@|�R���        ?�.�l���?պ�?,�?�	��?�L!�e?��-\P�@V+���@
���@�{�:>@ �vt��@u74��N@�(Գn@!��?�O�@$wʟ3@&���l�@)�ց��@,��e_�@/ɡ��?@1�	�.@3,�}f@4�<��@6�m�2�@8�Kt��@:c�܈�@<RԊU�@>N�*,YY@@+ӷ�*�@A6Z�*@/@BF��h�t@C]r��}@Dy��$�@E���t%@F�R�us@G�Y?�=�@I"��|��@JZb|�E�@K�5�^c@L�O6+q@N�[x[�@Ok�U�n@P^*B���@Q��{O2@Q��'�@Re�3��@S���n�@S�R�p�c@T�55�&�@U86擏8@U�N.��@V�qJn�@Wl�N@�@X,���w�@X��YH�@Y����r�@ZxkP��z@[@
�Sj�@\	{7���@\Ը���@]��XzP6@^p�;�@_Aϫ�E@`	�ϱl�@`s����@`�A�n��        ?-�Ճ�?�rWt6m?����'5?�@	�F�@�n�{�@3���gW@����M@���@J�����@#w��@&ì�x@*��y�@/�;0�a@1�j�*�6@4;S���@6�u�cV@9x���@<I���@?:�RF܁@A%��?ۣ@B�,Q�'a@De�?�Gm@F���_@G�-��M�@I�z*e�@K�32��@M��!�@O�D@P��J�sN@Q���@R��@T�V�n@U&��O+�@VNE� �@W{ܳ��-@X���<�@Y�D���@[)�2͗@\o���@]�e���@_�Ԅ@`2>R��u@`����@a�.��[�@bFV�*�@b�<���@c���1O@ds y�L@e2��S
@e�
;
@f���{ �@g~eJ���@hG�RV�@iRR�
@i�����@j�*K&�^@k�?>2�@lZ�zA�@m2�*��@n���C@n�}�k�d@o�n��r�@pT���        ?����i?��r{���?�1�� ?��X>�@����;�@�>�V�@l���o@�e�d*@%]��D�@"�n^��@&�gP<�@*��HJ/�@.��6��d@1��^J@4"2=;^d@6���R@9Y�̈́h�@<' r6�@?B8���@A����@B��j(2@DO4VU��@F!��*�@G�=��=9@I�Vr�MF@K�9�f@Mr���R�@Or��M@P�]F�Ѽ@Q�n]xŔ@R�j�D[@S�;�f6a@U!˩�7�@VK^��@Wz�x�F�@X�*D��V@Y��R���@[0���{�@\zU H�@]����0@_v$_�@`=���I@`�W�]�@a��L1�@bX��	��@c;��v@cΗu�e?@d��g���@eO�L��@fiz� A@f��4��5@g��j'e@hr�O!�@iB>����@jS�=X�@j�����@k�C��@l����@@mv]$i�@nU'Svb@o6g+�h@ps�O�@p��m�        ?����p�?�w���EC@D�H��0@v�[b��@VB=��{@_,tR��@$��U��@*�&h�kc@0�L��@4c�*@7۴�l�O@;�����V@@���@B\d�]@D���w��@G<9���@I։f���@L���KK�@O[�����@Q"�= �|@R���@T1�z��C@U���G�@Wq�>�@Y"�,��@Zߘk�5�@\�uP��@^z;�OjV@`+�MPK�@a�R�p/@b泒�b@c�oP�@d	���@e!�?�@f.�G-�@g?�.���@hU�$ +@ip.�Ř@j�R,I9@k�=u �@lٻ��
Y@npB�@o5HO�^@p4�Ƚb@pЋ�d��@qnut��@rL �S}@r�!��@sS���8@s���H'�@t�+���@uIY�.@u���i6@v�"Ƥ@wN.� ��@w��W_�.@x�:��W@yb.��@z�g��$@z�̖�K@{�i�]�@|=�x�'\@|�����        ?��W&�K?�a�S��?�[�2r/�?��y0�G9?��lL��@��gٶ@~-�<#`@w��uQ@�'�9�=@��6�@�y�@@!��'�@$�~?R��@'M	����@*<���h@-M���h@0@'B�W@1�d���G@3�X�JP�@5j�s�@7B#���@9(`���@;!<a��@= ��@?1;|�@@����@A��偨�@B�G/wo@C�/nRm�@E&a��T@FUČ��@G�A2k�@H��o���@J+kF�T@KOe2�}2@L�RʫV@M�� ��3@OF���@PR�W�2@QZ���@Q�4�Ŕ5@Rm��1|@S&tr�P4@S��lA��@T�q�q��@U_zNrJ&@V!��s��@V�paZ��@W�OҶ��@Xvjm�(�@YA�5
�/@Z4y�mS@Z�ԗ���@[��T�/�@\�fi��Y@]ZI<4F@^24[�@_!��Oh@_��ڛ@`b�*(g@`���1v@aC�b֮�@a���P<        ?�Ʊ�٩�?�*���?���?�2-\[�@��ȓ��@9�Ö@���Wm�@ QK��@Ea?ѷ@"U�.���@%��8��@)�����d@-�8���V@1.lmGtH@3�'+�t�@6��S�s@8�K)�E@;Y�2SYe@>5�į/)@@��E��@B&D��L@C� �~>@En��m��@G)w
���@H��	�	@Jʄj���@L�{�j�@N�t�x��@PS�I�@QZ�Bڸ�@Ri=@4�F@S~HӄX�@T��<je,@U���g�@V�>جY@Xܧ�q�@YG�F�@Z�{>�*T@[�Nr�W�@]
��H�@^V��N)�@_���)4 @`�eZ��{@a/)��@a��@b��4�#�@cK����V@dxPC��@d��<ۮa@e��0(�@fA�� Y@g�
�1@g�;`p�@h�!2|@i`{󊜦@j.F2�jP@j�z4݄�@k� �t@l��=��@m}Vk98�@nV��^8v@o2�Ue�Y@p��de�        ?���W]�?�n;!�+�?�qW�&?��A�8I�@��*�Z�@��^�sq@}�򎺙@�$E��@�(�řT@" R���@%�K�@)u��ǩY@-�5�p&>@0�;Hd�"@3I*�W�@5�y���@8P�߻C�@;�XR�*@=ڢ��=X@@go���@A�X���@C����\@E1��u��@F�!0��@@H�//s�k@J����!@La�h,�@NQSִtC@P'2+Zŗ@Q,�6Q~@R8�Zg@SKf(O@TdF��p@U��R��@V��pd@W�M�LI^@Y�6��@ZA��D�@[��IE֥@\�y�8FO@^Uf�7@_a�n�@`[�ړ�@a	���7�@a��3�@bn�V�@c%=��"B@cޅ*4	�@d��9�ǐ@eY)��U�@fv���A@f�_�c��@g��]`�c@hm����@i9r
@j|zQ@j��B�C}@k��$�@l�H�S�@mX��h�@n2nk+@o�=���@o�Kȭ�d        ?Ѫ=e���?�b���?���a�K~@
N��,��@�%��@?���h@"��ǜ��@'�i}58@-�:�0o/@1�"���)@5Z77�B@8����,�@<� .w�Y@@r?v=�0@B��A�~�@D���6@G+Q�,�@I������@L#��A̖@N��/���@P�U�N~O@R#���@S��[.@U�W��l@V��(��:@X)�=�<@Y���@[j�w~9@]���@^��[Ri@`I8��V@a.~���c@b<CV��@c[#�4!@c��S//�@d�m��]@e�<K&M@f�!F��@g�
�qZ�@h���;@i���#��@k0��@l{J�X�@m4s�L�@nNxw?@ok'l�ֳ@pE�*�x	@p����@qk�F�5�@r ���@r�׊�f�@s0bl�z�@s�45@tf(3���@uX��3@u�*5Q@vB:��G�@v��2�f@w���Aͽ@x+�<��i@xш&-L@yx����^@z!�I?q�        ?���r͖�?��m�[�?����,x�?�t:s�?�B�}�o�@_j�{��@
�Y�o��@�}l@��%�@6{��p+@�g�4�}@!D)���@#�R���U@&r��܏�@)8�N�RM@,�kk@/�Uj�f@1s��8�@2����]@4b���pD@6��
n@7���[��@9����@;���N�|@=l?4�"�@?^P��@@����R�@A�ሣ]@B�L#5�@C��X��+@DݜOJП@E�Jgq�>@G�(UI@H6;���@I]S���x@J��6:�@K�`
}k@L�/)��@N'h$ίR@Od�질@PS`�M@P�\iv.2@Q�eD���@RBqd O@R�v�!Uo@S�n;'=t@TCQ��tW@T�ѻn@U�ɽ��@VUVb0�|@W	��Ⲹ@W�����1@Xx	��m@Y1�
&@Y�z<���@Z��B54�@[i��.@\*��~[�@\�����@]�
��@^v�#�@_>X�^�@`q���        ?���~�x?�&�f/�?����?�t�7{@��[M�@���(1@���@d�VK�@1��@"M�t�{�@%���1�U@)�;hJ@-��\#�@1#�1t]�@3zo��;A@5�W� @8��x/��@;E"�)#3@>e��V�@@�sv[�@Bي�@C��X6��@E[ZA8�G@G�/_T�@H�l��@J���V�b@L�Q5��@N���j��@P?��l��@QD��O�@RP�7��4@Sc)�@T{���]�@U�ki���@V�30�@W��||�@Y�\�(@ZQ�@[�#G�@\���>O@^/�3 �@_b�`��@`Z��s�j@aE�m�N@a���;]R@be���<@c��8@c�E�(@d��WE2@eB��@�v@e���_G@f���y��@g��K��@hFZ].��@i%N#�@i�8\�@j��r�"�@ko|�#@l>�EI�E@mէj�E@m���@n�07��L@o����p        ?���V$�?����y�)?�U��;��?��e��5�@ɾHf}@�}��X"@��;�D@W�v@�����@"Ad��`i@%���;r@)��A�m�@-Ƣ�4@1�wk�@3hN���@5���K�b@8r����@;'>�ʗ@=���F��@@w�yji�@B ��\}�@C��!�~@E?ZfzI@F���u�@H��j�@J���6�M@LiA�z�@NVt�Z�@P(����{@Q,�@�G�@R7$^��@SH("!R6@T_�}�@U}K�p�@V�7�Ɂb@W�A�]�|@X�R �!�@Z1SI�N�@[m2B�r
@\�ݥ�H�@]�Enr��@_CZǛ��@`K��'@`�*���@a�e�@bW���m�@c�%=�A@c��`�:�@d|�N�@e8��eӖ@e������@f��/�Y@g|�����@hC9ᆗ�@i"�[��@iׁ+��@j�Nt�TY@ku���؄@lH H
@mo���@m�rP�N�@n��Z�@o���։        ?�݋�Ͼ\?���:7�Y?��RJ<@
���s�@o��+@8=�-�@"��$�{�@'���3�@-�&�g��@1�6�FV2@5Yq&Q=�@8�Q���@<�G�3��@@_����@Bym@��@D�`J���@F���4#@IX�'}4@K���|�@N^дi@P��n�G@Qܟm�ԓ@SBQ�0.�@T��5	�@V*�}�D�@W��'��@Y7�Z`�%@Z�qZ$�J@\g�*�FE@^�G2�@_��p�}X@`�y��A@a��]є@bxM�>��@c^b�ۍx@dH#%���@e5z��;�@f&W�F��@g���~@hd�:��@ivT���@j��Y�Y@kb�3�@l!5?6@m�3qH@n$����+@o2�J�f�@p"���/@p�	�]b�@q7�ԫ�M@qč�w@rS}p�\@r���Y%M@stFE��b@ta��B@t�;�˯�@u0ϡQC�@u��ѯ\c@v`K��@v��3��;@w��<G(N@x0�V��@x�Z!���        ?�z��v|Y?���a'�`?�׆@E��?�5�wV24?�id7^��@.떥��@����Q�@���Х@���L�}@DZ �<|@�P\h@"=RT�@$�j��(N@'m�^��@*U����@-]��Y��@0B08�@1�&�}@3��p,�@5S��Fr�@7 {���D@8��2g�@:�M�*i@<�eSS�@>�
����@@s�f�|T@A�(�PH@B���#�@C����_@D͏D�M@E��QF��@G=�:@HNְe�n@I�5S�R@J����@LJ�d�.@MHϨ���@N����VW@O�K� 9�@P��՗7@QJ��G@Q������@R�����@Sa���, @Tv0zDI@TѣG"��@U�c0@VJ�#�wb@W
����@W�z�q�@X��b��@YVȹ�U@Zhjv@Z�n��0�@[����u@\�JJ�M@]T�`5DD@^';K�˔@^��@��@_��<@`U2��M@`�K��L�@a0T���        ?�S���?ܘw�8h?�����m?��1j���@x�N_��@pbk2X@T�'6�1@�3�	j@[��l�@!��}U@%T��� @)V;Cg@-��iq�@0�Qr7�@2�&���@5F;�+B�@7��Y"�@:_�SC�@=��eƹ@?ɷ�@ApZ���e@B�M��W�@D��"c>@F-�Aj�@G���0�@I��fd2�@Ka4o��=@M6$�jO�@OB�W'�@P�+K��@Q~���du@R��5)�J@S���;�s@T��;��@U�ڌP�@V�]j�i`@W���)@Y�B��8@Z*!��@[Wb��k@\���]�@]� �<�@^�:���@`':�n@`���VL@agb(���@bm{ka@b��m)j�@ce)L-h[@d�kN��@d�>��@ew+?0M@f, `���@f��2J�@g�2��@@hWd�'�@i��u��@i�՝V�}@j�X'@kX!J˛�@l$k{x�@l�Vn�7@m���y        ?�O�˓D�?݁:�5'?�.�ᙐ�?���.���@_�˹��@���T�@?[���J@ąT3"?@�o��6"@"���@&�:���@*���(�T@.�VplW?@1�U�h�@4��Gi@6��cJ�@9XЏ�~)@<+n��m�@?R�v��@A�&=��@B�g���9@D^��:?@F�����@G���+@I�qbJ"�@K��3<�@M������@O���P��@P׫�D��@Q���*1@R�i��k!@T���+T@UBif��H@Vm�w�nr@W���]�.@X�b}� @Z6���>@[\RT+��@\��q��@]�����@_P0�q�@`V��`N@a�nS�@a�'N��J@bt�(�s@c.�|���@c���zl@d��Ň�@enj�DK�@f3��(�H@f��1�%�@g�{���j@h���lY@ic�*Z#@j67�m?@k?����@k��s��p@l��ҖB=@m�O��2�@nx>�Dd�@oY�O�	�@p����b@p��|�`�        ?�Qܲ�u?�dG�|@ ����@N��+��@��[��@! 0.@#U��"h@(�\����@.�v�z@2��Z0Y�@6����#@9��>�6@=�*�"�@@�7�;�@C ^;���@Ej����@G��O?&@JI�M�@Lݕ��ԅ@O�3/y<@Q$���/@R��'�o@T�G.@U�z�"�@W wW_�@X�l��&%@ZC���@$@[�!�	�@]�v��@_V�pr�@`��~���@arf�2�@b\��~!@cJ��e�@d=�7?
@e4)���@f.��B��@g-V��e@h/�$Kz@i6 ��#@j@���@kMˎ�
�@l_1��;u@mt2�[E�@n��Ĉz�@o�ј�8g@pd*�"�@p��&��@q��'Bӓ@r�P� @r����@sL7w�@s�|�	�@t����o@ul��R@u������@v[O[εk@v�z��c�@w�kaf�@xC3���@x蹤��@y��NN�@z8��        ?����rF�?�?N�!)�?�G����?����m g?�/4�t@��x���@�L���@��@=5�?U`@��B3?@z�Ğ��@"B�bc�@$�}�	PI@'�f?��@*�5k���@-���t@0]Q�z3@1��Ew5@3��xR�c@5a���e@7(C��b@8����@:ۘI��-@<ǭ�z��@>����@@a���6@Ai[ů�+@Bv��%[p@C�`p�
@D��F�9@E���|C@F��~X�@H	�i�w@I6���@Jh�4��@K����@Lۅ� �2@N:��"@Oa����L@PU����@P�bL.�4@Q���!)@RS��D@S?C~�@S��U�5D@Td?����@U,6�@U��)ڌ@V��yOz�@WD#��Xl@X^���@X�����@Y����sI@ZEM��XC@[
�z���@[����9@\�_m@]f���@^2�p��@_�
��@_�$ 9Zp@`R@J��@`�W��>�        ?��ŝ�?ޛ+)�b�?�e��T?�`WBq��@�w��ܠ@K�>A�}@���Dͽ@ q����@P%��k@#j�V�.@&�t��)@*�=��_@@.�$��S@1�"��Tz@4'��(��@6�ǲ���@9Y5m7@<"�-*�o@?O�6S�@A
��T�@B��Z<��@DA�0%�\@E����@G�s��@I���)�@Ka/��"@ML�ӂ��@OF���@P�z���@Q��n��@R�i&���@Sر��z@T�f�a��@Vq��sQ@WD�'� �@Xu5��f@Y��&c�@Z�R?-�w@\*�i�>@]s/B�t�@^�X�*@`
�4K��@`�`5p[�@af꣹@b1uhQ@b�)�tHw@c��^6�@d@����@d���9�@e�"�rP�@f}�0�@gB8D�@h�'���@h���m@i�k'�!@jk/,�5#@k;>��;B@l�S`�s@l��#��@m�߈s��@n���hh0@ol���=@p%$6        ?�15��'?�����?�ǩy)�?�:����2@��\5>@"51�)@��]�}�@(V�H]@{�hS�@"TC���`@%�y,@)��j*@-��>��@1�$�I�@3h <�G@5���@8j|�(�@;���@@=�W����@@l^;�f@A�Һk�@C��g��(@E+�hN�F@F�(��CU@H���Q@Jm��]@LJ�:H@N4+q9ON@P�2,9�@QA��U�@R!+�;��@S0��dE@TF+����@Ub�@V�.!��@W�1;�=@X�@��,v@Z35��B@[G��dc�@\�uɣA<@]̢q�@_h��E�@`3�OK'6@`�ãr�=@a�_ف�>@b<�ed��@b��w@c�+�
�@d]S��4@eԱB@e�D�݈@f��W��@gW0����@h�3�c�@h�܄���@i�G�8>X@jx��7s@kF%g��@l��E/I@l�=��H@m�/�P"�@n�^��b*@on¥�N        ?��$E8a?�[>{�>@ �L�В@=~�z@f
S�@	̯��g@#�����%@)�?��Y@/�X���@3,��TX^@6����@:��zj�"@>��*' @Az��6@C����@F -	@H�ܷ���@K�tJ�@M�h_�R@PA����@Q�)�=�@S#��aǩ@T�n�牔@V1�F&&@W��Ht�@YjP0\�@[�J�:�@\�s*��@^��O�2@`)�N`�@a'��ڧ@b̶]p@b�y�.�e@c�j���|@d�ș�/@e�-*%@f���JB@g��1�l@h�>̩Y@j�1$O@k#}S�t�@l<-Q1��@mX�.T�@nyc���\@o���KU?@pcV@p�����@q��I�I�@r*j� c�@r��_(�@sc_@t�z+�@t��V-�@uE%_:��@u�F\��@v�;c8@w6����4@w߹�`Z@x��qyh%@y6�v�@y���"l@z����@{E�r�]�        ?��A�dY?��A���?�ͱO�q?�.}�7>�?�dl��9@1(���@�g9ш@��GNId@��KW�@m��տ@;x
��@"*�í�J@$ݏ��;@'��*�.@*��G�2�@-�F���@0��H�q@2.Ec�@3��G2��@5�k�]e�@7���.Nh@9y��@H@;o�0�ɉ@=s� �@?�e�ڻ~@@��Qe�@A�����@C���@D&�X��@EO"ビ@F}�K<�@@G�"�*@H�x�Fg�@J,�'8�!@KrDW�@L���)�g@NNoA��@Odr0CT@P_�0��@Q@���@Q��cҢ@Rx~�с�@S0T���)@S�e�-n@T�<�Z�S@Uf<�n$Z@V'��|�'@V�0>�=;@W��ѭ/@Xy*Gh�'@YCuք7�@Z�'�A@ZމM<8@[�C^z��@\�!!d	@]V�O��G@^-�Ps9@_�I̸C@_᲏c�o@`_Eٛy�@`Χ�Ņ@a>�w��F@a�=+u��        ?��Pt;?ݵȟ�n?�k)��?���3?��@1a�u�v@u�ڠl@��WK@q����|@|͎�%@"�ʦC��@&,OL_|@*�tl��@.<PPi�S@1V�	�Z^@3��cR��@6+�K˗@8ǫ}���@;�*fXzA@>]��K�@@��>V��@B7A��~�@Cѵ^�@Ez���@G1�P���@H�?����@J�^�b)[@L��gW�@N�
;�@PJ�*�@QN}��7@RX]���=@Shڦ_?=@Tnw�1�@U����@V�l�d��@W�Z�Lb@Y��>o^@ZG��g�@[����k�@\�Hqx@^�ڦ��@_K��~��@`L��.��@`��̘
s@a�����Y@bQGhea�@cO?���@c��8y�@dk���@e#�x��@e�	�g�k@f���?��@gY�T���@h�塮@h��u��@i�#�@jj�A�$@k3�����@k�y#�@l��1C,�@m�]VJ7o@nm��_��@o@�sn��        ?��Wq�??ݧ�H-X�?�HhB�1?�΂�K��@i�9�@��N�@E͑_w@ʦ[.�F@�/ʷ�@"�x#�]G@&����@*�Y��@.�EӸ�@1�����@4�D�u@6���@9D��ai@<��#�$@>�L̩�#@Ae;�@B��4��K@DBת�U@E��=�@G�Erѩc@I�A�0�@Kp�C(�@M`�3��@O^~��	H@P�!��`d@Q�ٌ�^R@R�OPC#@S�j�J��@Uaw�@V71�|��@Wd���?@X�u�|�l@Y�o2L@[��M�n@\X��Fl#@]����v@^����i@`'7����@`��Bڹ@a��-h z@b<�m�\@b�9!J��@c�5OԮQ@di�/��D@e)_�=�@e�_9�/@f�G��
�@gw���@hA�*;2@iMa���@i�s��W�@j�"'2N@k�R= �@lY���\@m3��a�@n�3li�@n�����@o��90�@pWʸ��f        ?҄��>R�?�f�l@ �=@C�@}���1@�j{(-r@H,�ƀt@#}���`�@(�b�J�@.�q�,|@2�����w@6Gg��=�@:��`@>J2� �@A$a�8�@C]/ �Vs@E����@H��٘�@J��l@N�@MBG�H��@O�%�E��@Qbp�Z]�@R��՟@TPC�̢~@U�(w���@Wh[fW:4@Y�����@Z�����@\Ww6"Y@^�$��S@_�J�0@`Ͷ��i�@a�ZNeC@b�WM���@c���-Xy@d�<��@e��!N�b@f�i@�{V@g�'!f��@h��t�*Q@i���\�@j����S�@k�E�h�@l�E�3�r@m��,�@o	,�*E�@p��xV�@p�rȌ�@q:�M�l@q�w+@�$@rg���n	@s l��/N@s��f�w�@t6ΚC-@t�\T�!%@usvt)s@v��r@v�9��@wYמlI�@w��C�@x�m��@yMY�~E�@y��;�w@z�]w��        ?�dY¬I�?֛-ʑS�?��Y�*"?��߷@.]?�iXǳ�@��k�6@��%3a�@�Wz@��!$Vj@+��5@�X3v��@" 2'r@$��JD��@'�@��@*yW&���@-�7FD"�@0g�Us�)@2|qJ�@3���>*�@5���NA,@7��HI@9o���V@;l�����@=x�MG@?�/�8�@@�6�U@A�F@n`M@C&
i�7@DB�@B��@Eq�8@F��զ�w@G��J��@I&^�]�9@Jo6���@K�G?��@M��b�@NnӈB�@O�7x���@P��4�@QR��M@R,=&C@R��t�@S�X�o�@TJ�f@U)�l�M@U�a��@V�m�_f�@WqB��m7@XAթ���@Y�@��@Y�hj�@Zã^z�n@[��f��@\|�e>�@]\�g6 @^?��zv�@_%$�׋�@`w�.�@`{��[P�@`��W�6r@aiM�8Z�@a��iE��@b[�{��:        ?�KS�&��?�w�Y�*�?��d�;~Q?��S��Y@g�_G@])l_�@L�0@��@�=�b%�@_��|A�@!�����@%eq�`�@),n�IQ@-9]�I�@0�ṵ6�@3��
}>@5{vM0-�@8�2��@:�����@=��7n@@5,�-i�@A��I�@CM��bB@D�s�A�$@F��i8�.@Ha����@J/�A�@Lz�*�@M�C����@O�__-@P���}�4@R�,��@S�VXA�@T'����@UD5&��I@Vgvc�@W�0�Ĥ@X��M/�@Y��R�L�@[0s�^�@\q�@n.�@]�cn	~@_�KWuW@`,�5#�@`�P�^��@a���.�@b:�gfu�@b��@c��~}@dav�&�`@e�(�d@e�@�g.@f����e@ge��c �@h-]��j�@h���km�@ią1��@j��pI�c@ke��;ێ@l:�njY'@m���f@m�U���@n���|�@o��n�JE        ?��C���?���O(�?�UE�Ч?���y�k�@ʆW�QM@�N�Yȿ@�G�-@^��V@�M�i��@"D�[m׭@%�ؿ��q@)�E.�@L@-Ϝ���@1�M��^@3o�Y7mK@5�7��U@8}���L�@;5X��E�@>��!�@@��^Es�@B�t��@C���O

@EP�&�@G���4@H�q�N!A@J�KXX��@L�R��N�@NwW?��X@P;��e@QAN�"��@RNC��(=@Saߩ*�@T|r�W�@U��=i�U@V�ί�H@W�9f��@Y$�D�^@Z^��z�@[���3I@\䴽YX@^0�W:��@_��(�_@`m)q�^@a�A3[�@a͛����@b�!���Z@c9z͠n�@c�����@d����]=@ep*~*@f2��ۡ�@f��O8�@g�-�v�z@h�sb�eA@iVO�>;�@j%�=�,�@j�����@k�&��%�@l��>g@m|�h=@nX\��D@o6���6-@p��ԅ�        ?�l*���Y?��-�
�@ 
싨d�@d�ٞ��@��O��@:ωԇ@#y�{AI@(��`��@.�a��M@2ˊ����@6[v�٥�@:,C�@>;���v@AC/p�@C�����@E�T���@H`Q��ژ@J�Z��@M��x�,C@P8���<b@Q�h��d-@S(�`�Q@T�(��	=@VI���4C@W��ú�@Y�q���r@[Rf�?"@]q���*@^�f^��@`_��A�@aQ��3�@bIN�y@cE���hx@dG.�w�7@eM�X�[�@fYe�/N@gi�m0�u@hF��mx@i�za�L�@j�y��@k�<�D�w@m��~u@n1��k^@ocʙ&n)@pM#�:� @p�ȋ�G@q�z�;r@r,�x�N3@r��!���@swB��}�@t����@tʪ�IK@uw���@v&��΁@v׍
F/$@w��]�?@x?����Y@x��gͩ@y��2��@zjn�J1@{'-�*~�@{���`�d@|�C,�<        ?���ڬ�u?�\�C�c?��d��j�?�j��t�6?�0��vB)@P�8"@
�y�޲�@�%���@�_�ytf@Ą�!�@��/�IE@!'c
%��@#�d`��S@&F��V6z@)���@+޳&qgi@.բ�)�@0�	��-�@2��F�=R@4.Z�\�@5�׽{Ԡ@7���}&�@9eP�O@;:�*f�@=wY�m@?	�N9(@@�LEz�@A�Q`T��@B���F�@C��{�b�@D�κ���@E��
G>@F�-ҭ��@G�-�h*0@I#�5~�@JN@1�K@K}#�TA�@L�|/��!@M�4�oO@O$7OPo@P27Z���@P�cYW@Qx�p�@R�k�<�@R�޵�l�@Sp�����@T��b*@Tʞ;��-@Uz;�ig�@V+����P@V��[�-@W���:�C@XJ7q]�@Yj]6�@Y�>L��@Zw����{@[4�9�md@[�e�E�@\���ct�@]ul��@^8����@^���C�7@_���h        ?��	�?�?��\�t?�q���?�,�A�@�sa9h@6�7
�@ăOS�@"f\,�c@�X�
=@"Y
d��@%�� 24F@)����@-�I m�@1.e�jW@3������@6 �g@�2@8��˹��@;W��+�}@>4O���x@@�?]|��@B&o���@C�B?�U�@Eo�H �T@G+L����@H��p�s@J�����@L�?[��
@N���s��@PW��T6@Q`�#�@RpO���b@S����9A@T���o)@U�Z~w�2@V�r�ϖ�@X!���WA@YX�P�1�@Z�ܧx��@[�(�zJ@]"{pxK�@^q�$`Y�@_�8+���@`�:2(H�@aA�MaN@a�(���@b�h�ȫ@cdw�0�@d N?"w�@d���w�@e�5Y]r�@fd6��{�@g*�+���@g�/����@h��@i���f"�@j_�r��P@k3$p�)�@l	/@���@l��u��@m��)�x�@n���j�@oyԥR�@p-�ʄ�Q        ?���/��?�;�V��\?���@9�?�|�-�0I@gCk<{@`�Ӎ@N��h��@�d/1@`�����@!�5�f�@%bz��\�@)&h�f�@-/uS�ɥ@0�cO��@3�9g@5m�ˏ�@7��B�r�@:��k`��@=c�Ʒ��@@$e)6v�@A������@C5ˆ6P@D�Pk�h�@F����@H;�����@Jxg2]&@Kڰ�j�@M�V�z*�@O�:Y��@P֖��b�@Q��.�@R�ʊ#�f@S��^�P@UD�i@V0d��X@WT����>@X~���@Y�7͕�@Z���R;@\ X�n��@]ajO���@^���"�@_����@`����@aND��@a��]p@b�x�O@c_�\��@dOX6@d�/�{�)@e���
'@fD�|y:@g�S��@g��$(�@h�Ԓ�nY@iP:����@j�X���@j��5]��@k�<�T�@l�~���d@mR���+@n%�ђK@n�ڻ[Ð        ?���L�î?�-�@z?���i2@
g�f;�@��t�9@�B4Y@"����@'��#��@-��ش@1�E铽�@5=m�J��@8̓hS�{@<��b�yr@@GE5�V�@B]��a�S@D�E��@F�k�
(@I/q�8n@K��* ��@N+�L�	�@Pd�O�=@Q�Q[ۙ�@S!�`�#�@T�YПC@V�w@W�UA^n�@Y��!�@Z�Zv{@\=����@]Ꮊ���@_��?	h@`�.p:�T@aovS�@ba�����@cG���0�@d1P�̘�@e�& �@f��R�@g0 �m~@g��DyJ@h�e��~�@i��y�U@j��;A��@k�����@m�w�@nx�M��@obk@,�@pr��@p��L�@q,/OM�@q��� B@rF�oʣ@r�-e:@sf���@s���,�@t�8�CP@u ؿ7^�@u����x�@vM�.	��@v�Ws��@w�:1@x�j�@x��b��k        ?�+]�|�?�cG�?���w{C�?��U�*?���w�K�@q/�̞s@	�Vj�g@8_����@�b�@�71z\�@'+�Nh}@ Q�጖�@"�ܶo@%&�a��@'�Ab�� @*j��@-2v.�6@0	�d�o�@1�l>��H@3�*�܆@4�H���@6@�Ҽ�
@7�tv�O@9��ב�@;\�8ghF@=%��O�@>�X�Yj@@j%E��o@A] _�*@BT=��@CP��%Y�@DQqX�@EUܥ�)@F^�����@GlU����@H}��'�@I�[���@J��Kl�@K�Fexz?@L�u:�;�@NTE���@O8�,6��@P2hB�r�@P�%��~L@Qc����@Q�����@R��Yr��@S:<e�@S�1�{�q@T{��B��@Ue���|@U�h��h�@Vj�?a/@W$5lw@W�ԃU�@Xhk.�2@Y�xT�@Y�3��@Zr܅e?.@[$&�9�@[��		8@\�%��;@]@эMH        ?�U�d$�u?�����?�W�
�?�<JU�$@o}�J@
 ��<@b�JՇz@[I�w�^@��B@ �m!2J@$NM��6�@'ᯯ!�@+����B@/���H~@2�d��@4X�Q�8@6�ݾ_&�@9D�sϬ@;檞��Z@>�^ǜ�@@�'zv<�@B;�D�>@CċFu'�@E[�T�@F��R%�-@H�n�f�>@Jl�
��@L7
�m@N���p@O�T�n-@P��$5*@Q��'0'�@R����2�@S���Ϋ@U"��N�@V&!+Js@W4�%��s@XS��yB@Yw�e�nY@Z�D8�<�@[��r�
@]�c��u@^<�>*�@_zM���@`^~)N� @a?��j?@a�c���@bP�(�Q�@b��`�$�@c��Ը�@dX&�f&@e	���@e���>g^@fs���Z@g+��j��@g��8߮@h�P�_�@i`��1Ҝ@j!<,��@j㿳�@k�C��ee@ln�u�>�@m75��+        ?�V,�$T?ޞ�y/$#?�'XvS21?���&��@3[�'@�Lc]t�@�\$�@�b'�@�Wn_Qn@#]��˻S@'!ͮ��(@+2�o�@/��2H^�@2
��9g@4�����U@7&0�~"@9�Z�@@<�z7��@?��zq�@An=ڟ)@C3��	�@D�+%.#�@F}�� h�@HM8�z�l@J+��C�@L���~@NB���@PʗeD(@Q�&\@@R1�|���@SL����7@Tn�����@U��y1C�@V�Ms|g�@W�����I@Y:�m�\@Z}�}��D@[�لG��@]1:��@^n�m��@_�X_�@`���ڄ@aK�ӈS@b ܆�>@b�ier�@cz��b@d:��¡@d��_��@e��J_h�@f���p|�@gX�.o�@h&?�N��@h����,@iʭF��'@j��Z�@ky�s��@lU(�� @m3/6#�@n����@n��P�G@oܔ"L@pb_r�z]@p׳).�        ?����j��?�Ί }v	?�I+Ӫv@
��i�6@<��Y@k9���@"���8@(/��{@. h�@۸@2*����@5����@98�q�w@=ku�@@�QR���@B��Y�2@D�6 x=�@GS����@I����k|@LM��P�@N���iJ�@P�_�b�@R8�7��@S��#Q�<@U&ç��@V��l~Y�@X>�G�T@Ŷٰ@�@[~�m��@]-xL��n@^�����@`S��FP�@a9'0���@b#s��@c|�~��@d:�-@d�@�@e�{w��@f����o[@g�?x>`�@i ��0�@j�pж@kz��@l.�".@mD�\�@n_�.3�@o}zR@pORqۇ�@p��v���@qv'�"@r(����@r��5z�@s=@a_�@s�N��@tu��q@u[".~�@u�QϤj@vT�[�8@v�~�C�@w��O3��@xCٜ�@x����@y�bj�h@z?S[        ?�NM�2�9?֑_���?���	љ?���j�2?���8}�@���jK�@z�yѝ@k6J��n@n4�o�Z@�lAY#6@]_#Y`@!���6@$4�V!�@&��0C*V@)��*�I@,�jvLWD@/�@���@1y�H���@3���9�@4�|8B1@6�"�b�@8d&ʔ��@:@j\�f@<)��Q��@>���L�@@�l��@AC~���@B%��H��@C8�Z4� @DQ��_�@Ep>B��Y@F�n�V�@G�:TU@H�*��;�@J!�X�%�@K[��r3@L��ڦ}@M�P�J��@O%�E�T�@P9��W��@P��?��@Q�Lҋ��@R<Ԧb�@R�1�Ygg@S���H@TS	A�^@U	��G[�@UK�@V}`��^@W:O�]��@W�G��s�@X�Cp��@Y}<H1@ZB+ġ��@[	
�@[������@\�m�rȬ@]hಓ�@^7�~��@_aq�-@_��SP@`V��A�@`��՚�t        ?��q��W[?�ok�*�?��~�)��?�Y��؃�@
,=��@BS�S��@��7t@M�F]�t@Tk�T�@"{ �A@&�0N�@)�����0@..1g.@1R��隦@3�@,&�X@62n��R�@8՘�&F�@;�5	U�@>���@@����<@BU�d/k�@C��Ԏ��@E�H�O��@Gm/e�1@I>U��o�@K�>���@M���^�@Oll���@P���}�(@Q�*��f@R���3@S��`�@T��ny�@V)&y��@WC����@XzM<`�`@Y�?w?�*@Z��e�~@\D�.Ւ�@]���͕@^��] U@`#�_7��@`�:<�~�@a��C3�S@b@����@b�DR�G+@c�z �`@dx�	�3@e;{nS!@f5��c�@fɷrd	@g���l'r@hb�Xu�@i3�@�m@j�5���@j�����@k�y�F�@l���� R@mn_(@nN�%}e�@o1c��?@pO�`u�@p&�HR�        ?�Ε�k2z?�aai��q?��zb�L�?��o�'�@�y�]	y@�G��@h��?@�@���,P@�IRf��@!���P�@%~tr�@)FH�V�@-SW��P�@0�%����@3�>�0�@5�
Oᥡ@84����@:����͍@=��H?u@@4[J�I�@A��^V�6@CGyb�Ƽ@D��zpY`@F�^��X0@HO��-�=@JS\�-q@K�U�Ħ�@M��J��)@O�t��E@P��@x�@Q�dUdd�@R��P@T�f9��@U{A�f@V>�H}h@Wb�v�\�@X�J)��&@Y���T�@Z���d@\/�����@]p�;�c�@^��*��b@`s�@`�۟n-J@aVX;R��@bp�=�@b�6��@chQ�I��@dT`$@d�7>@e�����@fM��|�@g=r��@g��z�@h�Շi@iYR��vg@j!�3-p@j����@k��-5�(@l��r�X�@mY����@n-V!2�@o�<ǳ�        ?�8�{C�?�;�ҡϳ?��̚
8@j����@|�d��;@�Q�?��@#"KV�@@(v��v�R@.V_�/��@2\����9@5̄T�@9w��D�@=[�zK��@@����>@B�f;�l@E#?��@G|�K�L@I��r���@Lv�"U�@O���г@P�v&㩅@RJ�^j��@S����;�@U5�D�@V�wI�f#@XG�x�@Yߡ��@[�Rt��@]+�9�	@^�w�҅@`N ��a@a0��oS@b���v9@c?�n�@c��^�^@d���}@e�\o�F*@fذ�ۏ�@g�ܐAd�@h�ͽ�o@i�s#@��@j뻧�{�@k���(�@m
�0�{@n�-��@o7�75�@p)��� +@p�&g�+�@qJ-B+�@q���4�@rp�� ��@s���sy@s�����@t6�p���@tм�2O�@ulN���:@v	D�7�,@v�����@wG?�Ƈ@w�6�g��@x�t��i�@y-��K�@yҪ��^        ?��gaQ��?�N�u��?�CS�8?���-�?�����@��A�@A����@Kaj ?@K��x�e@�X�\�h@8�'�:�@!��!�^	@$#qU�JO@&�@�{,�@)��մK�@,��b}T@/�� @1r�����@3�	�S@4��'�r@6�efR�@8]D��4�@:9,P�[@<!��'<@>�"T8�@@�$�@A�����@Bq�'@C1MrZ-@DIW"�@Efl�|�@F�'l��\@G�3��]A@H�{i�N@J�5�X�@KH]����@L��e��@M����66@O�da"�@P+C�`Խ@P����x!@Q|�ㅙ@R(��k�(@R��Y�@S�9���@T9��;�@T�-�Jt@U��>D@V]B,~�@W���;@W�Ih�`@X��8?��@YS0@ZV���S@Z�ux>x�@[�k��@\g2F!�D@]0��y$@]�Jp&@^�ƨ��@_��Rr�S@`4ή�@`�)�"�        ?��'}�}?���HA J?�al���?��`�,D@��gy��@ڮ��d7@���I�@�	���@�ۘK��@"7p��Y@%�"�JRV@)�Do�H�@-�?5^@1N���?@3chor@@5�!x�y�@8nW��@;$6��%r@=�	�"��@@w|ȪN@B>J#�@C����u@EA��h�:@F��P3]�@H��^�W@J�x!���@Ln� wnS@N\�����@P+�P�0=@Q0C1f�@R;��`@SL@Yb?�@Tcȥ^2K@U��p*5S@V�x��=i@W�t�hД@X�m�5~=@Z5N�7}J@[q5"�[@\���@]���i19@_F~(T)&@`Lo�pG�@`�a4�@a�
��>�@bXeI=8@chPUb@c� ���@d|H< �z@e8P�7u@e�k�
�@f�Cu�'@gz�1���@h@YKB�k@i����@i�F	�r@j����@koF���@l@�V}ڑ@m�儉P@m�A|@n����@o���{,.        ?��r���?ܧ��8��?�?�*�l#?��6m�m|@��qFU�@��-س�@��N�j�@� ��@�xC�@"<���p�@%�3�@_�@)�U����@-�`T��@1�d��@3hHn�R@5��s@8t��n�\@;+��Z�H@>�/`�@@|T*�@B��
�@C�eT�w\@EH�N�&@G 2��4B@H����^q@J�����@L|	ޱ�@Nk�m�2R@P4�BF��@Q:Y(^�O@RF�&&��@SYJ~�@Tr~G���@U���M@V��˲=�@W��.~I@Y#�B�	@ZNUx47\@[�y����@\�|y��@^JwL��@_iЯ<l@`_~��7�@aߒ�W�@a���_@bo���%�@c%oX:Cy@cݦ���t@d�~�`�@eU"9@f��<��@f�zŕ03@g��_��\@hev̿@i/EL/�@i�j����@j�0%O]@k�OU�Q�@ln�)֧�@mDz�5�@nw��e�@n���38�@o�6J�        ?Ѽ�T���?�w���%O?���e��@
W�{�k@�8�r��@�V���@"��oT�s@'�egG7�@-���>@1�
i�@51G�P�@8�9G��@<�?�� �@@=��؇�@BRS�ئ@D� ��@F�i�@I�f0G�@K��߳e@N����@PW�%��@Q�R!�_@S~m.�{@TzP�q~�@U�]3�0@Wl-?��@X�x��@Z���ǂs@\���+u@]��>yW@_b���@`���P@ae��@bF�
�@c*q�e�@d��- �@d��||�@e��M�4P@f�b�S3!@g�=���@h�|��-@i���MS@j�ꦕ�@k���# a@l�;�"5(@mܞp��@@n�.
��@o���S�@p��`�a@qt^|G@q��e&NA@r*|�py�@r���M��@sJF���{@s�D�.�@to��K�@uR:�
@u�U���o@v1�{�@v�8zn�@wd
'��@w�ݹ&@x�S���I        ?��ϕ��?�aO���m?�V?�.�?��վ���?�Å>��@���@b��E�@a�&@g��*=@�Qcƞ�@e�o� �@!�8¦�x@$D�����@' ܫp��@)ݚ?�F@,��8-4@@/����G3@1����[@3B��q�@4���|�$@6��~گ[@8�(r�@�@:z�MW�@<j��r@>g��{aL@@8��Q�@AC�����@BU&C�]@Cl�B�! @D���I�@E�^�{�@F�t���@H/��@I9s�K
{@Js#�>�!@K�&)h�D@L�d�N�:@N?�l���@O�HQ��2@Pp娘��@Q"�h@Q�Ӥ��b@R|��V�@S0m*��@S�FĎ:�@T�t�6@UX�}v@V�> �@VԶx�@W��:'�@XYd��]�@Y�t�zW@Y� @�@Z��Q�y�@[|j\��@\Jbю�@]iMA3@]�{>d(@^���k0�@_���m�@`7g(�՟@`�p5/�@apE<��        ?��rg��E?���J͕?�MG��%�?��QA@��!xn@������@��Y*!:@�yd,N�@�����\@"j��m@%�b��f%@)c�	�mI@-tB��z�@0�[����@3/ڰ�Z�@5� j@�k@8(7��	@:��e$^5@=���\7@@C�}!@A�l�C�@CY�#�5@D�t�AhG@F�y �iM@Hf���l	@J1f�Ϋ@L	�iQ�g@M���OJv@O�ݦ�c
@P�|����@Q���>4�@S�\�@T��N�@U0�ÚI@VP#7���@Wu\�[b�@X��b��@Y�}�k�@[>i�Y@\D�����@]����30@^�g9qH�@`��V+*@`����@ab�ʊ�@br� �@b��˼@cvN���@d,�ח��@d�O9}O@e��h�&@f^7�B�@gRI�I@g��|Y[�@h��U�@il�V�w|@j6tM�Y@kI����@k�d�� �@l��$&{@msV}�6R@nH"��7�@o[��s        ?��#��?�u�.�˒?���&e?���[���@����@��+�;�@m��|�@���T�M@�"4�f�@!�(FU�@%�����@)GZNn�@-Sl��@0�Zc�Rw@3�eX8@5��2@8-i��@:�s�,�@=xN��&@@.
?���@A��au �@C=��`�1@D��ġ��@F�8���.@H??�AP:@J�4�KW@Kپt�@M��c/�@O����X�@P��?�F@@Q�p�Men@R�N}d@S�I�<�@UK%,��@V!:)�_.@WB����!@Xj~�'ı@Y���x�B@Z�_�yB@\��-�@]@+�LX@^�v+~S@_�E0)�@@`�RMym@a5��pE�@a�X�%��@b��SI�@c@X�Q�g@c���z@d�E�e�@e`���@f.J��w@f׶Ĳ�E@g��T���@hW�Ɉ��@i��sĀ@i�9�ï�@j�ʸe9L@kqy\�I�@l=>J�47@m_c�X@m�����@n�̦{��        ?�_py��?�t�B���?��mS`�O@:ئ�'�@��Ώ@4���@#N�?c�E@(�)��ܩ@.��2v@2�����3@6��i�@9ҍ_7;@=���7� @@�O�q_)@C4>�Ơ�@E�謣�r@G�~eH�@JpA��h6@M���@O����L�@QD~/�v�@R���%�@T0��)�`@U�D��]�@WH|�Z�b@X�)���@Z��Y^*@\:]�q�@]����x�@_��zL@`�e K�@a��e��@b���j@c�� ���@d���䩧@e��(�d@f��՗��@g�nUfrk@h����t@i���}�@j�	g���@k�jx!�9@l�oup�@n�B*�@o#EvIiI@p#А��@p��ku@qM��b�@q���,@r~[��Y�@sRS�kt@s���s��@tTC���@t�3��|�@u��9��@v8��9"�@vݬ��O�@w��ަ��@x+ߧ��q@x�J�r�a@y�;^_�@z,��j@zژ���        ?���r�Ɓ?Օ�J%?掑,�t�?�&����?��M�V��@'Sx3��@
�����b@�<�Y�S@�Եx�@*�s�@�}�^@!J��N�@#�3��|�@&��p�`T@)[_u�@,J��X�@/W�z��@1A1j�?�@2�+Rj@4�r4�@6U)��@8!�B���@9�m�@;���@=��HD�&@?�i�Y�#@@�^�ߔ@A���x�P@C�ڦȥ@D%KkޯH@EB�gA�$@Few,m�@G�����i@H�����@I�A"RN�@K'����W@Le�֊W@M�.�k&C@N���k�@P~O{l,@PȹR�+�@Qtm���+@R"��W�l@R� NM=@S�ȼ�{@T;X��@T��Uxx@U��`�)@Vi�1X�@W'~�9(@W�$�*�3@X������@Yo���H@Z7)�}/v@[ v����@[��M��@\�]kJM�@]h����@^:{�f�r@_�׍�@_��VN�@`]w����@`����        ?�i��y?ܲ�
��f?� ���?���C�5�@��8we@��~S-�@pxX�s�@����3O@�d��d@" ��eGl@%�#J���@)G��~E@-SL�A�@0��\1��@3����-@5����!�@8)�ö�@:�a�,�@=r�z��@@*iJpKq@A��Y��@C7��8�o@Dӑ-�@F}"HY�@H46N���@I����q�@K��A!�0@M�)RF��@O���$�@P��XlQ@Qƿ���C@R�o1u�r@S��}��@T�o~�h�@V���@W'K���@XK�J0-�@YuV	I@Z�z2��@[��>�S�@]��⬢@^Qyi"c�@_�l/f��@`o3K�>@a,K �@a���[��@bks���,@c�r� �@c�X}x*@d}X,/�@e2�`�~^@e�X�@j-@f�N: �!@g`����$@hF/֛@h߸360�@i����@jg�d���@k.��_�@k�U�/�@l��tl��@m�l�l�@na��H�        ?�b�-�y?�n�wq��?����?���&���@=j�l�@�9_�	/@�y%�j@��y/@���8@"����@&:|q��@*2і�P@.I���C�@1\\�1��@3�%D6~@6.�9�C@8���d�@;���|n@>W��h�#@@��!�Z�@B0�̣@C��)�@Em됌��@G!ګ�l[@H�m0�M	@J�b�S�@L�|ؑ��@Nw��h%%@P6��l�+@Q7���a�@R>�22D@SLA�k�@T_�W��d@Ux��@V�xYS��@W��6�tp@X�g�@Z�a�@[J�!9W-@\���5@]�z{jaw@_	1�~�A@`)�L��!@`��x>R@az��|:�@b'"F�@b���D8@c��_	�;@d:_KD �@d��:�@e�":�@fbf����@g��h�@gݑ��� @h�h��0@iac��Z@j&y� �@j�����@k��j	n@l�/��v�@mO�.�L�@n�C��@n��6�C        ?��h�F�?�b��f�@ w� D�!@k��@Sl��Sp@���K@#�:)�E@)�a�hJ�@/�T����@35	Ѵ�@6ӈ&���@:��<Z�@>ͮV9�@A�%9�J�@C�Ӫ��@F<��F�]@H�����@KR$*l#�@N����@Pe��4�b@Q�A��6t@SRI�l��@Tٰ�|(@Vl;��3@X	�aZB�@Y��&�2�@[dxyrh@]!b�U$�@^�cT��I@`\�����@aI��q@b<>�@c2�fʵ@d.I�xw�@e.A�8��@f2�_)	@g;�!���@hH�����@iZ5�1a@jo藁�@k��Ba-M@l���m�@m��C��d@n���_S�@p��E@p���f�@q<�"�@q�=ɝ�i@rs��&�@s�βu@s�-�D)�@tTIՂ�@t��X���@u��4�@vD""O��@v��lN��@w�P�ɨ�@xCf�p�@x�!W��@y�}?3��@zQw%�R�@{�j��@{�6g�L�        ?����>��?��/�"?�..Ż?��=N��?�|���@�=��@'a>��@<�{%�f@;;�%�>@�����@# �+�@!���p�|@$wl䮙@&���cL@)���J�@,��ž\M@/���٦@1d��]@3	��p�2@4�DREm�@6|~.�/@8J�~��@:$����@<�6�Y�@=���O��@?��Is.@A6���@BjIO�@C$����@D<i� ��@EZ
���(@F}J��@G�q�-@H�D�E��@J��ys@K@����@L~�BW�@M��ױo@O	�K��@P+w����@P�m�ؽ�@Q�g;�&@R-�*�z@Rݜ/T��@S��ƴ��@TD����@T���c�@U���+�u@Vp!b@W-��@W�n��Z�@X�R.���@YsX)�U�@Z9{��@[�"�[�@[����@\�Z�;�@]f��Ll�@^7
w*f�@_	U<ֽi@_݌��@`Y�1y�@`��:��;        ?�9z��l�?��'��?�7�% %?��{�5S@AA�+�U@�����4@��$��@~߁ ��@�C��)@"�6gk{�@&3����g@*�!D@�@.D����@1[�c�@3��>��@62o��@8�B���@;���t<�@>i�z�{@@�>9�2@B@��[�@Cݵ��/@E�n �<@GC�q��@I����@J���W^@L�>�-0@N�=A�@P^^����@Qej�
$�@Rs%J�@S�P���@T� O�;@U�P�S�@V�{���4@X%��$�@YL�Y�@Z� S��@[�P�Q�@]$���@^X(�_��@_�uSF7@`��&�DH@a/��bB@a��ݤ@b�u�ȱ@cL��Wg)@dd/�Ze@d��*}�@e����M@fC��q9�@gR�=�$@g�Lh���@h��BBp�@id�7� �@j3Y��@D@kQ�i�I@k׸j#<�@l�����v@m��r�x@n`R~J��@o=B��#@pD���        ?�$9�,�?�!b�A�?쑥���W?�t��@���T��@
=k3��@�y��9�@�	J�%@��;��@!&<��%@$sx5{̆@(
�z��@+��~�c@/�
ғ#@2(� �ѽ@4r� �Q�@6ں����@9`>�pd@<ʌ�H@>��M&��@@Ά���@BI��C@C�儘�@Ei:z�e@G��$�@H�QG:q@Jz8��6�@LC��P�Q@N��]k@O��~-~@P�#�t�@Q�&%�	@R���9�@S������@U�q[iF@V���@W9e8g�@XW��%��@Y{�'k�@Z�MZI��@[����(�@]��	ܰ@^@d��b�@_~'rK�9@``j��z@a.y<�@a�X6�9�@bR���@b����@c��qG0�@dZc�	�'@e-o1E@e����@fv)q�A�@g.x�j�@g����@h�����@idOl��@j%+�-8@j� ��C=@k�*1��D@ltC�|an@m=i��mF        ?�#���]?��}#�Z?��!���b@
����@ieh�V�@��#�i@#����s@(b��p�=@.@5^~<)@2Q�8N,@5����-L@9m�Ju@=R�3�8�@@�%��@B���@E%V�u�@G����'@I��x�2�@L���-�@O'�/�8@P�2�� @RY�6��@S���M�@UK/6�u@V�oW��)@Xf���@Z��l�@[�����|@]Y��~�@_��c�@`k�]��@aQ�.���@b<�rv�}@c,.B(�@d�"8�@e��]�@f9~�z'@g�˥��@h>_�=�@i!�]��<@j.s��s�@k>�-1�@lSS5EZ@mk{���@n�`	A�s@o���©@pe۔�@p�|>���@q���~�@r$�����@r��б�@sWX�-��@s�>�)E5@t��^��@u/�f��I@uЌQT�@vr��8��@w}���@w��
�X@xbfp�@y
��d?@y�m�bp@z_xO*        ?��T�B?օ�� ?����?��o���?�
4�|@�$�$�@�%�3W�@��7u��@���j�@zK��%@���$@!����,�@$�yN�A+@'GI�{@*,?�sKo@-1	�K�P@0*2b+?@1ʲ�xi@3y�Sܕ@56��@7/uB��@8�2e�%@:�L�<�@<�4(�@>��0-$@@\�)r@Ag��d=�@Bx����@C�JYe)p@D�h���[@E��E:G@F��i��@H�0xq@IQ%�u�d@J�lg��f@KªB��@M˨1�@NG�C]�{@O�d��L�@Po�{O��@QN�C'Z@Q�aBQ�@Rr�����@S#$��c�@S�v�ڕ@T����@U@w?��@U����@V�ǋ�}�@Wp~l0��@X/8wZi+@X���~@Y�����@ZwL�a3@[=�X��@\zIt�@\��+�G'@]�kwt7�@^k����@_;�O�@`p�=<@`p��H&�@`��$�        ?��8�i?ޚ�~�]?�	����d?�h��p�@���v@\�I�W�@������@5IC��@maA]��@# �~@&�6�:�@*�yf<@/��/�@1�sw�@4Al��܈@6�'8�An@9y��	9u@<GE�j�@?3�e�߹@AѼ��^@B���@DX��i:@F�~��:@G̷�^�@I���9�@Kx�gܺ�@Mc\:�@O[@3�.�@P�!`1�@Q����8@R�`��@S��4꜄@T���$�@VF�M+�@WB��C�@Xpi�9��@Y���=)N@Zܕ��O@\�D�@]_��+@^��7��@_�T���@`����o@aRS��@@b��Y�@b�<�[�@cgq�r�*@d��w@d�25��o@e���/�@fP�����@g���@g�.�� &@h��-b$@i^�a�#@j(@�̏�@j�dcʢ@k�cs&�y@l�6�y��@mc/yT�"@n7Il�h�@o� 5��@o�ο�y�        ?�!wI�j?���^�?�C�X�s�?��Ea I�@>��@��"��@�i���@��=\�\@ ���/@#��h$�@'w�'h�+@+��D�N@0q�(��@2dA`���@4��B�@7�=Uʛ�@:W�ً@=C�G. �@@)=nxl�@A�sy <�@Cj7�RO@E#HU�H@F�d�ǽv@H�O^��3@J�ʠ
�X@L��,�v�@N�~q�@Pa R�~@QsSH�/�@R��:��C@S�;Zv7@TԷn��:@V��t(@W89+ޡ@Xth[.@Y�zz��(@Z�i�.'�@\N�<uc@]�r�1`@_ _oLԀ@`1;J�F�@`�RL���@a�kd���@bV}@Q�@c~ҵ#p@c�g��YL@d�/P�K@e[�Vzt�@f$:���B@f�o�Q��@g�e��@h��0�*@iat��@j7��U �@k1l��I@k�~�l� @l�a2�\c@m����S@n��$�=�@or<u�'@p-��LW@p�CHQ��@q�V�m@        ?�т,>��?�^�l�ʉ@ t�����@��U�@F���@��A�@#�[Hh�H@)d�hr"@/{��4!@3=����@6��
8V@:jDjg׺@>r�?��@AY ���q@C���1VB@E���]��@HW�6�@J݈B�W\@M{�[��@PDxi��@Q}�e�3@R�]>�/8@TijY�L�@U�ʷX,@W~>Spqg@Y�lP9@Z�g��ai@\f���V9@^8�@_ځk^�R@`��ȿ�&@a��x�)@b�����@c�`>t)�@d��,f�@e�NP�;�@f~�~*��@g�}ٸ@h�)�G�@i�AT@j��\�{@k�ӆ�@l��7�@m�|x#T�@n銱��I@p��x�B@p��1��@q&H����@q�1:[�@rOÑ���@r���:�@s�a��@t:A��p@t�;�Ɂ�@uS��[F@u�����@v���.,@w5�)@w�v��@x~�(�@y%^hk�?@ỳ�L�b@zw�4�        ?�+��'��?ժ�����?�&/?�(8��`?��tӧ��@�
6@
��n�k=@��A#@����@�Mź@q�O�$@!x���@#����X�@&C�U(@@)A�WN@+�f�`��@.��<O�@1 zm� F@2�v��k?@4C�v0@5��v��5@7��4؟�@9�ZJ�@;fbG��@=M�+��@?@���6�@@����!#@A�ӧ��@B�[��6P@C�S�9E�@DԦ��.�@E�A$�v@Ges�+@H3���@I]�9^�h@J��>hN@K��^��@L�����@N7PFf��@Oy��'K@P`p����@QTɋ+@Q�~	�]6@RXㇺT>@S{>���@S�<�@z'@Te��,�@Up��@U�,��@V�FE1�@W=_��t@W�p3�ޙ@X�p�\�G@YtZ�T�@Z5#ԝS�@Z�ķm��@[�3-VI�@\�fZ�P�@]JWR���@^�u��@^�SK3�,@_�Nh]��@`=uDT�        ?�j�w:?ݪقڂ?�=��]�?��)t��@0�R�
@w4�ֲx@T�#@x��: @��}�Y@"���ʎu@&:���d@*$�4܏@.U�n30@1f�1�c�@3�p��c@6E�Խ��@8����}V@;����,�@>���q�@@�k3��@BU+M)f@C�����@E��b<�@G^#g@I(�-�P@K�(�*@L�%��@N�>���@Poɟ��z@Qw���Z=@R�+E�L{@S�2��K�@T��v0Q�@U�x:�@W �=J��@X.��E@Yc���\@Z�]��e�@[ݘS0M�@]#�bB@^o����l@_�|ÇV@`���@a:s/�P�@a�qL@b�_O���@cUᐁM	@d?��.@d��1`�@e�D�UZ@fJ@�Nג@g�<���@g�����@h�ou��@ig|3�h�@j4�ݿ��@k��_$@k�?r���@l��&��@m�t�[@n\gC��@o8��2�@p��Q�        ?��~���X?ܳ�*�s?�FzCUל?��Ol�׳@�W���@�����@�0����@�µx��@�E�4��@"<�S7�@%�B_sļ@)��hW1@-�F�p��@1��c��@3a�O��@5��:�"�@8hBF]5<@;D.���@=�_�)i@@o4k @A�Y�(�@C�s�6r�@E1i�@F��R���@H�����@Js��*/M@LP2���@N:��@P�����@Q�w�@R#����@S1�����@TF�;��@Ua�k��@V�3�@W�EJ+��@X�TM���@Z
8� K�@[B�"6cO@\�8��y	@]�0��Q�@_�i�l @`.�`��@`�Jn�@a� ���1@b5�unf�@b翆�@c�����@dSߗ�W�@e�|b�'@e�/��\@f��Gh~@gJ��j�z@h_�EAV@hԬ�kF@i�a��3�@jhz�拻@k5����@l���~n@l��ɋ%�@m�X�f8}@n��� �@o\J��g        ?ѯ��

F?�^�U	�?��'u��H@
?$���@�o:`@���>~@"�,)���@'�W�^�@-j�qY�m@1�1m�@5 �7��@8��Q@<q%�ڔ@@4L���@BI.��UP@DvI�.��@F��#^�@I��.�@K�-�z�L@N�eh0@PT� Ȅ�@Q����@S��ꛕ@Tz���E@U�ތ�;�@Wn����q@X�i�yJ�@Z�7ro�@\ ��%_@]��)H�k@_m�<#�@`�2���@am���sr@bO2��*�@c4�A�,@d���Y@e���e@e���.c�@f����@g��H{@h��c�!m@i�k��@j�I�/@k�_��/@l����&@n�3V@o �Ɍ@p�?@p����@q.��<@q�X<s@rN�%`�@r���N@st�e�H@t
�f��@t��5U��@u9ҐU�@u�ݱ @�@vn���@w
����@w��+�T�@xH;#c6@x�ķ�n        ?����lJ?�2�4��?�"2�oP?��5�1?�Lw�R�@�6N�4@
��!p�@�UߋJ=@�"À@@�u�y@?0@�Gl@!�Ȃ�@#�T��@&B�����@)�/���@,h:$]@/Ebm�@1 ��-��@2�����@4{;�i��@6=�w.T@8TZ��@9�z#�@;֐���@=�4Mk@?�YEg6Q@@�Zy��@A��@�@Cv���t@D-?��n@ELZ��@FqF�g@G�y�@H�H��?U@I��ъ\�@K8�wE�@Lv�M[��@M�����@Oڙ4@P'MZ�֏@P�����@Qz�6�'H@R(��ǔ@R�w[��@S�;A��@T<�l��@T�:���@U�w�@Vdk;d�7@W a�)�l@W�Rm��@X�5���@Y`'�b@Z#��!+K@Z�<> �I@[���w��@\y��bI@]D�=N�@^Bc��@^ߚp�-@_��#��@`@�r�=�@`�N�q�        ?��&Q]��?�&w�
?�A��Yp�?���8;V�@*�u��@�"�ْ�@��pK��@���ù�@ 3¤�r@#���*{@'vy�_;e@+�]q@dm@0U@�
U@2n����@4�lΠ!N@7��k_@:w@��� @=mqѹ��@@C����@A�ӫ��@C�P�KJ�@EQ��=Ǩ@G"�q�ov@I�*�=k@J�ii�	I@L�I��%�@O	���[p@P��ˌV@Q��GG@R�ˊ���@S�&����@U#��&�@VY޸�vf@W��%@X�C���>@Z&y�E�@[x�@!��@\�yRT@^17U0�@_�X��@`���V@a;��o�@a��$4{@b���p?@c{�C�@dB	��t�@e_��@e��w��e@f�$��8@gy�%��@hN�H�8�@i'�87�@jEJr�@j�K�,��@k�(�v�X@l��D���@m�I�)�@nt~Xy��@o`k:Ӯ@p'�u��M@p�'Ó�@q����@q�\$T0        ?��n�Mx�?�[fB�?��~��?�c�T�W:@W*�;_@@M��t�@Dиo�@��(�{@X��s��@!��9���@%bR��~@))�4��@-7[/�@0�}?!{n@3#'���@5z�W�$�@8��\�@:�0�9�@=~�R���@@4���K@A�٘s`@CL���E@D��1^�U@F�Ba�l�@H\�����@J);|'��@Lx��O�@M�E��@O�n���@P�^>��^@Q��z/�@S�c���@T9Zw�@U5�k7@VV)x�<Y@W|��d��@X��bb@Y�B
Q	@[/FK@\P�B`�@]��E�ݯ@^�u���@`:: R~@`���$Xp@ak1D`@b���@bˋ^�mt@c���!
@d5���E�@d��'�[q@e�E�,��@fh 1,0�@g(3�@g�xA�V@h�$�߮@ivx��)@j?3<1�r@k
���.�@k�	ШL�@l��Cs�@myyI>@nM[�G,s@o#R��        ?ѿX�X��?�ږ���?��VV�-@
cT�U��@ ˼���@��@"�l�Ņh@'���Y�@-��IR��@1�e�k@5QS*�x�@8��:w
@<���z�d@@`��X�^@B~ Ի�@D���I�@GY�
)�@Ii��H�@K�
Lq5]@Nz��nx@P������@Q����F�@SZ8rP�@@T͎S��@VJ��:�o@W�F�I	@Ya8�@{�@Z�KC��@\�L�ۓ@@^G""bP@_�_ʀ7�@`�s��@a�T�G@b��DL@c�/54m@d{-p{4U@em
���-@fb��.��@g\#��@hY@фuB@iZsgd@j^Xٍ�@kf6�@Q@lq��i@m�V�)��@n�|t�@o���d�	@p`V�<@p�P+��%@q}�v�t$@r����x@r��/��@s5�9q$@s�s�	�|@tb�5>k�@t�1xiI�@u�;� �@v0���<�@v͎��]&@wk��N18@xo���o@x�gX�Z�@yN����