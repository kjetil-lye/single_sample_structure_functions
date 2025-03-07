CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T112639        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?tw&��;'?�w�E�JV?�ߝvG�|?��۵��?�$�3��?��,�?�ɋ�ѭ�@e��X��@	���ş@�L�k�,@i�!2@�3�uI@ ��{���@$+�i%@(u�3t@-x6����@1���ey=@56�w�J@8��Qe�@=KO��>@A"��Qo�@C븭圥@Gߊ�0�@Ji�v���@N �@N@Q��;\@S=Dā@U�����@X�s�@Z�C�]�@]h֏��@`(���y@a��8��@cBb�ˣU@d�$�f��@f�z_�{m@he�(6�@j?�?�n@l*`�狰@n'�rѧ@p�'%�@q*VzZ�@r@��vur@s]��3�0@t�a&�@u�[��@v�FmVN�@x;:�@y6��LK�@zm�J�G�@{�_p���@|�"���@~(��Xg3@oG��|K@�]Nn�^�@�j��]@����@@�\����@���78�@���_�@�n�b��@�!Q�Ȝ�@�պ��3p        ?�.Hr8?�W��r��?�ؑK_�?�������@b�b		@��R��B@L�M@(��U�@2��;}ӄ@<�8��@ECΒ) @N�j&Ѿ�@V#��a�@_bX��@ej�����@l��@�w!@sD�Ǖ�'@y0����2@�4��U�@������@��s���U@��Ph��@�ra��@�������@�7'���@��	?�8@����/�@� dք{N@���	�s@����bv$@�c( ��@����p@�E�X��@��.�p�o@�dב��j@�C�%'�@��䱐�1@�8g��R@�ߌkq�@ř�>�z@�f�*�]@�GG�Z�@�;�(���@�D1�L@�`��}��@�Ț��d�@��р�@�����@�K�,�@Պy.��@��ZL�'�@�#n�-K�@�}Ӡ���@��ܢ��,@�P���@��8�Bx�@�N�R�i@�oʏ8��@�?[��`@�E����@��A��@��g�DՂ@���}[Ow        ?T�&����?�C�g��?�nwr)��?��`p�;�?�P@�|�Z?��u�6�?��! R��@:B�$1@:_�mŹ@A��K�@(�g�@3>����@=#Y�;�@E��(>@Oa���@U�/זa@^����'@dK��`'�@j��m@q[�6e�@vea,v�@{��1&@��Y�_@��|�";@��4��n�@�<�
�B�@����L@��(����@���m?�I@����dD@��ڷD�@�& �s�@���]��@��(7�b�@���	[��@��v���@�T�O�@�S�"�G�@��]���@���ԑw@�e7�@����1�@���r�@��Y�H�@�m-`�3N@�@ m�V@�-[m��G@�6۩�}@�-�%�5�@�O<3	��@/b0I�@��l3r;@�A�2)>@�t^Θ�\@����&�@�m��@�@��r;�_@̱.X2h�@�pr#��@�"x��@�r���@��K�� @��p��T        @L%��5��@~��~a�@��gŉ��@�m�;$�@�N���@����y̍@Ӓi����@��biQ%@�<e���
@���i3@��l^@�R;v���@��-aP��A �Hj)�A�w��cA	̯�B�A����}bAA��w�ARn7|vAwr�A �[MJA#�=B��A'L5�^�A+8ڤ�A/>+-זsA1ى2�p�A49� K��A6�]DXX�A9exY@MA<,��*9�A?i�y-AAA�|TxAB��/l¼AD6fWN�+AE�Q6_8AG��/�zAII�2M��AK��AL�99��'AN�q6��TAPC]��tAQ2�24AR#އrc�AS٭�1AT `EAU R�Fv�AU�
�xiAV�ц��hAW�&|qfAXՓ��AYȾ�X��AZ�qz�{=A[���I]A\���)	�A]����>A^pLY~A_YNE�dA` O��2A`�8���BAa�`��Aaw��B7�Aa�n�1Ab[�B��l        ?��$z�?�eFy��?�@{hf@�L���@�7xD{@%�5^�@.�G�nSw@4M���<�@9縴 �o@@퉈�#@C\�E��@F�B��8@JƷf�p@Nڽ�җ0@Q�@&R|@S�PO@VV:�Y�@X�Y�H�:@[���
�@^�@��%<@`ܧ%u �@b�=G4\`@dG�X� @f#b��@h0[j��@j j��G�@lA~��|�@nyx����@pd��4@q��G�<+@r���lk@t�O3�@ukFH�@vþ�|�@x#E<�Ǘ@y��p1@z��ļ�@|`���< @}���(j@B�쳚�@�Z{b<@���R�@��2�*�@���V�@�:��Ә@���Xέ^@��r��@�VhdfxA@���@��C=m;@�]�~ Ht@�>C�֬@�����=@�KLn	@���ؖd@������4@��#$9@��b�@�Y@�IН5*C@��=�~y�@�l�T�b@��5t	@���L�r^        ?Xi��6@s?����
9?��ȡ��?���@��M?ͮu��R�?��~�*"?�0,�x`?����@ [�5���@��:�~�@���c�c@"�B�@+�`R/ǌ@4�����@>�:�V.@E0�괔@M0�Å�@S�L���A@Z.�o�@`�<�ڳ3@e�����@k?�N�k�@p�Ѥ��@t�!Dq�l@y=�4@~P�5��j@��~�N@�Eצ`-h@�� �8I@��t��@��ِ�]n@�%:��Fk@��:L@��"S$�@���~���@�n|��s@�����K�@��z�ܙ@���bĭ�@�p���@����l#z@�6=O���@��"@����ȊB@�!#L��@�Ճ���	@��B�4�@��)@��@����|��@��Җ��\@�sm��*@�����1Z@�\j>@�^��x@�̑iτu@�N��<w�@����c i@ɒ�b+@�V����	@�27~xK�@�&/F�ed@Й��'rZ@ѭ��5��        ?̌�%��@]�8b@C$��0@-��q��@8�@z��@A:�{?{@F�=,-q�@L��ĕ@Q�S/��e@T�Xџ�`@X�5\G.m@\i��%@``i�K��@b�˂ǿQ@e���4�s@i�"�W@m����@p�t�<A�@seO��zb@v]$�w�@y���Uԕ@}x��R�@�����u@�(2��א@���Gu]�@�����u@����Y{�@�� E.@�Y����@�V���@�{��[�@����k@�B�S�:�@����m��@��K�%s@�_��� @���L�:@���S���@��vñ@�@�w��1::@��ԅq��@��}%:�@��S�M@���%���@�"s�I��@���Q�w�@�	��^@����@�E���>@�����@��+Pi�v@����6�K@���<"�~@���Q��@��n5K�@�<㱲�@�*j в1@�Y�j{��@Ɣ*jNY8@�ھ�Nb@�-���@ʍ�P��G@����M�        @v�rpN@��}+��@��f��s�@�%`���@�v��I�@�Q2���@���gQ�@�F��v��A�+���Aynln=A
Z��i�AV�o�A�A4��rXAJ�Ǒ�An�]1xA�b� NA�*D�DA@?�W��A��m�%VA �Z��&A!�!=_�A#9���W�A$�RN��SA&	j d��A'����MA(�J��;�A*����#}A,�-7��A-�wg��A/W_U��A0�8`^�A1]-�P?A2<Y�%sA3{U'�A4U��Z�A4��]�=A5�?D�@A6��d�FA7�'�L}CA8���B�A9����+4A:�k�T�4A;�A�<��A<��"��aA=��~��$A>�
�"�:A?��w���A@E���A@�U̷IAA=��m�8AA��Q�o�AB3�ߔ��AB�|,ʶAC(����AC� 6��AD9�1�AD�3���kAE��fAE�sz·�AF\�l�AF��cݘ+AG+�̘*AG����        ?�t�C�?�
!�RЯ?���� ?��)?y��@r2b<}@����S@�@��@$G��o:L@+���}@1�D#��@6���!�@;H��)p@@�]>�@C�!�9a@G�U��ԙ@K�A�?X�@O��=�
@RSa�iD@TޔX@��@W�#8���@Zv$�AP�@]�>/��p@`[[P�6�@b��r�@c�덩�@e��}�W�@g�Q�ߐ@i���R�@kэz�m@n��b@p3w��?@ql�S�@r�|1�H@tqZ�[,@ug�k�U�@v�
Z_@xS��I$@y��(��@{u�D��"@}jn,�p@~̋�u�L@�E�йt�@�+�?��@�B��(@�
�ϴ6�@�0R݆@�`�V��@��l��@��r$@�qc��@�.��Q$@�FSU�X@�b3@M�@���fi$b@��`����@���;Z-�@���?�֭@�����
@�4*����@���٣��@�q�V$�M@�����@�����݃        ?��J1��?�Σ�� ?���)�?�ˉ��?�[��@1$�:&@Dx��2@1�[��@")(`�@(D��D� @0,m9��@5���r{@;j���@A��Ʀ�r@F�ۓ�=z@M0>#�3j@R��h��v@W�߯�P<@]�4�ژV@b�Yʅ%@g3){���@l��0��@q�rj�@u~���@ze�f�@H���@��t��@� ��{�@�6ۑ��@�xE(��@������@�u���@��Du�x@��@��R@����&�0@�E$���P@�t:����@���9qk@�c�l��@�(�N|56@�%!�YJ�@��Υt3�@�g��2@�A��p�+@�=�8���@�]\g�*@��u{� w@�׶B�>@��d-3�@�2�U)��@©HIy�@�7t��<@�����@ǝj��!@�v�L�G>@�j���9@�y̵��@Ϥў�1,@��,`*-@�(vJ)2@�i��%h@Թ|B�V)@���#�        ?T��v�t?�-1�*��?�U���?ȣ�Bgk?�v���?��*l��(?�1\�s8?�$��@]��.��@\ �v�}@�z��@!%��k�h@(�G�'��@1��q�@t@8�r���@A%�ox�@G���b�6@O�.��@U2�
y8�@[ڼ���l@bD����@g�x��@m!����@r*X�RMx@ve'���S@{O�b��@�|3�0%A@��'<{@�[���o�@�sT��@�Ɩ�@������@�Ns�hH&@�Zq�M`@����!�v@�I�=�eG@��ս�@��BC�@��L��tm@�q����@�4ӫ��@������@�p|�q&@�
C�ȴj@�����8C@���^u�@�|$Ф�;@��ټ�z�@���wv�@� ���f@�8���~k@���J��@��#�.��@�U[N��@��X��J:@�~?XҨ @�69�ǟ�@�z܊��@��</lY^@��� B{@Џ���6t@Ѱ�il}@����H�        @U������@���o{d@�G�l5o@�?]�@�/�NgR@�Z�[�W@ܙ���]@��F�8�@�Y�5{@�*�5�N@��7!s@���W��A *F���+AU��/^@A���5p�A
�5%�A �&�9�A��7��Aa�`l�A&w4��A&�ʵ�mAgZv��A v1�=A"]G�SǆA$ki�?A&�
�G��A)�{��GA+��D>��A.[`~^:cA0��O�םA2>�s�{zA3�9�aA5���w �A7�ȯ�� A9����[�A;�L��A><6�M�A@X�J=��AA��]EaCACV� �AD|�7��AF
ujAG��::�{AIU���h�AK��4�AL�WO���AN�NѴ�AP{O�4�AQ�Q�YAR�~���oASǁ���AT�6���AV/�p���AWt3�Mw�AX������AZ��Y��A[���43$A\�+�F�A^s��P�A_���N?A`��W,�Aa��>$Abn�9�~        ?c����-?�;u��?�f\&�V@?�T��5��?�TQD1p?�$ �:�??����x��@A���:3@�pV�@4M�=�@��-Y�@z䮃�b@�ɚ��'@d%rt�@"<�Ȫ�@%�5�&@(G"4�@+E���V@.�);�qm@1Sg�Fp�@3ieNP�@5��u�ɇ@8 ��#@:ș�03�@=���v�@@^���	@B�k�s�@C�w���@E���؊@G����@I����@L!��{��@N���?}@P����@Q�X���@SN|�e��@T̊�=��@V]�����@Xv���@Y�D00|@[��5T]�@]^�.H\@_LQt-�@`�&	�@a�6�oX@b�|����@c�����@d�38q��@f��v@gQ%d���@h�ǄJ5@iͣ3�@k��CIq@ll�x�x@m�]� ��@o*C�^)@pJA��#�@q'���@q����l@r�L)�_@sD�S��@t�ez�?@t�D�        ?�#R���?�K�Į�?�ok}5@ډ�=��@���wqc@S�v)�@&I���j@/�"6�x{@5�:
�l�@<�w*5a=@BcʹBg@G.�޽�~@L�@*���@Q��Rk�@Ue��X�@Y�RJ�@^��Z�Ă@bMk�@e���~�c@i{(��)@m�L\�@qh��c�`@t5Q{�@wV��ȓ�@z��vx	G@~�F�T @�vǙ�,9@��Z���@�W��� �@��X�@�&��NU@�oo�I�@��{ O@�m���.�@��]A�a@��]����@�0~�;�@��.�l�@��&j��@�NV*7�@��52��@��9լ�@�}0Jn@�t�0b<�@��-�M@���C���@�%����*@��E��|@�(�m�k[@����7 �@�2%��@��}Au�@�E��Bq@�
7T��@�טT��@���E���@���D���@���?O�@���"�h@�9A�Bf�@�p��Cr3@Ŷi��,�@�
��e�        ?0K���h?h��E��?�k"7�?�ci��#:?����P`>?�z��<�?�����?�KA��P�?�;ye@T>?�tM�dD@	�[w���@���b#@!R-j�)�@*�@�e�@45GZ��,@=|���e�@D��a���@M"���{�@Sף�G]@Z�6ݐ@ay� ��t@f�ٵ)�@m�F��@r^�w� @v��o�@|np?��@�i�~!�[@� �@��J@�f����@�F�mh�O@�� �Z@����/@�o�Vha@�>'Ш�@�6vIΒ�@�~�\�$r@��[smX�@��"�v�@��_!�J@���y{a@�l0�8�4@�(�٠P@��z��l�@��9%!C�@��d���@�'�e��T@�m����@���-���@��^ı��@����mA@�ZK�&v9@��6�
�@�M���@��;�J�G@ɅQS;�@�<���\�@�Y�I�d@��0=,@�l̝r@�o�ߴ��@�~|X��@Ә{��w�@Ծ)� ]w        @4�Zf@t(�f²�@�d��G@��ˬRM�@���51@Ĝ6b��@�q罔��@ӧV��i�@�	?���:@��X��m�@�X�X�o@�Ͳk27�@�I�l(w�@��b�)@�m6�!@�x��W�@��ѓ��`@���p��C@�?��}�i@��(@�1h@�X"�Q�A ���*ÿA�>SQ��A|M��A�D�f�A�I��h!As��:�A
Bj���A%[��A�i�1�At;�	A#�t�v�A?6nVAf�s�}rA���;ZAۈO|(A)�->�A�s�2�A�-��*�Ac��&A��S)�AqDQ1�A �o�A ����A!��&ƞ�A"�QI�A#]�	�L-A$>D��l�A%!����A&��;�%A&��5��'A'�Bm��A(�o_�xxA)�����tA*��~��&A+�'�(�A,�B�7�A-t��h!�A.bl�$�6A/O��M��A0)�R(�A0�F,���A1
B��q(        ?T3��E�G?���T?�[��F�c?��}G�?�b)��4�?�z�P�?��iw�~5?��B�m�?�'E��?�jE*���@ �H埿�@vr�@	�!���@��u�@�PU�@�1�)n�@\�� �@J�7m@ � +�C@#!�.6�@%���J
@(g49���@+`i��@.����#�@1��d��@2�� ��@4��$�J@74���@9`OF�n@;�$s�@>�[w�ٞ@@���o�@B?�i��
@C�8@#d@E���^W@Gy���@In~-S"@K�����@M��D9(}@P |��@Q:�C�c@R���%��@S��UDq4@Uawa$@V�<�sW@X�u���@ZJ�����@\%�%�@]��i\�@_��a9��@a �*8�s@b/��X�@c+e:݌@dOO�-*�@e|�w^�@f��o�LR@g��r���@i=*B�o�@j��%��@k���6@mO����]@n��bZ�
@pT_���        ?T�]��M�?�jv!��?�oдi;�?�ܴ�s�?�C�[�x�?��Ǻ?��)���A@�t4j��@���|�@ �uw�v�@+��L;�@5����A@@��\��B@I:��O�q@R�G+Q�y@Z��@gU5@b��?�6&@i��:�@q�`X'@va5�`�@|�*�g��@�+%3u<t@��Ž���@��Ȍ�U�@��%L�@���uC�>@����+r@��	���@�����@�t�O�r�@��A�XY@���b�@�O��'��@��4SC@�K�,��@�梚�)�@�J�;1@���{��@����d3@��ݑ�C@�)��qYm@�����@��ĵoI�@�V�'���@�E?k���@�)t�h��@�A[��@�k�6{@é���X�@��*�~@�f�oi,�@���dj�@ɂ2 s��@�6zI��@�8�苐@��ƪXP|@�~����@ѓ���@ҹ�m��W@��_�j
�@�9�8C9@֔*�w�@�s���        ?,2�g�M?i����u?��˞�?���z�z?�j�0��2?�P�?=?�Kڞ�w@Ƨ��L�@-yR��|@-l&	[�@:���uW*@G/�{���@S {�k��@]��W�%U@fa��E�@p<E�׍O@v΅ ��@ ?B���@��KI�7@��:��@����
@�V<���@�)�綛�@��:��@���!�ZP@��}��@��<��8@�>�	}X@��&8��@��!�AF�@����\�@��ٵRk@�B�@�M���@��̓I�@��W�L��@���5��@�I��e@�3!��7�@�I7F2��@�\^pp6f@�l�o��Y@�zu(f�h@ȆG���e@ɐ�	��@ʛO5�Y@˦��_o@̴gt[��@�� �ס@�ݨT��@�������@Г���@�-��,�@������@�x{�,k�@�+�v�@���N�@ԯ;�$�@Ղʄ���@�c9�S@�Qo��u	@�NT���@�Zʑ�Ӗ        @��Å��@J�B� @m�uڀP�@����x@�g`�ĉh@��JY��t@������@�K(Q�Ld@�RT�]Z�@��Bj��@���m{@�-7%�[@�y�\Cjp@ه+;��o@�f/Ɋ�q@�0�n�~@�����@�@��VD@��;�\-@���n�h@��6e�yS@��2�H�D@����P��A :�hXGAVDTR6�A����8A6���.A	���9�A��{�$;A�`s��xAt�>'��A3���"zA��˷�A	/z�c�A �yW�AW�[�A�����A E��LA!b1K0�4A"��^(A$8�""A%6�	@A'd#�I|�A)Yz�A*�UOB��A,��$=�A.�L����A0�n�᝙A1�Tǝ��A2�墤IwA4/�:�A5Y@ ��A6�*�M�A8�3�
A9����e�A;��%A<��,�K>A>4�\��A?�ߺ�LA@̹8UL�AA����WHAB��ܻAC��`^u        ?����?����,�}?��}���)?����8��@ #7XvѨ@
��lt5@��dS@�sٯ��@"�-^F��@'� ^@.����@2d��C��@6#!i�s@:=�ޕ�l@>�O�H�@A����=�@D_�-�+�@G'��g�@J�Zp@MA�z-9@PI)2��@Rz��;@S�z"���@U��xl@WüH�V�@Y����y@\r:��@^C�~"X�@`N��w)s@a�����N@b���6@&@d(��3�@e� �f��@gd�8�`@h��PۻB@j)0M�iN@k�����m@m�w��@ojN���@p�ʰ�?�@q�z���@r�ɯ�k@s�S��jJ@t�+a@v"�[��F@wb�M@[�@x�F&o@z~'�M�@{�lr���@}�6�Gr@~�5�|M@���C@���֖K�@���7m�S@�Ш�V�@��O�)�@��iu3�r@�����@�������@�&%�1��@�[ 6:h@��f�@�ꤚ��        ?)ƚ�t`�?dȟ�<:M?�q3?����b�?��qD<?�n�'��?ͩ��R�U?ݳ��Λ?�f��?�tj��@Ӟ���.@y�+���@!�:&Yl@,YQI>�Z@5Ĺn�d
@@+�� �m@GP#
�(�@P[]'3W�@Vf�x��@^��iy{@c�r��6�@ixf��Կ@p/�[)�@tHL���@yݦ��I@~���M�\@��˚�&@�/å��@�Q�\@���@��&�@�����@�?h/|@���͐� @�T�,��@��J��0'@����k@�S�Gfh@������@����iT5@��L{�	6@�ܟ�M8@���u!�@�J��5�@�)Rs�$�@�"��?z�@�7�c萌@�h�	縄@���&��@��i��1@�ԽZ.�Y@�(lĈ�z@ċ꼗f�@���g�"�@ǄO�#K�@�K���@��<�8�3@�|���H%@�J�K��}@���~�@�H�#J�@�,�%�{@�(.�ya�        ?x��H1�?���k[zb?ն* ��?�&��;p?��Q\���@P��+��@�S�e �@�@#kmF� @*�J��0@2e�9�P�@9Tp}�@@� u�@F�Ƅ�d[@Nv���Ȕ@TCWkޅL@Z��e���@a��2�;�@f�RH~��@mY���@r�'>kO�@w�ݷN	@}�ŉж@�X�
���@���h��@�b����@�iUʬ@��t�>�@�SF'l��@�c�<Cd@���2@�s���@�0�m���@�+�Zƕ�@�f��d|�@��� �Z)@�M�Ȏq�@�K@��Y�@�i�@��0��>�@��m��"@��e$mm@�%����@���+���@�e����@��Qڧ
@�}���Ux@�$��|��@�ޅB�;l@ʫ(S��@̋de���@�ƍ(��@�Dq6�%�@�S��X��@�m׻o�y@ӓN+�ٌ@��\Të�@�TXz��@�J�P��@ؠXݓ��@�;�>�@�s/'T��@���l_M        @>� ̸M�@xՄ�5�@�Of1��j@��3〤�@��扰ޫ@�"m&�@�L��G�@ڶ� K�@��8Y�@�j��/<@��h�L@�̊Zi�@��
y_1�@�n'4 @�# �ZC�@�4��Z�A�R�qВA������AL�
���A�0�pSA{I�ġUAJ�-�A���+A/�}E�AՂE���A�N�g[Ag�T �AWa�9��Acw��yA�j�� �Aڤ��aeA!%��A"o`6�V�A#���x��A%>����A&��,X�A(aSay*A*��Q�A+݉��!A-��L�9�A/�����%A0�I1��A2�׶Z8A3*�&��RA4bvm�A5�@e@��A7 �N3gA8i��B��A9����5A;p��8�A=���|�A>���ո�A@C�̉AA17��k>AB)8CuAC,k�#�AD:���K)AEU���AF}��b(�AG���b|�AH���tAJK0�U��AK��O���        ?�i=;��?ߵ#I��e?��R�e@C((x�8@ ��ֆ|a@*�c�J�@3y�!'Y^@:���Z�@Ab��D�@E�^�=�@K��Ak�@PR	IY�S@SZ�|�?@V�����@Z%Bl'%w@]�{s�@`�
��t�@c
�n�@eA��8u�@g�W�qb�@j�Q��@l����6@o0� �uQ@p�u�U�-@rf��HE>@s��aB@un��0�8@w�q�I@x�9�ѭy@zg�x\�@|+���b@}�����_@��˾@��\*{�@����Y��@�垌3��@��e���@�a��@�BZ\��@�5I�ڼ@�W��X�g@�,�@��V�ɑ�@�����A@�z�flz@�H�˺�0@���F��@�a���@��;tK@���AG��@�G����@���ut@��]���C@�:C�c�@��'�L@���q�wu@�;����@���W�e@��kރ�@�I<~$lu@��s���	@��?�d@�d%��        ?�w���?�%A��?���2�X@�#~4�@�.�4{H@!���px@({�(0��@0��N�P@6
T���g@<�ikxJ@BYs-��K@Gc���q�@M�5��@R��X9k�@Wx��@�@]G��@n@b'���>&@f_����(@kfcz|F�@p�����@t"�&3[e@x'�w�@|Ĩ����@��Z���@��>�q�@�Ci<��@�����Q@��R���=@���L�"�@��a�v@��uፙ�@�c{.�f@�T��0?@�u�����@�b���@�" %a�1@���;�@���_���@��T��r}@�	E؀L�@�>)��Q@��W�C�G@�����@�9'�ж�@���=�@��/Aڈa@�N.4腬@�ȣ6z��@�S���	@��2X#a@����b@�W"TF@����t@�Zk)@���J���@���H��+@����L{@�!����3@�A��@�l|2bB@Ƞ�̂�@��3!�0@@�*�u�a        ?�����`8?�����?�b�1X�?� |�R�@�!�s=�@�<g�@�5�[�@%�v��@/���1��@6���TJ@?�	hB�Q@F.���)!@N�9+AN`@T����@\U�U�x�@b�
�e�@i�L�u�@p]QQds@uz�V8�@z�
��-@��+@6�@� � +K@��Ȑ�7@���B�@�Zh��'@��>�WA@�
I��@@���,�@���5���@��eZLju@������{@�o���)@�6���ו@�f�X��@��z�nK�@�etJ�G[@�:����@�N�b�6�@�R�<�@�!K�eH@�Ҍ�("@�2��dI�@�z�O���@��s�M�C@͖ȟ @�8D&�q�@��H���@�d�6�@�'�ܷ�8@�	��V_�@�Of{�(@�3b�k�@�}�>s�D@��̖Y��@�B��X�@�pʦ�@��&BB�@�	�bp�@�H���v@��J~-�@�ڀx�G@�ʿП�j@�֒J��X        @mً���@��K5�@���T�@�f[�j��@�_�� @��S�C<~A ��d(߱A�2�!AK���MAiBj��A�$�iB*Af�=�lA����A"����q�A%A}�zA(-n���VA+DA@U�(A.����A0���v%A2�Ay��uA4����.�A6��(��A8�DV*A:�ٗ1l�A<��[�"A?=�h�d�A@�ފGxAB�k�ACG	�(AD�=>z`CAE�X|A�AGIY�j*�AH�8��)�AJ&�C ��AK���q/�AM,.8C�[AN�ޕr,AP,�ލ��AQ )ٰ�AQ�W YAR���@�AS�ы�U�AT~��xGAUiՌ��AVY$�7��AWLG��:\AXC��ckAY=]Ao�AZ;6�.ԏA[<�/���A\A���!�A]J�}3�!A^W?�R]�A_gٮ�I�A`>6r��	A`�D�v�AaX�"�Aa��� uAb{([IAc�.��XAc�B>S��Ad;0��~HAdӆ��n�        ?r*��?�F�C)�?��D�D?��a���?�7���?�wC�.��@����4~@�0\�aE@@�$��@a=��@W">���@"W�R�@&-��lD7@*8�/v�@.����2@1���f�@4R<+Pj@7!�5'W�@:)]�M@=k-w���@@u��}�@BV�J�ӫ@DZ�?���@F�����&@HӾ[zVL@KL�#�9�@M��7�@P^�bcAA@Q��x�M@Sle��@U5S&q@V��SOs�@X�<>�s�@Zy��:�@\md���@^t�ie�e@`G׾#��@a_�R��T@b�ۡ˪�@c����X�@d濺�	�@f)�u�3�@gx ��@hў�U @j6�J�E@k�Gx��@m�MmI@n�Sc�+f@p�0��@p�*d(��@q�5i�a�@r����S	@sa.s��@t?(|��@u!�!%�@v	T����@v��ַ�@w溷,��@x��kj�B@y��#5�@z�.�Q�@{����|@|�13��        ?B`�W��?��0��r?��ȵ']?��(�v?��:�i�g?����?��c3�{?�=�\7c?���G�i
@��UT��@ ��Ǔ	@$�۬��@'4�|�@13Ӗp	�@8�{�U�@A��� %@H����@P�Z�Y@VE�K �@]D���@b�^��|@h1�ũ�@n��R_n1@s���Zt@wm�OEh�@|��
�V@�F�߲�@��-I*�@�����@���r�@���zb�U@���Dfy@��@�P9@�c{R�@���kisS@���`@��/��}@�U��;��@���@7E�@�|��#	�@�U��"�@�.vr�H�@��8w.��@���$o}@�S����J@�A�b?��@�M�ό�@�y��*Z@�ļ8���@�@�L#*@�a�����@½ V�?@�+J�/V	@ŭta��@�D)���@���dAn@ʱ�gϖ�@̉�ȟK@�y58���@�@r�~@�O�E��@�klj��@ӓ��c�        ?r(�G�I?�UG��?�g#�� �?�8��?���$�?�0�Dk��@��`��@�p}-'�@O�b	�@#�'�U��@+ԕ�6Ѿ@3�|�{|c@;!�Pg@B�`�8B@IV����'@Q��V�;@V��cB�@]�wǱ�X@cr�� @hf/�գ�@n�
����@s3�Yu��@w��brt@|�G{	r�@�w�x�2�@��鵹i&@��6�"9@�-9Q�@�,���
@����b�@����=�L@��»���@�T(�-@���.�]@��,y��@��c��C@����Z��@�H��@���7�@�c,v��@���W�@���9e�
@�n��L�Y@��O@��A׌�@��.Coq@��$
1]O@�lTH��@�$�p�@���N��@�W��=�)@�A Y�y @�.� ���@�!h�@����@���L��@����l%@�K��;�@�,S*c�F@�Ai	���@�^@3���@˃�����@̲9`��        @?*�s�@x���{�@���/� D@��{k@�n#z�@Ȼ�*� Z@�<�.���@�4?q<�U@��A@�7����@�]"5��U@�	��lm@�.�����@���W�kV@�Xٔ�o+@�aOq{#�A\��ǂA��QA3���xA�=A��A�e��U�A�u��AAm�Q�:A�����IA����K�A�KK��A�]ge�A�r��A��5�'OAP:8�A ���bA"/�6ҍA#��IzA$�!��5A&e�k?<�A'��aA)|���DA+(mJ�A,ѿ��O�A.�-�w�A05䕗�A1(ѭ��A2& �A/�A3,�ת��A4=boUPLA5W�.%�?A6{|����A7�����A8�'B��A:!	���A;k����A<�pCT�rA>Se�A?��d ��A@~Y�K�AA=ݜ)�*ABP��AB���7t AC���Р�ADv %�[AES��]LAF7�<r.~AG"�gh��        ?z��ں$�?�bg��?�����S�?㊢��!?��xpA�?�i"U3��@�f�fܣ@�#���@@�G��^�@���*@���	@"'E$�	@%��L
)�@)�y�VW�@."���k�@1x+��O.@4|g�Ի@6�JwiZ�@9�.(��@=%g�pu@@*�so#�@A��Y.&@C�T2aiB@E�A��&;@GnX4l�@If
����@Kny�jba@M�Z�"c@O����%@P��iס@R0m��v@So�I��@T�\�U@Vy�G�M@W�Sr�@YjQ��@Z���C��@\G�.�G�@^���<@_�2�y�@`��[�S�@a��hs�@b�%Q7�@c���z�G@e����@f8��@gkv��=@h�sS]�@i�p�\�@k@)�0�@@l�q���J@m�F=���@ok�����@pq�Ȫ��@q2k"��@q�vs�wB@r��U$B�@s�jn�w@tj8�x��@uEŉ��@v$��ɝ�@w	��hK@w�Mt��f        ?Bڈq��?�~�q��y?�`�y�?�#M�?�??��W��?������g?���}*?�a���l@s�8e��@<�}��?@t>�_�Y@#��iJ�f@-�8���@6H6�8��@@H�r슲@GR!�tK�@P]U3�,@V���ȗ�@^kͧ��@d/�E�G|@j[� a�@p��j\�@u�5����@z���Z8@���0ݱ�@�m�j(&@��q!N��@��Q?��@��Ob�@��Q6J�@��4D<�@��O�ق@���.nu�@�0E��O@���G��@�̲��޷@��0<b@���!3@@��k �@��vw%J@��z���$@�Z ���;@���{��@����Ք�@�4z4�7@��8�b@�M���:@���䴍"@���&�+�@Ȝ���x@ʐ�ŷ@̜���<@��߉��8@�~�@Ѫ`�Mܣ@�≜���@�'�Yf�#@�z/su�J@��S���@�Ge�#�@��z�҈U@�Ki��R�@��Y�٪'        ?"}���4r?\�x�C�I?�O2*5I�?��ͦ�+?�W��^>�?�*�T�?��*�?��{�NO?���B�T�@�榅9v@�y0�z@e6��ѝ@) g?9z@3º���@>��&:@F3�wcMI@O����h�@V�(W'�@]� �N@c�S�S�c@i��rl�[@pR�2K�c@tb�H��@y��@�@~T%� ��@���,@*@�h/D�O@�R�F,Q@���CS�@��15��@�����"@�t����v@�#��&c�@���w��@���4�6@��f���I@�c�WJ@�6�ID�@�%�����@�0r�@�Zb���*@���t��n@����c2@��ކ�+�@�+L�u�J@��L+&�@�!^�i�@����%9@�rBR��@�?��?�@@�&�X��B@�(v��/�@�"�_�@�>ϯ(��@�i+���@á����@��..�m�@�?+8y�@ǣ�����@��)�@ʚA!>�@�+��d��@�̚ц�        @''��-�;@a��|4��@��.��O�@��z�i� @�ɿoJ�@��6+�x�@�J��@���{,�@�9����@���wbW@�,�^@ӟ�%`j@דy���@��;�u�@�_ę'֥@��|8���@����(k@��e9�\9@�%=��@�=����@�(a�@�Y��@��~�	�@����L�@���z��@�D���9@�� 4�A �h�G�A�01�ARh[�ɊA�S� �AJP0u��A�{K9A	����APA`J�BA'��Kt�AT���sA�y+^A�e0*/�A���G��A�_��ߡA)��luoAte�N�A���\pA5�Ȥ�GA�3~�j~A1>�B~A��!ᧄAf���<HA �~ �CA!jƗ�{�A"Q=�h0A#>�)�wEA$4R�v�A%0�~�O	A&4�ʛųA'@��I=7A(T���UxA)psrAeA*�$-J�A+���A,��.�A.)�Z��3        ?{�e%e;�?��~�Z��?؞�<�� ?��v�C0O?����D�@��}��@��_��?@mm�͗�@ �\~@$F��G�@(����q�@.���@1�P����@4�w2JD�@7���@;Eh�N@>ߡ�6��@A\����@Cm�����@E�Ls��@H4w��I@J��lf�@Mkx�Cr�@P7K1�@QՎ-W�y@S����h@Uk����@Wd:oG�@Yzm3�͉@[���I_@]�{�y�@`5x���O@ay|79��@b�A���8@d+{y �@e�C�((�@g���I�@h��h���@jA����	@k�|�7�@m�`v��@o���!OT@p���C�@q��;R�@r�����@s�c����@t�l*0�[@v":����@wZv)��]@x�ܒGa$@y��3@{T�^�>@|�����@~C��{P�@Ѭ�ﴫ@���Y	�x@��<._�O@�h���o@�L"�V4�@�6����@�(�\�@�!� hk�@�!�����        ?U1E�n>?��YMN�?�����\�?�3�yqEQ?�&�ZJ�?�eP��?�z�Wj?�ҷ�u@�v@D"@������@��	�E"@ �_۰�@&�d�%�@0F�~��@6�-$��@?�L�_�@E��:�@M�]p)�@S�
�r�@ZUj)�n8@a*jFm@fl/r�@l8Z��~@q�*)3@u��[r�@z���YB@�]J�d��@��7���t@�����@���K��@�gi�`o8@�%��SX9@�3'� R@������@�J�ɏ�Q@���]�ՙ@��Mc��@�M�v)@��޽���@��i9(&@��s���@�x��F�:@�2��>N@�
PHz�C@� z��^@�(���@�L%����@��0�p@��E�s@�۰�JSQ@�:���r8@ìAM$W�@�/�3��'@����Ŋ@�o.�Nę@�+��L�@����4��@��8Q��z@�����@��[:z@��)Wz�@��d���@�A�5_"        ?s0��
?����2?˧)��s!?�j$p��?��0�D@ kį��4@	VЃ��Z@8hqx�@0�N��@!O���{@'~@ş�@/)�./�@@5U�Q�W@<�#:���@C>�l��@I��o��h@Q3~�<�@V��p8�@]��w�@c1��A�@h.3�)@nZ��V�@rшgK��@wy���g@{�7=hT @��.�(�@�ʂ_�~�@�6�v�fF@��O��
@��J'@��[��@�7��b�I@��!t@������@���k��@��~��v�@���ކ��@�N7^-�@�'"�cJ�@�2{�c]@���~@�5��sor@�e�L�Ҏ@��yOo@�$�Ho�@�;����@�x�r�$@�Ρ��n�@�)}>G%�@��a���*@��}F8�@���.�%@�[�8�@���Ja9a@�V|.�pL@���dQ�@�k�����@�XN{gYp@�M@Su��@�K�O't@�R1�}~@�b�a��@�}>$^r        @4S���@qu��hq0@��57�X@�;�̀m@�W�]ؾ�@�,�g�!@�H)�#��@�e�C��@�M Nd��@��F��@�|��H
@�\�>U�%@�C#�%�@�,���@�u�?��@�TnE��@���`q�@��r�sg@��埌A �R�<A������A���_�1A�c����A	M	hm�jA�4i�u4A���K5�A�	AqP$Ar�nfA(�/#�qA� �)^�A�;��ښA�73I�A��iqÍA0]���/A =�*o)�A!o�F0��A"�� d��A#��I/A�A%T��(�A&���#�#A(1�H9;A)��B���A+K6��beA,�LR9�hA.�ur��A04�[�A1����A2���;�A36���A4S	dz�A5�.hA63A�M��A7QO�Z�A8wamQ�/A9�6gpĞA:݋��v A<f\tG�A=e����A>���	��A@t��2jA@��$���AAp����AB*�
D+B        ?X��{'��?������?����?ïv%�'�?��#���{?�R�e]��?炎Jͯ�?�~� P�X?��q��?�m��=�h@����.@�:�G�y@
0�ĥ2�@��/�.@�Ɏ��@ݩ�M7@ޒd]�@�� �@�}��g@!%WE�@#&�Ӕz�@%O�.��&@'�[c"c�@*%v�f.@,���C3@/��@Q	@1hb�\�O@3��R"@4����@6�*��
�@8���(@:�=���@<�^�a@>�&�h�@@�b��+Q@A�⿀�@C;B���@D���K��@Ff�u�s@G��C[�@IE`s<��@J����`�@L̚��	@N�D��xi@PW�Vl�@Qb5���@Ry?lvƹ@S�I���d@T��f{��@V�,�e@W\�D��j@X�F>��@Z$}�:��@[��B@]%7��g�@^�π�i�@`-��+�^@a��w��@a���6�o@bŇ1 w�@c�]><��@d�����@e�X@�B-        ?$��b(:�?k��0<��?��-���?�LS�FiR?���D��?��W4�k�?�o��`�?�|ֆgC@����@�w�BP8@K&Y�A�@(�S�ƴ^@3�E����@>ٌw��m@Ge�z'?@P���3a@W|���o�@`�����@e�K�ه@lU�U ��@rA�@�%�@w"�Y���@|�$ĸn@��Ydgi@���!��@�����6@��>�jK@�8�Q�F-@�K����@��� @�n.(_KP@�BTf͗'@�|V���@�����.9@���ؚ@�N�+/��@�P����@�DV��k@��Vm'E�@��ќ̛@��\[H��@���Vb	(@����@�Gof܈�@��oed��@��cS�w@����y@�c�c��@����@�oG�;c@���љ@�Ț<,1�@˓�C��@�t�nb�G@�j�_�@л�͚@��r��@��6���@��/�b*@�N:HB��@֒��w�"@��w��
�@�FyA        ?b��ގ�h?���*�e?�͎ ��W?ۯ���/�?��
���_?�<!��D�@	#g�x?@Q�˳�@v���Xy@'�Ôi7@1D���6@8/�	3@@���JT@FbƾE�@L� ��@R{�XJL5@WF	���@\��Wv��@a�δ$)�@et�J��l@i���Oq@n�<��@r1 ��T�@ue���r�@y�zˠ@}�	�V`@�Ґ6-��@�\0�n"F@�,�N���@�H��-+�@����
��@�:�f@�H"!;@���=��@��5���@���Co5�@�v�@�d@�� ��0�@�s��Ƣ@�@��rOy@�1@��@�Fq��l@��/+ ~Z@��)���M@�t�-�@�����H@�	� ��@�����m�@�67��@���j���@���y��@��ş�\]@��N�q( @��ٙQ�G@��L_bOp@�����g@�뙜���@�0���8@ł���eb@��'@��@�N_�y�@�Ǌ\M�@�MV�m�2        @|���F@P�{$+Y@r�yD!ҏ@��K��/@�5=����@�����,@�d`�V�@�����G@�׵f�f@����8�@��;�4�@�4@x��@�����B@��AتV�@݀�(�M+@�8᳑,�@��!Co�U@���"Y.@��M� ʟ@�fg�/�@��#�2"/@��1��@���Ք��@�߲��"�@�K�+�e@��FQ��@����:&�A �a����AY��r��A��6�A�g����A��J�>�A	�1��DA�k���[AK�ΦA>�^q�A�(4'A�3YD?AP~TàAԊ�~�Am��T��Aj�ݗ�A����TA���k�A�r>|uA ]���q�A!pC�t(A"��%�#�A#����R!A$���"@A&K�d$y"A'�э!\A) ���LA*�ZN��bA,5���"�A-����!A/�Ἄ� A0��Dz LA1���V�A2�V�Z�9A3�3���A4�O͎��A5�P�Ġ4        ?��q&˛n?��%W�Y]@�w��b@�b3�-@&�X��5c@1ҝ�D*b@9���̢�@Ap��:�@F��T9\@LY�s���@QLgǸ�\@T�=�C@X:mŚ@[���ة@_���͚�@b2Їm@d+�͓�@fcm���@h��9�Xy@k
H7wE@mx&�h@o���Fh�@qBMO�z�@r���-0?@s�.wb��@uB�谊@v��'f��@x�IF�@yw/��d�@z�ҵ�2v@|\�!�m@}�<IOP@Q��O��@�h�7��@�*֓��@��)�@��zXq��@�|SX�	�@�FYX�� @����@��q+?��@���&Z@���<S@�]�sB%@�7�^���@��j�A@��"P��@���J-�@��۩��@��K���@��'��w>@�����f+@�?9W�z=@�����p@�9���*�@���lޕl@�;�����@��fg�@�E�R�@�̤D@�d@�V(����@��X֬�@�o��[�        ?w�$|/3?��U���?�K��"?��yv(�F?����mZ?����D��@*ҩu�@̠'� @�!>��@!�Iw@MST���@#g@7�Z�@)�j�ݩ�@1&�,�@6y�f+�@=����@C4��k��@H�&R`v@O�:��@T/�i��@Y�chi�@^�����$@b�/U���@g���@k̴�3V3@p�A��@s��ƔB@w/#����@{�j��:@���c�@�;�E�R:@���B?ȣ@�Y�!@�aq&A�@���`F@���`L�@��uË�<@�DÄ�%k@���&S�C@��k�Z�@�:��@�F��(8@�,�h�@�;���X�@�x�ߪlZ@����%�@���ԕ_@�a�Ϝ[N@�:��)�J@��<��@����k��@��@�c@��m��Y@���&�p@�;�!o�R@��;�T�@�;n+zU/@¬i ��@�5�9�5@���_��@ǗE&m��@�rM�@��@�k��61         ?�l�s2ޞ?��:��1?�HvLr�@����9!@����@NO��@$��d�M@-��3�@4CV�cX@;N����@Bu�6�@H�^>�R@Pq�9y�@U����@[��3@@aj��{�@en\��u�@i�8W/�@n��Qu�@q���w@t�L'�S@x)�`��@{�a����@�꺇US@�o����@�~V��eh@�!_�Ӽ@��D���J@�F�k8@�8�A��@���lJ@��`��zN@��n ���@�w=�aV@�R��B�@���� �@�%��4p@��i���7@�7�w�:T@����m@����@��� `$@�L���%�@��i�@��V=JI�@����]C-@��l¤
@�֭��x@��!^��@���s{@�3�l4�@�l�$vO'@������@�	�/�Q@�n����A@��=��
@�j�]�o�@��<b�@��c�iي@���L�}�@��W_@�t��@×�ǹ�=        @}79*P��@��W·�@�o֫��2@�L탈��@�ծRu@���=�A�
p�/LAӄ��A��q1A�Sl~,A�����A 6�ޭ\A Xj��oA"�s��A%97��"WA'·�BA*z�A-=�L�(�A0
���*�A1��]M�ZA3Gg�t�A4���09A6 �X1.RA7��
��7A9c���9�A;�ak��A<ǝ.�(�A>� �M,�A@$�r���AA
<��AA�����ABޑ�7AC�0�Co�AD�Ǣ�GAE�g�<A�AF�-&�tAAG�:J"�AH��j��cAI��<zYMAJ���jd�AK����c�ALľ�bn�AM�6�k5<AN�9��`AP����AP�D�:�AQ(<��WAQ�����KARU��e�}AR�h���AS�̙��=AT-�+-e�AT�c�_�:AUu�@�+gAV1r���AV�U�k�wAWs�6j%AX"��a�VAX�z0�lAY�|��Z�AZ?��-AZ�@˴��A[�$�-�	        ?͐>�?�Ȭ� "�@�OV�/b@#��3(��@0��3*��@9�5Pj�y@B^��B@H��*G�U@OΠ8�@S�Q�-�@X[ed!�]@]<���n@aHO��k�@d1G���@ga����@j�1���@n�S�tW
@q��	d�@tOB���;@w����.@z�NQ��@}P[&
{@�X�U��@� �x%@��Qz�'W@����@���͢��@��Q��D@�Q�s{{@����� �@�x��3H�@��o8��P@��!��@�5>7G�@����\U/@��0�@�:@�F�����@��^Su�>@�(+#�_@��|�YNO@�(&*���@��F���(@�����f@�p���@�B܁{�@��F8r@���I�D�@�֡+���@�� -��@����@���4�R�@���	N>@��Çȯ�@��f����@��\:�@���Ȧe@����)D�@��L��M@�����@�@�l�R@�������@������@�R�&�s        ?���6 �?�3�
� �@p1Z�$@$�6R�}�@1�@ ;@:6OE�8@A�BD��=@FX�<!�@K�����V@P���8��@TY�w��@X�nEV�@\ۖ&�@ay���@ep��s@jҼ��5�@q#M���@vE�c@|W��dV@��� Q@�(>��5�@�\Y�~@�>��62<@�N5P��@���ǆ� @�z���@��B��@���A�c@��^�[@��
˩f�@�ʡ��@�C+��@�BȆ#L�@�'q�I�@�1�wX@�cbE��`@��{Z-t@�>
��B�@���H2q@�_MT�@��a��4c@�u���2m@�#7����@��	��/@����Z�~@ʷ��$+,@��JD˂�@��:�jy�@Г�1
&�@Ѿ��|@�����}0@�;�:;�@Սc�f?l@���`�<�@�W��s@�Ё�Sۤ@�W�h@��k�m@ގ�0o�@� �fHS@��,[�@��j�� @��h��        ?�#�@�5U?�Q��1p?���q�Bq?�nUX�?�u�0ȟ?�����i�@��>��@�HWϪ�@�[R(^@$/�@.�P<�@6ZD��@@Sd�R��@Gb�B[�@Pg�\�m@V���4�@^i����@d �Iy�.@j."-�>?@p��}o#@u�0y�I@z'ge�lo@��u���@�`�T.@�/,M%2@�vY��}@�g��@���o�@��z��_�@����%V@�N���Č@�	���J@�.y@�D��5�@���.�J@�$�d�}@��Mg�� @��4)�@�ڿ/�R�@�t�ʾ�@�#���K}@��+���@��Ώ���@��W�˗�@��z�t�@���\?�i@�
l3~��@�/�!%y@�`LzqH@Û����M@��w��eI@�4�"�J@ǒ&\Ys�@���塚@�q��J@��^��y@̈́@IK�@�!�7�[@�f�^�]@�Cس��@�(��Э@�v-�A@�	���@�        @�|_��m@���:1��@٭�	L�@�Nf�3p@�jix��4AC�`L��A	��� RA?�Q�L�ADf�~S�A�J���A&�Y��LA!;��**A#�i�8��A&s���[�A)��A�oA-q��rA1.z��"A4U���wA8"�o�<�A<jd#�l�A@��L���AB�Aћq0AEx~!LnAH �H�AJۜ�V"AM����Z�APNrK���AQ�1���ASS0Rx7]AT߀L<AVp䂏o_AX���;AY�ZV?X�A[AIj�v�A\�H�w	A^�u;1h�A`"��C��A`��)�Aa�]����Ab��c�<�Ac���b� AdtCV�rAeR���C�Af19(3CXAg�I�U�Ag��f��qAh��q(wAi��n"Aj��M�ZAknU��#AlO�ox�%Am1߳��qAn�1/2eAn�[	��Ao�g2���Apb�=CB�Ap��z��AqL	!�5�AqJ��Ar:����Ar����
lAs0�k��HAs��n��"        ?��� ��?��] 
k?�ۑ���k?��K♎�@B�Ӵ?[@�_ �J@ѯ��Q@,��wsO@"7}��*@&���Sϖ@+�B2lSx@0z��<�@3G� �o@6<�|�@9V�v�@<�,ˢ�a@?�	=�@A�S���@C���<)@Ezg�n@Gs��E\h@I��qu��@K���y�=@Mף�j�@P�!�\@QC��`�x@R�mC�N�@S�Q�-�e@U!��r��@V���M@W�"��@Yn���@Z��$��@\�\_c��@^+�s2̲@_ז7(o�@`����@a����@b�@��U�@csO���R@d^�z	�e@eL���ΐ@f=r��9�@g0H�}<@h%:��nv@i_�h�@j�K��@k�`sS@ll�~��@mK��֦@n�G`�z@o+�pJ��@p���K�@p���j@q7>��@qƪ����@rW����@r��<O3@s�Qd4@t���@t�0`��@uH�+`R�@u��[u�        ? ��r�'?Y@xγ)�?~eU�ҍ{?�O=�U�v?�nW�u
#?���Vڇ?ΠQ�*�?�� �YB?�0k�*��?�ɫp�#.@)��jdb@9�h�	�@�[dt�@"�`��@,t���y@4�x�>S,@=����$�@DȠI-�@L� ����@S1g���;@Yi��۳\@`���}�(@eF�|!��@j����I4@p�}�˛[@tᕴ���@y�\��{v@~��E�=@��+�W3@�'%t�@�-00@������@��Ć ;�@��kɈ�@�݅S��@�U�&��@�'W��@��P�u�@��<�[Y�@�p�lu�D@�##���;@��� S�@�2@6-_@�I�@ �@�$}]�@�ÚpC�@�]�N�a@�Kڒ��]@��!qD@��j��@�[��N�Q@��i���@�2F��<@ĺ�*��g@�XV�@�
$��Z@������@˰Q�|@ͦ�-X�@ϴ����@���ׁ�@���_�@�>�@�z        ?�⏪W,?�ߺ_p�3?�?qx��z@���-@�u֯�I@u'��^/@&��2�e�@.��j!�@4�7�C@9��&�z@?�k��@C���& @H*4x��-@M���P$@R ��ڕ@U�<.bs�@Z���*��@`0^�ߞw@c���dRI@g��	o @l�'��\@q+$��n@t�\�8:@xt���@|���;@�$��}@��*@�j/��K�@�0��2|@�i���Ԡ@��_-Ǔ@����&�}@����H�@���n��
@���۬@��A7%�@���!�i@���M�@�>� ��}@���@l`e@�I69���@���Q�@��n8�~�@�����Y"@�.�<�[v@��bɜ)@��(��!�@��ъ|5M@��K�o�@��tL߂@@�\�,�@�1�%IƐ@�kE���@ò��Rj@��č�@�m�ѿ�@���� �i@�eQ���@���b��@̚d\!̄@�L�q���@��X,;�@��         @R�&���@����(0@��8FI{@�-����@�*�_�@�\���9@�>��?@�%�뺺@��h���@�#|9��s@�9`�S�M@��B>"�@�t]n2�hAL?���Aы�/A��C}�AZ�u4�Aa��2�YA���ؑA˫�4j�A�}�SA��l�*!A
�|���A_��X�A�lg�ֱA :�� q�A!�� 髡A#�-b�9A$�'i"jA&<"+}�A'�Z�-9A)�
��IA+���*�A-���
ETA/�s��.�A0ր�G#�A1�VU|!A3��5�fA48�Bq��A5k8��A6���LdA7��p�IA91�­�A:�@��ђA;���$�A=8OG2�A>��-#��A@R�+�A@����!AA}яc�AB@L��AC%n��!AC�wɲ�
AD�OY��,AEv���AFO�rN�#AG,��e��AH�}�nAH􃿌��AI�؍�H�AJ�V
�yAK�~�c|@AL��i���        ?��:
\�2?�z�����?�$yT��?�p�vFf�@Uy݋�@�pE�@����@!��Ԧ>a@',z?�&J@-u�{��@2Eq�(�@6:�3Sum@:��K5��@?v�+ҸG@Bcj�2@EH��SH@Hl����@K�8��݇@Otɝ�a@Q�s[��@S�'��@U�Y�i��@XZr��s@Z�8H3	@]��0T&�@`'�/�k@a���&@c,zPH@d˒�'B@f}��fv�@hC�JI#@j�/�:�@lsB(�@n���,@p{
@q(��EJ@rI9���@st�Va��@t��d��@u�du�p<@w9�-m@x�;�@y�l`��@{l3-�+n@|�l�gA@~z�xF�)@�Z�p��@��7eV;@���&�@��0Sz @��)`���@�v�=e�"@�m�z�!@�i�æA�@�l�沓�@�u�o6�<@�����@�����F�@��1Y�D@��/رq@�b���S@�8;W�|-@�7��$D�        ?�w���0e?��|��3?ٺ_'���?�>r�@���e@e�L�@��@#�w�j�@-Ĭ�$OB@6�ыq�@@,�:�s@G]\G�b�@P���NO�@W��@��@`la�F�y@f����w@n��gM@ty�[�?�@z�2;��.@��$�ֿ�@�d�`��@�C~h�@�����c�@��Tbw��@�J�Dj�I@��,rP�d@���C@�ӿ9.�@��[�;)�@����/�"@���iU��@�R�skD�@����̚@�ĭ-�@�Zp-$��@�d���:@���_�m#@vvA>W@�Y��x>@�H�q�r@�U��cp@ʂ��p�@���=g@�B�^*r@����h�t@�L$�F��@��b�"�x@�J�iG��@��̶�
@اѻ��u@�}ohR2@�oB,M�@�~��?Թ@�V�&X�@�~�j��@��ֿ�@��j:�j@�`��� @�Ѵ�SCh@�V��R@��ݧ%�@레�z@�@�f�U�e�        ?x�ehK��?�uG�I2f?��L�Fo�?�W'���?��U����@�G4�s@�a��@!K�UP�@)9�1�I@1���1��@8"P��@@E6w��@E�u�:�@Lt�r�BX@R�
L��@W�q��@^kx�j�@c7��ר8@h&WW��@m���P��@rXF%�kW@v]��/�A@{����F@�8��xl@�N|diSi@��~�{�	@��.�PW@�+f��@����Q*@����?�@����:}@��`��^@�_X�%<@������
@��Yd�6?@��֧'�0@�	f���@�Wri/@����@��@�PV�&�@�}�@G�@���n�S�@�WM�>��@���g�z8@�m��e@��Emğ@��#~�@�{�T "@�F_�P�{@�@��	b@��T�r�@�y�!��@�w�Jm�2@�{)>�63@Ą)ߠ�@Œqg��@ƥ�A��@Ǿs��k@��
_��@���C:�@�&(l�ϯ@�R���@̈́?.Cm        @_nIK�@���e�as@�D���h@�v����@�%�֎'@�#8��@�F�@���n�y�@����M@�b�}�@�����A �A4J0�A6h�4�mA�P>��A	�<�WAI�CY�A�Y��FA��W��A��UI�A�̫ڼ�Ak����A!�>+�$�A#̲�Z��A&��(}A(�ӈ��A+R-�7I'A.;�
{�A0��_+�A2\��ؒA4'B�$%A6x��,A8�O���A:G��I��A<��腟�A?�ڄd
A@�����AB,򼒸�AC��s��AE"�T}AF�p�a$nAHkVO���AJ0�ֻ/�AL�>QS?ANH�AP
Y���>AQ ��zTAREK5&�fASyH��*IAT�Y�{AVD0!�AWv.P�aAX��t6�AZrRO�J�A\	i���A]�˷�PIA_h6�Y3A`��p���Aa�:����Abv�^/�Acq� �ڟAdt���7DAe�^�XAf����w        ?k�+�|�?���!�RO?���I?�]��J��?��wU1?룔����?�SP	��E?�	G]�bY@xw#��@�Gv�)@.�io+@�����@%�����@ݪ#?�K@�d��v�@ ��nN�k@"�vr=��@%lR��q@(��I��@+T�K��@.'6t|j�@0��/�@2���ߚ@4d�Qģ@6a�p�1@8|3��
^@:��X;�@=L��m@?����nz@A�Y���@BrT5A�{@C��-�3@Ep,����@G,ω�N@Hǯ`H��@J�[�+��@L���g@N���U@PM�ײ2\@Qh9��?@R���y�@S��b9cg@U)T��J@VY��{Y@W�=B�@Y)�yH�@Z���[&S@\7��}$h@]�Q����@_��7v�@`��ѥ@a����\�@b}�چ��@cyzYz&v@d�ć�@e�Y2�H�@f���l�3@gԃ�ڌ�@i��
�@jI�X��Z@k��:�\@l��u�5@n_W2S�        ?r	f�H�?�)��i�?˚��!�?➆c�E?�+���@ ׈���:@
�Yb�  @5T(�h�@D��K�@$�"�Y:x@,ǉ�w��@3�����@:��'��@B�48f@G�V���@OY7���@TL��
�@Y��)��@`gw+��<@d|�I��@iKpQ!��@n�-�̥@r����@vkB�Z6D@z�=QmY@txh��@�mĪ�Q@�t�z|�.@��9y��@���w�Ն@�a�u[��@��|�'�@�8�vg	@� [��Va@�����@�^�#B@��y㈄@��&�̀�@�b�R@�\V[�0e@����i�@�{)�R��@�S���@�05W=]@��d;j�@����qo�@�iN�Q�@�b={�"@�zؒ�4b@���D�w�@����^�@�ɒ:�A@�Tr���@Å���@�����9@Ɠ��=@�<K0�)�@��3����@��4���5@�����@��ȉ:�
@�����^@��/�E4        ?9�U���?w=��M�=?���L&h ?��s�V��?�C��S?�z���@�?�=�EZ��@ #�;#�,@q�Oa=@D��|F�@%+��Yeu@1ƿ���@:}�.��@C�|�0�@L�}�q�n@S��+%�#@Z�\��@a��V�@f���xt@lA�E�G@q`<��P�@ur����@y�����@}�oY9aD@�I��x�@����c|@�	�����@�V���_�@����L@����\ˋ@����U1@�n FLi.@���s@��4����@��%��o@�f�`�ם@��y~$#@����#U�@��[���@���##�@�A��.�@�����C�@�GN�l\@��ޮ@��؇�@�%DOE �@��j�Un+@�����N@���]t��@���
�JJ@�-���:@�R���C�@����5@���&�@Ē{� d8@�0u(�oA@��g�C�@���WQ8�@˷����@�ͧ$� g@��\.@�/���zU@�n�.��        @'73k�-@^�Ox $@~�ӡ؄h@��x�Iu@�p�yl��@�f�HQ��@�,���@��͌�R�@�%9���K@ϙ���s@��${C@�T�j�@ޤ!� �"@�p��ܪ�@�� ���@鷗�y2N@��7�mi@�@ѥ��@��}���P@���w@�t���{@��G1��NA 
6��1A�^>]tWA�f�&?yA�3�" �A%�����A
��PQA�#�T�A��(���A4�ꜙPA�LuN&A5J����A��x��A��y �AH��h��A!ɡWb�A���MA�(w��A �0n�ffA!���A"͝G�NUA#�;�eEA%7u�8>*A&̲ø�A'վ�H�WA)9�� {�A*���V��A,.�|;T�A-��F�bA/d��A0�|(�G/A1pH:aT\A2]�~�n�A3U���<�A4X�t`�A5gLb�{A6��dNђA7�nH��A8�Z�o�?A:��UA;n=��A<ͼ�EH        ?y����8_?���Jk�?����>4?�eUdi?�j�?�.eޫ@�۪"�@�,���@o��w�@E���Ef@ _�#E�@#�-3@'�A���@+�
�O�B@0��e�>@2c����@4Ґj3�N@7b���]D@:�p�Z@<��S,+�@?��v|�@Az-<�˓@C=��@Dȩ���@F����j�@Hb��#�.@JNYe'�@LO����P@Nha�1�B@PMY��@Qt!����@R����LX@S��<�N@U<�8��@V��upz@X�蠢h@Y��V瀼@[	4bغ�@\��(�]@^K,��l@`��_�@`��ϻ�@aס��f�@b�4��)@cϼd���@d�S�/�P@e�����@g��If�@h,!����@iYBD#�@j���U�_@k��`�M�@m=/2@na.!
�@o�����@p�5W7g@q<��e��@q�Z�)�3@r���I\�@sh��@t'���F�@t�y���j@u���Z�        ?$�ZCX�8?l6iއ��?�0�*��?��p��p�?�Az&��?�v@�j�(?�?��q�?�}$�Z�?�J��<@ \zO�z�@3I�MN	@��$��@!8���X@*�X�@3)'�@;P��G$%@B��o�m@I�,+��)@Q��M�\@V\acrt@\�O�2�z@bKxw��@f��7�g�@l��$��+@q����5�@u�SI�{�@z����,@pk�Ek�@�ʽ�G'�@�Q>F���@�V�|ը@�梪�;�@�0����@���j*$�@�$���@�������@����"��@�
K�}@�q��Z0�@�IZ��@��8�Wry@�
�_���@�3�ְ@����K@��� (@��Ɛf@�I�����@�����H@�4��4�@����}��@�`'e*@��I����@�z�+��@�'�KV��@��{~ �@��/�v�|@˻���@��!]6ho@��J�}�@�;�Pn9@�?����@�w��71P@Լ�#�,        ?H[�mB=?{Rx�	��?�r�6!��?��|KQ�?�t�9���?�7wW��<?�p9 ?���0?�4=���?��~K$��@x>V6�@���v@7z���2@(���@2s� �@:b�L�B@B��h��D@J��|��@QƘ�'qz@W�Z%}:�@_����@c�����@i[�f��[@o��þ@s��T!ik@w��r�@|�0���@�%��2��@�F���h�@�Ƽ���X@��ԅĈI@������@�Y����@��qC� @�����(@��D%M@�@� o�{�E@��P����@�����|�@��s���@��1l^z/@�<g��l`@��S���@�86�Zx@�t�%���@�ު��G@�ZE�s�6@������P@��Ǆ%Y-@�:��u�Y@� ���@��Y�:wl@�ȆQ��@@�˝T�X@�����@�	lwZY@�,��B@�Zi�rf�@Ŕ�t�4�@��RH���@�.�vT�@Ɏ��RM�@���=N�C        @)A ��@`���Ab@�V$��@��9��@��Ձ�~P@��Z�I�@�K#dqw@�B���>�@ő��h+@˅�����@�N*@�G@ԟ���@�|��v|@ܣ��}!@���ڤ�-@��l�XŇ@�r;�ޢ@�$�n?��@��l�@���|@��m�O@�c��Y�@�8f�]\�@�([��B@�4��D�Z@�^.�{�@���AL�@���-�A �)��?�A(:�DA�2��iOA�DA�A�G�.D]Am[;)��A
9��A8�Au��aA vOOA]9�9A>*vf�Am�\ągA�/�52A �����Ae�v�Aݞ��AiH^�a�A	O��6�A�^^e�A�G�+%A 5	�I��A!0�����A"8�!=��A#LgT��A$lG�PEA%�d��eA&Я��A�A(ƃA)e%��3�A*����FA,'q�.�SA-����h�A/�*�V}A0LK;��9A1���`�        ?���m��?��E�ʙ?�3�oM�?�<�.�?�rI�k>@���O̡@��&|@��>bVU@䢳�]{@#�-���@(e�F��i@-(/�V�@1 D談�@3�e�VR�@6�L"��@9�ǜ��$@<��]�j�@@5�>P�@A�n4�@C}/���p@EJ�?�IS@G%�>�@I��+B@J�-����@L���@O8�)�%@P��
�J�@Q���׵�@R�\��>@S���8u@T�H�ש�@Vq�[�@W?�����@Xv8p��@Y�M\X�@Z���̀�@\P�p�i@]��dFq@_��ݰ@`G��e�!@a	a>��@a� *G��@b��2�#�@cx��ߤg@dV��+�*@e<�ID�@f(_�z,@g����@hW8ӡ@i}�f�@j!;>�@k1�O��@lI�;Yc@mi�z�p�@n�>&�M@o�ұ�P�@p|\�S��@q�ٮ� @q��p��E@rk"�Yܯ@s��N�B@s͠�-�!@t��C�6        ?Ru�є*?���x=w�?�y�-�y�?���P�?���Yrc?��.�P��?���̚�?�]��p�@V�me�@��TuK�@����=@k���#@'V���?@1H��p}@8u<�k��@A.����%@G��7�xs@O�-�s@U\�0�@[i�Y��@a��w�+]@f3W4�@kN!��@p�h�1�}@t2�b�@x'Y�UN�@|�	j��Q@��\r�g2@��L���@������}@���uc~@���4@��]B`�@�3�RU�v@�����@�Q�;E�@�7��f�@�\,-J��@���^0@���cL�@@����~%�@��dVV��@�)����[@���)���@�P�b��2@����b�=@�����@��İa��@��Ԝ�!l@�]���@�WjB���@�q�4S@���k9	@����@�A�����@V+}l�@���2�4L@�jgRJ�@��"��t@ȏ�[T�k@�@�ea�#@�?0�#Q@��Z뿣�        ?`�ժa?���؝�?����fT�?�YNn%ӡ?��%1r�?�U��,L@�x��6@tX�6b�@#I���@0����Z�@<�]`��@Fޒ'3�@Q��l"�O@Y��9j�@bc֟KZ@iUN��D@p�٢J�e@v)�ڵ�s@|S�.�@�� ��@���}��@�����DX@�䫢o�@��1�	�s@�1�9���@��@q*��@��,RAƲ@��V�F@��N�;�%@�!J຤�@����؜*@�q��+o@�y��~$0@������@����q�b@����8h�@����@������n@�`B���@�-�"L�u@�����@Ã���$Y@�^�KF/�@�Z��}G@@�x��.��@˸2o��"@��Fs6�@�N�Rs[6@ѡ���V@�@��}�@�w��J��@�����@אYI��@�4[g[�r@��H'��@ܬ�]��@ހ��`u�@�2oy�6:@�,z!��@�.���Y�@�8ߏ�-@�K]	�+ @�f%1г        @H&��]I@������@��&�?3�@�%}�<�@œf	t�@�1YD��@��Q�a��@��qQ�Z�@�I�p��@��m�%@�U����2@�fp��V@��1�4^�@�'-p��@����d��A �c���PA�Ld�AA��lA�:����A��9�A4D�4A���x��A���iA,�SZ:�AoC`�~A�_)SXA�a���An*37?�A������AG�!�A�Y8��AI�ԥcA���]�Aw�VQ�A �/k"&XA!j�iA"L(<P>5A#4b:*��A$#��pA%��EHA&=Q�A'usS-A(-U�{3�A)Bä2ȹA*_�B�T_A+��"�A,�?��azA-��n��A/�D�`�A0.�����A0Ӌ�|#�A1|�<��/A2)�߅2A2�.8���A3�b5mDA4I@n�j�A5���{�A5�y�)
FA6���	A7P]�&mA8D�6�UA8�\�ΗA9���i�D        ?b�@5��?��xT[9?��u�?ҁ��/E?�a��V?�$�ʬ��?�y�#�?�گ\�%@��od�U@$n���@E
��~�@t�b��@��8��*@ۮ��_@s���%�@P]�b�@!:����@#sv�H�f@%Րs�]�@(d~�ך@+$s���@.tn@@0���y��@2f"H���@4M5�Ų@6b����.@8�	�PP@;.���u@=���|@@}ru��@B'kوa�@C�T�L5�@E�ꀘ@H;	<�Q@JeR�tb@L㜫�/�@O��V�t�@Q8U��m�@R���}�@Tc�6э�@V!Y��$,@W�S���@Y���G�@[����@^,2��B@`:+��S�@al�1IM@b���^��@c�����@eS�
S5�@f�M�7�@h2��GcZ@i�
�~�@kJ��5@l�^TT@n�Q'p�@p/^�y,@q_N*��@r�H"�+@r��.#�@s��޴%$@u���C@v���1        ?����\?\�̹�
E?���(�?��� �?��V��?ə�7�R?ڼ����?��,ȱ?�=�:X�G@��}��@1�8�u@ ȳ �8�@+)R0@4�I�/N)@?��δ��@G+�4ȳ@Pe>��*@V�����@^�}��q@d��$�\F@j�X�֍=@qV���"@u�t���@{�Dz�@���W�s.@����zf�@�O��#�@���(�@���R
�@��a�=6m@�)�����@��L�@� �XadJ@�; �V��@��ut��@@�:���t�@� ���m^@�����/E@�~��@����[�<@�{[�=V�@�V=lt@�H�+^a�@�T&���r@�wү� �@��%�ɬ�@��Vz�@�;��v�.@���R��@��M�nA�@�.ڄ!�@ƙC(%<�@�0��*:@əS7�@�/1��y�@��kI�e@Ή��l�@�'��@��H	@�	=�%�@�AP�bS@�`J�}�@�$�֧C'        ?s��*r[�?��\-V_?��je��?�+�ma��?�	�
r�i?�ϻ���U@�� O��@g�'>E�@��mS�@V�4@%��VoH�@/��m�z�@7�sj[\@@����f�@Ge=��i`@PA�\�5�@V+a:,��@]�ʤn��@cy�N!�@i%�H@oзµj�@s��%_<@xV�*N(u@}u�Rܲ@���Bq�@��L�ˈ�@�E����@�NW�K@��p�j_@�S��o?@��[+��@�C���X@��2����@��ߪ��@���f��@��F2�a�@�S�ўKu@�&<?�͓@��P���@�-$a�@�:�ά�@�w����@��(Ѽ&'@�#��֑�@�m��±�@������@�0}�g@���v�"�@�7	�GѦ@�� �ݯ@���H߁@�Q*��j'@�/�P�j�@���ԉ�@����3@{@¯`���6@��#V?K�@���7cS@�D���H@ǖ,Y(Ev@��	ְ�m@�n@��Õ@���i��        @'�DU�_@d&�t�@��X��Z1@������@��f���@��eSP�@�I�E�B@�W8���^@�
�ew�@�;�Kꥄ@��f� �@�	��
,@�]�6�d@��:@������@��V�4�.@�/R%85@�j��!A@�������@�T0�d@�L��"c@�%}�{�@��NpJu_@�~�tT!X@�c/I=�@�u��Ԓ!@��2eR@�;�d�@��7�;NA ���-�A�=�;�Ah����AT' �r	Adn�)�?A
��G{ A�bX8�Aw��աA�[BZzAw��%UWA�DP���A�.2!JA'��r��A�!��'�A�̆HA�{���A��kq�)A P�т�A!d�Y?��A"�Hh�xA#���J}WA$�'c�IA&7㖖� A'�ǩ��A(�?�߫wA*h���\�A+얝�P`A-� I�A/#���i�A0k����A1Mu$��A27�1A3*!pA4$��n�        ?Qa�Z
��?��Éi��?�:����?�D���?����y��?ט���a�?�b7�?������?�e� ���?���`��/?����3��?���hz�@�l�g��@�7��Z�@�nb��@?Zq��<@U��I@���9��@��з�@�Je>!@��}*�d@5�ڜ��@�qH<@ ��U#�@"I7���@$)W0��@&����@(l¨7�@*R�n��4@,�7�n%@/:Ky7�z@0�w�	@2e�j��\@3�(�B�@5��X.��@7D`E%�Q@9քIj�@;\F�A3@=|V�@??�yu@@�ǖ9�6@A�K�у�@C@��	V@D�rs|��@F1Dm��@G~y����@I�a���@J�"�s@Lhz�0-|@N4���<)@Ped/�Z@Q�6��@R$� �@S"��r�@TB1����@UnU�O@V�:��@W����@Y@	K�@Z�5fT�@\��㓓@]��QM��@_)=�        ?l�}�`?�Х�S��?ͮn��;?䠍	q�?�1b���@5_��=}@?F/��@H��J�@1M���i@#/)�TI�@)�\��q<@1\�ޕy�@7O���=}@?Kڡ���@D�9����@L �}l}U@R�F]d�H@Xt�-1�@_���Ǵ@d��K�}{@jDJ���@p�����@t����9@y���,�@vS �FU@�Q��̃@�lQ]��@����
}@�X-�Ef�@�E�e�@��-c�@�J[�"0d@�rk�}@����A��@�>�%0�@����Tݪ@��_��$@�s�A��@��L�d@��	�3@�ɫO9^�@�%�Z���@���ۥ@�j5�@�UCq�@�9|��."@��Ft��)@ĥ�T&�P@Ƅ��'@�~B��@ʔ�0֩@��ț�=�@��s�@����@�	*�Q�@�^���qo@�È���@�8Q� �F@׽3���+@�R|vCI�@�����@ܯ�ex�@�x>|:�O        ?N�߅���?�����?�ۗ-��?�ݵ~-�?�\Er ��?�j;�<Z?�B�[��d?�_g}V�@:�<�J@��њ@}ô��@ @�+@&+�2^I�@-ה�L�@3�u��9�@:��MI�@@�Td�-�@E�ů4�@K^ÐN_@Q(%Y2B6@UKIj@�@Z-f�(�@_�9�\�@cA����'@g�ls��@kj���#@p-)i8{@r�h|Yu2@v����@y�X����@}g��Ң@��_���@�)�Øe�@��{>�N	@���A��@����v�@��VhuF@�(���/@��E�&@�S�s� @�F����@������u@��D�l?@��Ч���@���a��@�L�"�@��L����@����C2�@�d��}�s@�L�ʠ=�@�Rl̼�@�v7�#�r@��Χ�F�@�W��?@�S3�f�@��J��0�@�u)���@�����T@�!���@��y��7@��)�y�Y@�^�!��i@�M���_:        @����=@V�'��@yC�Ci�@��vH��@��I4�^@�	>Zi6@��(�@� ��@�u�Ŧ@����"�@͘���@��:���@���X�@�^Uhcgb@�g�@��p�'R@�U8�@�2K���@��FT@��5�2@든ڔ38@�U��v6�@��<�@�-/(�wE@��j��P�@��!wl�@�]�x 	.@�H�a�F@�JҪM�@�fNbި@���L��A � ^:A)�����Alع�T�A�X=]�gA��O�A�_�ܶA	�>lrA
�m�a`ADs	ٍA���l�A�{�n�UA�vcKZuA�C��_�A�u�l�UA�Y�B�vA�B���A�,�A?���Az�Vܜ�A�G�@�A�\�~TAx�s�A��)��Ac@�=��A v�E��A!B��|��A")��A"��� �TA#����͡A$��{�CA%�U�X/A&��&��        ?h��`��S?�i*���?�qž>?�!�p�G�?�i'1A/?�]�U	m?���W �G@@� ���@����@a$
-1@���=�@�B�V;|@ �m*Sj@#!,�3u@&[5��R�@)�W@-�`\��r@1\�:Ą@3ESeS�@5��c�a@8Z���X@;4b�[-#@>JyGم"@@�1�e�c@B��~�@D�(٭@F����u�@I8�T	ڔ@K��(�@N�iF&A�@Pݤ��@R�Fa�@TN���ř@V8�3�v�@XD��"�$@Zs�m�}�@\ǀc��a@_@�M��@`�����@bUu�ãJ@c���k@e]�NCt�@gZ��#�@h�L�QT@j�:n�@l����_@n�Zk��@p\��zz�@q��܏�@r����W@s�����@uK��(��@v�*��@x'��`@y�1p��t@{KU���@|�ݑD��@~���A @�J �ޟ@�@l%�@�A�mlP�@�N*���@�e��%        ?eИ�Zȴ?�)?���?�,�z�5]?��o�=ʹ?�<.c�C�?��ˍ0�@K��،�@�Q ���@��H�A@�g�$;;@&�TX.4@/��8��8@6�wuP�@>�D�T @D6:���@J���%{@Qq��=ل@Vj&��O?@\h����@a�E	��3@e�G��.@j��>�*@pH�ǽ�I@s�/�M9.@wO,�#Q5@{�U��#@�7��jtc@��/GnD[@�!�.
@���<��I@�]�C��@��R0�U�@�7dP�W�@��BU���@����LS@���0��@�g1���@����@����x@��?o��@�QQ��~�@��#WՆ!@��w%�a@�bW}���@��3�O<@��J��@���y��4@����I�@��C��@��
3.aO@�Rm���c@�l��GЅ@��x�j�@�-�Ӑ@Ĭ8A�@�?{�f*@��E�@ɦ�O��B@�{g��Pl@�g9��	�@�j�L9�@���uO��@������        ?Yo1���?����3�?��j˳�?͛�m��?޾���?����2�?�Q����s@݋�(Z�@�J&�@,�o�@!�#d,�@*���N2^@3�k��L@<��9�D@C�zfN@KFms��@Rq>I�;@X{��KC@_����Yn@d��u�in@j�T��=@pV�AW @tA��q�@x�x>@D�@~Dle��@�E "FD@���>y�@�����@��r�b�	@�ۿ@�p@�e���@���Wf+@�M��4�@�CKv{u@����N;�@�-���L@�/��@�$d���@�~���@��ڄ�@��IRɭ@�84&"i@���h6��@��.p�\�@���:�Q@�r@���]@�7�;Z�@��L;��@�v$�L2@�7���2�@����D;@���x&|@����}@�!�^N�,@�*q� ə@�O`�-�@���}ޗ@Ӻ�s�vk@� �h2@�Q���2�@׭���L�@���L�@ڄ���k        @0��a
�@i�?1��T@�U7X�<9@�B��/�H@�y�g�@������@Ò�1E��@��6J�r@я�>�^�@�6�M�U�@�a�58E�@��PnA�@�菽�@���h�a@괔�­�@����[@�y	_��@���Q�3\@�>�p��@��HpS�@���
z֚@��g��A���2�A�t��A��C�:�Aش�;i�A	!;�z%�A��a|&AQ�G���A�Y���A2vp�WA�sY�NA�i��s�A�����A�jr�L�A��SkA 8���A E*<+LA!�����A"�DbvUA$H�1��A%��R���A'K�D yWA(�ini8�A*���0OA,]�GC�-A.5�ę"�A0�ȑ�A1�w�6@A23�%�A33ف*��A4V���"A5�#�f3�A6���,�GA8ߞ~lA9ZV�w�A:�s��A<,���A=�v�=A?9K��6A@kR�]�AAA�fG��AB �-�\�        ?�c<KSu�?�N+,��?܊��r�?�GQ���?��o��w@	���K�@��L�"�@ VOcn<@!.�g"��@%�h9o��@+`���@0�8}T�@4`+A9�@7���@;ХD(�@@$lʹ@By>�A��@E�n5�@G����,�@J�~��^@M�(����@P�
M�a@R�q�G�t@Tvz��9@V�sffg�@X�Ӯ��*@[En�W�e@]�ou��`@`G���!K@a�����>@c@+?�9@d�+�yb.@f�bjL�@hM�eO!@j&M(`�s@l����@nEʣ�@pT;�8X@q05Tp#I@rSx��Ƃ@s�f��B�@t�k2(@v �#��@wZFp���@x��L���@z00�U�@{�9P�hK@}D�G�;�@~�Uh�@�O"V<��@�36#�l@� ��7��@����@��ы+@�"��>([@�6	�,��@�Qօ��)@�u����@����$@��q��D;@�~{!<�@�K�U�D@��R�Hh        ?D��}��\?��8���?������?�S�I��?�v�s��?��/���?��ZR���?����_?�N�L�z@��P���@�O��]'@ ��E�5@*L��h@4��az@=�ΜeAR@EY�v3��@M��;��@Tf��q��@[:HdM@a�?z��@f�e� v@l��rB-P@q� �	ʄ@u�c�1?@zt ����@��+2ʞ@���>T�@��88�@�¡�Y؅@��Δ3�@�.1mP��@��ê#�a@�bH�`��@�Z�9j�@����G�@��Q7�@��'��3.@� @ �I@�5VÆh�@������@� �@R@�ۊU|_�@�c�<i�L@��h��@��J�A7@�cL�+�@�E��,�S@�FTv�.�@�em�%d@����.�E@��:��^@�Ec�>�@ܼ��@�Br��7@Ņs�(�@�*Y�t�@�� Ĉ�@ʙ�^�@̂�K��@ΉB��
�@�X��T:�@�~���:@Ҷ3���`        ?X�+�~��?�	�Kc?����\?������?�i�Y��?�d�w~T	?�gJ�$g�@ ��NDiU@
�̲r�@�ޚ}L@!�+���@*x��2�@3���f}8@=M���wH@D��l�@L�����@S�\ҨUI@Y�؇ōt@`�F� 'y@e2�_T�P@jf���%E@p0�Y�J@s��I��c@wf�1<��@{���~R�@�5�0���@�����@�����F@���b@�fش\T�@���4W@�1I�HT�@�v��p@��IBF��@���ZRۂ@����D�@��!��2�@���>u@�h­�zE@�ht��@����2�@��a8��@�c�c#	@���K�@��;��@@��^��� @�/����@�����w@�۝,W>y@��i� .@�H��@�Zl|��;@�g� .M�@��:FO�@���*T9@ē)lnu@�#W ���@��M-�C@ɋ��\{@�e�A���@�Y��Gx@�h����u@�ɨk��        @?�IV��=@x ��T@�Zb+HG@�a�:�@��[��@�_TlY@�y?;�	�@���D�Sa@�&2�~�@�!j:��w@翶Y��@��Φ���@�@r�+�@�TFᱦ]@��G���g@�I��7�B@�-��:�A���}�CA���AAF��(�A͑_�|A|C[�:AT&�˧(A�d5�T�AB�@b�A�`
�BgA�yu�%�A�����BA��r�eA��jN�A�;�K(GA ���A!/�����A"h �eY�A#��9��_A$�X8T0A&[��e�TA'�����A)<��rA*��4���A,Q�ߞ�A-�Z���A/�>��^lA0��o�SgA1�P�oS�A2�q�4A3A3wiQwfA4w���[�A5������A6�^8�CA7�hclÐA8�Ay��A:<���A;S�Ѩ�!A<��B] A=�Z�N�<A?V��4�GA@a@��i�AAK�#�/AA�@��B�AB���T�OACjO�m��AD8+� �        ?e��&�?����Ϊ�?������?�z=2'?���Pho�?�!K	�H�?�
�:�?�9���@ �q���~@$"Kz�@
>�[�|�@��@2y�@��8'z@��M�.X@Z�t�@����� @!��Z�Z@#��͹@&�$N�,�@)m��]�@,t�~�7@/� �J�@1�.���m@3ce���r@5RJ�^�"@7]If7ځ@9��$���@;�E��L@>(��>�@@QѪ��@A�J��@B�TG��G@D\�9�~@E�!/ u{@GS/<��@H�|��;@J����n3@L1����@M��U�u@O��� \@P�,��_@Q�2
�v�@R�k`���@S�0�@U"�)��Z@VT�����@W��kݮ�@X�=���@Z4*�h84@[����fw@\�Bo���@^sL�q�@_���χ@`�lX��q@a�$P$�o@bO����-@c �+�U�@c��XnV@d�ݏ�`x@e�3؁�8@f�ޜX�q@g��[mM�@hs���J�        ?C�|Ji?��[��L0?�;���=;?÷'��}?ԵT���|?���Ѩ?���8Q�<?�'���@4�ff@�~{�@���?@$�$�*@�@/���ou�@7�F��@AT�)廪@H���?(@Q)���u�@WeŎ.
@_H�S�@d�u����@j��b��@p�J]: @u4̵	3@zIĝ4�@��)�<+@��1��@�h2+yL�@�У�ME�@�aZ�V@�!�tj�F@�+��߱�@��VK[v@� �PSTs@��2���@���~�h�@��6����@�I���I@�՜ϸ��@��~o���@�\�א��@�,=O��Z@��8���Z@�a�հ�j@�|Qd�@��N��b�@��I���@�����9@����y@��oS���@�
Ƌ���@�/�X=	v@�`�⢉<@Ĝ��i�7@��I���@�:x+`p�@Ȝ*�e�f@�
��c��@ˆ�*�D@��:{�*@Ψ V���@�&�v�2\@�9_��@���#i        ?2v^6:��?e�b\�O�?�������?�gn�r/?�m~�&i?���{��?�#�j���?��8h̿?�6��N?�W�&O8@�8�5;x@dVa�@mc�0O�@'x2/��@1��T�(@8{�G�H6@A'�U�
�@G���⅋@O�9�̗�@T�Ǹ�L�@[ i[m �@a=��a�@e�,L[@j�M�r@p��?��1@t,���@xL�K��@}�G�H�@�,�@b�0@�0�ꌾ�@���}��@�ZA2���@����2�@����m@��ߴqLg@��Y�,��@�����N@�8[�O@���m|@����@>@���S<>@�fv��*�@��A�4?#@��i�C0U@���@�@�T�<�8�@���/�@��,G���@���k��e@�za(�R@�4���@��Ӆ?,@�̴�aVZ@��(}X�o@���B�g�@��Rx���@�4/�V�@ŀ�<�J@�י9�K�@�8ל�@ɢT��S@��&��g@̕��O        @(����|Z@Z���l�@| ��H*@�,3�QEC@���t��@��d���@�5\,\��@��C��>�@�HGv�{@��м���@�ɹ����@�/l9l�@־g\�G�@ڐ��@ޥ!,v@�}�e�$@��-s6B@�5GA|�@��6��'�@�p�{�|@�A:Uc\�@�.�@�@�&� ��|@��3�@�vilh��@�:���G�@���o@���3�=�@���8�7@�|F@��A �e;��oA�nǋaA�\���A�?gS_8A-7�ڳAj�ۨ�A��
��A	����A
aF�54JA�3�Ri�AE����_Aε�@!�A3�S��=AR��A��î��Aɗ�A�R����A��k\$�A�Y����A�=���hA�t��mA�٣0��A�U��ҹA�6{�A*�>�!WAYr�&[A�����Aͭ��7�A ��+)��A!0�ri=A!�� '�A"�Tz�ռA#?AB4        ?��-eS�@ ����w�@4��#KK@2�nw�W@Atp��̒@L�V�D@T��:�1�@\)�i��@bnH�
�@gK��+@l���<z@q>\_v�s@tb'�@w�ov,�@{K,��@Y���@�}��hѨ@��:J�n�@���S�Q@���[�\@�9�ޢ��@��r�qW�@�#ӊ:@���^�e@��zI�L@�v�Z���@�١���T@�F�e��d@��Ys��n@�@Z~�#�@��@�I�@�f���@�̠G�@��]3�H�@����J�@���e��@��{�QJ@�hlu@@�R^�n�@�?!���M@�.!�Y7�@�.����@�,��p+@��W��@����7>�@�����5@��e7r�2@��j` |�@��\���=@���z|9p@��ݐ@������@�V"�@��@��#�@��ш�|@������@�87�tR@��z\���@�X�R���@��0��O@����8�@���^�@���w�e<        ?�]+�$�'?؏"_S�?�V�v�@_�cПG@>>��G@!���E�@*�\2ʎ@3��mu�@;�I� SZ@C��hIP@LY`���@S�)n�@[��~���@c4��@jM���@q�I|WE�@w�q����@����@�м�7�@���*vf�@�0����(@�7�b��@����@���K��@��i�I%@�G�9��@��� ��@�_�r��T@�b��E\g@�_N�Z@���* w@�0���3@���nx��@����@� �5��@�Q�Z\@ȑ�n�&@�ټ4.V@�$�L.m@�m�D��@����(g�@��4�$�@�	���@�8a/m�@�# �~��@�(Z��@�*l8�t�@�+G�@�-U5 M@�2z�mH@�<eS�@�@�Mյ�"�@�h#��>@ތ�)��@߼Z��@�|C��	@� ��e@�̪J���@�����@�:F�Ն�@��{��ջ@��W����@�֒��        ?�oӼ+@%��#Ǐ@C�}�d@W����@e���J]@p�!N�(�@w�����@}�4>��@��5*��h@�U?&3@�����C@����B@��sZ��T@�=�ѥē@��9>�j@��{�^�@�"�j �i@�2 MJ�@����~{�@��6Ž��@��ħ�@��o${�@����@���|�
@�R8�zN@�췠���@�El,W�@������@�;�B�@��)Qz�2@���\��@�d��S�@�N?b�B@�PN�h�S@�5��� @�P�x��@�y8K(t�@ï���B�@���l4F@�J��R�@ǯ�-0�E@�&����$@ʯ���E�@�M!���!@���.[G�@�����@�����@��.b���@��r��@���!wT@�2i�8^@�t�3s|@��V���A@�7�
�ta@ں��� 0@�V���&@��˿@��'�=@���qy��@�뗼�ֆ@� �Yɪ@�%�z�!@�[.-�0        @�g��8�=@�>��R�A x��k.A�
~�qA"e|SDyA-P�Jp�AA5/8�̠5A<�8�ô�AB��ҼsAG.�۳�jAL9�o
@�AP�/;���AS�����MAV��]sa>AZC���`A]pZ����A`}8ET`�AbS��k�TAd:=)���Af0UU�g�Ah5|��AjG�`�c�Alg�xy�An���C�Apgc��:MAq�z[;3�Ar��f���As�ݭ���Au�� ��AvRޅ��AAw���ܷAx��Kƞ�Az.��y��A{�?�:��A|�1��A~L���A�f�DI"A������9A�HQ��ǇA��v櫀A���R\pA�z�0�^A�8��}�A����A�zA��o��A��^|�nA�F�gc�A��hguA��L~xx�A���2��A�t��E�A�E�M��A���	*�A��$����A��)>��A��׃S��A�x��A�)��@��A������A�7���A�xd ���A��1A�Z:��]�        ?g;muuD?�/��dK?�4VI��G?ܙ�3��!?����=,?��1�4�?������!@r|�h@��ڙ@l�VA@�"g�F@�˚�03@ u��"@2@#Z@�t��@&���5@)���u(�@-���Xu@0ԯ�ޓ@2���#�@5T�|Q'q@7�פ�k�@:�e�c

@=^>VI� @@3f�r[M@Aθl� �@C�O���@EK�����@G-毸$�@I)LE�â@K?Ec{�@Mp�i��9@O���S@Qa��@R`���Fg@S�I6�E&@U%N�_��@V��,TH@X0k2&L�@Y����(@[��賶@]I���֌@_"dǾ��@`�n}>[�@a�� ��@b��|o�@c�|��@dȱ-hC(@e��[�&@g-:Qx@hrV�g�@ið)�w{@k"�5�)B@l�G�7�@n	��L53@o�M'}~�@p��:cӚ@qj@A�@rGip�@s,�t�@t��q��@u����@v�¶Hh@w$��h��        ?1g��]b?r����?���B���?�$����?���n
�?��O�F��?�n�2{�?�x��ۈ?�<�:[��@
�O��t@�aӄ�K@"��&-#�@-߲bJr@6�Ԯ��=@@�e5��@Hs�a��@Q.1r�?@W�:z�@_ǭ�Y/�@e��}^�@kX���@�@q��L]�@v/pF��@{�㭄%r@�!iPt@���h��@�Z |_@�h�ڡY�@�����@�T��C�@���W�� @�a�L�@�¢y*6@�;ơ*R@�񄙇0�@��#� ��@��:�@���+,b�@��(��Cu@���9;i�@��=p���@�G,��@�������@�*%�m�_@��b$��@�kʹ3D�@��Яf�@Ę����@�Q戕U@�!�xs�~@�s\�mT@�u&��L@�/3T@�5Ɵ�@�cLr%�q@Ҡ�A�d�@����@�P�S�t@�ï�*�@�KbWnz@��b��/�@ۛ���x�@�gt��ڛ        ? e%��?[P��B��?�dB[\?�_Ca��*?��	˕L?���1(��?��#��:9?�Y�Cq�?�w�]W!@^B��u@v�N��>@xՕ���@&1x���@0��*� �@8�0ZV'@@����9�@GN�RI1�@OD�b�f�@T�j��k�@Z�u���@`�@w>�{@em?Ok@j��@o��2��y@sAo��Z@w�%�� @{NNd�ו@�&E]��@��V&ΰN@���z/ls@��L�mN�@��E37qQ@�C��g@�kr���@�ÄL7�@�N�|z��@�6�H�@�
���@� �]~�@�ۡ�@�@���acPm@����R�@��k.�~@�#c���@��6�Ӆ�@�+��4S@����T|@�k��w�@��Kc���@��*��s�@�R��<@�"���E�@��dY@��y��@�)HtL�@����%A@��r\ףC@�"�"%�@�T3��	�@Ũj�f1@�"��a@�}��v�@� �i��        @ U4N�^�@`7���	@�UM^F@��ƣ& m@�B_���@�N���{\@��jݿ�h@�c��0W@ń�(5�@�S��N�@����d@ԇ3۸a�@؇ ��8@�����_q@��5���@㋃F{�l@�p��|�@闊 ��@�&kI�@�Y�I��@�W�㻭(@�{��d��@���%�:@�:6�r+p@��.�V^@��%�>mA ľq���APܾ��A�_S��>A��xIO$Ax���e�A	_Se7��A_@9Ax#��[UA��=���A����A,���W�Aj8֛�A�c`��A�"Ƥ�Ag�(R��AҖp=)AH����[AʝFXo�AX4�\N�A��mfj<A L(	#��A!%���>
A"S�pA"��)�a A#ܣe\�A$��bkA%�L�eLA&���(�A'�ek�A(�T�{A*!��.m�A+M��{4�A,�q)1A-�0xa�aA/���$A07��Q�A0靁YO�        ?e���@<?���C'��?�4�[�@?�q����G?�2�ϙ��?�	@w�w�?�2[��?�}���n�?��u��u?��E"3��@��4�@�ݦڦ�@�]B�@ ���s�@}x<d�Z@y�#��@Ix�6@!���3@$��t6T@'�i���@+��˞7@/�!��@2\>�7x@4��QB�h@79��@:%E�Ew@=L��V�@@X��2`@B*�rP�@D��d@F-�� �@Ha$�w�@J��3��s@M.���2�@O�����@QDN �x�@R���]��@T9��2�@UЫщ�@W{֩�)+@Y<�@��V@[ܮd$h@]��7@_�}|�n@`�2ph@aÞ(]�@b�����@d;�{�Ye@e��q��@f�l�t� @hiFF���@iK��@k�=�C;@m*b�%��@n���P�k@pS�A�}�@q?g��ʰ@r2ˉ^�@s-Ԝ��N@t0-NX�5@u9nN�s�@vI)�a��@w^�s�        ?b~�2L�?���Z���?�(��-�?��*��t?�(��J�?�=��*1�@f�%�@��[�@@ڡS�;�@�3��cs@�0i �@$��|��@+�L���t@2�� ��@9�O�t��@As;��"�@G��Y�Pl@Oz=P���@T�S�ۑ�@[Qy��I�@a�S5��@f��5��@l�g���R@q�ss�n@v9P/�/�@{@���@���2}v�@���~@��j�8�@�7�@���]T}9@�g�ｘ@��r7/�@�
F}(<�@��b60J@�!�S�@�s����@������@�ڲ]���@����U@�B�AP�@�o�Y�R�@�b�M3�@�{��u`@������@�&�1f�@��7$D�@�{��,@�4͑��@��\.5�@�j-�x�@�)��ݪ�@�m��E{@��8���@��M*�@�0q�R��@�;����@�m~���@ҮB+�0�@��H��&@�]����<@�ͺƕp}@�M��a�        ?A��h�?q	Q��I?�����\?�/�v��
?�>��(�-?�o�fӇR?�!��(�?����?���[ܾ@	To���0@���w_@ �y�Xi@*d/�Q@3��R-A'@<�<�]"�@Df#�~�@L'p�@!n@R��w@X�ӯ{w�@_�b @d;?&k�@h����T(@n/b���@r''�7-@uqՕ�@y
T]��@}'��Q�z@���V��Y@�/Ta��	@��X:�`@��+Z���@���ř�@�1߄D^-@�v�A���@��� ^N@��K��@�6��e�@�����@��� @���M��@�b0C<@�[wv��@��a�=��@�㦉��@�zCN[�@�L�`]�@�����"�@�Z����@�*U�.ش@� *݄a�@�>�@2��@���^O@����(@���p�[�@�=Łg�l@���4��@�e��BL,@�$!_V��@�ʜ�c@���k��@��A�x@�\��7@�`} ��        @*x	dLj@aoX����@��xcuLz@��}��@�ez�@�^���@�@��T�t��@�'�G��@ʽM��@��#@m>@�D�-��@�ߖ��M�@��f_�*�@�<�@r�|@�F����@蛄:[P~@�C����@�$?m7Y@�Y�"�R@��b����@�qC�,i�@�[~�md@��e�0�A ��h]A�Ac6���Ao3��;A��y��A	2�*�,A���(q�Ao�׳jkA����m�AU��9A�R�7�A�!���A㍓ćOA����.�A:� ��1A�G퀧�A ��G<�A!�iK�0A#S$�v�EA$�0�Ւ�A&n�����A(!���i\A)�c�\lA+��M�k�A-��Ч�A/���w��A1Zq3rA2E ��	A3~�{��VA4������A6���GsA7��ۡ�"A8��~TŧA:pyfWZPA;��(��A=���	=A?8�`�oA@s���?�AAQpb��$AB4kB�-�AC�񣀓        ?p�UzM?�|E��Xf?�ok��K?���;��?��IJ*��@1<�=��@�z�� �@Ό.�%\@��۾�@T����u@ �3^)��@#�aQ�\p@'pR�g@+#�v
�@/		eIQ@1��=ѽ�@3���Ƹ@5�%�j�@88�p��{@:�S�q��@=	2U2�@?������@A,r��@B��1b@D �'��&@E�!�gB�@G�Չ��@H��ٜs@J[e��$�@L��B8�@M�͟�#�@Özg�@P�/A�,@Q��3�I�@R�D m�y@T{h(�@U$�=��@VN�.�^@W����@X�B��@Zd��@[eF�Wt�@\�jB\@^?�T��@_ĜbH��@`�\0�&�@a��s�=�@b_��EL@cH�)��4@d<�5���@e<d���@fH��1`�@ga�(�ğ@h�:�麹@i��4���@j��yZ��@lQg���@m��t��@o#ў���@pR�\�Ѣ@q�=��@q�-*�1�@rǉ�m4�        ?4�>[��?u�.��[�?����3L�?��X)3�?�Ӷ��x�?�PP�?��f�K?��q m��@���Lu�@�̔�@!��ZI@-��_���@7��4\@B���R�@J�|H��@S`��z�`@[5�〺�@b�p�*�%@i��4_@p���I?d@u�g'�4v@{���ū@�p)}Ɯ�@�Ǚ�8��@�掳��@�q)�wl�@��WY#�[@����/@�o5|�4@�������@��o��@��M���@���lO@��Y��D�@�x(�&�@�߅Tr�2@�}aU���@�S8-�Δ@�b]��O%@���Q��@��k:
��@�x�]@�w��]H@ǕJ\P	@��ʆN�@�-},<�E@Ψ�Sє@С�l�@����i�$@�k���<@�� �϶}@�tro�@�����@ٺ|_�@6@�t���3F@�=��J��@����@�~�p�0@�yd;)�@�{u����@ㄭ�N�3@���9�@�D;Hp�        ?ATa�?x�Pה2?��vJӞ�?��r���?����HĬ?��y��{?�X�@l�?��v:,(@w�LX�@��"�p@���Jk�@%��$��@/|C6x@6#�Cƿ@>4 5��@D��@��@J c&@P�����@T��j�lx@Yˋ�k�@_���<�@cgM�v�@f���K#�@k.�_y�@p	����@rʲ����@u�Z��?�@yPnஷ�@}!跾@��W~��@�� t*�@��5��S@�V�� Y@�c�r��@@��<���d@�)@�6K�@�M��u�@�<4(��@����?�@����0��@��t"B�&@�n��P'@�8�k��@��TA�&�@���(&�z@�U���{@�?dd�1c@�DU�_�@�eyO���@��y�bx@���L2@��ft޽@�hC�@�d�y�6@��T�~~�@�NE��h�@��"��@�{AE_�@�+����H@��~���@��F!]d@��6:��h@��5vŶ        @/>�వ@e�ţ��@��D]ў@����օ�@��b��|@��.�A^@�H�l	@�ɢ|�H�@�7�7e�@�TZ�U�8@��L�@��XG�Pr@��yХS@�K���;8@�uҒ��@��G��@��
��@�X�c�s@��0/A�@��X"�'@�Y�N<@�i�Q��n@�P �ے#@�S]�|�@�t�k���@���{�2S@��L�h9A Tn���CA���^!AOa/A��r��A:ؐநA�8����A	����iA���B�A������A��xY�A�o��h�A*��<AI:�ޚA���� dA؄�yyA5���4&A�����@A�hN�6A��R��AC/J��rA�˞�l�A U��+�A!<`��A"+ ��A#"��r^.A$"��BA%+Ø	SA&;��aɭA'U_��A(w>Oj$A)��4d�A*�t�GA,�(A-S��$%A.�GD=A/�B�k%        ?͏9��?���;�.@/�x��@"(p���@/����/@8L��f@AR�����@Ga��nV�@NOq�rP�@S���6n@W\S4�L�@\]���w@`�|��@cb[��@fX� �v<@i���@l�^�}@p-g��F@r&�0@s���qm@u��C�L@xF��"�@z@L��5c@|�@�.��@~ۂI#q�@���>n�F@��Γ���@�3��)@��@��@��{��Q@�^	���@��i��<�@�[���<�@���(=�p@���ځL�@�)�)�G@�l�Vl^@�J8;u>@�,��k@�8�X�V@� t���z@��+��[t@��$)��@��-��"�@����@�ܲ2���@���|�w�@��0���T@����3�@� fc�@���8@�$����@�ZG��_@���&�}@�7IrM��@���#�;@�U��.��@��'%8�@�w���S@�
1Nl�w@�������@�2\�d�{@��'�S        ?��	�ƒ?�YV2�%6@�ƴ�@�	.г@%�LC4@0瓉���@8�#-5�=@AǊ�7@Fx�wA��@L�A����@Q��ۆ3@U���X� @ZDI1@^�L�yKh@b��_O�@d�,��m�@h2�!ްA@k�_��Re@o���y�;@q�@���@tGС̥|@v�A�?b@y�t�!u�@|��-j)�@��;�@��+J�b@��p�q�@�%���@@�����͖@�'q��V�@��Qܯ!�@���:�g�@�/�N!r�@���H{�@���Y�'�@��(x,�)@�9~!�@��k���@�+��(��@���c��@�g>��4@��a��	U@��La��\@�V��"��@�/ǜ��c@�#�n��@�4W8��@�a�}6�Q@�֊���D@��'�\�@�P��`�<@���ݞ2�@�K��@��v��]@��"v��@���{9@�Z��ŋ�@�:AN@���c���@��1h�C�@��K�͑@��5�4�@�}��8y        ?������?�\!AU�M?�k�K^}�?�	�3P��?��,��A�@9��ž@6J�ԙ@��r��@-� ��@$	���@,c�=tF@3���\�@;ܶG�ت@C&W����@I��W�@Q1�S���@Vn[lUJ@\�|��@b(V����@f���lX@kȢ��5@p�
�L�W@t^�DԵ�@x]۞��)@|�����@�ȐX� @��R�q�@�l�V9��@�5���s�@�s~p�r)@���t��@���h���@��g_�T�@�ϱ=c0A@�Rr��^�@��G�@�/�v\��@�{N��C@����R�-@��̲m�`@��dFU_<@�sûLu�@�4�n���@�����@�,�23�@�i�֣˝@��Ц�I@�t�*bm�@�$�)�C@��N��4�@�P75��Z@�	M�W@�����@�`a��@�4mlv3	@͊l��8U@����s@�Y���@�ÔuQ�@�D�W��Z@��-�T�@׍Z�?R@�U�/n�        @�*���	�@����@� =�u'�@�F�%��@�QA2K�@�e�Jh�5AB���~A
}\�t��Ar���A>ثe�A�L�k�A Ѷ+�A$�:��A'�ƉۜPA+��-J�A/���ɝA2DN�U A4~K��A7-����A9�o�I�tA<v�r�V6A?g(M�2AA=�C�AB�b�/�AD��՟4�AFK�f@gAH ��Y)�AJ/��rhAL���M�ANKi~;#AP|�54AQ(P�>��ARD�:��ASfI���AT�j���AU���AV�DڕAX& ���uAYa�е-�AZ��ܞ.�A[�U�G
�A],p�8%�A^v���A_���)A`�\��Aa3UF��Aaݶ	�GtAb��1"�Ac5j���Ac��ߓ�Ad�n�/�Ae>��V��Ae� E�Af��;޴=AgMpv��9Ag���=��Ah�ZIkAi_V)-<�Aj���(Aj�{_�EAkt�c�9PAl'H��Al��_k�I        ?���tR]w?�Ǡ���?�w��)��@nC��n�@xV�;3@'EY����@0Q-X��@5�x��@;d83�ʧ@@׭A<��@D7z�0/�@G�ן<��@K��R��b@O�~T*;�@Q�S��Oc@T#L�iB@VB3ʃ{@X�'�C�@Z��o��@]i���8s@_�1�1P8@aE,�E��@b��3���@c�nyv�@e`��ϊ@f�ަ��@hM3d|r"@i�lZ�Q@keu��]@mkmG8�@n�xo(��@p6�}ϛ@qs- 1@r�O�^@sn���@tvp��@uQz�"@v �M��@w>�G@xfsݢJ(@y�/_�?@z֥�K�a@|�eC��@}t#�0\�@~Զ���@� �L�!@�ݷY��=@��A:�)�@�k�n4R@�=p[2�@�����@����J��@��9/�z�@��9�]�@��Cy��M@���9V�@��a��@�����y�@������@�N�`�@���[�d+@��$5])@��|)R]�        ?{`����$?�swnè?�{x%��?�9tQ1@˧B�9�@�kC7��@��y�{]@%t%a�2@.�'�@5���um@>$�Y2@D��.�@L1dR�!�@S}���@Y�?{{@a����W@fhI	��"@m!�i8�C@r�$�,@w�D\r@}��m��z@�D!7�W@�Eѐ�?�@�ږS�PE@�3q�=@��;I0@�+���l@����8X5@��[��@����a%@�JR|�C@��eN�ȓ@�s��~fu@�KjoEZ@�OsSP?)@���X��@�m�G0r@�0.�=T�@�Մd��@��CP/��@�����4@�L���@�Jd?�qx@�K�D�=@�}�X��@¾r[�p.@�7^�RS@�j��N,)@��ZEzM�@�V2//�@���+DAd@˅����@�8��5P@������@�mr��<�@�e��,��@�i�wN@�zD���@ԗ�7L�@���O19@��:���v@�G��O�@٢�!(�        ?�TF��Ȃ?�\��&�?�v>�i+@�v+�T&@��J<P@��>A@%G�Q�@-3���[@3�8�Ζ:@:���vG�@A�hC�Q@H�#�M@P�H_�$@W.�@��	@_��OY�@e�?~ـ�@m��D�D�@s�bb��@y�"�Q(m@���F��@�0�Nr@�s��	�-@�>!���@���z�+�@�h����@���fHZ@����j�^@�Z2J��@��'b���@�~��l@�=+%��#@�@�h�@�X�>��@��,�4�h@����� @����Mj@�ag����@�11SH�@���DH@����2@�p_��@�S4��HY@����fy@�����@±+���@��hgd��@�� )���@�#��Ս@�i.Ld�@��WZ�n*@�*�%;=d@˩.�C@�=TC�@��m&q��@�T�%`Vn@�Al%̠@�;Ֆ@�A��M�@�U~���^@�wb��QR@֧����*@���E�7�@�5$�ƀW        @s���SXE@�·;�@�a]�LW@ۉR�E�)@�]d��\U@��D�r@�frB��3A��~E��A>����AbT|�G]As�^o#Abl)�J�A|��WA�M�"2xA*(r26A [����A"3{���A$����A& �~lA(��ÒA*"����A,>s�xA.e�	caA0L=%A1j�s��A2�~�*wA3�c�o�A4�#����A6%���QA7g����A8����~A:
��"�A;mlU^�A<��_��TA>Y� �FA?���lA@�F煒+AA���~3ABp�� �ACVa2��XADD���DAE<m�d�mAF=�}#�AGIc�q��AH_���,�AI��e�AJ���
׸AK�;���AM-�2��AN���S�AO��!֋AP���afAQk�^�xAR59���AS�2�4^AS��7�OnAT�^Q��AU���Y�KAV�Z��qAW�>;z�AX���G-=AY�-�6-A[+�-9��        ?���a�?��{3&��?�g}B@�x@���{H@"f$�%��@+����Or@3��i�@:\{�K��@AF�ۿ
@E�L����@J�z���@P���@S</���@V��f$e�@ZW�C)�@^K�8��g@a>5ϥ�D@cq7`E�@e���v*@h��Bp�@j��m��E@m�fca@o��uO ?@q$�6��@r}���͟@s�Yq�9;@uDs�ua�@v�2a��@x)��T@y�$� lf@{1$/�6@|�_� @�@~]L�e(A@�4�˧�@��Y���@���d�@���!��@��*���@�r��˅�@�i����@�gB��@�l"�9Pv@�xM�]�@��͒U(�@���'kf @�������@��Ѳ�vI@�$V'Ve@�]�O�:I@�OXOͦ�@���$��@��݄���@�G��1^@����B�@����W-m@�_�F��@�5_��@�յ�*��@��;��4�@�W�Ξ�@��պz:@��a�nr        ?��z��ǈ?�#�~�@C�S�_@ 9��P�@0V>[V�@;��� @E#b�b�@N,�J�@TU�̋�@Z���y@`���$@e6| ��@j ���]\@o�ܔ�P8@s2X2)S@wPag�-@{w�)�@�V\ ̠�@�cW	���@��dDvZ@�?C�{@���5��@����V"{@����W8@�T��]e6@�DO	D��@�ҁC�="@�>[}u,�@��v���@��~|X��@�}��@�v�p��h@���y@�����l@���=�j�@����'�@��]��Լ@�?��f@�
#}�Do@���X%�	@�%]�2�@��Z!�I@ƥ�HX!-@ȎT��m�@ʓ�y��@̶����@��E��]_@Ю2b�Q�@����P&@�E]<���@Ԭ���<@�'-�W@׶����@�Z��D6@��Ƅx@���:�@���� �@�f��2�0@�s��d�F@��"�B�@�3R95o@��e���@�-�"9c�        ?���iS?�Q�x��?⾥�ո?��u|ҙl@�<�j?a@����Q@9p���
@%W�J}e]@.^-u�S@5MD�lw@=��)��{@Dmh9�P]@K��-��n@R��5i�@Y(�tÒ@`r3N�.@e=V
�@k����M@p�u��'�@t��>(xn@y��
S�@~�y��@�R��@���G�U�@�A�b���@�Br
��@�ώg��@�+���@���>�۶@�i�Y�O(@�H�>^2@�PW�o�@��aXm�@�iM�;�i@�%w�!�@��*�@��/!G�@��}\^^q@�΄l��:@��pƲ��@�N�x��@�3?ڣ�@�dñ��@�����E�@��kZ0�@�K���{@��ܝU~�@�1���|@����3��@�Y�5q@�*��M'@�đ���@��*��s9@���Y7��@³����P@õ�Ȗ�;@Ŀ��,��@��O-t��@�쾬�L!@��3d!@�8�����@�i�Nd9�@ˡ>KFK�        @dg&6J	@��6�:��@���l�@���ڏgK@�Q�?��S@��bJ:�A���X�A�� ��AV�r#\�Ao��D A&��C�A!�P�i�/A%:9�7�A)�;�^A-F���A0��WV�A2����*eA5S�>�J�A7Ǫ.!A:M�q]��A<�N1�{�A?�`�ܤ�AA���ABrW2��&AC��}�a�AE-�x귗AF�b~C��AG����AIT�*D�WAJ��⯭AL"zT,�KAM���DZ/AN����AP4�Z���AP�A�<AQ��.0ARj��*)�AS-	�:6AS��@�M�AT�����AU��VS��AV]�%wtAW5t���cAX�x<�cAX�2��
�AY�X��	jAZ�!.:5CA[������A\���o]'A]���JڲA^��c�L=A_Ċ��+A`i�M��,A`�y���cAa�h��3Ab»��Ab�ﮆ�HAc/�P�DAcÑ��	�AdX�BH:�Ad�AhxAe��YiLAf�4o)        ?g�(+&�?����Ժ?�T>
�?�Wv�u�?�p��BS?�:��&?��5sx�	@ ;��q@t����=@��^ʡ@T�	��@o,͕�@0D�u&�@�v�Ԩ@#�O��1@&�֣'K�@*���}�@/�V���@2o���U�@5c굒s�@8�z��@<:�愙u@@��N�@B$�2���@D^�Kv@F���+!�@I4�ɸ|b@Ḱ�dR�@N���S�@P��f@R 0��^�@S�bY�T@U:ny tv@V��`�?@X�
���@Zd=?h+�@\B@�hk]@^2�ѧZ@`Z�e�@a#�[#�@b5YzK�X@cN����@dpe��a@e���]�f@f��z��@h�����@iD����@j�B?��@k���!�@m7R�l��@n���/�@pM�@p��ِ�"@q{���
@r>�_Y��@s.6�U{@s���Â~@t�ɴ�m�@uvIn�@vO�X@w.y�Hڤ@x 2BOM@x����6�        ?aA�����?�I�e-u?���XJ�?�|�
�j�?�zy��K?�p�_�I?�5 } @�o��W*@���_�H@�����@"�]�w�*@,t�8�@4��K�u@=��O���@EF-�m�q@M����a@TM��s�$@[XWC�@b m�M�@g���|�@n����!�@sm3-�ݠ@xr�q�@~oia�#�@�����=@��6�'�@��h�M�@���N��@��F�-	�@�Q hK�@�I}��@��e'��@�C���k�@���$ZJY@���K�l�@���g,v4@���y�1@���t�m�@��`��	@�k�Ob��@�]5�W@�]��&t@�lCU�2@�������@�����(@�i�%�o�@����J�@���a@ûƟ��@���OFi@��%���y@�#7-�n&@�K�6Ґ_@�wߔ��@ʩҠ�;@��>�u9�@�l*
��@�d��@ϴ���@Ї��o,H@�:�1P�r@���h�@ҵ��C�i        ?>B}���?xk��M�1?���&�S�?��d!z
�?�"�D(?�k�K�?��g^R\�?����h?�4�r��@?�;:Ǆ@V�[:b�@J=*@��@&�̧��@0�\AF5@8���?�@A�vl�p@HRԅ�K@P}�`@U� `�@\������@bts�>C�@giʛ=��@mQ���@r"=d5@v/J���@z��j)�@�I�n��@�"WP��t@��Sa_A@�Z���@���Xb�@���Q~mb@�)�
�3@����W@���1M%@�0��v'@�Vj5�<@�3C���z@�.�i=v@�Iv:]@��Y@��@��\��\K@�Jj���K@����Tza@�BF~���@�����xa@�Q�Z�@����Z@�C�{�@���Y���@�F��5��@�����h@��`.��@�X/t}@��[fܔ�@�s
�Z �@�]*��m@�K��`@�?kf�@�8	�� R@�6Ͼ�@�9͂���@�C��x        @-�'h7��@g#N!��q@��i\;�@��*�K@��}�M��@������z@�!�� @�V#�n@��պ?�%@�]���(@�V�
�?�@�qGL��@��2�|@�=���@㳶��C@�0���
@�8q�gt4@��C�s�@���!@����Ls6@�HY24�z@�Ya���A �><U!A���	!YAz�li��A	��yZo�A�y��sAcal�^AUt���LA_��A|���2A�*S���A�z�6�A.���;�A}њe��A �L��FA"s�ǲ�A#B���E�A$p� }7A%�Ŭ�.�A&�6e$�A'�Y�4s�A)/��A*f�q~��A+����ErA,�)؆�A.1	�#P�A/�Z�O�A0m�W�URA1y�E�A1Ӫ��`TA2���b�jA3Lk��A4Q���A4�cn�[A5��|�lA6{|�۷A7T��<�A83�2yxA9̳\A:�A:�6� PA;���*J        ?M_���g?��h�ח�?����Z�U?���)�?����t?�3E��m?�+���?���>WU|?�T��p4�?�T.���5?��:�Q�?�=lPB�?����6i@5�fv-�@spMS��@�rX,;@�f5e"�@�VF�@Ώ�wy@H+�ze�@���Y�"@��7��@����@ �%��i�@"�M7Տ�@$���)�@&���.@(�ls^�@+Wِ�٩@-�'y�L�@0_H4�DT@1�̄Xq�@3�,ۖ�@5I0s�8M@72i�ܔ�@9@�||!@;t�u��@=θ]�NC@@'�~��@A{�?E��@B���}�@Db��}&�@E�Nt�y�@G�ahE�@Ig��.f]@KDQDc�6@M:�6�n@OI�ڤ�@P��?܄L@Q����zQ@S���@TCL��w@U�����@V�N�`�`@XF�3�c@Y���s3 @[;��/f@\�ɮsD@^m�nF�T@`#��Yj@`��aa@a�7)~ah@b�*��+�        ?�eS�?G� �?x��U�:`?�d-�O"�?���&��?����b�?��;�S?�ɡs?Q@
��ܚ�@73�c1�@"���1B@-��N^8�@6�o��Bp@@�N�*K@G�3��~@P��F�$@V����M@^$b<*U@c��k%Q@i3O<y�S@o���*"@s�{r��B@xy�(]C@|���m��@�M^����@�t�3�/�@���]%v4@��: ��@�!_��H@�������@�1
w�@�~~�W@�OlvB��@�Ϻ�}��@�P���)<@�e�A>;8@����P��@��1�=<@���⬻�@���_T��@�W"���d@���)0�@��g�M2�@���0�E@��>pKw@�֒t���@�%��@�����8@������T@�4h�5@�~��я�@�@�&Y�@��A+<@ȉ���6@�m���@�nE�@΋�<@@@�cÁ|��@ё
lOr@���_>A@����X@�wʝ�3�@����'�X        ?z �	?G��` ?n�qK�?�^�e?�'T�?�Tz�xC?����;?�lnȣ�d?�W��'��@�BOi]@Ϫx�<h@OU��$@(w痹��@2ߖ��4@;��~)6@D<��@K뱿���@R�
+NX @Ya,$e�@`R�L��@d٪n��T@j9��/Fm@pC7��6l@s�맿��@x/Q��@|ܰ��°@���٧@�/�IcG@�p3�Y�@�L]��@�#���@��?p>��@�)��� @��c��W@�������@��s����@����|Y�@����Qg�@�|�"���@�vn�FF@��|���@���W0E@�).*d@��5�s�@��5}T`�@�	��݊�@�~�܆��@�[��%�@����zm@�L��G@�
ӓn�1@�ܙ����@���Gg�o@��L����@��ζoR�@��ߋ#�@�^��|@�=�4��A@�s����@Ʒ]S�
@����L�@�hI��i@��	��4�        ?��+ ���@/(�)�@P9p�nD�@d�}��l!@t�'ȟ��@�:mB�g@��#}�@��C!C��@����@�a�Qb�@��
�@�J�,ټ@�>DQ/�@�\����@�f��@�D��`(@��vք�@�rf��@�5�Y��*@�;��74�@ˊ��أ@�&�1���@ъU���@ӫ�x���@��Uue@�t�M5+@�����@��� $��@���[U�#@�4��:��@���!�@���cY1}@��vE~�@�a���@�����@�@<�>@�=CK���@�ͰО�p@�{��ʄ�@�IY��y�@�8p�@�I㛩��@�����kk@��@�-A ��\J%A���$�Au kNA�=c+S�A��G��]A9|�ұ�A	��zZ��AԾ*��A�奯A�W_�A�-�C+A�E��A5� [Z�Aig�
�OA��'�J�A�F��AQ婱��A�w��A1;�-�u