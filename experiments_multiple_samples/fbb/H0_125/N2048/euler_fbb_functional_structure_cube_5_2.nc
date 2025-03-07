CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T103611        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?��|>G�?�k��W�?��=I��@X�鱉�@�֪�)@!��j�]b@)��t�|@1����L�@7p�d��I@>n��X@BɎ�͎�@G
@�f�@K�:���@P��#I@Sz�$}@V�F��@Z8���>@^)�)��@a!(�q1w@cgǴ��@e��h���@h�j��,@kb�����@nv���@p�F?z�@r��3E�<@t�����)@v�&�CK@x�	X�/�@z�U�N�@}M"U�:h@�#�Vn�@�8p��D@���o��`@�I9g@�� �,�@�$��\8�@��)q�T!@���3��@�K�ɜQ@�&�l$��@�	����@�� ���@��xV@@�"���@�;��`y@�]��AI�@��¯	��@���#L�@��M���_@�:�~#�@���f\E @�ڵ^�@�6�YwI�@��D��
@����$�@�>n@T@�@��A_I�@���y؞m@�����@�RkJ��@�"�iF@������        ?�j���O?�"��Q=:?�)�U8��@e';�Ӿ@�@���@#W*�`a@.QHc	N�@6{M�A�a@@<�P�@F%
��[�@Mۻ�ޤ7@S���g�@Y��/�K@`I����g@dwP���@i`+qF)�@o�	�A@r�J�9�@v��r�@z�`�~y@���U�@�z���@�q�6]�d@����A@�@�R,Ŧ�@�!��r@�F�1t_@���f "@�o�@���z��@��;�7ά@��O�!��@���_@��@�i��gZ@�S��4�@�]~U8Dl@��.Ⰴ@����#P�@�D���P@�lɴr�b@����G�@�;u=�@����x ^@�[m�y�P@�Swr�@��)�$�@���^}@��Gzz@��"�#�u@��^��;g@�ݬh�P@�E��d�@ă�d��@�τ��B@�)���P|@Ȓ��ZQ@�
|�9_@ˑ�j��.@�(B��@��T�5�@�BP˶y�@�%���w�@���.�        ?�I(z��?�9��EKX?����,#@K��@!���7�@.41\�@7�O-	�@A����@H���%r�@QH��z\P@Wb�w�@_	�o�l�@dBT~��@jY�f�@p��ﮎ@t����]@y��7^��@~��d6�@����p@��}���@�d�Z�@@�1;�ժ@���z��@�!P���@�� ׂ��@�p�=���@��\UA/@�m/�1@���;N@�R���@�<���@�]��l9�@��8�Ĳ�@��3�1��@��&{x0�@��kˋ#�@��@���@���Z���@�H�?fH�@��h���&@�,��F�@"[��7@����Y�@�cNB�@���F6�@�u��@���|�@˸�)?)@�l	���@�*ROS�H@�y��@�b�إ�}@�Q""9�@�C�է� @�:��jH�@�6H���@�5����@�8����d@�?���wh@�J��fM@�X�H�u@�j{-�g@�UUius        @8p3D{�@k_#n��@���h��@�w�M��@�-Q�FV@�,��u�@�X�0�n@�2L�D�F@ʛ�ǡ@��(�c�@�2&:�@ٹ��.ji@��U	Y�}@�H_~`s�@�j��"(~@�ٵ�a�@�S��W:@�V�껠�@�f��%�@��W�4�@��FH�Zc@�I�M��@�C:Ed�.A 9	)i>A�a�)�&A���ӻfA�8�	��A��]�ɖA	�����sA(N����A��單1A��ü՘A�V�*�|A?���ۆA����{A4�$s�A�f�$Ah�Y]>A���5�A��{D��A�qy��A Kӿ$�A!E��v�A"G<;tgA#QqW��A$c����
A%~��3A&�Y(���A'ʷ�eA(�)�1iA*7��|�[A+z�ZW�'A,��ב��A.���ӚA/v�aA0m����A1$����A1�C���A2�+�S��A3d���ӫA4..�y&A4�և��A5�M�k�d        ?�~���B?�CA�@�"��q@Ml[�A@!��<O@+��$h@3TO���@:�L~\@@����@�@EQ4*�/@J-5>cs@O�m�� i@R�"5j��@U�� ��@Y)^��@\���"?�@`Hu�N��@bM"�ݓ1@dn`n�x@f���T<G@i,�3�@k��S�w@nT0.�h@ph��D-@q�s2��~@sOƶj@t��VY@vv�+��4@x"rJ�@y���m3�@{� �_��@}��&C�@x�V�#t@����˘M@����!E@�Ӹ��6�@��T��@�zo`@�3s��@�b&��&�@���x-X,@�����@��\�5@�j1��P0@��
:�@�f�}~@�?�����@��D��H�@���)q��@�k����@�,Z��@��z�E�@��ɸDI,@������i@�S�ңc@�'}>|�@���{ 2L@�؜��p�@��x���@��y���F@�Ƈ��7@�j
��@�XFI�F�        ?�4zc�`?�L���?�o�B�i%?�"t��@	T�}��@&,T�J@"�U�@,=�9=�@5+���՗@>����@E��݃�v@M�f!�=o@T3�0���@Z�~��MK@a]o�B��@f4@��{*@k������@qc$l�X@uX�K�m@y�#4�6@!�
\"�@��dE=(n@�ׂP�1�@��N
��@�����<�@�)�4l�@��`��?�@�Gy��@�8y�os@�ga����@��/��u@��s4GP @���V�@��v1!�@�Ms���@��q/��@�\��0H@���T�"@�M\a���@��Ekl�@�cr|:u%@�lJi=@��z?�>@����Շ�@����@��d�ބ1@��M~W�@���LEH@��H�99P@�)ˏc{�@�_�:@-�@š0��)@���Īz@�G��Cܱ@ɭ��%��@���?�s@̟�:�2@�+�E�@��pFJ-�@е��a]=@я�"y��@�q[�r@�YK$��"        ?��YZ�u�?�f��?���]H�@	��۞=�@}%�:�@#	��Z��@,����=�@4�H\wJ@<ˌ�V��@C-�O�@I���"T�@PǾ%���@UqFobD�@Z�����N@`�?��k@d���@h�78��@m���論@q� ��̝@t�t�E\�@xҐ_|}@{�����e@�^�Ү
@�/�Pж@��%�u�@�QJ�+�'@�9��'^�@�_�V1��@�c���A�@�8�at�@�1]�Kx@�Me�W@��
�X�@����Q�@���x<@�YK��&@��N��m@�����@��S� �/@�bkކ�X@�)t��5�@���-�@��͋<�@�=9��@�q�{��@�,`���@�RpQ �n@������%@��'���@����p@�Z�o��@����>�K@�#�6�%@���"�@�����K@�����|�@�!�9t�@��R5��@���a�@¯0���B@Õ�����@ăJ#�&@�wz>��%        @C+���+@uٜ ��4@����/��@��i:m+@�H��O@��sa�@��~�]su@��֋���@���o@�wb�X̬@���?��@ܦ�� �u@��ˈ*�@㻂����@�~^UN@���+�@�O)/��@�p�!��E@�RDp�b@�K��`aQ@�^Q/b�@��om}�@�Ϋ�K8@�.���@�����Q"A A��x�Ay�-��A�}�[!AW�h4|A�sUg!Ao�R�ލA
�^M�A£���A�<�W��AP�s|2A�� �AA��ZGA�ˢ�_A�X-TA������A�ͪ�/�Aĵ����A�A�2�A
Zc���A6�գ�Ai��h�A��s���A�2����A's���vA 9I���_A �9�A!�  ��A";n]�>A"��c��\A#��#�L�A$V�!́A%|���;A%��o��mA&�!?���A'M�iթjA( m3�A(۠��0A)�i|'0        ?��I����?ԘTps�/?��~?ղ@���8@���2@�D��@'�J��S@0z�����@6]��ņ@<�^�7[@A��ި�@F$T'�@J������@O��*���@R���>�(@U��*9�V@X�M�t@\J��L@`���*Y@a��琕@d���'@fV�G��/@h�g&��@k6����I@m�H��@pQ�_�>@q��j(9�@sR�6Dl@t�g�F@v�l�˞�@xg�y�k@zA?ʘ�@|/�z.�^@~2���@�%;�@�:}VkƏ@�Y�đ�@�������@����AP@��"pG�+@�4YM%@����d@��*T1@�7�	��@�����^�@��6,_@��w:��R@���u��@�T���>q@�#Aj=E@��!b�w�@��~��	@��R~��!@���yhL@�}M�6j�@�ltX�Y@�a�o{X@�['B���@�Z�A�5�@�_�q��@�jX�z(�@�ztF��@��0���        ?��M��S?�)؏w��?��0XcP@	�j+�y�@�-���X@$�7z-8�@02�S��@7���4��@@�#s�@G+Z��
s@O@�A��@T��9�ӆ@Z���o@a(
\.�l@e����"�@j���t�@p��K��@t��IB�@x-/��@|�Tnw@�|9x��@��j��I�@�6l3M@�ͳIȕ�@��b �8�@�������@�ܟ�k�@�ec�,$]@�"7��_�@�E����@�@�)_�5@�S}�Y*)@�%��*	@�K���@�(0����@�[�s"'�@��P0��@�+ń���@�d��k+�@��cQ�@�:�R>�@���4�@�\�c��2@�8<c�@�͔=}ʴ@��4R�h#@��q��T@���M{�@�ҧG*�0@��`L
�@�	6�`�@�5^;�@�m�^�@ưX�|�@��yO89�@�Z�d��@���n���@�4���?2@ͳ����@�>����@�kn��O@�<��I�@�kd<dU        ?��f�eQ?�����v@ 3$���p@f0�F@"�}��[@.�GK�T�@7����v@A��w�@G�� ҩ�@O��b9�3@T�ܰe\@Z�}$;�S@`�b�w@e�%.�@i�G�m��@o��^8@s 8�z2@v�/��@z����n�@^�Q�@�?}ID�@��z�(@�8�BMw2@���>��X@�j�D���@��('nf�@���<��@�`��z�-@��&p�%@�Ą�Mq�@�łM���@��@�(W�@���m@@���B�y@���`�H1@��E\���@����� @�3[0Y=I@�����@�*_|���@��l��}@���/F @���X{Z@�/�T�*@��1��x@��JȌX@��"9�0�@��ǂ�@�I��nH@�\�>T��@�{�?��|@ç��wW@����S@�$��!��@�v�Jvn�@�ս �@�A���@˺V��f@�@�Ep�@��yٻ@�8��w@�� d]0@���(��        @6��z�@i!K'���@��!Φ�@��2d;��@��$���;@���4uJ@�����S�@Ċ��/f�@�RB���k@юq���@��5LM�@��c���@�#����@����Յ@�Q%��@�ʍ;,�@�}���@����YS�@�䱥��@�)?�3�@��=y[��@�x��v@���6���@���ЯwAR%�b��A����A�}}� �AH�ۙ�A��LA
S����A �QyA�^ٴ`A!)���AB����Ap��X A�Լ�uVA��X}$cA?ux�,�A����bzAd:��Av���A�A�>v�}AA��'A�g>@�A \�	�A!3��R*�A"B93�A"�vA0�A#�>w�E�A$ѵ�e9�A%���|�vA&����A'�ڦ���A(۔�fdA)�,Bmz{A+	�OX��A,+t1A-Sn�s�A.���PA/��|��A0{5,7A1ADIбA1��\�Y\        ?�`+��ĥ?�9�r�@a����@xIa{�@"y���א@,0���t@3�&��0$@:���b�p@@����@E(tqܧ@I�v4�f�@N�̿[��@R!��VGH@U��a�<@XI"�@[����/�@_M!&L��@a�H��9@c���X@e������@gʩ�r�@j� ��@lQ�� u@n�tK8q<@p�~+S@q���&o@s��q@to&I8�@u�9s��U@w=�"�d?@x����x@zD[��y@{߉� �@}�'Z��@J��MW@��!S�<�@����Q�@�{9��4@�c
��;@��f��D@��y���@��!L��@��,��@�@��x^F
@�G�	%:�@��"��C�@��-�C@���@�P=���@�N�Ŗ'@���ل'U@����uZ@�P(�n�@���$�@���8�c�@�e�-O�@�2��1�@��{�kѓ@���W���@�J�u�2)@�es��@�����@����`�        ?�0nb��D?Ӳ9���?�YJ��@t?�@�,N�3@$`�DtDk@0�l��A�@:$����b@Cb`�e@K�+�ӥ9@S%�^��
@Y�9\�[@`��B�@e枺�U@k�Mo���@qH���٢@u;��:�?@y�v|��w@~�����@�SQ6K�@����펵@�#�Ϧ�W@��k�  @������@����o�@����a�l@�� �Ű0@���_[�@��C#}@���e1@��O4X@��6h)@����}�@�&ͩN�R@�t1H�0@��x��8@�6���F�@��HBh]�@���Ǟ�@�m�73�@����Nx@�����x@�E��@���{�@��5�%�@�ɢ[���@�dA�5��@�n-wv�@8�~�@à�	E��@��Q��
c@��X���t@�=I!�@Ȇ�	s� @�ھ[z�i@�9����@̢�3"\�@����dD@ϔ�!a%�@Ў~�P�@�W���g@�%�1j�%@���U�s7        ?��_ӄ%?�f��O/@���(��@���@�@#��0@."VUDh�@5k
�G�@=eC�P�@C��j'S�@J����R@P�-�4�@U�	�c�@[�d�;C@a�G�{`-@e�8�@��@kw*���@p~���@s�gx�K@w�0H��@|o5G(/@��1��.@��/��@��]E]8�@�h�_װd@�K�&�_�@�DX���]@��36I�x@�
@u؂\@��.�>��@������@�����,�@��h��N"@����};�@�m�M��@�XZ�%c@�^K�Z�@��#*�@���q~@��) ׿@�����@�j��_@�sI�~w@���� �@�`���HQ@��9�*!@�����x@�N����@�G�͟@����F�@�uF>!@�x�_�r@ƫRtm@ß:G��@��j�C�@��"2�@�)�J�8@�n�Q��$@ɿ,MM	�@�}/�_�@̃ӟ�ɵ@��Uu@�y#��rN@Ѓ/��}�        @Z���,��@����	I�@�V��y]�@��b���@���F65@�t���|@�h�ׅ`@�Q����@���p�A�@�1k#[@�P��� 5@�㐠�
@�y�ޝ@�C|��h�@�Q�A���@��nmeW@�9�{���A ��YE}A�24ץA�N��J#A�M�gA	0s�A�J��ӉA�:,�A/��D��Ama�[��A���)�A��AJq�A���3A 0��H�AhC(&VA��6���AVJu�`�A�~���tAs-��:A �e���A!a�CA"?\o���A##B�fKA$���OqA$����A%�	�^(�A&�a}-A'�Mn��CA(�#�[A)�����A*��D��$A+��I5��A-���#A.S
�L?A/��3<A0z�0s�A0���j=�A1!�Y��A1�,���A21m�$_�A2�W�exA3Cڱ�GeA3�*ج�A4Y04��A4�C굤�A5rn@R�(        ?��.��?�����@	��d�G�@�=u�@( �j�6@3T�1Ʋ@;�2���@B�L�M�@H�&�	Y�@O	����-@S/-��7�@W@y��@[��;�Z�@`PH��@b�	���R@e�
ԋ�.@h�q�Gg@lP���̇@o���,	@q�^4@s�a���@v%�^�@xlJ�a��@zݯF��H@}p9B�@����X�@�|0r���@�����Ɋ@��?�M��@��N�@�ʏe�(�@�����1@�U�F�/@�4,���{@�#[��@�������@��ŭI @��@��0�@���@6X�@�����r@��~��@�=��_h�@�v^+6=�@��#����@��²q	�@�P!�i#@��(�Da�@�Ɔ��@�7u�SK@���,��@��ʘ���@�h�X���@�*���@@���梁@���:>@��B���Q@�Y2�}�@�-��TJ�@��S���@���t[�@���2?3O@��^��*@��L��jA        ?�[�V�(?�]&�{��@
�U�?�@ @�Ј�@.��u+m@9��ulX�@C�E���@M���@T^�4#�U@[�Ph��L@bN�q��@g��t�@n#���"�@r�7����@w0R'`V�@|-N�$W�@������@�O���@��Aev�@���y��d@��}֢P@�_ҽ!�@��2%[�@���I�fn@��8(Y@�6��AN@��*A�;@���O�+�@����Ry=@���w�@�[�O�{@�ӏ��@�q1��p@���^�;�@�4Jj�@���fYiR@�8��@���&I��@��2��#@��"O���@��2����@����]�@�X�,2@�um�՗@r��[�@���Z7��@��udo�@�_�Y@ǹ��
��@� ���A�@ʕ18Q�@������@ͦ'�"|@�CB��:�@�w*�@/K@�S�Kn'�@�7r�bN^@�"H���@�HϚ�H@�t��(@�� k7G@�B�	��@�#�{-        ?�qI26QR?튾
���@��W�o�@�)�>n@)wyL��n@4�6�_�@?B_��C@Fs���@O"���c@U����@[�/�|G�@a��C\( @f꼗�5@l���%g@q܏�ᛥ@u��d�@�@z���	c@�U�S�@�� ]E�T@�L���6Y@����w�@�Cy���j@�rY��H
@����7@��D��@��T��@��q���@�X[����@�F!����@�Y����@��v�U6�@������@�����("@�>�6�q@��Σ�@����d�@��h<~-z@�|	�Xpv@�Q���@�?��F�@�I��?�@�l���k@�����@�/Ps�Z@�>I�ٝ@Çk�|��@���&�(>@�D~h��T@Ǹ՗�,@�;�ܞC�@��%�w�@�o{�T	@� %��6@��D!�@���9�M�@�ǫ�[�V@ҿ=�`��@Ӿ��u�&@����>�@��T�f��@��mw��@�R��l�@�1�_        @P��T�_-@���4�@� �]:o�@���DSBC@���:`�A@�i
��ī@������@��UP��@��O� D@��Ꮇ��@�k�v�Z@�PS��f@��:�L@��6�J�r@���Q���@�J����2@��T�zA �_ī�(A�Z�5A&�����Awb�铅A	�"m��A{��H�iA0q�L�A���RA}�����A	K�E��A�;�%)8AQ�1�%�Av)0CA��d��A�$��kA�3�mwA T����A!];��+�A"n��@�A#��Z13�A$�w0��tA%�A}�<�A'���g�A(I��.�A)�(i�%A*�x���A,7�V�IA-������A/�fZ&�A0:�Z�K�A0�Y ��A1��W��A2���A3Jb��f�A4�X��A4� �]�A5�?�#�
A6�
��AA7{�zA8^�;��A9EA~�4�A:/�����A;GU`+A<�
3�A=��Ƞ�A> �(��3        ?�o:�7?��.�M��?�Gvni��?���Y��@%��J@Z�q��@6�v�@!L��"�@&�b``��@-��q�`@2�}�S�@5��Ȉ�
@:V��=�@? �Gu�*@B.s��a@Er���F@HNW�3@Kq���@O0����@Qo�R���@S}�M�l3@U�~蕿@X.�~�@Zp�6��@]��A�@_��x�*@agE���@b����@d��V��@f7����@g� �^��@i��Ɖ@k��'�@m��o@o�����@p��x�\#@r=��@s,]P��-@tZT�N%@u�$���J@v��hI��@xA���@yty��@z�T�O@|;����@}�e�Y�Z@(V*�o�@�V7��@���� @�� ��M@���k�Na@��0�1��@�eI��^�@�C�D(:@�%��	P�@�ag�@��O�5:@��y�>�2@�� ��@��N��B@���aN/�@���{�S�@��q�T�        ?x��M��?�.R<�%�?˾����?���(��?� &RE@�
;@�;=-�b@��7�@$9\%�b7@.9�7��@5�&��@>����!J@D�-�^p�@K������@R8���#@Wsl�bT;@]���D_@b��W�Ѥ@f�h��
@k��}�%t@p��E 9Y@t-n&{@w�x�e?@|��/�D@�ik�Q�@�>���u@��6ۢ�@��ǐ@��;���_@�8T@�@�Ny'��@��y���@�8'��'@���^�z8@��M-L��@��>Ix0�@�k�=N�\@�*c�&Ra@�q��W#@� �J�+�@��[��@�R��2��@��XI���@��x�@�bTa���@��l� p@�4VY5�@��g�P�@�N󹗺�@��I�)��@���T��@������@�h�&�Y@�/���@�5��LuT@�E�ϔ�w@�`,| �@ąV88�@Ŵ|�n�@��j\@�3A��*^@ɂ�� Z@��(��q        ?�:"3���?�`�r� ?�U�i<�K@	w=����@�A_�D�@"���!*�@,_�[T`@4�Ȁp(@=�v�?@C�h{`y @J�BTŕ�@QZ�1�+@VBr��@\��j��@af���8@eJ��e[�@i��U�f@n�%JPP�@r9��@ug����@x��Tk\@|�^���@��n⫖�@�����@��R�l�@��.���H@����)��@�F���}�@���*��g@��X��@��
_��@���w�@����Hh@�]���
@�"��_E@��.�W�@�W�Ҫ�@��vڰV@���,ӧ`@������@�a/TI�@�IԡWƳ@��eN�Q�@�j� &@�]����_@���˘S�@�0;x���@���g_�4@�N��mkr@��v��T@�����i@����VA@���Ȅ~@�������@��6���@���*�@�Hx�@�7��:�@�s���@Ǻ�n�@�b����@�p�o�A/@��,�vns        @1�5���@`�DXɩ@{NR�Ư@�|�:�iY@��:].;�@���R�+�@�x6���@�3FA9�i@��%�pR`@�7�#f�B@�!��Y��@����t@�7�Q��@��r rCF@�\��2�@��`3�C@�ث��?�@�޹af�@����.@�9�g�w@⌾��y�@�s�!d@�t���@菕@�P^@��7��@�\ZK@���K�I@�˯��@�Ub��	@��@�!&̱��@��6��l�@�%Vh&�@����O�v@�a�'��@�B�3@�ֶ����A S@psHAA���MA7�.`6~A4f�u%wA8!��AB�Q�8ATd���zAl�zHqA���BA	�c�A�A
޽�}�|A����AL��j�A��ŰDFA�٬	��A���e+MA;)L�-�A�߂P��A��^QCAN�I�@Aމ
�NA¦����A�Ǒ�AEU�t��AkU��RA�q� �        ?���˗(�?��H�n!?��Z�3@P�3@'%��(@�L���@'*��Z�@/��'h��@4����1
@:HҼ�F�@@7��U��@C��.�0@GM�B��@KO�5�@O� 5�[�@R�Ox�@T������@W)��@Y�L��@\�q��Pn@_ɷ�d��@ayX\%��@c ���}@d��b,32@f�}�US @h��Uq@jܬmMP@l��Qr@n��Q�\�@po��.N�@q�kW�8"@rŦ��Ǆ@t �ˡp6@uF�%�6=@v��_Agw@w���%"`@y[�ar��@z���.��@|Mٸ�<@}�:���@q:%�.N@����[�@�c��k�@�Cr��@�)���L@��i]�7@�
�B��@����L�@��Hx5@��UM{@�"�$�@�;��oo@�\�靸j@���y+�U@��bT1��@��i�^�@��3�@����LcZ@�i-��#Z@����A@������@�W��@�9�)��        ?�B��k��?��mi�yP@!T��
@�^�Y��@-�\���@8 [�\�
@A�Ė�@�@Id�̃Jb@Q@�ӯ��@V�t@xj@]���o.�@b�V[��@g|+���[@m�m*��@q�⌛l@uj��I�,@y����jS@~i�v��	@��"}� ^@������@�<5�I�@�����"@��z/��@�1#���@����0fy@�3����@��/��@�	ѿ�*	@�#̢	(�@��>��^@��%dZ@������`@����R�g@���(�@�Q�V� @��h67Ȗ@��&�$�@��A��k@������@���� +@�����cA@�Z�1��+@�T~�Z�@��Gb�fc@����'�b@��Ss��@��G[Rq@���_6@�BI=H�@�qk0-�@Ŭ��f�@��<�@�Cy�
�.@ɠ@ފ~^@�wV��c@�|#��x@��E��J@υ��$F�@Ѝ���^�@�^��v��@�4��޿@��C��@��t��*        ?���'��?�k�ȳ�?�O��wT�?��6�+�?���p@
�k޽��@�mh��@$�q��h@0$�p�@8�dNj>@B�����@J�r벌�@R��|F@Ym�xH@`���g�@f2ՅT��@l�.�
�d@rD��Z@v�}��x�@{��_�@��t}�@��w;_��@���Ħ+&@�'�C�ǡ@�,�Q�@��;U�T@�Y� �i@��	#'2@����@���1H2@�0-���@���g�G�@���/��@��=�j@�G��p@�/����R@�@P�h�@�{��Ћ�@���*�O@�|�n4B@�FI��B�@��݃��@�;�wR@���.%@����K/@Ƕch-�@�ǇT�Ƀ@��E~�q�@�L�>3Yq@�aj'�l�@Ѯ\> �m@��� �@����@��c�:�@ןW�J�i@�M���(3@��y0�@��q��8P@��>g�a�@�p����@��܆C�@⛍L�93@�ó�R$        @:4bQ׹@oE��?@�[�'�@�)���+@�<�;�@�[)�Ȑ�@�;?��DD@�2B-fͫ@���Y9@�c*)���@֮M];��@�fһ��a@�E�<!q@�t�伬@�	��Պ@�9f)��@��xGh@�V\	o@��j�)J8@���Eh@�����@�7�2=+�@�|�����@��v�t:g@�Q8�	|A �x!HAEf�@sA�=+*0dAV����A����8�A٘�¥A	�r�e�AY�#/�wAeA�Y��|�AO1<�lA>-�h�A4�+NbA3AZ�A9����AH��q:>A_�E8|Aq�2�0A����A�Q���A�J=YAX��ۊA���Z�A�ظ͙�A 02���A ��X8A!�d%\A"c����A#*��� �A#�Dה"TA$�a����A%����A&}�|��A'`#>��sA(GY�zA)3��On�A*$��BwA+S�T�        ?�Q'���?�0�3H/i?��@�,"�@�Z%4�@�jk�@'�K�K@0��V5Y@6� i�4�@=qVA�@B���˭@F�N�ו@K��hMZ@Pdy��>N@S/P�N��@V17R��8@Yjy��A6@\�0�c N@`A�8$rw@b1`�=p5@d<֢ӊr@fd,�A?1@h��ʅ�	@kj;� �@m��;d��@p˻�@@qjQ3��N@rԱ��ʃ@tN�#ĝ@uֵ^�@wn�E�X@y1�?@z�J�|�h@|�m��@~j�[�	H@�({�'b@�#�i���@�&΢`Ƅ@�2�cQ�@�Eh��-�@�`ëӳ�@�����@����N��@��^EJd]@�
�LZ5@�[�U7-�@��0��oI@��0�+5@�E};�й@�O��@x@� ��Y@��@o��@�if1@�@�"����@��󧒒;@��vB=W�@�a(���@�'�߅�@��3�T7@���t��@��o����@�_�/��@�6B�ڰ@�C�pU{        ?�o�FZq?�v�Z�2�?�HT��[@ �8��@�Y�k�v@Q�� �@#]6RF��@,ET{8�@3�y`<��@;r4)�R;@By_�F$Y@HjUCX@O�V�:Q_@TUQb��@Y�h���a@`	��O�@cɛK��@h'�Exae@m2O'�@q{W�Y@t��?G�@xuz�t�P@|����|H@��t���@�+aTW�@���ޝ�@�<0��g@�scR��@�R���@��y��@�*Lb�5�@�s2���@��f�!91@�~����@�Co��j�@���� ��@�(v��H@��rJ�@��~�|@�_��PF�@�N���o]@�WQ�Mw`@�z��#�U@��uv�z@�b�N�@�Hh�s�Q@���G�9�@���]�*@�]����U@��i�@�i���@�
���c@��py�8@��;��e�@�/�h�@�'i��M@�)U��@�5�xe@c@�Md'8�@�o�����@Ɲ�g��_@��L�#��@�{�m�u        ?��Y-\�?�H�P�@����@��kf@"��M47@-�]��@6&��� @?=��7@�@EUB���@LZ@�{2!@Rn�_�:S@W�}v�[@]�z�\@bOrW��A@ffͩx�@k�z�@p9u�xK�@s?�-�@v�=��;x@zk�S��@~����.<@���X��@�0��<��@������@��@��@�p��]#@���r��x@��@���@��y��@���;ت@����0��@�Qe��s�@�@�f��@�3)z��h@��iP�4�@���K���@�����@��(�=4�@��^�vR7@��9"��@��}s��@�b~���@�]�-��B@�Ʈ�۔x@�A�hl@����qk@�o/M�Z@�"�5COj@��		6 �@�Ő��@���}D'�@��t1��|@�껋%��@��(�it@�&o���@�T[�:��@Ǝ�l��@��j.�U@�$�%-��@ʁ�8��@��|':�@�`�BL�@��9�(�2        @K�^3��@yL$F:�@�5e�`2@���<�a�@�@�6π@�ڱ����@�X���#�@�܊�$��@Һ�B^@׍�-�Y@��ӄ� @�b
�e� @��S
� @�*t���@�Q�.��@����s@��N�'ٹ@�J<�2@�v��Eb@���;Oa@���a��)@�;��hs�A �S�ϫ�Az9�A�q��A4U����A�?��Y�A�L��rA
w�B�2!A[X��AP�w� �A+���A8�͠�IAN;'�ZAm-�7�?A�o����A�B�O�A{~u�AF��H�A�j���`A롴YǣAL �h7<A��";r|A(��-�A RZ��)A!��dMSA!����IvA"�l�zcA#wQt=�A$K��ɖ�A%$
-ؼ�A& ��a�A&�4�y�A'�aqxA(�5�+e�A)��VfA*������A+��(��A,y���gA-t���1+A.tu]L��A/w�J�)�A0?��͉        ?� t��eP?�7��d=�?�b#�u<@ayf�a@����@�k�R@#Gyf>�@*P[9<�@18�%�#0@5�4	u�Z@; ��~��@@\*R1��@C���0@F�ǘ1�h@J����}@N���]@Quֈʷ@S��A�@VCǉ ��@X�(ȓ�@[�H @f@^�p2\��@aq��Ca@b�qH�ۮ@d�aڶ�@f�y��S�@h��y�q�@j�$=��J@mNJ0���@o�uwL@q7<B�@r�{��~@tA����@u���G�@w4�#F3�@x䉷���@z�|�nn�@|�ao��@~p�g@�:�>9��@�Ip1�#@�c�YO@��|;�
�@��%�˺'@����9�5@�Lb2��@��[	(-�@��g[�@��Ag�@�
�KY_s@���΅ �@��\ ��@����z�@��L�@���*r(@���#G
@��jy�y@��J��T�@���<c�@�����@�ѹa�!@��v��Vj@���H��        ?��+(�?���5Ԥ�?�
G�?���#iv�@���֘a@�
#:�@"�ugr؆@-�g��a@6�K�b6�@@�Y�V @Gg��9 c@P!~v�D�@U�Չ0I�@\��+>�@b�R�iO#@g�����@m��o���@rHE9g�[@vRI�O��@z�c���^@��*�:�@�r,�j�@�`  ���@����@�&�FD@�R~1�e�@���*Y�<@�x<92��@�bq
!N�@��7��P�@��.o�(�@��lΖ�L@��O�N��@��_���@�'����@�^N��~@�خs���@�v1Զ�(@��:��@�����;�@����(�@��1hk"S@�P��Sa�@�u^-�@�؄�+@��ݡ7~�@��|�<F@�V� �C@�a�aX�@@�u�|��@Ò���*
@Ĺ8����@��x(��@� �R���@�a���=@ɬ���@�� �@�Z�
�H@Ϳ����}@�-1$��@�Q��N@�W�	/+@��mc��        ?t�lơ:?��m���?�}O�VS?�ۅ�I��?������@��2Z	@b�-8�@#m�:)Q@/�%�Db@8;�֒�@A�n���]@I4f@ڙ@QG="�l�@W�"�1-@^
���H@c-C8�@hdPq@m��̉i@r�,��/@u����J@y��/c��@~}�����@��Z�aa�@���[ w@�Սɿ�@�N,��@��A�@����g]�@��r���@�Xu˿@��l�aJ@��l�U@�꺟~�@��`X�@��l�E��@��s���@���5y�@�ԑT��@�Q�@��@�n���D�@��y�<<�@�HOފ9@��*E2��@� =���i@�����v@�B�*ᱟ@��%L�eX@��Z̠��@��Ɨ���@�t����@�:.e[R@�D{2�"@�YU!���@�x˹�0�@Ģ�S^�@�״�sl4@�-5<�r@�aP��+�@ɶܡ�@��E��.@����@��,��[�@�se3g��        @5�`o,@dÌ��XI@�gmOg�M@�~7��@��F�θ@���BU@�X�^�e@��x*��@�o�ʫ�]@ǉS��-@�N����z@���7�@�yV��
@�n��λ@�Ŭ꿆@�A�H8�@���t`@���@�@��PQ�A@�ߏ����@�.k��Q@��4�"@�@x�ɮ@�7���@��"fC@��U�j��@��gH�g"A 1�෧fA��v���AA~�G4oA픷ޜKA��Ɨ�;A�Å���A
�{!w��A�����
A�y���wA���ÐFA�23��A�r6�AA$3�wA�c9riAi+TA�`O�juA��rA�����AR�>8��AʔqA oF�L�A!_�K{i�A"YE`��^A#\H��k�A$h�h.��A%1~�A&�W�ŶA'�b�So�A(�T1�OA*;�x}A+����o�A,Өb~n�A..ꚙA/����PaA0y�"A19�,��        ?�T�w#�?���p?�V����@"��#�@?�~<�@�R�o˸@"���RR)@)E��`2�@0�f��̈́@4�1{�U�@9�`��oc@?lO\M�-@B��0 �E@F�陭@I�Z|��@M�5�>2@P������@SO%�/��@U͸8�n@Xz�\,_�@[XQ�S�@^gOіf,@`��B��@b�[az�.@dg"bbE9@fY���"@hh��qXB@j�2�yՕ@l��=rf@oF1���[@p�� ��@r7�R��9@s��w��@u3�-�@v��� �b@x$$���@y�R2�@{��^�+�@}W�?�w
@<}���@��au@��^�YV@��#��U�@�Ӊ��g@��niZ�_@�-��v1e@�jc��@��k\���@�٠V�^@�^�d��z@����U�@�5����@���w�@���Â'@�c85�w'@�0�����@��0@��'	<�@��'.ҡ�@��ǦLW@���r@�v;^er@�k3���        ?��$z��?��[�?���9@����P�@�kʬBJ@$߸]��@/*����@6�5����@@4G�15s@FE�W%��@M�g	�?@S�٥0X@Y�C���@`S�<p*�@d���ӝ@i�en�@ow5�7G@s"�cƪ�@w	�[)3�@{yz��@�=A}�~@�
�>��@�)�O3�@�����R�@�j
Ѩ��@���VdX@�JT��q@����H�@�A	�>9:@�.3�K@�X��� 3@��.|S{@���C�V�@�����I@�жBQm@� ς2	@�}D&9��@���
@�a�o�)�@��}�@-@�S�W�G@�ꁹ��@���#�AL@�S\'��@�%��H9@�Хe�@��:���@�
ީ!@�0�@n@�6puנ!@�[�s��@ċ�u!V�@����T�r@�
�r���@�Z��R8�@ɵ�}�D�@�긗u@̎N{+�@���O�@ϗ>��
�@ЗQ��M|@�i�Z�6#@�Bl����        ?�E��~�?ɹOL ��?������?���./��@.8Q���@����@#)�&1�@-�Ż(�@5��A�d@?w*d(@E�4N^ov@M��[3@Sɗ���@Y��-��P@`b�D�u@d�>3]�G@iSxh�h�@n�W%iwa@r����g�@v����@y����s�@~_���*@���>l��@�RB�� @�Kd�$1@��zw���@�&X=�@�	<�t]@�,�啬[@��t��ZH@�W�o��@���,�x@��(�)�@�t��"�@�+�z.,@���(�'@���?z��@�!
�P�@�R����@��J�c�r@�;�qØ@����J@�]����2@��"�{m@�l���#+@�a����@����[�V@��Yn6{@���?B�@�{d��p@�E�^}d@�X�5#6�@�wsޥ�y@áR0M��@���м�@����@�d٘7�a@Ƚ����@�"��2�N@˓Q_�h�@������@Θnb�2@�>dc�x        @1lz1}a@c��{Xg@�Z-���@��m��g@��;���@���5��@���2'�z@��D�@�M��*c@��@@�@�q}YV!]@�.�_�(@�qPw@���;@��ٙ�G@�>B���@�c<�P�i@��~�4@��%M��@�v_lh�@퐛�+@�q2�Y�@�6�6�;�@��t��q@�p!��@�;[�Xp9@�{V�"8@�ڛ��]�@�Y���A ����}�A\�݋%A̰R���AM�毃OA�@�p1A�`s��A
>♇^�A�|�A짎��A�̱�;A�A��W�A���A#��b��AJ�}��
A|�P`Y�A�I��[A ��J7�ASv�b�A�/e�LA2���A�O0A����OA H�l�!�A!���FZA!�,�S�A"�3qg#A#���{\A$rbe:IA%X����A&D����A'7'5(A;A(/t�ݦ�A)-䜊�A*2�<�X5        ?��gʺ�?��:$�?�=�4b}e@�O�q��@��H�@�N���6@&-%�;C@._sR��@3�Y���,@8��.]^�@>�����@Bt$�	��@E�|��@I҃įa@N �Î5@QB��jD@S���O$Q@VK&�ͦ@Y*[��@\8�9��@_'��u�I@a<
ϰQ@b����G@d����@f�D1|@h̭�o@j��j�~�@m'���vp@oz��/�@p���S@r7$�,��@s���/\@t�)���@vQݮ��`@w�z�m@yS���:@z��P�@|�n'��@~@��z�O@�=���@��R�ٶ@�ُ�pY@���&��@��R�\8@��k���@��p�u1@��j�,�@�gN
�w@�C|L�,�@�r�+�Q@��q��b@�ꚑ�L�@�3bJ#k@���TA�@�o|f�h�@� �_�B@�փ,�@��pL�@�N�̈�@�D��L2@��Q%yr@�����@�t"�        ?�`Y�H�?Ƈ�h7'�?��M��?�%�ê�@� ��4>@���O@ �m��+�@)��tg@3$��:�@;ra���@C*9��@J&y�A��@Qx�>�ȋ@V�C�ۋ@]�%��4�@b�#��C@grJ4<U�@l��Ba��@q��?�[@uWL��=�@y��ĉ(@~7T5x��@��P��@��=���@��L�d��@�N��@�i��{LT@�׾�ަ�@�)��W~@����r}w@�_�}�(@�GM���@�c'e��@�Z{��P�@�s��2@� ,
�`@��e6��@�n�Q��@�T�!ء@��]��7�@�� kL�@�`Fo��k@��>8��@�*���v@������@�:1]Y�@�܋����@��J`ʵ@�X֧��@�3�* ��@�����@��j�� @�t��@�2�u�l@�QB��@�zp�}�r@ƭ�pxk@�깺�@�1�$��@ʂ�!���@�݊ǀ��@�B[k�8�@α1 �H�        ?�A.]Mm?��B�<T{?�
,`�H@=��_l@��V{�@$�*nK�@/�R.SG�@7s����@@�?�L@GJ����@O��5��@T��vW��@[PQL�x2@a�Du�>@f$Q*Q�]@k��d�R@qf�~�Q@t�L�n�@yAB��@}�/r��@��go�@�ԾMZ@@�L�q/}�@�%rj��@�1��	5�@�����@����z�@����Uq@��o����@�
k��@��-n՘@��Pw�@��W���@���z��@�� �z�@�IN��C@��`xV��@�7t깟}@������@�4��(�@��L_'g@�6�c�
@���[�#�@��[7ſ�@�z��C��@�cblwt@�^��:�@����F��@��u�5��@�����Aa@�	"�d�(@�8A����@�q/Oq'@ǳߓ�ŋ@� J\$sI@�VkR��@˶C�ޠ�@�ڧ��]@Γ?,��Q@�C,�	P@���[M3@є�����@�bc�4A�        @4�[)}��@e=���Y�@��Q��o@�RJK�J?@�5"s���@� ʑN6f@����>�@��2��@�{�A}�.@�;r�r@˙͍r�@�ζ/�O�@�&��iA @����A+@���b�Ŏ@�)�{jG1@�< �@�*{x�@��"��;@��U��E�@�/�sQ��@���p_@�ǎ���@����L��@��3ۼ��@��G��!@�.��T	�@��y���A ��rr|AyT]��"A���$�Ah�����A����vA��\s|�A	Z�󅠱A&T�/SA=4d>A�Ri�@�A~YB���A�ºW�8A��Ky��A�2�T+�A�(�eA T:A��A_¿L�A���2�A�g��oA_��Uf�A˖��!AB�N.��A����x+A �/L�2EA!u�&�C�A"GM�ݸA#�P�A#���A$�:��$A%��QA&�PX�W�A'�-8h7A(��g���A)� ]9+A*�zr!�        ?�o��ڻ�?�����?���@�i��J�@��&4@���K��@&�!>F�}@/8��R�@4���H*p@:��c�c�@@���
\@DTS#f@HpxZ�b{@L�o�@P�u�6se@S���nY@V����@Y��F/�~@\�PC���@`?��"0@b$��Q2z@d&�d�7X@fFч8��@h���"�L@j���B�@mT[�;�o@o�s�N5@qK�(8�@r��$���@t(�̟��@u�u����@wDk]&�@x�`�5�a@z���҄�@|mV�y�@~I[㥺@�t_��@��JT@�%\�q�@�8���@�V�E��b@�p���@��55e�@���t�@�<G�S�@���W>w�@��4���o@�`����@��˥�P�@�.ì�ì@��@���}@������o@���goK�@�vB[��@�W�e�s@�@� �@�.����y@�#ls�xo@��~$��@� ,��>@�'�"���@�5r�[o@�I	;7�        ?���f��A?���{@�?�o�,�3�@-I У�@�R,ы@+��%2@5TeX��W@?�gEc��@F�O?�By@O#t`\UD@T��)���@[nP�A/@a���40�@fS.��U$@k�_�{��@q
�tR�@t��q���@ya�p�@}ҐU^0L@��Q�/�@�� ���@�l�\Ɲ@������@��4Q��e@�6��@��C��E@�^�*Z|,@�G ��@�i���]@�c�7��@�0�e�t{@�j���@�'pR��@�REqAu@��o�e�@�	gt�)@��� �9@�"����}@�����m@���@��@���Ci��@�,��H�{@��o6��@���B���@�q�L�M@�Y�	�@�+_���@�4MHG��@�H�}�@�f��>t@đM��c@��h�8�@�	�s�C@�XF�@ɳ��p�&@��҃�@̒��ξ@�LSˋ@Ϫc��"@Х� N[o@�~��w�@�^%�T�@�F(��        ?�Y{���y?�?&����@ �{�F/@�Hd޿@"�;�٣b@/rcN�rH@8,CF�N@A��Q"�]@H},���@P�f��@U�~��_=@\e7��@a�0�$��@e�&���`@j�?�g�@p@x�DV@sie'§@v�B*�1"@z�3Z�e�@1L�,�@���e���@���GjO@�c�*��=@�t�����@��|o�A@����E:b@���!ko@��'ކ�l@��#��@�@�U��}D@��j��@��f��@�̊�!W@�]B�m �@���3n@�̣uP��@��>TvR@��e�~3�@��2�{@�����j@�*�=?f@�f�1=T5@���Q�@��bc�@�}�q�.@�����@����@�-�Ս�@��%䙥+@��SN3�@���}ц�@���{y�@��x��@��@;��C@�ܩ}j�@������@�*.��B@�a�Ģ#�@Ȥ��?q$@���N�f;@�M��5@̳0�<�@�%U�Q<�        @CN"� e�@r�y�+u@�hT�[(@��Xj�B�@�x�^AgI@��\R*�@Ğ����@�yC�0z@��f��b�@��	�C&�@���4��@�~�5�@� a$�@���j�@������@�)0�3@�u�,pa@�k[z��@��3��Th@���+��@���!`SqA+%ME2�A���A��U��A�+�c��A�3�-+A
�%ʞ�AS�N���A�ߓ��A�vY�RAe+���A�(�+پA!��ӜsA��ÝgA|���A��3*A6j�3șA�����A������A #�/��IA!X��A!� 3�A"�ۜB�'A#С��e�A$�pu��A%�o@�WA&���;IA'���k��A(�w��_1A)�~��'A+
���zA,*}>�1,A-P����A.|ڐ+��A/��i���A0t��~��A1�8p�"A1�-�3 A2_���aA3	��:�A3���@��A4h�=(mA5�7pF        ?��p��'?�7l��|+@�\����@�DO�P�@%�_��,@1��a�@8���h(@@���o6@FN+��;A@LgO�~�?@Q��d��@Ur(t1G@Y���)�@^9���M@a�T�N8�@dHZ��w@g*��潰@jB���'�@m��¹W�@p�;�^%^@rj��08C@tfX���@v~��(�@x�<+��@{5���@}q�e��@��c�m@�Q�L�x@�����ء@�&�t�tL@���Wz�@�9M!a��@��"v�[@��
�f�@�R�6��/@�)��%@��6)y@��Zƫ@�?���`@��c�@�3��#�@�T���p@�~��|��@���KK�@��n�նq@�-f��H@�v���	@��۵��@�_ܫ*@�|+�@�p����@�&�Ɛ�@��w	�@���w��@�^nE���@�"��'�"@�� 1	ƅ@��Et��@��>�yw_@�T�V�@�*| {o@��Kb�@��e�}&&        ?�9d{�t?�0��ȹ�?�ͨ��@�џ�a@����@-�C��4@8J��rE�@C<C��D@Lx��-`�@Tb��_3@\7q�O�v@b��)��@h�d���@p	 v%S@tD4N��V@y7Y�"��@~��`P�@��xl�;@�||�3��@���8�b@�c��'��@�M�(��@�-O����@�R��Wta@��
�T@�u�J-�`@���WT�@��tw�f@�,Ž\.@��^o?�@�7�"�@�������@�p��Y�l@�����@���B��@�E�6��9@�
�DvӞ@���8��@��|��w�@��ݾ
��@��s�l�@���zw�^@��R��K�@��o��@�$FUM�B@�k� wo�@ƿ��<'G@�iQ~��@ɋB�&@�@�}a@̇i��9@��)�[j@ϴZ�X�@Ю�S�@щ��-@�i�f��@�Pk	J�@�=,r.��@�/�Ŝ��@�(�,L�W@�'��:@�,6����@�6�c��v        ?���p�=?��(-��?��hgm}@�$nԕ�@�q���@+�M}@6b��F�@A=�@H�wN���@Q_�u#
�@W����3T@_�J�M@d��2�Hk@j0 �x�@pf���-@t3�/c�@x���k�-@}_yn�9|@�b�7�l�@�\�l֌@����@�-�����@��h���@��4k$E@����V&@�;� ��u@��Ê'�@��ϭ��n@��R�v@��`[L�@����@�S�G��@�?w�Ӝ�@�I�C��'@�r����i@��b���@�!4�@��^��Ҙ@�%�*�¾@�����@��W')@�|�E�@��P�@����|k�@�gßxN>@�,�<�&-@�-�$�@�t� b1@�o\�^�@�r����@�~0��!F@đ�	"0�@Ŭ�
V4@�ϧ;���@��,��vT@�,Dg	k<@�e썟 �@˧,Hqr@��w��Z@�@�����@ϙNGֲ@�|�j�<3@�0�F�_�        @R�*�+��@��H15=@�
	��n�@��*���@�����@�p�ѡ��@�7uz���@�'����	@��"�E�@�rߋRA@��z-�I	@��Q4�?�@�����@�_Äx�@�� �?J@�����@���>��A �g#�oA��k��A9�� �RA��K�A
ܐň�Aɔ�F��A��	jAG��<�A�q���}Aw�,g�A.�2�A�X�g�A�c>��A�6�NA�[U��A �w���A!c��+�A"I�*��A#��uoA$�ýU�tA&E���KA'm��*�A(�I�&�A*M��=�A+�i��m*A-_Wq���A.���='�A0O�P��~A1(s*�vA2U���A2钓�x�A3�2Zi�#A4�M�bTA5���I�hA6�b�7}�A7��GOD\A8�U���A9�ǰc>7A:˻�6/�A;�kۭA<����.TA>���A?@}[!R4A@5C*n�A@��e}]�AAf�U��,        ?��=��>?��'���?���H�@ ������@��~	@���*+@!$��(w@'��vM@.�;a-;@3���7�@8jۤ��@=�):Qß@A�g�1�@D��vi@H{p��S�@LGi*��@P0`���'@Re3t���@T���<'@WJ�ض:@Y�{�_��@\�ާƁi@_�ܯaq�@a���8@c:��ew@e���]@fߔ;�8S@h�lڅ
@j�ar/h�@m��0{@o>]���@p�q�=�@q�Ȍ���@s?l[�C@t����o@u荩�K�@wP��U	@xŬ:��s@zH*���@@{�o��@}u�h�F�@ �4��b@�l���c@�PZ� �@�:��P��@�,~H���@�%N����@�%X��(%@�,��B�@�;([L24@�P�`�@�m�o��@��1�HN�@�����Z
@��@#�V@�)�oTn@�j�l�@�YA$�\&@� ���@���N�Ð@�Y���@���a��@���[��[        ?��w�?���(�?�;BP�n?���׬��@�qh2�@�_[�q@�"��	�@%���@0���V�@8��`�@A�j[e�@HR����@PsMO �@U�u����@\=��J��@a���j@f�?.��@k�J��/�@q�먍�@t��|{�@x�e�hN�@}/ �#@�'{!���@�'�
�@�5�#���@�������@���2�<�@�v����@��q^�h�@�\qe�@�"WY:�@�"�=ݒY@�aTcq@�pN��
@�Q��?a@�U��^=@�}v�91�@�ˏ����@�@��n2�@�ݣk��@����a_-@�I�*�:@��|��5�@�z�N&@�4�q�_@�h��`J@��:��d@�����@��ꃽ�@������?@��_ėm@��G_��1@�)U1!:�@�q��wR@����/��@�&D/��2@ɒ�!�$�@�v�ץ9@̐TC��@�!}K:�~@Ͽ�@д��o�@я�%S��        ?�x� �?�]v֚�i?Ӛ�5[6?���X��?�/<قߨ@�=�⷗@q�(�3�@!�AP��@+�����@4İ��@>d!I(@E�k��@L�CNc#u@S��TO@X��ףlE@_�u��w�@c��A@\�@hF��ˮ@mu�<(@q�5U�S�@t�q�!�%@x����@|��-ki@�}��	��@�����@��k>��@@�uw�wu@��4*2�k@��l�x�@�S�@���@�K��VB@�g���z@���Uq��@���.@����*�@�Pg�^��@����j@���R�N@�,(��d@��ZO���@���-N�?@�e[BT�@�K�;'�@�GC���@�W� ?@����R�@��hL�J@�49� @�:�  ��@�z�S=y�@��u���@�l]/=�@���gBd@���c�@�k����]@��\j���@���l�F@��)^���@�j���C@�G��"q]@�*�u ]@�9+K/�@��k��q        @&Ka�^
@V�s/&F@r�jJM��@��%�m�r@��֪�+\@�R/&�@�@�.R���@��J�=�f@���h�W@��($�y@�����
@��Y�{@Ř�g�=@�y���<@ͳئ���@�%����S@Ӡ�e*�?@�K��R�@�'�Y	%@�3b��
�@�p�H��@�o��Y@�@����O@�*S����@�-�|��G@�J�\!�@�vc�F@�����@���@�c\��
)@�H��]9@���$��@���sN�(@�lo�v@���%H,@�/���Ǻ@��S�b'@��z�l0�@�m{!A �E]�υA�msj8�A�MM���A����<�A��y��A�;���9A��aA25�'��A	j�{p��A
��Cb2xA��O\��AN�b)�A�)K�|!A��R�PAŬZ��A�wH�a�AH0	���A�2��A���~A�rVAIA��'��Aa�@uX�AAYQ��A%SY.V�        ?�{t�Aa?���X�0}@'�e
@�����@!�Q�㶢@+���Γ}@3��ҧ @;GL��.@A�{�UKW@F�(�V»@L1��U�@Qj}'��@Ts֌a��@X�ѕͣ@\gY��=@`"ۿ*ۃ@bh>�S@d�a���@gc��S�?@jF��@l��*�S�@o����@q�����@s9KͿ#�@t��� +B@v��p*~@x��n��@z��`p��@|�,#���@~�ǭ�R@�����h@��R�'�q@��^�T@��@��m@�D�u�j�@���0� @��+��K�@�<��8�@��յ�|@���@����Zn@�M���@�N�PJ�@�M!�i@����7��@��Mfo��@����e�@�z��6�@�_�t�3V@�I����@�8�+_L�@�,�{�x�@�&W�� @�%����@�(�폝@�2?]`7@�@�a/C�@�UuMk@�n��IC�@�G nmB/@��Y�-�@�ne@}$@���        ?��OO���?�+�|sT@�1�o@Kab��j@#��)���@/�	ʏ�@8%�����@A}����@H�^��N*@P�*�g@@V�}�c��@]��%\{@c:+6��@h���FD@n�� <��@s#�rg��@ws��9@|f:��@����w@�5��@��@�Ͷ�?|�@��(X*%@�*����N@����r.@�up���<@���D&��@��eﱾ�@��?Zl�@��w��@�".�X� @���38��@�8ϸ'm@�����@�/<L��@�Bhd뉖@�nbM�@���٬CD@�eԕ�@�9�۵�?@��~����@�n�ǝ�@�X��-�@����U��@�8��e�*@��b�J:@�ku��4@�#�9\��@�����%@�Հ��P@��&E��@���2X]@���PD�@�!���s�@�LZ7��&@Ԃ�sZ(@���:!�@��b�w@�p�ԧ�@��sB�Y�@�O>���@��q�jB@�cX=��7@�!�w�        ?������?�.����@A���}b@$��FP@3�B�U�@@s��#<@I$#G��@Rw�g�@X�-"���@`�}��@e����@k�J�,5q@qbG�P9�@uw+��u�@z*�v`�@�$�z�7@�ӄ�3.�@�F�4A�@�&���@�zs�(�@�������@�M���[�@�;�Y��@�rI�b%@��Q�v�@��C��T�@�����C@�7]����@���딃�@�A�IF@�О0� @�Y�:�G@�����=@�W�s�޼@�'�j@��#���@�U~�B�@�8s�`<@�u<(��!@��H�ö@�!��I�%@�k#��Ӏ@��x��A9@�*�5�ǳ@ơ�"���@�'�޽z�@ɽ,ބ`]@�b]�P�:@�!��o@��ea�q@�W���#@�I���&@�B,�l�/@�C ድ�@�K�-qm@�[��$u@�tG�$�2@ה�ըȜ@ؼ���@��dϨB@�&��@�f��u��@ݰ)�Y�        @P�Q+�!�@���n1@��n��7Q@�B�Ա� @�6ٓO�@�W\R�T@�>��)�|@�E��>�@�@�o���@��|}* @�OG#P�@���ܓ!/@�Ђ���@���%@��lҤ��@�fC��@�#����QA1�`��A3���)8AwN��zAܑS5��A
c�����A����pA��N��4Ad7B��A��N�^A�>�A�A3d6tA�,��v[A���䦢A��J)�SA��4+A���+A �G��K�A!�~���A#�WA$F�$�A%}g�ע;A&�*cˇEA(	^5$�A)_7��ٝA*���sbfA,+�= FA-��ULЎA/$�B^�A0X�n��nA1%\����A1���x%�A2ψ&��A3�[�Y�A4� �o�8A5zs�]�A6i�� �A7^�X��A8Y��F�0A9Z[mp7
A:`����A;m{��aBA<�
�cA=�H�r�A>����iRA?ک^�>A@�DYˉ�        ?�H��?�QW�X@v�*�%@+�d7��@"���ф@-7�)_v@5  k�J@<}��#^@B��N@GU�_�@L��FCz�@QB�F�Z@Ts)��s@W����@[��g��z@_��t��e@a��`�@d7�8Cg�@f����J�@i.�w��(@k���:@n�n}10@pя7ب^@r\�Aku�@s�ʬ�	f@u�RF��(@we/��ۤ@y5y�[�T@{_؄�@}8U�R~@�e7�@��}�
f@��'V=��@��$��VM@����O�@�/�FWq;@�r�{S�@��B��6@��P�fF@�9h��@����?7@�njPc@����i�@�GF)�\�@�|Կ@��1(��@��(}3�@����@H�@�������@��!��:@��\ip)@����p4@����@��@���aPI
@��=ʟE@�ds��Q@�6`�^F�@�oB��x@����~�@�~�Cpg@�(e݊%�@��g[U@����?G7        ?���SP�?��P`h@����s�@�G��Z�@-b�蓁D@8�fC��@C�e�*�@KZ��cm
@R�0��s@Y�չr�@`R�{��@d�M��X@j���"@p	e��B-@s}�{v;�@wgD��)@{�F|�kc@�Z�}$�@��H���@�����A@�|�8BZ>@�5V�yr@���6�j@���W@�jkWXۤ@�&\���@�$g�Om�@�h��?��@��d_0�@��=hæ@�;��@�C��v�;@���r�@�S�A���@�&�Z�@�^�4��@��A���A@�p�0�@�J+L�}@�BB�(@�Z
�8q@���`��@��}1��@���^Qg�@�)�.��@�g�̾}X@�ݤ�Ic@�f���΄@���5Ϙ@ɴ���%G@�z!�21@�T��0�@�D.��g@Ф���@ѱ�_�o1@����B%@������@��fԬh@�S�L��n@חlv��@��ȱ�� @�>ԕ�$�@ۢ��>�        ?·�H��?���m0@�_O�@@���@*�DgM�M@5�ʙ�-9@@R�.�@F�UH��Q@O|0�,��@U7~G��@\��I0V@bT����4@g�]e�}@n�=��@r��7O�U@ws�\Iǋ@|�dN-�@��6V^�@�0��
�@�U�@�@�@����|@�����dM@�����@��^w�1�@��Ϭڏ@���{{%�@����@�� E��@�%o<$��@���U�@��J�m�@�:��j�@�\�o��@��K*�j@��]����@�#$�`@�n�X�@�ہv�?�@�j���Z@�Y���@�v�a�`@���P�Y@�}�i��@��T�:�@���lk�@ʍ�D@p�@�a�q��G@�H �wL@� |˻�@�&0��=@�5:�@�M�_��@�odj�e@՚�vGT�@�ϷמzW@�?��)�@�V�]ڨ�@ڨ��"�@��j��R@�j�hYr�@�������@�*�;��@����mg        @U�� fǔ@������@�()�!z.@��g�hK@����a�@���o��!@҉�e�O@���>�#�@��O�-G@�
�L�@�v��ezT@�AXUbH@�8��ic@�Y��ND@�	���@�2�o,+@��Qkt�UA ���Ϣ�A��� 2A�Ё��fA�2W��AܘZ
  A1�t���A�(x=�;AX�/�AmJ����A�o5UC�AAʌ�.kA�j��AOj�~��A��]�#A�Uf_"�AQŕ���A�v�
A�~��"A ��x+}oA!�`�-H�A"�rh�,uA$1%eR�A%���W/A&:?���A'c�T�;�A(����.A)Ӑ�1�A+��}AA,jV��8�A-��'�F<A/)���J$A0Lc��A1	Z�r�A1��]�w�A2��a��A3a�k�JA45z�d�A5m`�G�A5�פ^vA6�f^:/�A7�6~�awA8�f.N�A9�#h8�A:���ϩ�A;����A<� ���        ?��rG�
?�_Y}���?�~ac�]@p��Y@�>�)��@&r�=#gX@0<TX��@6.!0qB@=p��7�@Bo~��L�@F҂ ��d@K�y��]q@P�-	 `@S��l�1�@V���]a�@ZBv��$&@^�����@a�d�'@cH��C�M@e�k�5�@h57)l�@j�z����@m�R��@p|wHa�
@r#�o���@s��`=^�@u�El��@w�j׭�"@y�m5��@{��}��@~+�9w&V@�Di��ׁ@��-Aφ�@��I�`�+@��wF�@�����Ӯ@��2`��@�s�7$�p@�����	@���m�I@�?*�j@��N��@�@�Y7KeS
@�?��Y�T@�-	�Ύ@� � ��@�q?�Z@��ٱ�@�$�ܭ�3@�3T'̼J@�H����@�d��5�@��䭃7�@���!�?@��F�T�@��^k��@�Y�My�@�O�#���@���^w�@��*� �@�O�|�oi@��KK� @����Lz2        ?�Mm��?�82NM�?���.P?�P,���@QO�j?�@
E�	�@H�|)�@&�;؜�&@0�u^�l�@7��x���@@�!.U��@F�~���l@N#NlM@S��oz&Z@Y]Sw��@`���`_@dqJ�zC@hÇ� �J@n0�5��@r5E�(�@u����T@y�
M�Fe@~6M��Q�@���FȽ�@�Z�t&@�d�)Y@��} r�K@�_��˘@�+zd�@�Q�!M��@������Q@�&���G@���9b=@��Կ{Y@�j߬�N@�ax>(Z@����ey�@����Z��@��C	5-�@��Y��&~@������T@�M�8��@�`�nș@����'�@�9����@�o��H�@����6�@�w&���S@�[�?Ǒ@���:t�@��t�@�Uc%�t@�}�F�%@����@��p��@�)��S�@�@��PF@�a"V�D�@ƋEf4@ǿ�u��@���X��G@�D:�ɣS@˕�O��        ?���`�?�\Qс��?�6N�+5@�0�Z�@�Ѱ9�	@$l��5��@0�N�\@8�f+T@BRv~3�@J��K�^Q@R��)Y�@Z/VhPĤ@a�!R��@g�ײ;�@n��;מ@s�*�@yHďb�P@����@�w|d��9@��[k
�L@�{�Y�	@��y�wIL@��l<>@�<N�8�m@�ډp��@�ʚ�gй@��)�"�#@����bF@�M�K
)@��Pܰ['@��p�G�@��[M�q�@�w�pԗ@�Ο{��@��C�d$�@��K�a��@��_X��@������@�NI���@�ƕt["�@�/n Yj@���
 @���>��@�s�#��@��t���@țJ�Dx�@�Gn��@��Y�O�@��aʑ:@ϩ���@��uY>6�@���H4�@��$�3�@���Er�@���\f?@�
���@@�.���@�X��(��@ي��2by@��H%�@�c��.�@�K���E@ޙ�*=        @C�eH)�J@r��Ɠ�@����Z�n@�	���@����?m@�W�j@�@�9�7}]@�A�)���@�RZ���@�M�J�x�@�熥�8@���>���@�"��0g�@�b��\e@���x�@�XCF�h@�k��)�@�y��@�ZG�0w@�LH��@��4^9�T@��繰�g@��:�f�@�#��Kg�@�q��w�@���b��A 5�7�MA�T��x�A�ϦY�{Af
k%�A�gXܴA�� ��A	$�أ|A
���c��A�X)#�Au���A-���A(�U�A+þ��vA6�l\��AI�C�a�AdX�oA�(~��A���QGsA�}�W��A�"�JOAX�g��AA�A�d�*A�m<�AFk�]�A R��>�A!C�̮A!��X~'A"y����A#:)����A#��?��A$�f�Kk�A%��ߦA&f�7a�A'<fQ��A(���V1A(��_{�YA)ݟ��*        ?��9��,?ص��w�?�t��2@}g셰@o]�*�@�<��N�@%y�w��@-W�Ž@3A��X_i@8�t���@>tA�p7@B���`:�@F=`{�7@JMɧ��Y@N��#֥A@Qɬ��	�@Td&q���@W-��F#�@Z%P���@]GHg�y�@`Iȸ$�@b� 1t�@c���B@e���>@g�tΓd@iɶ�Dʃ@k�-}&_@n5$߸�0@pG{�_]@q��@�%@r��3872@t����@us��,2�@v�jl��@xP�Yv@yθ�<�@{XJ�Y�@|��%�M@~�<c6�@�Y>J�Y@��Kz7@�д���@�����;�@��uL���@���v>_@�y_�O*@�o��'Iq@�j��@�k���@�q����@�}9�|��@���)Ao@��M]ke�@����8@���D�@�	�	�i@��Vgqr�@�<���*@��j���@�}? �i@�">6�x@��ZF��@�u�;���        ?�L��6�4?È7�	�?�P��q�?�t���@
�\
��#@�t ,�@#BWc�n�@-}_��:@5�x)H�@>�g���@E�<]j�@M<ݩ�./@Sz��نb@Y~�q�bj@`i�AB�W@d��C�x*@j%�]�D@p~`�@s��m��c@w��u��@|f�82Fe@����!Ш@�ł�@��P���@������@������@�}��km@����@�j�\Ǯ�@�/�Xfu�@�,-�V�6@�b�����@�j��cJ@�D�ly-�@�@�h�@�^��R�D@����@��}�@��g���@��c���g@�!Y~�<�@���|�@�Ms��@�ፁ��@�ح�>A�@��e/�T@�ǎ�/@�娽��!@����g~@���=��@��<�?_@�5��Ix@ŉ(J vr@��*�97@�[��˼�@��tn7�@�j2;�H@�UKLyp@ζ'�$�`@�9� ��D@�!�u�B@��q�A@�x-�v�        ?��l�1�?��TkO��@��ȖN�@���@#��r��D@0��ח@9��ق�=@Bψ��@J[���."@Q�	T� @W�֔�b�@^}
�8FU@cR�њ@h�m��@m���ɯ@q��J��@ut�}怙@ye�ACs@}�G���^@�H4�Z�@��;��@�È`B�@����@�4��!@�g--�?@�Vg�<�@�i���C@������@���o n@��3D"�@�D*6L<*@����&d�@�a��@���� �R@�y�I#&k@�N��8ӊ@�>`��U@�I�a�@�q����p@�����@�Pa��v@�N�\�Z�@��ҝ?}@�B��=@�s7�t�x@���I#�@���8L�@�.��@�����@���%�B@�@�����@�4f��@�0hՉޚ@�4w֠��@�@s����@�T9���@�o�*B�w@ǒ���jt@ȼ�x=Q@�� �Ft@�'w���@�g����@ͮ�<��H        @A��X	@q:1�I�@�#����(@��`e��@����B@��@a���@��@>��@������p@̍�ڱ�@�"t��"W@�q�����@�2�vn@�1(|�R@��&��tD@������@�.c�z>@��f�@�
��zi�@���I��@��?�\�"@�� "l\I@��=�S�}@�q���@�G��:q�@��v/�A y�RyA��k_6A�X<!P�A>��cآA���A�տS]lAR.Z�ˠA	�����A48����A�ϑs�A7��38�A�i2A�X�X��A}�X�{AQ�v�2YA*KSBxA-v~i$A螗!kAΩ�\xA�Y+2�A���}QhA���LA��!�>�A�l����A�WeCwA���ۙ�A�y�N��A�d�0
~Aӏ���A x�A!��F�A!������A"2�v�(sA"�ױ��A#g��g��A$D�w�A$�����GA%K����        ?��DHr>?׈a��
?�'�d'�V@��?+�@��n9��@��CXl�@%���a�2@-���R@3��|���@9��oQ~@?OZ�3[@C"�mX^@F�|Q�d^@K<�I�@O��&
�3@RsO�f�@U*p>ۣ�@X�^ݭ2@[3��o@^��c���@a{&�!@b��j�@d�?�=p�@f����so@i�w+Ji@k]C�&�@m�����@p�c�"L@qc_�?�@r�@L���@t�`m@u����@v�㎦�@x�+�s�=@z�-�rk@{��\�X@}W�Zԓ@��@�f���k�@�L���s�@�8��˜�@�*qԔ`U@�"_
��;@� ���_@�%�����@�1M���#@�D���@�]�
��@�~��F��@���@���@��;$���@�.0�%�@�K򁁽�@�Il� �;@���>�{@��:�QX�@�N	g�@���V�@���q��/@��D��@�F���V+@��0u6@��V�d�2        ?��d�:?�3��E�?�#J�'4?�#�*�[@&����@�hv+H@�P��
#@(A~�K�@3��V�X@<��޺9�@E'&_�ٷ@N�}#@T�i��K@\7�
O@b��	o��@hDn��ׁ@n���I@sw�Q��g@x c�X�@}�;�~��@�ڪѬ.�@�^�I2jD@�Uh3/��@����P @�W�ƃ.{@����@��Q��@�E���zP@��
��&@��,�}N@��,����@����YNK@�LtB"�@��y�}��@�W*�v��@��=\�6@����c4�@�~_�=D�@�~�Gn@��wf@�@���6��@�TY��o7@�>���@�>��Ş�@�VS��C�@��]�w@���9Xذ@�!>�@�P� z@Ř�3^�_@��@pt�U@�NYVzla@ɼD:�@�6�58�.@̽�)�8@�Q��
?9@����� @��O2#@�@ѭ�*� ^@ґ�c/@�|ڒ�(@�m�a�Z@�d��H��        ?�,����?�j�m�?���B�D@/�)Uy@�>$�r@!�l��@+}� ��6@4@�Q���@<�$(�Z�@DA�}���@K�$$.y@R���u;
@X��ۦ@`0U���@d��!�k@jp�l�h_@p�LVr]R@t�z���@yٌ�O@~Y[�z�w@�.XCN�U@���7@�f�E�@��=�P�]@�1ӑ^@����i� @����
�@����d@�aX�G�@�`R����@�S�c/��@�i3��@���0{�\@��ă�7@�t���}�@�8����@�f	��.I@����?/@�Q�f=9@�ޭ�2�@�{>�R�@�&�����@��#��i�@��xr�"i@�����I@�i�K���@��ƿ"
z@��=�PL@¼A�s@���b7)@��F�4@�w�4@�1�dOR@�b��`� @ɜ �?�=@��b7N�@�'_
�x@�y����`@��	|��@��_+0@��Cu4�@ю����@�N�i�X�        @6���0r�@h.O|��@����POR@��/$
(@�z��NH�@�nG�r�@�����j�@����
��@�o�;��r@ȝ5��l@�l��Ͼ@�n�_ ��@���s�Y�@��b�_�@���� @n@�8�����@��̧�p@�)�}��@�ޫ��i�@��J<��@��,�%��@���k���@�_�>U@�i	6�z@�>�-�@�'ϗ[�8@�$l�\_�@�4\:م@�V�rw�UA E��+ �Ai~��A�]�m�UA̆���A#����AUi��R�A�z��[A	V�W�A
k�h]m�A��v`2AR�$`/�A��P �A,}�'[�A���`�A��&o �A���5DAew���A@A��A �GR�nA�7�Y�A�u��ǄA��x6�A�xi��]Aج���A۬v�A�rɤj�A�.'Z�A����GA"���*�A "-�ba�A ��e3/�A!Od���A!�b�d�A"��!�k        ?��a����?��ᑶd�?��I�Ͼz@Z�`dػ@��ȩ@$�.��\@,�.���@3�"��"�@9�4nM8@@V�K�
'@D:ٴ��)@H�Ƙm��@MP�p��@QB�c~#@T����@W%8V6@Zop�_��@]�����@`����@b�in@e7|���@gD�9k�G@i��|��@l+����@n���9'@p�}�7Zk@rA�hn@s���4@ub2�Ȧ@w�Z�;@x�\IS�@z��v"$@|~��D �@~t�rD�@�?%(H��@�M�EȄ�@�f���h@����6�@���,8�@��[�C��@�/��Zt&@�}�P3�@��d�ޗ~@�:�0k�@��u��@�%����@���O؟@�����r@�o�ｏ�@�E6>�q�@� ��N��@��&,JO@��`\��?@��&�>��@���I%��@��{�7u#@���5
�5@��Q�6��@�Ջ�5�}@��s[@�����g�@����X�@�=?�4�        ?���|�<?�/wW�Ϫ@���+i�@y$IB7@#���!*@/FT�O�@7�\՜@A7�Ĭ@G���~m�@P5�Qi�W@Uo�	,@[Ҙ^��%@ać]@f`n��@kԊ{x��@qcow*@t�v��@yx+�@}��I|@����(O�@�إH+�I@�O�u"@�&�ӭ/@�2(��S@��@�}_@���83@��,i>b�@��ToC:�@����XK@��vի��@��r#�E@���ic�@��2�~@�#N9@��;�R�@�.�(W��@�xvfi0x@��tv+@[@�z����@��)���@���bd@��Ϝ��=@��n//�@��&�Ed@��Z�H��@�p �T��@��SL �~@��wl�>@�����@�ei�R�8@��ȕ���@�7��@ɶ�]�[@�E�dĩ}@��z�v�:@ΓQ�U�.@�)>�>U@�a��@�l�|�@��@l��y@�����}@�����{@�άie        ?���� ��?�Q� �?�;̉@@@1�>�/L@`�S�[�@*��4�UU@5�|R���@@���X�@@HǤ�k�x@Q���B4M@Xs~d�@`�EP|��@e��.��@ll�� �@r#u�+@vɑ��V�@|7<���@�<��J@��/�f��@�շ��@�X����w@�.,։�@��i��@��5���k@�P<!���@��%�i@�퍢p�@�,����@�Tz�r� @���~�A�@�gT-Yc_@�4q��@�-��U@��'�^�@�\��R�@�$�(,LK@�Ќ��@������@��K*�#@�H�ϟx@���F�@����6L@�>Jnj,@ÌeҙE9@���
f@�P��Z��@��΅�ɋ@�Jx���@�����z�@�{7��@�(gs� 9@��Dm0�@��u{@��U�R�@Ҹ��w�@ӵZ5"ϧ@Թ��!�U@��QR���@��C�L�@��W��V@�~ �X@�KJ��;�@ہ�R��q        @G#�1N��@t��9�M@�tf)�0�@��$�@�p�����@��S��u@��(��Fm@�c�m1�@��O��5@�\=Hc��@�D�*:O�@޿7ۜ�@�hn�e&@忦���@�hgЖ8�@�f���@��񡬸�@�6���@��;�D�=@�yI@@�f�]r�@���蔚�A �%�pzA��/&[�A�l�C�A���'A�H�`�A�z�QpA_�O���A����A;k��%SA���,TAN|��_A�P�X^<A���A�o�Gu�AW��D��A6��MA� �&rA�2��jA �����A!��
B�A"�ǯ�dLA$gȸ�A%,�%��A&V}����A'�`�
A(�AAC>A*
����A+W~����A,��QbJA.+RU�A/sB�]�A0q D�p�A1,�x�%9A1�ɠǺ�A2���].A3x��Ad]A4E;kT|A5C��*A5�L`J*xA6�3l�2A7��B�4b        ?�>��^�?ُTǜ7�?��+�q
@�S.�@HL �:7@�:E.��@#%�=b�q@*��ÖS@1�vÕK@5�bN@;�(��@@��3��@C��Î�@G}��*>J@K���m��@O�oS�@RU���f@T���@W��B[�@Z�&X*GU@]���@`�>��HJ@bZ<��C�@d=!���@f;|�/+�@hU�K��@j�0�v��@l��2a��@oM����@p�Y�|�@r?�Q)�@s�H	���@u�'۴@v�V"G�Q@x����@y����;@{S����C@}|�7�@~���5P@�G�1er�@�3jU(��@�%^4�	�@��n���@�Dk���@�!�5��@�-���/@�@�N5B@�[4��m@�|��`@���� �m@���
�*�@�'���@�K�uyi@��:g�Gl@�n���@����P@��u���.@�u���d�@�)hB�b@�߄���@�����@�Us���?@��S�a        ?�r�Υ�?�rd�G@j�V@ g�B�f)@.
RהW�@8�E����@Cn�0�~@M7�̨�@T��|k��@]Q�Y��@drTo@j�sPΙ�@qm�Q2f@vT,%��@|�*+#�@�kD�c�@@�F�Ʊ�@��B �3G@����p@�HS���@����)�@�V�m�@��{W��@��U��B�@�(E@�gs����@�杕�F�@���sΉD@�zt���@��֍&��@�r����@�8�д�@��:�:@� VUO�@�D;�|K�@���?d�@��@Ĭ5J@�>:H��@��h�'l@� �1�vh@�~���`�@��j7��@Ƕ�8?�L@�qZ߰��@�A�=o@�&���@� ��k�@Иh�[��@ѫg��h�@��Z�M"n@��H�9�@�&1I��@�e��;�@׮�9�a�@�y��
@�b쒓��@��%��@�B%�x��@���;~@�&\��y�@��Eg�}�@��Ͷ�1�@�Q��J        ?���٫�1?�I�|A?�gxk��?�>�:�@` ����@=[���z@�v�?+7@*���@5��]pu@@�e�@H��/��U@QƘ��#@X��&�@`�Xc���@e��rN�@k�4�R�@q�m���`@u��O�`�@z��J�$�@�D1ꗺ@�����>@�nk'�~I@�6�@�c�$�l�@�~�y�u@���5C�@��?�^�@����]�@��tw�@�NH�u�@�9�ݦyv@�K\�"�>@��$s�R@��]��G�@�vn��@�0�ｃ@��,*�P5@�J��P�@��6��B�@�ue+��@�I@��Y@�6,�E2r@�<���W�@�\�Ժ@@���F�@��ɭn@�/���@�v��?@���b�@�1�X�\@Ǧ�"5�@�+��6�T@���$�@�gu�,0@��.�I@����'@��m�C	�@����k%@��'0�G�@�ߧwF�@��X��3�@�M�b�8@�0��ln        @D�#���@p}��j/�@���$Mw6@�oe
�G�@�b��@�n��jE@�;��3�@�# ��M@�-F�$ @�Q�X�3@������@ؔӳ7pj@��U���@� �B�R�@�V�<B�c@����}�@��A��{@🅣2�@��R[E�@�Z���#�@���1j��@�����@���$�[�A JJ�*�A���3%A�x���AG|�WqA�r��aA�2�b�A
�O�0A����>AP�p�SA����iA�H�-�A�X��EA��MbSAW����A�.ӝ�jA��1�A7Q�z�qA�#2j��A��nA`W�vA��n��A '�V�ngA �)�Z�A!��u"}�A"{|(3H�A#J���O5A$�� g]A$��í�A%�JŴ�5A&�XZ.4�A'�M7�PA(xG�#3qA)a��_ѭA*N�cɊhA+>�mx0:A,1}�f�zA-'d��vA. 7�I5�A/�Xî�A0Gu_�        ?���Bg)?�tb����?�9Q{��?���0U[@�(b�:�@��4�@M@i�݆@$���I�@+p	�7	E@1��Z�B�@6R�B%�@;��,�-F@@��j�v@C���Z�@G�eڛ@K��a.�@O�����@RI�AB�@T��"��@W�Hs�r@ZwYX/��@]�q+A
O@`v^�'��@b<"�ET�@dsG�~@f��ޗ@h3����@jid��@l����@o(�]��@@p�x�hij@r,����@s����a�@t�6�{
@v{I��~@xtW%�@y�7�`��@{Q���Lz@}��8'@~�N����@�\�K���@�Sb�uq]@�Q��æ@�WE�@�dVW�'@�xӓ��@��ܻ��@���wRv�@��%���I@��W� r@�S1��@��p����@����t@�5i�J�L@�H�^���@�������@��J�绤@�lZ�)��@�,7p@��I�S@��4`�.�@���bK' @�\�Qc�        ?�������?�K��ԓ�?�yǏ7��?��ܤ��@!��	�@���~�Q@!&Z�%�@*����De@4V�S�Q@=��#��@D��$)��@L�����@St�&��@Y����@@`�}͛�@e�1zH@jT*��}[@p?#+9T~@s���	D@w�\�+�i@|��VҒ@��H-�&�@�Ћu!A�@����1�@��ox�@����j�@���JA�d@��}h�@��-�ئ@�N�3��@�P�@��@��x�F�@�}]i/�M@�R�	�=@�E[6@�VL�g��@����r2(@�ԧ�҄{@�Ccgf�'@�i>S�{P@��0Jc+@�)���R@��1��2r@�-��j��@�� i\��@�xp����@�9@�<:/@��nI�@��)���@�w�c��z@� R;9�@/Z�@íi��_�@�ԏ��F�@�����@�Dh��@Ȍ�H?�@��*��@�Aqo�+@̭ҸɎ@�&���3�@ϫ����@О��%��        ?�*P�2�?��*���?�������?���9�$@�knJ��@��Ԭe.@#f�س�@.I�6�>�@7:���/@@��1@G�=2��U@P�塊`6@V`��w�@]��Na�@c�l\�@hF#&-��@nb��.��@r�<P�@v��P�@{�5�lR@�w�%��@�{��3޵@��ȵDD@���;RNT@����@���m�E^@��W�4@��$"�U@��n<�[@��x��3@�"r'�ܙ@���e"@������p@����8wi@�&�6�u�@�}B��$@���]��@���;��u@�0sϠ�@���^Q�@�7P��O@����O�@��Ѣ�\�@�hd��B@�Rn�8H�@�Uu����@�q�����@����HA�@��<S-@�1�y��@�t��D�^@���%��@�$�/�r�@ȑ���q@�v�n�@˗V�L@�/����c@�֯�J�@�F+s�r@�(a��#@����@�*� B@��ث^7�        @*���+@Z�Wo��@w�u^�s#@��k=�o@��A)�@��|��P@�3ϥj|]@��G���@�:�
�4�@�違3�@��#)�(�@�n�XH�J@�۶��%@�[M.O,@�6��`@�m�u'�@� $HYq�@�v���Q@���侧@��tw}��@���eګh@�_u�@�5i�|	=@�����@��ZbAE@����&�6@�����@���5L}	@��.�o�T@�1}�
A �	RO��A��=��A%󢨺�Am��^D�A�;�
�A `~؄�A�¹�gkA
ʾ�νA���	NA"G̿7A�� �3�A41)��iA�\�ӯA�YXzA��3�~�AԐ��=�A�u����Aϸ��FEA�w��!�A�����A �D��2A ��w!'AH.|9BcAw���q�A���\A�k�F��A ��IA �б�KA!nװln�A""0��A"�ϗi�5A#��J�A$J�nQ��        ?��JS��?��f�Ҽ?���}ҟ"?�/a"k	@	u�7)8,@(tR�R@VĆ�Q�@$%�J�<@*����v;@0�W�.@5W͢�@9�}�J�n@>�8�w�!@B6�ㇲ@EC��Ï�@H����[u@L���N^@O�9CS&@Q��ڣ��@T)v� �@@Vtj�W��@X�1z!?�@[p��&B@^#���	&@`}u�C,�@a�����'@c���B�@e0��N@f��|q�@h����@j���4f@l��%��@n� �mw@pR}��R@qk1�ᬬ@r������@s���j�c@t��W���@vC���@@w���?ݒ@x�o��;�@zc��j�@{�"��%�@}ah#�@~��޻B@�I���H�@����^@���S�@���jn��@��U�ն@���
;��@��
D��@��f����@����,��@�����@��8�M$(@��-Xv�D@��'߶�@�L�I��@����'x�@��0�)#K@��� �>�@�*4�� �        ?n4����?�ؒb�?� ����|?���f?���Y�@�F�U�@"�MR @ ^p�N�8@*s�.��1@4[����@>g�(�e@E^�S\��@Mp�ly�n@S�	�W@Y��O���@`�ai#;@d�x@9�@i����0@o��@�<@sl d�;@v�D:4�@{��i]�@��}\��@���'�߁@�����r@��?�0�@�\iM�s@�$�>M@�G��F@��ڞ!�@��y��@������@���佉8@��VH��0@��8���@�U�)9@�4���/]@�0 O�9J@�G�vN�*@�{��MQT@���(+�d@���hq�@�_�9�ن@������%@�6�+�@�~Y�眈@��lE�<�@��\K��1@�J� ��@��fL�T�@�q��N,@�4 ?wL�@���,���@�s%x\@�kLU�[m@�k�q3��@�t�q���@ņ �`{@ƠM���!@�é:�*`@��CV�M�@�&H�N�@�e�^5�8        ?���^c?̳��6?�e�oO�@ �qu7Β@2�jD@���fJ5@)]�,7��@3�����@=r�?��@E2𒖖�@M��|d@T7q�9��@Z�w�L�@a�
:�;�@f�EF��@l�����$@q�iE�l�@u�K��@zbX$��U@��%@����b�@��I�'@�p�R��@�N���r�@��]�V�@�G8=�@�pA��K@��?�<@�Ƽ9�x�@���L���@�b
;>�<@� u��U@����@�{%�'��@�Wt���(@�H��"�3@�N��͂�@�j�WY�@��;� e@��,�@�@�!�d=�@�]P�8�\@��-��kx@��ʡ?Rq@�[�T�K�@���t�ט@�H\.��@��*C�@�n���L�@�T�^�U@�h���H@�L�f蝻@�8���#@�,���G`@�(asM�X@�,"��@�7�lș@�K�n�9�@�g�=_�R@Ɍ13�(T@ʸ�b�NO@���mtd�@�+v�j        @(�c��=@\��'�@x�uXwH
@���C�@���@�C<%�3@���{x̩@�X�w�E@����1-@��`�9@�M�#9q@��H�1��@����@�Q{<(:@�Sr<�Z@؎���R@�����[@ߧd���@���	M�@�ȉ��H@���;�<�@�T�5bk@�n�E_@���+Iy�@�UՇ�(}@��_�[��@�P�k	��@��@@�)�*��@��`�4@�8��U�L@�ԨjgQ�@�U;hz@�8<���@� C�ԩA k���aaA^���AY�l;��A[�䠐.Ae��j�pAv�a��!A�4KX)4A����pfA���7�4A
�9J��A5��UaAo�r�A�A��X�A���J�A"d`l�A�|*��Ax�c��A(����A�7o!o�A���4AMS��^AV�hr�A���MtA���\$A\3��|qA)����A���@CA�L�i/        ?�4-o�T�?�׌J@H��,�@M�Zj>@#T-���@-�Uv�\<@5m3�9@='�H�Y�@Cp��@H>��@N��^@RK�T@U��7|@Y�H,|�@^*6BF�#@akpuE�@c�<q�\@f����@i�R�0�)@l�Y|�!d@o�(���8@q�{��(@s���H@u�a�
;@w�i�z�@y��'ߑ)@|)�y0�@~�|�]@��- y��@��S�.��@�R\��U'@��r���j@�P��A˕@��CY�u@��[��W�@�IcN��@�գ�p�@��,L�@�oh�m��@�p
d�W�@�z��x�@��~��FP@��Y��:�@�Х��R�@� n�B*Y@�9�=���@�|���jc@��'��!�@�!�.�@����|r@��8wq�@�3�a�R�@��$�<	
@�����@�� BPO	@�Yph$�@�0|ru@�����e@��-Iu��@��t�׸@��o�G{@�����@��T{7F        ?�r�(��?ƒ��W�[?�|N�ߋ�?�tI)��@�I@��@)�$3,!@'��Ȁ@3I�S�/�@=� �,�@FF�^��~@O�)��0�@V5eh�@^�i,L�@c��Ĩ�@i�ޚ��@pnP��9@t�H-�%�@yy�o[��@?�_Ic@��C3��N@�v�
�\�@���6@�Ox(L��@�F�z{!�@�2���@�qKxx@��Q�	�@���0�Xj@�*J���@����F^@�&��t�W@���?@�>@�j�f��@�8w���@�
+�}f�@���Ŵ@�!"Ug�@�jD܀Ä@��B�(}@��v����@�)��"�x@��1@):r@�F>���@������@���Gv�@ȸj�S�*@��)����@���ǠUg@�*<p
{�@���mE@���.@ @�T��A�1@Գo����@�!��0_p@ן�ɢT@�-��>JU@���r��@�y��xj@�85�� @�_9��@��ņ�8�@��O!�k�@������        ?�κ��s�?��M>@��z�Y�@)�W<��@7涷A�V@C��/p��@M��3�G@UB�j�I�@]��.�@c�,l�~O@jK�{��i@q�~
.G@u�X.b�@{Y�{ �@��L�'��@��-�#��@�J���m�@�i�f��(@�U���@�l=;94�@�"�q ?�@�I^�Q�@��L��`@���p��u@�T�*�~@�m.�;�@�κ^��@�>!��]@�;�)�{s@�a���86@���n@�)a{�
@��X����@��x0��@��Qe��@�]��p�@���8�B@�ʢ_/��@Ǥ����u@ɗ�3 ��@ˣ��u�@��t�{�N@��,}�@�2��buI@�n<>r�1@ӸFQ��@�V�H��@�w!���@��ߘy^g@�s�}�@�	��C�@ܰa�{@�g�W`�h@�S<Qk+@���N@��1e�c�@��v�N�@�{i�k@���c@�5o����@�\!t4 �@茭@CR!@�����G        @Os� �)@}H��
�!@���pc�@��2���@�V�Ū@�um�QJ@���X�2@�����	@�v�G;v�@���ë�R@�"q :@�,���@�S����@�3/t��@�������@���/,}@�WI)�T@��;��3�A f&�+e�A{�l��A�#��ΘAD}o��A	�e���Ag!o��-AOD�x'_A3i��&_A��v�]�A�ib8Ao��R�Ac�׫1�At$���A��
���A�ԑ&%�A �;�l�&A!��U҃A#<mI��A$�앵k�A&Q^�E�A'��ƐBOA)"�'�<�A*ĶZɆ�A,w���A.;��S�A0Ad6�A0�m8��gA1�WGH��A2�֟U�A4	����A5 <�^�QA6?�*wd�A7h����A8���F&A9�<�׌JA;9]3G�A<i�ϓ�A=���,G�A?#ĵ|-�A@G�Mm;�AA3ب�_AA��L-®AB��ߊ�EACN��f�AD�}'        ?��:k�x�?��a��$?����e@;���s�@e7:V�@%EFĜ�!@.�����@4��?���@;	T:��@ATE��@EY�g�@I�.��<w@N|��9�@Q�a��}@T�X���@W�i���@[C+�Q��@^�2�4�@aG}9��@cB��Hg
@eX�"~"`@g��`wq@i�6^�c�@l=Y�i�_@n��aP�@p��D�}�@r�d��h@svϋؖ�@t�_0.��@vx��G<@x�D|�@y�,�Бy@{k�J���@}1�2�@�WcJ@�uP4��@�o�t"��@�r-Rx�.@�};p�@����O�*@���v�@���is��@� )���@�7�`��@�xg:�@���8�+@��D�@�q{=֮@�ׄ��5�@������K@�_���,@�!$D(��@���d��B@��X�@�@���#`1@�R\��R�@�)0�R�@��S�y@���%�޼@��%���@��6A�H'@����ӵ@�� <x@        ?������?�e�1�u?��*�8�@Q�_�@�@����@�=��4�@'
AN(�W@0Ή($%@7����M�@@vږ�@EBg���@K����@Q�. Jc�@VK�P�n@[��FF�`@a���K�@d�����O@i$��̓@m��٩�@q��f��J@t�d��G@xD=�2*@|0�͡J@�*��OX@�}'^�`�@��8�@���'=��@��p�Τg@��uy[�@�̓����@����x�@��Iś8@��Kc�7�@�3���v�@���Em�@�D��R-@���Ḑ@�����%@���K{�h@�#~\p��@�طX��7@����C�@���l�V�@�~g����@���~~@�Z����@�y��/~J@��3|���@�ܸ�{�Q@� ���^@�p��H@���(d@�7�`�@������/@�2��Ӝ@��,t�V"@�c���z@��zXeL@�fJefyM@�KS�Jg@�7�"\k�@�+�\sj-@�&�n��        ?�[�U*�?��|]��?��E��!�@
jt��Q�@Έ�z@@$�g���@0>%+�,@8� !��@A4�Wl�n@G��!9@P4K9a�z@U�����@\
B��e@a���OZ�@f�'.��K@l)^e�N@qH��n�	@t��t��@y*�$�9�@}�I��@���"�@��b&�C�@�����M�@���_�B�@�}1|]�@���-w@@�G�i�$@��e�\@�����N@��ShOl@�ɼ:=��@�� )H)@�q��6�@�gJe �@�~�p�&@��TB�=�@��-ہ�@��xA���@���.��@�	�x��@��/DS7@�0μ�`@��䗬i@����Z��@�cGR��Y@�V���Y�@�c����t@�Ev]H�#@�f�&a�(@����@���(��@�Q�5�@�xT�w�@��$	04@�X�T!@��
��@�v�\k�@��"��D@�ҏI��@��2{�:@ѷ&~w��@Ҫ2���@ӥb��        @E���C�@t�Ш�&�@���e@�3UV�{�@�ԏ��t@����K;1@����{�@ǧ��rb�@ΩŕՂB@�Gf���@׫ڠ�I�@܂�� #G@��%�g��@��O^�i@�����$Z@�,k¶�@����D�@�ѻgت@�i�y�@�Ю[-�Y@�,���@�R�3��k@��6���g@�A!�k�A p�ս�A�B�i�A;���޳A��]pwA@A
`cA����A	�n���A8�9�N�A ��BAסg���A_�Q��A\
n�� A`�ݖ�Anr�pTA��V�5A��rAiA�`�G�A��W��A4Z�7CAv����A��Aq�_��As���LA��:�:�A �ri=�A!`E����A" Sv,>�A"�w;O��A#��o���A$xXa��EA%G��BA&�ӑ�A&��-O kA'�@m��"A(��i�#yA)��KJ��A*i;8͂tA+N�n��A,75mY�[        ?�~��$Z?Ҥ���,?�x�^��@��_�o)@�`S>@d$��,@"�M	�]@)u�;�@0��`@5|��:�@:�?�ܶ@@q���@C���&,{@G�_1d!�@K�S`B4�@PC��rH,@R��D��@U�N=­)@X�vq�B@[ۚ�w�@_]��K�3@a�|P�!�@c�����@eƜ��O�@h��� �@j�߫�V�@m2�2�@o�[��qg@qu��I�@s���~@t�~{.7u@v]a�h�@x*��׶@z0�f۴@|��X��@~|��"[@�(�u�@�><�#�@�i,����@��9��G@�����:@�4f���T@������@����g@�y� ���@�n��֤@������@�C+ӝb�@�|�4r!6@�`��d@�K��K@�>$�/�L@�97�k��@�<b�f��@�G�NImo@�[>�s��@�w&�<@��[PB�@��(J�?@����%�@�;Π�8�@���lI�)@���^a�(        ?v�ݬzP?�W��aC�?�D1��m?���1=�?��@��H@ -�	#@^����@ ��aLǈ@*~\���@3�K�� �@<�yn��@DdZi��n@K�Eco@R��85�G@XK8~���@_�E��@c�2�Gl�@h@��#�@m�a���@q�7��;@u\}��t]@y?
�Z�=@}������@�+O��=m@��v����@��R=��@�ǃ�&@�*��yE@�j��p@�e��0�@��au��a@�����@�F��n�@��B��@��_i�C@��:�bu@�q̈��@�"�@�hU@����N@��>�N@�ւ;j��@���Ai\{@�20~jdD@�F�^
к@���1�^+@��u��ra@�-�J1��@����j@��/g@����|y@�I��*dL@��i���@���H�@��5$e�@���mX�@��R��`Z@�ǋr�z@���7�cE@��7���@�*-ۺ}@�N���#@ȋ|���C@��[�w��        ?�#���*?��e�6-�?��K���f@ҍ��F@<��@%(�T�}@/�c�ɒ@6�_�^��@?*{v� @Eͬ��@L&9I��7@R�J�B�@X����@^����&@c��*�@hu�h��@n>-���i@rz���~�@vU�;�@z����t/@�-�@� @��$���@���m�Gv@��[���@��!
7�@�^�}�@���e# @��� d@���ŕj�@�Y}�s��@�^D�\t @�N��h�4@��6F@�쇋+4�@����?T@�t���@�XW�&@���D�f@�Z�X��P@�7�q�@�����@�	Y�~-@��LF9�/@�^3�X@�+D�us@����68@��Pຘ@�"T.�5�@��nN��@��o`��@��`�i��@�;uƽY�@ņ�W�@����~�@�F�v�K*@ɻR�3#@�=�R(@���i䗔@�l^1�@�h_�p_@�馜�@����+��@ҹL�4��        @7���J��@g�f��@�۷���Q@��x��@��ge<�@�U�__�Z@��,-��@��\8�R�@ŸXo�2@�/�|h�E@Лi
�f�@��Ί��E@ׂ���t'@�k�Sߓg@ߦ�d�@���g@�h3O@�,��@��VӦß@��g�	�@�;�.��@���"�@���*k@�rAޡf@�r ����@����de�@����@����(�A A��!��A�b�L�A�-�=;A@u��hA����OA9��ľA��3�C�A
s�l��A+V�|JA��ii@A�&�<��A�C�]�/A�C��A��9���A��'VA��AH�?�AA|�Y��A��g*݄Aw�}:AY�}_�A�?U�pA#�NJA�-h��A ��A_��A!R��6�A"��Y�A"�Zd�jA#����A$�J�]G�A%�j��AA&w� *��A'k�5)��A(fn'پ�A)g�
�T        ?��Vx�Po?�~�O�(@\�6m��@��|�m�@&&[��a+@1wR�i@89m}�sB@@SGZ=�@E%M�#�@J��4��@PK����@S��a0g@W4og�@[�2���@_Fd�#�@aެ"��L@d>y��s�@f�c�	�@ijT�;GU@l6au��@o&˘�+�@q�<�}@r��d�Q@tj�4*�@v-qI��@x�/���@yꏿ��@{�V�m@}��K>@��B=�@�k<�Z@�>OhZ�@�e�*Q�k@���&T�@��%�{:@�x4r@�R-v"�.@�� �@��V)}�Q@�K���@��r��&�@��ק�@�>*�g>7@��Ԩ�.�@����?�@�qtAHtk@�3��Y�H@��D#�+@��le/a@��9��1S@�_�]�?�@�4G�\�@�.Y-�@��'��% @�������@����)��@���;`G@�}߅|f@�lwS�a3@�^�Sϯ@�T�e89�@�'�Z<y@���&Y�        ?���W+�?�;�U��?��a9 �
?��ε��f@	��޳�U@�b�r�@#Ȫ����@/�եC��@8���@A�Q��t@I>.ӹ�@Q~��e/k@W��3X\@_Bvy{�b@d@����e@i�jf��@p%�ҭ�@s�7�_��@xOcЇi�@}ICsd�E@�ss<w��@�������@���5�\@���,��L@�o՟ղ@�\[�ԲS@��E���@@��[�/�w@�h�~�@�~����@�f��@�*P(cI�@���u@�����@�-R�;^"@�o�t���@��W�`-�@�\ڎ%@�U⛘@�n�pܿ�@����@�|��ZQ@�!�x��
@��y�V�\@��� y��@��'DZ��@���Y?�S@�R�Y�D@�i�=�<�@pIl�@þ��g@��'�fS@�H0̃�O@Ǣ�@6@��g��@ʄ( ��@�"�y�@ͤ���'@�Ls��?@Ђ��9x�@�g�v�c6@�U�*�|�@�L,5B}        ?�`r`	?�u�Hp�@��|��B@ ��P��@-o1���@7_��X�@@�f����@G�	I\�@N�]Lt�@S�ξ���@Y�2��N@_&��܏V@cvZ��@g$�yuSa@k���O!@p}�]yǧ@sp~-��K@v�����q@znwv
i@~�4+!�=@��,@h
�@���*7t@��a=虃@��^�W�m@���W�@�$te.{@� ��j��@�  �Lo@�$K{N��@�nP[(�@��n�0[D@�x�C���@�k�@��1kn��@�"�x7@��֮9��@���q��b@�W;���x@�D�oS��@�L�M�co@�o���rS@�W��xט@�����;@��ty�X)@��[�fL@�n�CBB@����%�@�^�!��@��Г��@��9-�j@�V�x�@�&��Z}@�� *�ٕ@���T0�@��?Q@ç�^"��@��lI1�@��;��Y@�:�/�Ҕ@Ȇ�Fs�z@��XݱR@�J�����@�£�ʅ        @X���u@�K�$b�@�@�<�F&@�������@���4�]@��"}�-�@���y�@��bq��X@ڽ,�K��@����a�@�Q86���@�G�]�@��X�@���@���Z�@��ZK�@�p�D%�@�]�x��L@�seͫA לw1�A�2�N�ANO,��A&�#�xACp��A
!�L�A&B�\�gAL���1ACK^O`�Ai��q3qA���@mAӳH��A8�5�HAdt��� A�@�<�lANS���A�2I�@�A�ysnGAn�{��A�j��&A ;��P��A!��.�A!�o?7,A"��y��A#k���A$?�q�A%n�d��A%�v�hSA&�R���nA'�J��ڄA(��J9�#A)���ʼuA*xoQb��A+nJ?�vA,iW��A-i�D��IA.o}�r�A/z��LAxA0E��zUrA0��N��fA1^�U�[ZA1�����A2�Ix�RA3�D�W        ?�/�et�?�nF Us@X�`�Mp@%;�_Y�@2ű.?j@;m��PT8@C?��ނ�@I���qo�@Pg�`4O�@Tf�+9?@X�8�8�[@]��4h$@ac ����@d,����@g'�@�5@jR��8�@m�1�@p�^���@rt�5���@td���T@vk(t�@x�u$+�@z���x��@}��~�@i���@���i���@�;�Yw5@���Lm?�@��)�>�@�bl֥3�@��%�1@�j���@��/ �@��5���@�i4GH�@��
l��@�	�3��@��Fx/@���%R@�
`E��@� �<?��@�>!O
�S@�e��t�w@��(O�@���s@ K@����a@�h�ᖪ@�ÊK"˧@�(��G��@�L�4J�@�
�\��@��nH��Z@��~��@�g��5(@�<rjS��@����G@���h1��@�٫uHS�@����O �@�� ��K)@��Cmڈj@���Ph�@��a�-�        ?�]U�S?�'%�H\?�k �"�@d����@!4�*��:@0�8�\4@;�+@�M�@FP�i�ϧ@Q.��+�@YU����@a�y`:9@h��ب$�@pg��	�X@uD�1@z�6g@��!�È'@�t���i�@��8�P�@�Gg8j�@�8�0�X}@��gUBb@�=��O!�@���vA�{@��<M�@�c���t@����@t@�:��q~`@��(���:@���k��@�1��S��@�Uu3|p@�2q�ό@�0��c�B@�PƁn@���R��@���iR@��M�@����]�@�
�M�Ĺ@Ì1:s��@�!|B��@���!Wz�@ȇ�$W�@�X}��@�:���6@�.��ȿ@�p��P�@�#+�׶@@�3��@�K���@�hI>� `@Ջ,wJ�y@ֳ�yJ]]@��W�M��@��cUy$@�M�����@یV0e��@��S&z�@��xՉ@�o���@�d4Ē��@��'I��@�Ⱥ��G%        ?�B��Φ;?���1�Ն@��_k��@!�d�)^�@0���_@@:���v@D^~5Bm@M��
'�@UE�ې@]v��j�@c��D��/@jsdc�@�@q4(�@u��2@{�9�_@��^[�@��-<X��@�%�{v@��^<�g�@��E��@�EMz�u@�������@�(J3f�%@��2TR5v@�����@��㿸E�@�b�/>@����к�@�Ow^n�@�:ݡ��@�����d@�X�C�J@� O�z��@��R'W�@���Pk@�06]�)@�u<\.��@��nM�ם@��ح�-�@��N�^�@�oK�Z�@��� O�F@�w����@��/��@��#��@˛���@�}�@�t:�qF�@�����5q@��2lxV�@���^�@�����@�G��ì@ք���$@����i�@��^ �|@�y�m�l@��-��}@�P�h�^@��\�SƢ@�'�奾@���{JU@Ẽ6E��        @n�0�;�@���>��@�����@�M���@���	��@�7k5C,@�DP�m@�^CE�@졡��U�@񠼉�N�@�BL�r��@�6+���@�|l��A
]>A�AC��TA�p�4{A�BA����ZA����dA��4tA���$LA}qr�AQxHe�A6�D�A.7�#gA7�7zl�AS���jA Ap���A!b㩀�A"����`A#ŵx>��A%qP �NA&W��&>�A'�3zh�A)��9dA*�G�+�A,�V-�A-�؁�A/Z^�o�4A0�Kp�uA1h�.Ќ�A2Q�\_�qA3AVG��A48``A55����8A69�D��A7E����A8WB&;A9o�hH-A:�ԭI��A;��^��A<�>�z	8A>��@I1A?W��6�A@M�&c�A@����AA��+�1(ABG�!���AB���<�AC�V�ʑAD^Fg1Z�AEh#BAAE�G�e#        ?�˔0�y?�9����?�O��j��@(�i���@WY呡�@ Y"��?@(2k%�Y@0��;��@6W�qk�@<���l5�@BRJVD@FOu]�o�@K,-��@P j�L�@Sh�P��@V3�M�<@Y�?�ת`@]w�>��@`ɠYx@c"�V�@eb��4@g���r4�@j�؂���@m��Ur@pE�{�:@q�o���@s��_�@uL`�m�@w#'!�jd@y���2B@{�Ge�n@},TgR�@]�5�}�@��`�F�@�Mz�
w@�A��Y�@����ͥ]@��T(�B�@�E6����@��E�u@�/p{�%)@�����2@�JPX,��@��O˴@�KvVA�@�(*sWMz@�^5
�@��%��$j@���A|�@��cP|�@�١ct�6@��#^?@��⬛��@���ϝ�@�{[XA�@�*�P�@�N�I��@�zZ�s�^@��d^�y@��#�£W@��L���=@�:\�&@��;d�l�        ?�ɽ}5`�?؅ג?W?�r.Z�ړ@G��8�a@�`��j�@,o�p1��@7Lj��@A�(� �@JXJ|�i�@R�Ɲ���@YV��+@�@`�k�4�u@e�!ܩF�@kw��0
L@qZ�A�@t����@yFz�ޥ@~6X����@��S�S�@�����@�uO%8��@�M��+]@�F�G�N=@��wW��@�-C9�R�@�����@��SC9o@�O� �ˣ@���.WN@��]�P�1@���`i�@�"� ��}@�����@�
��
�@��@3B�@��E���@�XFV�N
@��wPT@����q��@���R�k@�r�m���@�|b�{
@���Ԃo�@��Kw�C�@�%e��i�@�gLY�y�@ù�ӈS�@�ZcŦ@Ɣ*Bq�@��u��!@ɹc¾&@�i�_�T@�-�y��@���"�6@�{�{U�-@�~�r"�@ҍߟڄH@Ө�=�%@��/��}�@�3t�N�@�E-��6@ؓb���@��9�y!        ?�5	�4\?ʨH#P�?�s�Pǯ�?�i!���@s�]���@� z��9@%�a3��@1"&4z=@:�X��<@B�e(�"@J�{E7��@RE�W���@XPY���@_��"Þ@d)M;w�@iC:&��/@o+��o@r�Z��5�@v�_�f�@{%9���@׬��@��?f�d@�oc=S@������@�����@��o��}�@��n�3�@��k��k&@�6O�W|D@���/U��@�@G����@�}
6��@�~��a@O@�k.��@��r���:@����*�@�i ʈ* @�f�_w|�@��y}^5@��o�F�@�w��`�@�<P�p�@��K���+@�����9@�:����@���pH�@�-�=a@��&�$@�Z�q��&@�矎��@������@�DUX�6@@�/A��@� ���!@�C�5`�@��PL~@�(<��+@�,��@�Auȷ8�@�]����@@ɀ��Oɑ@ʫ�`�@�@��v�S�,        @7d�g~@h����@�p2�l=@�~�����@�A֤:U�@��p�B�@��w\���@�¹���Z@�v�-��s@�J�H�s@�ƕ5�@�l���@ۻ M���@�{���"@�\�=Kو@��,1�@�����@����g�@�������@��7Xs�@�1�s�[@��E���>@�!�z���@��啃",@�����AJO2��2AׂޟB�Aw��\�A,l��6�A���"tA	��x�N�A� ��ێA�c���CA�]�*,�A�N�E�A=(��	[Ap_2�4(A�N���A�����APo�V�A����xA �V`v�A�5�A!f�v��A���'�A (�1�'-A ��y!��A!����A"�9?�AA#�-���A$�Ј]'A%��J�;"A&y�D�.A'x�~@q�A(}�sD�A)�yY�A*����^A+��ͱSA,Ӈj��bA-�u͑�A/(�DӔ9A0/<o�>XA0��V�N        ?�t�\��?�f�m��@N��ln�@�[Sl��@#�~���@.�V:��l@6P����@>�e���@D(,~�0�@I�4r(~�@PUަ?@S���ܽ@W��7�y@\I*1	U�@`�1�)�o@ck�0ۊB@fn����@i����@m.�/�ck@ps���k$@rl[���@tMu��3@v�<u��@x�\جl�@{Gږ+�@}��?$|I@�ʰ���@�g��;y@��@z�D^@����@�z��@��ٵ��@�TAEL)@��?#��w@�E�!ڥl@���7���@�J�S��@��G���@��*���@�zY}�H@�F@G�6@����U@��r��@����@����R�@�m�3��@@�K�`x<�@�-��_��@�Ža�@��x�d/�@��m��@��gX���@�ʕl]k�@��ma߮8@��JF{ /@���)u��@�`oV��@��d.�)@�m��@���K�@��e��@�6�9�@��r�D��        ?��q��2m?� ��y�@��J��O@-�/)��@;2�du�W@E�U
;��@OX!��M�@U� ��@\����>@b���T@g���P�5@m�#�m�=@r��
���@v�h�vH@{�$/I��@��Z>�}@�)�)÷@����;��@�Ow�o
�@��g�*('@�G��H��@�FF|s��@��E|�)@�2���@���z�,*@���p��@��A�@������&@�Aᚅ�0@�$�)��@�[�Z@�E�8@���U�0�@�_����@�Y��bS�@�q��4C�@��<̟D@� +���@�<��G�@����@��)�7#@�T�G̌@��^�Έ@�g�xLH�@�	���@��硒o@̌�>(v @�i;O��@�,�?��@�.�D�Q�@�:��%&�@�Q)՛�v@�qﺛ�@՝2�� �@�����]_@�X|^(@�^M���@ڳ����@�$��C�@�~���@���F��@�9׬�X @������        ?��Cك?���+�R@F�|�@!�CÀ��@/�2ľJv@9��fN6T@C3���@Kd �v��@R�a����@YQZ'�@`�,S��@e�i���@ku�;É;@qFJ#�zB@uv�cM�@zYu����@���$��@�2�o�"4@���X	�@��w�'�@�w[�o��@�G]�6��@�S�`@�D�C~@����}�@���j]�@�����HU@�N�̮��@��1n��@���V2i@����e @��P��b�@��s\�~�@���he!@��Z�aV&@���"�@��Q}�\�@��(k�A@�yʌZ&@�}Zi@��Q�KH1@�-��Y��@Ě#��O@�'��@ǜW���@�1�=��0@��0����@̆����@�Fw�R4@�
j��@���|�@��o�I3�@����tz@��.�U��@�~�(@��,{��@�;FxM�@�e)�=AB@٘�]�@��ν�@���MJ_@�p�g��@��`�(�        @TM�$+}�@�ڊ���9@��^#ah�@�I�ZؘX@Ľ�ు@�$b�+�`@�>���@�V��5�@�ovHҽ@���}��6@����l@�zwЭ@�Q�H!�@��ŕU�A ���<�A�<��d Ay:�4%A~���L�A�c��cA;����Aw���$Am�-��LA|����A�D���^A�5��A6� �?�A���t�`A �
��A!�g=^�A#$�۷kfA${�>���A%�L��A'9L�6��A(�.��fA*�jiaA+o@F,A,�!8m�A.F��Q^A/��sA0��ߞm�A1H��[��A2�C�<^A2����7A3y�!+�A49	r"�A4��\svA5�kU^LzA6��_YA7R���A8 ���#A8�g��TdA9Ǟ��,�A:�>�R�A;|��F{?A<]ED�UA=B�\ld�A>-�+nn�A?�:���A@
#g-�GA@�j�*AA	򿏖�AA�ƭ/��AB���I        ?�#�I��z?�U]HZ]?�D��Z!?��I`���@ !)���@	��I��I@�k1�p�@��XU~�@ �ؑ���@%���{�@+�m�b@0�,�i��@3ԧݷ>�@7�iK?�@;���V@?�%��(2@BX}��bR@D�=uƭ@G�����@J�S�QԎ@M���F��@P�bL^@�@R��H�T@T�۵兜@V��8�:�@X�@ �&@[T�gqn.@]ᇍ��S@`J1�ZF@a����Hm@c61��@dȮ��e$@fn"��@h&L��@i���2�@k��>�\@m��
�@o���,t@p�&��&+@q��D��!@s�e�B@tF5*�h@ux���?@v�i�s"�@w�x�^Y�@yM��6�@z�9�^O\@|�I�'@}~����@~���5�X@�?�Ϸ�@�<��@@��T�v�@��y.��>@���|w\V@�d�=�2S@�Jǣئ^@�6݇#��@�(��a��@� O�2�@�*� @���eL@�%�^Q        ?z8@Gא?�k�M�9�?�X���~?�~��E)v?�r��y@�	���@$#|!|@eOJ�i�@(�@ߞ@2��|���@:�w�N]�@B�ql2؎@J�%G@Qw���@V�z޷�@]�9%
�@b�T�H@g�X�rͨ@mCޒr��@q��= @u��c���@y�4�*�@~��� �@�U-5G�@�(n?6@�g7֔�@� )^���@���J�@�_�x=��@��Efz�@���#�WG@�}����@����b|@��tEh>�@�n�����@�p0J08:@��gK���@��b���@�[B�7�@��7S5B1@�`&]�*@��K����@�eG!O@�f����@��ZyX�@�����X@�c��K��@�Ug��#@�Z{���@�9y�z��@�OY�,��@�n���}�@×�`J��@��MF��@�,(O�n@�KZ�
@ș�U�%^@��M��i@�Q�Ӭ�@̻c�BLx@�-���SJ@Ϩ�_PJ@Ж/����        ?y9��/?��.e� ?�=�Jc�?�j{C��?��?z�,�@	{�J�8~@�F�(b@$�{�0�@1-�m
��@:���bf�@D#=2��y@Mc<�O@TG��`��@[�x&!k�@b9m�?�@g�lrI��@n�3�@r�U���@wA� �t@|\H��@���w�R@�j*cj@�'�Ww@�W��(�@����C̑@���b)i@��뀵�@����8�@�w��vN�@����]@����H�@�E�z�~@���"�W8@��=ٮj@��W�S�@���)�@���콖�@�s\b�å@�()�tq�@���Xb��@���a0H@�ۑs���@��s4�y@�&��P��@�910A��@�k�;��@ª���Br@���z_-�@�O�r�c�@Ƶ/�U@�'~��J@ɦ��E��@�2�\�T@���&�	�@�q�ZV�`@�� ��@��+*kW@��Jc��@��^�ü)@ӹ�֊�@Գ��?4,@ճʭM�@ֺ	@��        @ Ԭޚ��@O��ڋ�@i�R1�e@}7�?���@��~�v��@�7�� 6�@�!�&��@����T's@�� ��*s@�H�\���@�۹�Z�@���e�@��u���V@�Rc:�@ǔ �T�;@�o��=Z�@ϧћţ)@� ���A�@Ԡw�N��@�V��@�G��dTq@�v��֕@�tlJ�U@�R��ON@�V�7�J�@������@��A�b�"@�k6���@�%+>��@��+�^@��i��@�߸�Uj@�|��r@�S]jP?@�Bf%��:@�H�X>\$@�fc�F�@����>��A �*?h�A$l��Aap�8I�A��3>�A ��/Ab]�o^�Aј�_�A
M��<��Aօ�1�Ak�����A�:��aA^BZV�A;��(8�A}���A	�V���A��� 0�A���A�$;��A�6��}�A ()|JA8�6A(�1WAD���Ad�>�S�A�BA��E        ?������?���~��?�MEXY?�N���?�U��V�@p�� �'@�o���@�WN�\@�����@#�E]*�.@(H�c�@-p�*�g@1��(E�@4���A�@8&��� R@;��]@?�/�$��@B*�2�L@D�sbb�@G��@I�4��W@L�~C(%G@OƳ?Q�m@Q�ٗԥ�@SKLۻf�@U(�+�HV@W#�41W@Y=�BV��@[w ��%@]�咍��@`'��#�L@aw����@bھ�rK�@dQrB1�@eۻ�#~)@g|X�,@i39`Z@k���:M@l��|01V@n�!$�N�@p�#��-C@q��'�#@r�c��|�@s�Cg�@u1R���@vV�z@wۇ ���@yFF@�@z������@|I�� �@}��j�J�@��p?X@����Q7�@����)�-@�t*S�2�@�j=�|X�@�i'�'��@�q�I��@����
U.@������@���Ӫ
�@���Z@� H��        ?v���.�?����(?�ĐU���?��O,IT?��=_��@�Ӟ���@��莉�@D��z�@#�rV�@.�J-��@5���۲@?$��@Es4<�,�@L֔�Z@R�����@X����ٯ@_�{�� @cuΔHt@h0Rԯ�@mK,Y��;@q�
J@u�`��@x����X�@}M���}@��ʽ9N@�����n�@����(�M@��z�P�@�[=ru�@��o��t�@��>��=@�ا���@�;Ud�zm@���1�@��`)�@�x<��o@�L��*�\@��-���@�����r@��t(��@��˱ �@��E,R5@���Ń?@�DV�I+!@��(�+�@�'��H@�����0@��8�mD@�h�_~�^@������@��߼�U�@�?�mg�8@���ᬿ(@���&��G@�Xb���q@�R ����@�T�?�k�@�`wh $@�u:賔@œ-E"|*@ƺh 8�5@���}�o@�%%��b�        ?q������?�C�ڳ�3?�d�~7?���@y?�{�Ka?�.b���@	y�x���@���Ba{@!S�����@*��R�$@3��=:��@;�����@C`Y��@J5OnNl�@QX��\@V��CV��@\�c��Ů@b��+n2@fr@N��_@k���e�@p�Q� |�@s�ܪF��@w�@���)@{��hh!@�UqM͕@��
�	�R@��| �@�"DX�)@�|`�kh@�"Ҫ�7�@�1:3���@�k=J��@���B��D@�i�a���@�2{g@;U@�.����.@�0Gk���@���b��@��2P,@�� J���@���9��@���p��@�-�A�R@����@�qiߺs@�rR��<c@�ߘ�J�@�_Ć{6�@��T
�4@���݇sz@�Vgk�1U@�&�O(z@�D>-7�@����F@�,|�cN@���2�@�>�c�Ϧ@�ig8�V@@şp�=Y�@���|�H@�.\w��6@ɇP��һ@�����B        @Z�sX@J8�)�S@e�d�	@x����@���'I@��nx�n@�w*]|��@���{���@��n)�?�@�$u8u��@��Q?���@�7|B��@��k0�@�]53߹@��Ye+O@�Q���	@��~\���@��#�HM@� x���@Ϟ��|E&@Ѯ`l��\@Ӯa��D�@��H�-�@�$���C@�~-G���@��.~�@��W�}�@�P?)�q@��Y�h @�n3�K�:@���|��@�� @4�@���r�@���a�@���?��C@�+��f@�'v �8@�\�rj�@���@��dA��@�W%6�/�@��J�C�{@�K�|@���܅Q@�~ �{P@�/�5�� @��#��oA �[y WA�J��A�^���A��%�.A�%�4�A��D�q(A��}c�AE���4A	zqN��rA
�b,��Ap�qV:AU����A���*CA;t�3A�0&�^|A�k��T