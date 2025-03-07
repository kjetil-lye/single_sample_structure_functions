CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T113732        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?��]�W�?�Xv]�?�X6w��?�\�f�?�S�5H?�P1c�g?����?W?�Wl&�/?����j@y�q>�t@��S��i@
jiU>�@���RJ@'�^Ӂ�@�c��@3�?��f@��dY��@*ӳ�:F@!�-�ه�@#�n��C@%��j6Jp@'�Є�_�@*_�˺$�@,�FU$h�@/�-�kޭ@1*^`��\@2����@:@4#�h,��@5���B��@7a]̔��@9Y��7U@:�'�V@<��V�@>�&����@@Yc�ݺ�@Ac��nkn@Bw$�r��@C�F�Q��@D�\Y��@E��;J�@G%���@Hj_Ey�@I��p��C@Kً9Zt@Lu>W��@M�I�P�R@O\ u�u^@Po�-f�@Q7X��{@RP�Z�d@R��K� ;@S�!�-�J@T��V�B@Up��w�@VY�.�C.@WH�a#�@X<�8L@Y6�ޣ�@Z6*���@[:��?��@\D����@]S���@^h�p�        ?A�K��?p��]��?��4�?��%A��/?��`)�J�?�7�;�P�?�b�Q;�?�xZ���?�̃ue?�N����?��7R;�?�c�lC/�@� �U�	@
��t��@G�lo�@�k{f@���$@!1��!Z�@%rZ�H�@)^1Z�xo@.IJ�`X�@1���x�@4���%R>@8T�z��@<w7���@@���@B74���R@D�Ћ� @G#<|�@I�I��^V@L�[�u�h@O�8)c��@Q���&�4@SG(�?@U}�K�@W�,���@YԲ��@[:�,�
�@]{�*��
@_�P�}��@a*eϓ�@bv[�R\@c�M�T:@e=�e}['@f�F}j��@hE�/O��@i�ܾ��@k����E@mR^Ϲy�@o%���|�@p��u�?/@q���ݭ�@r�h�J� @s����	�@t�- �	�@uܺQzw@ww�}��@xK���b.@y���L@z�a�m�@|K�ޗt�@}��S��@6��r��        ?:���V�?iOv?�2L?��M"?��c�r��?����@?�����?�1z���5?� JE��?����t9?�_����?��֡DV@I6���)@	28�-9@�oi�[�@C>�5��@������@"1ť��2@&����@+�pf0ϯ@0��n�xU@4iW:�^@8G�(g��@<��	-�@@��8k@Ca�D�Q�@FPGl�}�@I�A�_�@Mr;P�(@Pf�:
�@Rr���@T�f*�y@W�r/�f@Y��u�n@\DY����@_'c�r�@a��g��@b��7�?2@dw|L�)F@fJ��/l�@h7�)�l@j?��!@lc*��\@n�k�G@p#�M@q���:Sa@s&T��@ta����@u�$NfN�@wFI0n(K@xКo[�V@zkdaa��@|��5�@}ӊ�[�X@�v���V@��}��@��,RFS@�����@���I�5i@��
�i�@����8w@��L�*�@�O���1�@��$yA��        ?� h��9@�Y��Hh@#�*�M.@4&Y�@A�����@J�z�k�@R�"d�3�@X���Ǥ@`7�-p��@dt�E:�@i3�[�{@nw��xc�@r �ȇXS@uJ}X
F@x���\��@|o�76@�6�}=p@�Z�P��@��C���@��jse�@��I�>�6@�h@z��@�Na�u�@�.�lK�@��آ/@�|��L@�BŴx�@�L�LI@�%4��@����r@�= E�f�@�;�m|@�c�#@��h���%@�۵�G"9@�+]g�@����j�@��65��T@�jRR�@��e"�5@����jd�@�''�·@��4 ���@���E�'�@��@��O@��	Q���@��`0XǗ@��Q{lh@���@=�@��*���X@��$ΐ��@���Yq�S@��]�`��@�+��\�@�_����d@���*�X@��n7+�@�#y��<@����.@�k�K��B@���X@�����@ÉVk��        ?T���0�?��$���?��n�K?������?�����;�?�8�>?Ԣ4&�[?�q~�Ng?��D��ز?��¾��?���D�&?�P$c�,�?���-�?�$к�3%?��+q�]\@��7-�@����7/@tm˹
�@
����{@��)50@��ړ��@ؾ8T��@���^@7�E�n�@�H���B@-w+�-*@�lY�@ �QTK�@"eb�]@#�gg��@%�Ƙ�:�@'t�b�T@)Rnct�@+F���RW@-S���@/w����)@0��-�(�@2'$O��@3>BJ�b@4�5���@5�)��@73��^s@8���B�@:J��^�@;��*G��@=0X��:h@>Ͼ{�!?@@>�[D�@A�S�I@A��� ?�@B��^@C��U90@D�ˇ�)�@E�F���@F�^�Ծ @G�5Ǩ@H�]!	@J23:�<@K"���,@LGDA��>@Mr_�兮@N����b@O�^���         ?2��#��|?hg�jd^y?��f"��?����O?�i��s�?�%W.�q?�K��z9?�8L�&D�?��y��N?����4?�Of#̵@��sj~P@	pMU_z@G\��@M����@��ϓ�P@"�]�dB@&����@+�/;�/�@0őj)@@4��@7ۺ89@<��{l@@Z
]U:@B���`�@E� ~do�@H�L���:@L'O3�2�@O�\*S� @Q�`_?�Z@S�b�z�Q@V2Wv��@X�_<{@[-���G�@]� ϛ&�@`i	"wm�@a�B�f@c�H�O�@eL�L/m9@g��o@iq�}9a@k���@m!��e@oV����)@p��f2j�@rÅ��
@sJ]��W@t��z�O�@u�j��"�@wfP"�o�@x���e�@zk���@|>5�I@}�|�w"�@eGJdt@��[&��@���[��@�u��w��@�q��#	@�u¿g�^@��S���@��i�z�@����*p        ?A�!����?q�F�__?��y�?���H�4?�j-��?���g�V?҉3��n?ިga�?�*�O�?�*�"xZ?�g�[���@�����@	x�Hgn@�uoZ�@K$d��@�X9�6b@"�(D�0@&�/�A��@+�@0����@4�ǯ�}@7��H��@<)/6��@@rI�PU�@C)�IG&@E�bJ�%@I7��@L�i��U@P+����@R5�S���@Til:jF@VȨ�n@YT�Lж�@\d��I�@^��*���@a
��@:�@b��@��@ds�h)�@fO��+�0@hGQ�$�@j[H@��@l��V��@n�z�R[�@p��L���@q��~~>@s<����q@t�e�[�@v-�Ș4@w�U�/	D@y1f��@z׺���M@|�lWZ��@~Xf���@�n��
@�� e�@�~i7�z@�~l��@�'��^�@�A�!�N�@�eD���@��[���@��f��@���3�        ?�~c/��?��Ie�sP@
v��s��@�qr12�@*���_�I@5Mˮ@�@?��
p@Eh�w7T8@L>)���@R
�C%��@V}O��@[|�q`�@`��b�m@c�� �j�@g���}T@j�-x@In@n�M�@q�$ �Ic@t�|2 �@v�%|�@yo�W&6�@|tq@��1�Du@����\@�@�m�6�6S@�f���	w@���p۬@���u�n#@�y�c@���e�Zg@�����51@��Q���@�q�B?�@��yH�&�@���i�@�@����Y@�,��7�@�ז��-@��6�1�@��G���@���
5a@����R��@�σ�\�@�C_�~~@�va�H�Y@���N�?@���A&z@�M�)�@��T6��R@�]+[@���/f�M@������@�@��H�@�vS]%@��XPX�@��s�KO�@�{\����@�V���&@�5X����@�KE�JC@��%C��@����v�@��"F@��        ?_��w?�+��r��?�{ᅍ�X?��;e�1�?�[�sqL&?��)���?�>�x�A>?�:�<J�J?�F2�u�3?�L�QM3�?�B�ۇ?�=�N%G9?�^�6iJm@�{~xL�@�9�W�@,0�;py@�K�]M@H��v�@J�̋<h@�g�$@O��f#@��Ɏ[@�n:@ �t�M@!�7Ac@#��kж@%o�*�^@'g����@)x��<�@+�G�0qp@-��#��@0%>��k�@1c4��.�@2�2�_B@4	0����@5q���1�@6�ͮ�v�@8n�e�r@:�o��@;���[�@=[�����@?�sv@@x�P���@Aj��Α!@Bd��G@Ce����@Do�Wn�@E��^/5@F���+~@G�V���h@H�˶�k�@JP+E��@KU�� uU@L�R��{@M⺬'N@O5�{0@PG�B���@P����F@Q���]�@Rf��;�@S#�Sp��@S�^���p@T�V��        ?>��/��?qޙ��J?�2e
,�?���]�\?�L;�n?�q�Y�:A?�o o�xL?��Ȃ���?�sae���?�\�� �?��Oa?�}�gEN�@af-���@jF?�@�gz�%�@���
@��^��@"���5@&� �u��@+�ө���@0�0w�K@3��lp��@7P���Z@;>ޓhV�@?�?��JF@B2]_�P�@D�Ă�@G��Q��@J���?�I@N.����D@P麝H@R߂�q��@T��n�q�@W:d���@Y��\�V@\1�#{��@^��x�S�@`�L���@bo�ԗ@d L���@e�(�:IK@g���J%@isV��@kpL�q@m����@o��<<	V@p���ږ@r1�8���@sqS�u�@t����1@vD�7@w�NT�Q@x�n�|�@z��ôӇ@|����x@}�*��cJ@t�e@��WvnxL@���CӅ@�x���*�@�s}'1�$@�vN]-�@����.�        ?Qɍ�\�?����mG�?�m��KB1?����Z?�Gi��W?�:�բj:?���o+?���OR9?�$�Wl�?��quT@���Z@	�)�1��@�t=^@cU��@�6_��s@"3�����@&��3��@+�jx�	@0�����@4sā�C@8\l��o@<��䍺�@@���w@C��\�W@F��:h`@I�:�<�@MO:�=+�@P�π��^@R����=@T�x��@WFљ�r�@Y�
�v&�@\�͛#�@_r�C�Ŋ@aAη�ja@b��iH)Y@d�'�kt3@fd�#\�@hJ=�< @jGݜ��@l^ �"�@n���1�y@pj�{>�@q�:����@r��c�r@t#<�)@uz×�3@v�v���@xQu9���@y��P�~O@{]Μ�~�@|�id�'�@~�����@�+�ز��@��+�
i@���WS@�炅�N�@��4��M@��2��>�@��nͦ�@��[��m@��"��@�$�:�A�        ?�����R:?��.8�}@��FI��@'J��w/�@5V��"s@A0�<F)@Ip'�!��@Q�yDC��@W���	P@^�f�&@c;z]�;@g���]�{@l���Z|@q*��+�z@tB��p�@w�����@{\�=���@d�;5�@���h�ge@�9��Տ@�����sN@�q�tX@�Rf�c�}@�a�C߁�@�PP�s�%@���Z!Y@���_�=�@��� �@���6d�V@��/3R��@�
� Y��@�W*#�7>@��əYT@�=o��@�m%"E�@�ȶ�+@�@�2#O���@���]@��@�/B��z�@��E{ԒP@�e�j�s@��FH�-@�֝�A�@�ҐDS�@��5yv�i@��@jg�@�����U7@��|d|�(@�Ţ�O73@��ǔ0o@���sֿR@��j6�@�?$����@�o���ì@��XO�B@��M3ϟ@�,�c5w@�=R�N@��x�g�@���1���@�Gij�0�@����؝@ö'3)p�        ?Y����OO?�o�,k�?�O3�X?�qʨ}�"?�UN ��q?�5��k?���(���?�lӠ@��?��m����?���GN�?�n���F?�Y�Y���?��?U/�?��k#*@��s	� @Ӛ�"�@�!�Y�@h��X�S@�ٰ�@������@��/��@�A����@b�`g��@�?3۱@�m�ů�@ O�>R�@!�F�^5B@#wc�c�@%,���y�@&���0�@(��LW%@*��M��d@,�W�ǯh@/HO��@0��Ez@1���-��@3�H�,�@4d��@��@5�@�QY�@7����^@8��pO@@@:
+P���@;� ���@=-����@>��;�+�@@D/���@A%wd��@Bߥ�&@B�v��ٌ@C�G�f�@D�Z�%C@E��1:@G^e?�5@HV�k��@I3��]�@JV5����@K�z�ox@L�4aI�t@M���@O)${��@P7�;ٯ@@P���G�c@Q��N�q<        ?I�� X�c?{FWvt�?�8�o�X�?�����?��V�*�?��o��?֟=A(U?��lYxp?�>�[�'R?����,�%?�s�P��@��/��@
�|}|@�t
�X!@ ���c�@�J@"�՛@'M���L�@,��C���@1o..�@4�|����@9	�r�@=���"�@A]��9�@D:O� �@Gg ���@J���c@N�|}���@Q}��%C�@S���5 �@VJ�_�N@X���W=@[�HY>�@_�U�$�@a9ti���@c�����@d��\ڽ@gcW��@i8�~��H@k�&��p@n!��qc@pP�6-d,@q� �6�\@s&[��@t�bj�I@vJ�
��@w��b�6@y����U�@{�A;���@}��,�5�@��<�ν@�����@����n��@�`U�˳@�E�7s��@���^ P�@���-@��:��Z@�}|2�aA@��j1�D@�a��\��@��̙��@�x7���k        ?'�ƒ�?Y�aT1�T?zz3�3?��G��?���n�q�?�+V�|-\?�o�j���?у:�C��?�Pn���?��7w�,�?�%萣�g?�Ei��_@ 
/�a �@�4.�@��?�IY@�2v��@�.)T�@��7�@"qU~�v�@&���;@+6�ci�@0D�,�@3CN���@6�c�4l@:Yg����@>z0X�@A���x�@C���]��@F�cE���@I�5>�Q@L�J��ӛ@P%�o���@Q���qzb@S�t���@V[b�O@X`�4��@Zʩ�*+�@]["�A@`	�J�ݿ@ay�8E@b�¤w�@d���#�N@fI����@h����j@i�L�̩@k��/�s�@mﱢ�C�@p
tE��7@q)�8�@rUZ2�a�@s�*��I�@t�=�E[Y@v'���v@w�1�ˀ�@x���N@zv:����@|dnK;B@}�M���M@G3#Q��@��''�b�@�dl�r�@�P��kr�@�D�I�G        ?���Km�?����Z`@�̻� @�9�>@):��]e@4%~�@=�O'!1O@Do�h5@K���@Q[��D��@U��v)6@Z�M1I2�@`F7��@c'<��@facT^ �@j	!B«@n��= @q.�>�e:@s��[��u@v�|��b@x��xz�5@{���0o@~ޑL���@����e�@�〣9��@�����g�@�ɥ��E�@��O�b5y@�'�?x
K@��G��Sj@�j�")@�Pg�Ɩ@���)��@��f�9@����qe\@�2kz���@��9j
�@��74"�@�N��
��@�%Loo�@���i�@��c{p@�	�׏�@��d�/@�14���@�R�9N��@�}B�[�I@��A�t�l@���@�5u�-0	@������@��r5g�\@�B�#jy^@��:��Q@�����U@�RR��{(@��	���@�߱<�F@��P���U@����|@�V[�D}�@�1�I�ݓ@���DE        ?e�G�ѵ�?�,U����?��$T�X?�G��?�@J�?ױ�hG�?�!�Z(��?�k�9tȅ?� ��g�?��'u?�-��l1�?�\���	@�n���@�"Z&@
^��@��x�|l@��<@�K�A�@B槖ʋ@��W�H�@Hc��8[@��2�A@�.���@!d�-
�@"����@$V�eN@&!^��6@(Xd;�@)�O/�!@,�U$�@.*$X-�@020a�T�@1Z���*V@2��;"��@3�{1�E@5�(��@6q+��X@7�1��@9CG~��@:�o��� @<E�����@=�@3rD�@?y>��Z@@����0@Anߜ�.@BQj?M��@C:G�f�@D)��+@E>�T�5@F}��@GPb'id@H'�jR�@I7�6C��@JN��Q��@KlU����@L������@M�3tۤ@N�"`��@PH�S^�@P���O?@QYM�MK�@Ry�TbO@R�p>�'�        ?RYh�	�?���G��?�����zf?����/&?�L܂:�'?ӎ��?߿�Eփ�?�lD1^�j?�	�S�`?������@�@X�i��@.�5�@<=�@2�]8@!v�YrM@%R�_�i�@*@�<�
@/��2��J@3@��R�@6�L�:�@;2��f�@?��;^rt@B��hT^�@E���2��@H�s��@LX3���@PaV�@R>��`��@T����<@Wy�b@Y�����@\�����@_���G��@a�����@cVI�@e=]\9�$@gC���3)@ikA˺@k��+�EP@n��7�@pV���@q��E���@seH�@t�N�H��@v0� ��@w��q�w@y�U��c�@{f��eW@}M旷cN@J�_��@���f&��@���ʆ��@��,���`@�4�kbQ@�Hm֭)@�������@���j�]@�8�h�\@������@��S�@��D�L��@�*(?�        ?:6��z"?p�s}�?�n�g�?��Q7I&�?��oHb�?Ƌ���f�?ӓw�R�?���^���?���K�K?�H%�@?�8���@A��Q@Ȗ����@s&�pi@h���@`0���/@!:���%[@%`�p"y�@*0�Q��}@/��"��@2�W���@6�hy2�I@:~�dE�	@>��~T�@A��%�@D�����@Gz*��x�@J�)]��9@N*�KQp@P���J@R� ���o@U��3�w@WX�"/�@Y����Z`@\`�T�8�@_ (�t��@a1���@b�}�2�v@d)���V)@e��3��@g�4͒S@i�O�
@kr@3.�U@mz9�B�@o����GI@p��s4�:@r
�|;�@s::[G|@tt�Irc[@u�i|,�@w
ٺ*ͮ@xf",�B�@y�5�W��@{=�e@|����j@~>��7� @�b��q@��TQyg@��9x���@�`]w撡@�=�?� �@� V-q_�@�&iB��        ?Ϫ�5�@ ?mB>�@���]�@-Wg�"�@:A; �A@D���/r@N�1�N$@T�����>@Z���O=�@a'��~[,@eG��û@i�A��N�@n���Z�@rC�?�p@uM(���@x�Hi;�V@|,U@Hi�@��&m%@�%�*�@�H��0@���y*�@�$��K�@��P\5)@������@���I8I@�V#����@���e���@���u�)@�u4?l�@�P����@�?L�f�@�@�+�w@�U{PF@����@���ݞ�@�J��7@�0U��X@�h�-��@��Z ��@���Q��@�Hzl���@�����ż@�
nd3�C@�x��9p@��SeH�`@�8rN,%G@��T�r�@���.��@��!KJ��@�h+�ܜp@�@�N)@��P�@�����@��c�Ԃ@����c�6@�Ê��N@��� ���@��T��@����.�@��l���W@��@a	�@���u�O,@� ��D��        ?\_б�?�5��4��?����?�
�^��\?�����(?�Wo�SH�?��>�F�y?ߖc�%��?��9qM1�?꾯��� ?���?�i#m{��?���y2�?�PA��@�X�R�@��&�$�@�����@	м�G��@22Ԋ@g��zv@Tv���@`c���@�1ꇊ\@����p�@G!�!�a@�.����@ Fo~ ��@!�� i�@#2f�&9v@$��F��W@&k)�}�E@(%�����@)��QW>@+ؓ'�@-�0E��w@/�Ǻ@�@1�*U��@2"CE
@3L<�1!@4�����i@5ù��m@7�H�:�@8k����@9ґ��0�@;F)&]�@<��jڃ�@>TӔ�Hl@?�m  �@@��!S@A��.��7@B��c�˴@Cvp*GW@Dg����@Ea R�Қ@Fa����@Gj}#� �@Hz�o�l@I��7�@J�jbT?@K��ꭳ@M	�@b��@NA����@O�����        ?.�7�:��?b��%��?��<#�1k?��k{?�;'��go?��t�W�?��Z��1?��c�U��?�^����?�w�� ?�lXQ�P?��ҫ=�@yHoS�@	�)-�D�@ʞ�a,@X+Rq@'��g�@!�L,��r@%��L��@*Ք�
Y@0?
d\�@3y��/n@7!����@;>�h�(T@?�S�*E'@Bz��7� @EN	����@Hj;W�,�@K�~��#�@O�-w*
P@Q�G����@S�oG Z@VW�L]x@X��.6�@[�<x�4@^��e!�@`һ��\y@b{�b��@d?B�А@f�}�l�@h�}���@j0O�*>@ld�w/O�@n��ϛ��@p��%|8�@q��NQn=@s5^��8�@t�,�!��@v����@w�Vz��e@y>m�Xq@z�Z����@|�Ǻ�)@~@���'@�2�1�E/@�/{�ڡ@�5��N�@�FA;�Up@�aA�'��@����**�@��<��b_@��s+Vc@�9lܭib        ?Kߎ�ڳY?zc�f\Ż?����Ѐ�?��[��j�?�i��6?�8V��?�S�@�?�a�GU?�ޏస�?�q��b�?��ρ�@����a�@vdN���@���ۚ�@����Wl@���>@)��b@#;3�:@'y��z5@@,^��U	:@0�M��i�@4+"��@7�S$�@;�o��@@'xO,@B���<�>@El�A�Yd@Hy]�@+i@K�uҕ[�@Ox�e+�@Q���}]$@S�0���k@V7�Z�x@X�����@[q�pׅ9@^Y���&_@`����@bc���9'@d(N\
�@f	��o�H@h!hi��@j%�~�}@la���
@n� m`̥@p��b�P@q���i@sL��)�T@t��N�f@vC�!Ke@w�֍��@y�����@{@��E�	@}��.f@~�i���&@�x�˫��@����&,�@���a��@���`q��@�٣Cl>@���s�@�NZ%�8@�����LL@����ޤ        ?���{ �3?�l�pI�@�\�@ . H�@-k���+y@7�J�z��@A_)��p!@H*:�_k@P	7.�@T�пZn�@Z"e���}@`y3��@c=o��&@gG�h��@ku��=�@p�ws�@r�ǟ���@uCV�
��@x7ߴNM�@{h�ۓ�@~�^�_�2@�@�n�V]@�7#�C�@�N���n�@��+ˉ�@��s)=�@�e5��@�
T�c9@��ޓ��@�c��.�@��_��p�@�����^�@�G�M�n�@�<�f�Z@���꡵�@��߻��@����F@��z�Yp�@������@���"�	@�ѭ�H@�[���
�@����re@�&%oD_@�}~�g%@���$�+~@��{F9�@��O(sG@��MSۙa@���E!@����.M@��=��a@�}f�]�@�wZ<��;@�y*��/Z@���7�vP@�����$�@���riY@�І���p@���6fl�@�-qEu�@�h����@��Tlx~�        ?V)"g�i?�W�srx�?�6v�s�?�F:M?�?�
���:�?̒�V�?�֗64�[?ܲ� �A)?��Yt�?�6ͫ)�^?�,2�X�?�j��ċ@?�%��Z?�)�Ix�?��x�kq@����Cs@PP(�En@cڋ�	@
#r?�B@]��x�A@g�CYpN@<հ�,{@.�0��@>P~�#�@k�#Kħ@��YY� @"��bN�@�.Aķc@!,��5�@"�6�N]@$	;���@%��?�@'+y�1�@(�bb_��@*����D@,fx�h��@.JW���@0 �S�w@1&Gf���@25�a\T@3O�*��@4s��� :@5��˸�@6�[�{,�@8 �	^cd@9p��6��@:�v��|@<1�A���@=�~�cw@? ��V<�@@U!˹@A�� /@A�j	��@B�G�%��@C�k�U�@D����@Eq��@Fb�(�D@GY����@HW�'�q@I\�4P�@JhL8�ͱ@Kz㯓�8        ?A��ݿ:�?uv.Tb?�'���?����B�?�;.o��S?���)G9?�=FF�c?���|��L?�lB�i?�O���?�m:.��(@(ʏ��@Z*��E@�M!�v@��:\�@O��U]@ F��P��@$�%�mf@(X�r,�S@-B�q �2@1g�8I��@4������@7��X�b@;�ռ��@?�m;��@BG�D�^'@DŗC�w@Gx!�?�@J`���<e@M���w#@Pl�k���@R5�-5�@T��;�%@V D>ۄ~@XB�/�:@Z�R�	
�@\� �굛@_e[(��c@a���-@bcb޷��@c�X6Z�O@eV �z[@f藕���@h�[!���@jA��t�F@lb��@m�%{Zy�@o����~@p�֦.�@q츸@n`@r�7�C�@tW�fM�@u>>�AE@vmy�V�@w�
��)@x�FY��!@z6�C�V�@{�V�Lu@|�쮋@~`�]5��@�TM��M@������@�x�/�        ?=�c�H?me�ְ�(?��	5*I?�.�"a��?��Qd�?Ƙx��ag?�^�g=��?��y��?�0Y0�6'?��B���?�'�x,-�@SQ�	y@S<	F�@���=.�@�g1��@ �Y��@%�0���@*Q0��0@03�X�P@3�iX�I=@7���s�@<6cGvȓ@@�\E�|>@Cx��yx@F����g@Jn�$6@M���B �@P��1�^@S6��4@U�;�Q�#@X=h�k4�@[	�V��@^+u��@`���[V@bPh�~��@d��n�@fxZ�>
@htX���@j1I�ή@lq�Y���@n�S�]�H@p��Z�.�@q����|�@sT���^@t�[��?@vD_�p%d@w��=ڀu@yy��Z@{.{�@|�+ �@~�����@�]�����@�]�G�(@�g �'5�@�z���}\@��n+��@��x2Le@����[@�05��m@�xAdY@�@��O]>n�@�)�2��y@����/g        ?�D%��?�(��&�@
�
�V�@i[�?@*���@5��c�2@?�a!�@F'r��Hk@M�����@S�a[�H@W�C�qwk@]^��4U-@a���@ճ@e!�W�@h�)�@l���@��@p�|e�@s��.��@u�г��h@xu/�̌7@{r&L��@~��(�l�@�v��@���W6��@��=��3@���A�S@��T*'_�@�9��t@��&��4R@��xWXk@�e��ۈ@��@N�A@�?�q�Z�@��5̱�@�`sfXK@�=�vJ|@����u�@���H���@���D"��@�>C���;@�E��'�p@�WH��e�@�sÓ��+@��+��$_@�͸'���@��Q��@�U��h�@��Lh�7@�x�X@�x�у@��4��@�xʬ�9@���.~@�V��7@�,۰��D@�
q��L�@���ۻt@��z���@��&���@���*�@��[��8@������@��m�ݫ        ?`�����?�Nz��D?�O����?�����e�?Фa4`uI?�NF,rϕ?�51�i ?�����?�
G�?����x0@ V:��a@_���b5@��Ҥ��@"Cb(%@� ��>@@'`��@�; �m&@��A{@ Zl�YxN@"���}��@%��V��@'�D�kB@*rB!>�k@-h��[�F@0F���]�@1�
 JS@3�U�li�@5�Y�Pp@7qZ�+�@9r��J��@;���G�@=�,<��F@?�a�j@A%��|v@BY�[ש�@C�8���@D�Y�t�@F7����2@G�j�V\+@I�� ]g@J}K��` @L����@M�^�2O@O5�N��p@PrV��6@QQ&}�@R7����=@S%��U��@T��3�@Uگ2=�@V�rf�2@W-�iA�@XC�,�i@Yb$��0d@Z�o�t)�@[����O@\�y�E@^,G�k=�@_sZ��@`ac��jO@aYB{4@a����E@brSݺE        ?`jcޫ�N?�b��؁.?���r�?ªY3��?�8�Or�?�iO��?��+�O�?�Џ��T?�7��}�@h"}�@
i-ɛ7@z0�x�@�ė���@�Qc�\�@"����@'�a�^"O@-bP��ty@2 �=ڰz@5�ц�@:2����@?*!е��@Ba1Y�F@E�e���@H�����@L��M]W@P������@R�N��@UW\�|��@X@�!�2@Z���1@^̔c�V@`�]��@b��^^P@dm2�
��@fp�,3@h����@j�8�
%@m%�jJ@o���g@q���6�@ro�Ӫwy@s�2��@uKԓ��@v�GR�$�@x_�p�n@y�g��d	@{�6�Ο'@}i Wz�@3 ���@���fSi�@�x�q.�T@�rϡ��3@�t���@�|X%	,@���AO%@�����@��p��l�@���#%c@�`�:X�@�FGW@��2���@��ERP�'@�n	��        ?T���G&?�q ��?����d��?����,�?�ekZ�^?��3���?��L�r�?�bg�/b�?��d��L�@$SĨ�@��3�\@s�ٸ��@��:�`E@!�՞��j@'@��Z9G@-�;ē�@2����U�@7i~���!@<�_)���@AZ�f~�@D��X�@H��^`@L�n���@P�^�Pr@S8ۉ�L
@U����E@X��Ѱ@\^<c�\@_�Qv�L�@a�i'�X�@c�� (@e��0p;�@g�8��@i����@lJ3gN�a@n�Hx��@p�#�c@r��S@sh@w��l@t۸Ε��@v]4S5R@w��Y��@y���ȳ@{7�b@|��d�@~���N��@�Jx���@�=���@�9s]Rw�@�<��\;@�G�f�J�@�Z�R�,<@�uБU�@��;�0�@�Ĳ�	(v@��ɚII#@�5}�N��@�z!�@��=:�[�@� ���#-@�@i�o�0@��$����@��y���        ?�Ma���@+��2�(@%��)ϸ@8�׶	@F��)X�S@R�#��@[����O�@ciS���@j�5��@p����Bk@uL,��@zY+�yol@�풮�@�2b�@�����W@���T�J@���!�&@��\hߓ�@�.�Yq�@�ڤ�wb�@��P(-uH@�Ń�]`�@��)n C@�����_�@���h<��@�|�OP��@������#@���;�|&@��AH��X@�3٘���@�Q"腼 @��G�>�@��pe�@�D�%b�U@���?�t@�*GfL��@��C���@�H�ZB@���}�nV@��D@�iT#'��@��i��@���Oغ@)
pb�@Ò��IS�@ĠM'�j@Ŷ�~��@�֮�=��@� M�/C@�3�U]@�p�͐!�@˷Л��@��
�o�@�c�m�@�Ȫ�(��@Л�,RA�@�XS��g�@������@�����@�@Ӭ]��@�}h�_ß@�S��Y��@�/wڀ�        ?j`ct9J?�v��He?�Tl7L?��Bu@w?�̹�f�;?�
��?߇T{�1?�S��(��?�n��?񃦇M�>?��� UA?��7f ?��n>}@>�2�@.��xS@[~��8z@��Ns@�@g߬� �@������@�Jf��b@ܕ"��@%�n�J�@�ְ�@3#�f�@���Ԥ@!<Rr��@"�##E��@$-��#�@%��jX��@'^1<��@)�yz:�@*�J��(@,�`��2:@.���-�@@0:�&�V@1;�l&}@2Ex��@3W���?@4sa܁@@5�W�@6��J�@7��~���@98��8��@:�l:h@;�S����@=+M!f�c@>�_ W@?�����@@�FI11@Awn�A�,@B;��@Co��ƙ@C���(/@D���2��@E{ҳ�@FW�u`�@G8�>��@HE�Q�@I��+@I����!�@J�-��t@K�5��w@L����        ?,u��Hu=?`߹�NN?��d�[*b?����~�?��J�2[)?��O?���?�`�r?�6;rk7�?�n�"�?�K�8g?��,��Է?�Uq$��W@+m�J��@O<��@�1WzG@՘Ө@�0���;@" ��S��@&"�M�k@*�9���{@0&�\�7�@35�k���@6�����W@:w`�T@>����6@A��&C�q@D:��J��@Gj�?�@JjUf1�@MH���ǯ@PeE-`j�@RF����L@TJ��@VoU��X�@X�qm�Dn@[##�[�@]����JU@`3��V{@a�C�g+y@c��.�@d���q;@fXoi	�@hډ�v�@i��Z�l@k��3�@m��+�@o�=���@p�Ϩ�}@r�Ay@s*0S�{�@tW�j��M@u�$F@v���]� @x .�+;_@yx"	�M,@z�Ǖ@�@|H-2\�@}�`��^>@Cp	��@�h����@�5.0���@�+����@�޶F�ϳ        ?*�����?_���[�v?�t?�N?�5Z�B!�?���Y���?�w'�˲]?���u�?���~�U?����3�P?���D�?�[T�PW@3jͯh�@	W��!�@.�S�o�@�_��i�@��AF��@"�-3��@'�r�ԕ(@-CC�!@1�u�~��@5��h@9�4�Kt)@>|>j�X@A�_�\�@D�s��]@Hvb���@K�q9�x@OjI�{�b@Q��!�%n@T��Jp6@V��u��@Y%�|��@[��A�:�@^�
���@aƧ5�/@b��.l�@d�hg���@f~V{�\�@h�^
�WA@j� ۱��@lھ6RFc@o2�~۷@p�<���@r6u�vF@st2I�p�@t�l_צ>@vR \�~X@w؉�� @yn���@{n"BG)@|�b`,X+@~���OIG@�6B�3��@�+�Iǃ@�(��8�[@�/���@�>b���@�V֮TH@�x�+�O�@����ɗ@��+�֔ @�b����@�^_��        ?͓!ND��?��M��pn@jX�@#���G�h@1Eln�$@:��Ḽ@C0�<���@J�i)&�@Q*,$�@U�Q��r@Z�:u[�@`T����~@c�cF���@g��F8@j�o�XU@o'I
(@q�n�_��@tQ]E��@v�XLܧ�@y�o�2��@|Ѵ���&@���@��:�@����@�u�Ox��@�{6��=C@��DT=.@�س��'�@�1K9��@�S�.�>@���N!�@��d�M|@�Y�*<��@���ȼ�F@�Spۙ��@��
"_A@���J��@�@T��z�@�����|@��^F(��@��N]{�,@��Y	3�@��b�W\�@��v����@��"���@�-�t�Z@�X1����@������@��b�>Rb@�W����@�]�:<%@��>�[:`@�B�ŭ@�A�P��@��9D^<@��Ht;�z@�~��!7%@�GK˦�@�/Z���@��'��'@������d@��ig��s@�uܭ��        ?@p+�1!�?p���a��?��G%X�_?��I�X?�ʳ�� �?�O���?�� ���?�Q�z��?�9t_�$X?�3�M��5?�� �?��*&�l?�ڨ���?���D��?���\�{?��vOW}?�j�A��?�P�-f��@ L�Y��@���'@0�����@�$�_"@
�[&e@+�6k�@�Ȕh=�@�<�@��@��rA�@�� ��@�l���@_v���@⎯B'�@ D����@!� �Z�@#" E�,@$����$d@&JX�b܊@'�mx��@)�6�2�@+��5d/'@-�	f�~e@/������@0��h4@1�:9�@3È�+�@4/���@5d��ye@6��kų�@7�sX9>r@9D�Hd�^@:�{�_ѻ@<���hX@=����S�@?�@�@@F�C��@Ar��E�@A�L[Q��@B�����c@C�=�`34@Dqi�Ev�@EWt�@FB]#��|@G37gQ�@H)���ڌ        ?*�,E�	3?_%Gܮ��?���(��?��/>�?�6�`i?��%��9�?�����?������?�Te�'?�?�� �'�G?�!͚�N?����R�@�`EC�@��?L�p@�ɡ8�@����@ Q�����@$}=�5@)]h,��@/3̋�B@2��n�9�@6gR�ٴ@:����s@?,@��<�@B)�M���@E&*�}M@H%ַ���@K����@OSF?�3@Q�|���@S�+Q�@VD	�7^@X�h.���@[�j��4@^vM���@`��M�4@bp#�E(%@d0�5_u�@fdC��@h �b���@j��o@l;�����@n�ms�&@pr:�t�@q���<�@r�\a�[@t[4Y�n@u�~�IR@w>[�^�Y@x��PR�@z\NyP�@|��O�7@}�S���@y��'T@��M7@���G �@���.>��@��n5=�a@��D��@���S�@���!(�@��6z�@�R*}        ?4t��%k?f礶vU�?���y{'?����AM�?��
'6�?�CZ��C?�C���?�%��v?�>�xU?� �}
!�?�@V�%^@ b֪9�@{��7̽@&� �@@�-�=�N@�8Xl;@ 5~i;�M@$C��T@(�^�T@.u���n�@2ZIi��M@5�))>8@9�#�2z@>NDd@A�ބ�߅@DR�5"��@GK@��g@J��Y��T@N�$�@P���s_@R����@U+�8f
@W�l��a�@Z�[��@\�?^u_@_���	��@aDݥ��R@b�3��@d��zG@fK_U��@h%�~E�@j%ኛ�@l"5�B@nD��N��@p?½�\�@qi�x���@r�t��@s�Xh�&@u4���@v������@w��P�5@yw1u��-@z���+@|��O��@~60�~(d@��J�x@���g�ζ@��;ދC$@���� 4@��s�7�N@��5�2f@��NA���@����S$^        ?�T���?��H�?�����`@�*��@�U�]�@#���AL�@.fz�f�@5�Ϙ��k@=k?�^C@CEG�0�@H�m`��I@N�!"��6@R�H���@V��_��@Z�O�v�J@_��_O�@bq�="�@eZ�@r<@h�g��Z�@l)�'�@oЛ����@q�k3��@t.����@v�1���f@y$��W�@{�O���@~ԊO؛�@���z��K@��2@Z2G@�gDH]�@�D\t� @�;�R:W�@�N+�s~�@�{����@�ć�Wr�@�����@��4E�V�@�$�S�2@��yR�@��13+�@�h��dP!@���˻*@��_��7b@�5W�Q'2@���!���@��>��Č@��6�4�@��I�@��e���@���Y��s@���(�@�܁ʇ�m@��U���@��GR��@�Le��@��<>@����xT�@�m�d�@�X�aY@����Fާ@���ۖc8@�?�g8[@���5%p(        ?c%H�?����}J�?�_P_P�?��y�mX?�z�a�?���G�v�?���<���?�����?��ǵ��?�a��?􉬱P�?�������?��bI'�@����ф@[�)1u@n�1iղ@
�(��@DM��p�@2r50@��*�Q@$����P@d��e�@Ű�tM@G�m���@��C+�@ �>oR��@"LPG6i@#�"˵�@%j�a@'�=Q�@(�a�(�@*�Ҧ�$H@,�X���~@.�N��.�@0H���<�@1Z�p)%@2w=���@3�aw1b�@4�Y��oh@6@�֞4@7U.��@8�:��)@:z:�%�@;p��3_@<���i�@>eQ�9��@?�U��@@ď�T�@A�k�N&@BnR��@CLV�]P�@D0���K@E撲�@F�2�@GN��Mo@G�H'�@IX	�+C@Ja�\�@KDK�J@L.�͐��@MI#��Y#@Nh���H@O�aq?�`        ?O�C[�?}����Z�?���J	?�j8�?�c����?���~8�?�M9��/�?�8&-��$?�����_?��0)�@ 0�_@n28�=[@P�7ِ@�#�}4@�$��
@ �l=z�@$�����@)���@j`@/*� �Q@2Ĵ+{��@6\�ނ��@:bO�o@>�#rY�@A�9�e@D�PJf;@G�񣚊!@JǾ����@NC���@Q o�4�@S4G
�%@U2q��!@W���6�@Y���`��@\����O@__�7O9a@a(^�1�	@b���u-^@dX�j�N�@f�����@g���Q�>@i�U��y@k��u��V@m�pg�P�@p ·��b@q"P=�b@rO�E	E@s���8�@t��v�!@v"����@w�"T��@x�zd�TR@zg�\��@{�v�i��@}�s
ʇ@$!j�@�i����@�HJ�͕�@�.��߈@�益a@�ϕ�Z@�
��2(�@��T20@���S��        ?Y>��K?�;��"?��݃�?��I�#��?ŗ�[��?��-��c?ޔLG�?�K�5��?��֔�A?��[-�@ aƑqx�@莊��@���B�@xy4!�:@d��3�@5�<�;@!�zc���@%����	N@*i���@/�����@2��o�@5��"I�@9l,�=�@=`"�X�h@@܊�k2�@C=�qה@EՉq�D@H�;���@K�w@N�=G�=@Q@��^nu@S$F�cL@U)2y@WOϬN��@Y�0`&\�@\���	�@^��xH<�@`�l����@b3���@c�,�z@e)����@f�5�/d�@h�y��J@j`�ѽ;�@lG;ى��@nCx�:�@p*���@q?.�y1@r^�%^<�@s�Q���@t���J�_@v���s�@wT���@x���H�@z�?��@{�y���b@}�5t�@~�*ܺ�@����+@��y>� @��r�4�@��ԋ@���qu+        ?�xy�L��?�L
�#%�@i<`��@)�Cs7�@76W���Z@BXm�Q�@J��i��@R?�.�@WﱴT��@^d%�{�@bϐ{���@f���@k;�Iǐ�@p��[�[@r����>�@uI�X�@x��З��@{ڀ�p�P@`��d��@������7@��7�r�F@���-�@����5�@�R.�-c@��/�K�@�uS�[�@�|���@��@3B=@�*��]@��p�xzb@�OE�fl�@����n@��V�Sk@���U
�@�������@�Oo*p�@�YH���k@�lza��@�����|@��=~�T@���2��\@�o+��Q@�[�]�~P@��*_��@� {L{R@�b^N��2@����b,z@�FX�R"@�dt��M�@�+h�4�@�� Mo��@�ʭۨ*�@��B!v@@��|-޳@�eĞ|�6@�O�E*�@�?���Z�@�5�i��C@�1Y8��@�2��%n�@�9�=�@�F8�p�*@�X�z�]        ?Q�i�bt�?�H��?���.Aى?�����5t?�ξ���?��@�[��?˻�@?�DMn��?ٴ��q�0?��=�+?�� �f\?��M�ߛ�?�e���E�?��<	P�G?�/��a?��W}��?��"��@@��m��@�u�A�@M-�77v@	!��|�@,^ɹ~v@o�����@vd���;@S0�*@N���	a@j]e���@�<��v@���@��0�@ ���<x@" �w��@#}j�J5K@%oq�@&��S�Mx@(tQRgL@*H=��r7@,3Y2��K@.6R��7@0(�5n@1C`�~��@2j�K9[�@3����2+@4�c��;@639�o�@7��C�0@@9 �
{�%@:~C�=";@<o�^�@=�����@?T����@@�F8��m@An�1e�@B]hdaq�@CT{Ǜ�@DT	���@E\0�ɳ�@Fm�+~i@G��N�>a@H����4�@I�U>���@K
V���n@LH���>�        ?+���?_^ž�F?������?��hx�E?�1搄-R?��ŀK?��iz��?����hh?�jq�{�9?����R��?�����]�?�Eu�x@�%�R@ �dn�@K�`@�b{�(�@8-[{?@#]���b�@'�GX@,����q@1Y�ϑ��@4�����@8J�q��J@<_�:y�@@rg�@�@B�W���A@E�F���@H����]
@K�3�}�f@O^/J�V�@Q����M@S�ς;�@U�dm0_@Xx�6m\@Z�ev��@]D�d@`W�9"�@a�ƤU=�@c �3�>�@d΂H �@f��C�@hrN+��T@ji֑�c�@l{T�R@n�m�c��@pwd���@q�1���@r���iK�@t7o���@u���ٗK@wv�.�@x}�EÀ�@z	����@{���e�z@}R!���@U�UO�@�nƎ�M@�^��Zb@�W�r@�X����@�c9���@�w��n�@��M��+�        ?H?��W�?xP<"u?� j�wS?���Īld?������?�i�5�r�?�_�V��f?�_�#� ?�/^�\?���xe�@�0&P@	��vS�@���YB@�3����@�N�>�6@$dQD@)��**@0A�l?K@4ѤL�V@8�}���}@=��MbS.@A�s�b@D�7!$;D@H��m�b@L�߆b�@P��ǝ�*@R�"�&��@U�x��;@X{;�;.�@[�x���@^��e�@a?�A���@c'�%�@e-Ƴ̪r@gR��VL@i� n�:R@k�z-�B@n}��h"�@p�A�P@q���?d}@sc�̦@t�����4@vx�0�@x@H�@y��N�ś@{�h�P��@}mYE]6�@U�$>&@������@������@��|�g�r@��0|�mt@���܆t�@�5�f�@�Q�M�@���Q\��@��S2I�z@��b��h@�u�S�@��;��@�=��=@�W�֤��@�b�ty        ?�O�7�| ?�P�a�@���@|�m= @#C�TS@.��^j@6��+ܷ~@?P��;�C@D����@K��
��@Q+�"�-@U�Dqx@Y�W���2@^���� c@b4Ӆ�i@eW���@h� ��f�@l��؅�@p[��?@r�Ai��@ui-��@w��a�p@z����}.@}�f{�j@�k�OP�P@�*���O@�#Î[@����@����@@�]����@���L�@�Aw��w@��$f'�&@�_$[Pa{@��xh�u@�m7���h@�K @���P�p�@��U�S@��dJN @����si�@�O��:o@�f��@��9ͱ0�@��p���$@��f��@�AJ״v�@��C��C@��gɯ2@�mɀs7�@��q��q8@�xe8�L@���wWA@�\��	@�5�W-z@��ȧh�@���8�3@��i��l@����S#K@���n�@�ܬ+]�@��%Eҥ�@��Z�p�        ?fk��ݓ?���U���?��GiS�&?�ZՅ�Ҁ?�󆮺k?�#5_�?�56(���?�sY�b�?�����d?�6 D�˵?�2��j�?�����y@�s(�K@k�åm�@	?佳�@s��u�@4�QyU@����U@3��q@@��0@3a��{@�*
M�@!�(��Q�@#fv�%ҩ@%c�Jٞ�@'}ϺR�@)���*��@,����@.���@0��h�z_@1��{9� @3O#W]@4��ԏ@e@6Uz��l@7�A�@,@9��-3b@;^�0��s@=/6t��@?m���X@@��8�7@A�9�S:�@B�n��@C�Ýy9@D�`.Z,B@E���;�@G)�%W�@Hh�m2u�@I�L*7@K�cvΰ@Lcnk͒�@M˴�ve@O>�$KY@P^�h�[@Q"A��@Q�}u$@R�yV�!@S���X�@Tk�");Q@UM��@V4�]	,j@W"{� ə@X�^F�@Y�$޻        ?A�xW�[,?q��Z�*?����k�?�¯O�>�?�9���٧?�n�>�?։�*�Pf?�<_;�?�\���T�?��#;@ ��߳@�{�.@��8�)l@���+@)���@!y��@&��Ƕ@+��6���@0���n��@4��׍�F@8��1]�@=_d�#?f@AH��eY�@D)c��;�@GS�~ג�@Jɗ���M@N�a1�=@QN��}t}@SL��@U��{��@XY���KC@[���@]��Hq@`l�	Ӄ4@b��@c�	��> @em�x��J@gD̚u��@i1��7n@k5��$�@mO�?�@o��JZ��@p�$.��@r��hX@sN�8I@t�B�0$@u��("@wF4I8ͱ@x��r���@z'Y���o@{�^J\�@}9�?�,@~�*�S@�?��}��@��jh�_@��� �@��U��^�@�����@�˝���@�ɃF��@��Ľ.�@�ۇ���@���mr�p        ?@��q��?q�؉�U
?�O�P�
.?�D�f��?�|_{�rE?ȏ|�|?իYL�e?��'4�~?�VX�� ?��j	?��ȸ���@�e�"�@�O��US@�Z�=�@�Ǿm�6@ ��,@?@%�OH�Q@*P\݄�@0-����@3�%�v�@7�@mY�@<��S@@z�S@C8�Ϡt�@F<��~��@I������@M�hU�*@P~�m�hN@R�F2{@Tρghe@W1'��@Y�9�O�G@\g�n�-m@_=a�S�@az�#ت@b���@dRi�ټ\@f
l=�"@g���Y�@i��-���@k�ڸ@m�\�r��@o�k���@p��)��@r�ɖ@@sB�d�@tv���5�@u�[��}@@v����[�@xM�YQ[@y�e��i�@{L�W@|kͭE�@}�Ր�9@~�a�a@��顳�Y@�S�ׄ��@�%�ɹĄ@��n�S%�@��M�ӱ"@���8��=@��U�`�u@���?>�        ?ɿ(�s?�S<�P"�@���#��@#�T4�!@2#'v�Ǭ@=*ڜ�e@E�x�ݞl@N.G���@T28�@Z&�����@`~�
���@d`����@h�2 ��`@m�����C@q�g^z�C@tz����@w��SE�6@{Op_��.@0ϥ�@�@��ɍ��@��+'��@�i��>�@��ǚ'@����E{@���>��Y@� ���@��C����@�w��X��@�Y}�sl�@�Ue�+*8@�k�U�)@��J�F~@��X��O�@���F�أ@��B�N@�>N�A�@���#��<@�B��@���R*`h@��`v�@����i�q@�l��Xƕ@�.��J+w@�7�]�@��"�`�@����<@��S�m	�@�����@@�I�L�@�=�CE�c@�h��1�@�� ��%@��T%�3@�&-J�|@�y��ガ@�ו�iV@�@8�z@1@�Y��-�|@�(�T�@��$�@¨���r�@�y3�^@)@�O�%��0        ?P�P��[�?���g��?�\�Sx�?����)��?�_iI��?ȋ�y���?�D��pMI?٬���-�?�L1,��(?�K�j��?��ȸE?�ٜ�\�L?�΁ԛ �?�8u!��_?����[@6d���@B,�@9�'�G@�%Ս�|@%�v�][@z��X��@����@�'�K7(@�O @U����@�ɟ�/@��	�O�@!*\���@"���Z��@$-;2�@%ʌ����@'z�H�I{@)>�9�@+(q��@-tR���@/ �ş5'@0�H���@1�j�X@2��5rE@3������@5�(�@6Xe�@7���΢�@8�%m�@@:V0L��@;���)>@=8�od�@>��!r@@%s�H�@@��j�G@A��μ|�@B��c�v�@C��q�Y@DgO��f@ETMfY�@FF���t@G@6ߛږ@H?�!.�`@IE��5j�@JQ����@Kd<�+�@L}���V@M�b#�	(        ?%i�$>L?Z�G��?}N��J�?�����U ?�h���?�{�qս4?��X��?�W���U�?�0�ߣ?�'Z����?��)m�?��t�R�@�=��ŧ@We�y�@��2��@���uk@~�]��@#���[j@'��O��@,�����@1AvY]j@4��+h�#@8A���&@<`/e�?�@@w*���@B�[�P@E��tT��@H��L�LG@K�l1�_@Ok�z;@Q�"j�e�@S�^ ��3@UÑ+�r�@X��(9@Z���Ɩ/@]RU��@_޻~���@adc�$�@b�45'�@d�I��	w@fB!���?@h<s�n�@i�&t�@k�F-��@m�B�b(�@pN+��@q2o_�}�@r`L�*�@s�+���>@t�U�-��@v9ڟq@w��g�P"@yh*��<@z���Kb@|v �U@}�[�ɍ@h�����@������@�yC�y@�gseԝ@�^NR�5@�]!���d@�d�C��G        ?4wQ�e?d˅�gAp?���g��#?�@��=?�ů:��i?����V��?��	GZu?י���:?��%� 1?��;���?�3���7?�����W@���v�=@�O�E@U��mթ@���}@�X+'D@"�6��@&�����@+�;�ĵ�@0�����@3Ͱ�q�k@7K���\�@;+[
���@?q&�@Bw�w'�@D�P��x�@Gg ��u@Ji���O�@M����)2@P�D���@RrW�,�@Tr��c?@V��3��\@Xٱg*��@[Bg�>��@]ϧ��$@`A#
���@a��{B�5@c-r�hph@d�CgQTG@fidg���@h&=���O@i�7��A�@k߼L��@m�5%���@o�8�)�@q�P}T�@r.���w�@s[�1��@t�I\���@u�G���@w*�QR%o@x��h��@y�IDh@{k��b��@|�� @~�.���p@��� ^&@��-�@�Ƃ���2@��~�
5�@���g҅m        ?�����)?�8c��@������@�\�b�[@!�v�S��@,NZ��~@4�ry,L@<�6e���@C ��4�@Hi[��@N��^$9%@R��r;s�@V������@[�Y��T@_��|S"6@b������@e�*��|�@h��K��@l*�:��`@o�vِ2�@q�Q��D�@tK��.@vjv�}�M@x�{tĝ@{�,���@~J+_��'@�����-@�-�g�%K@�ҠHM�@��簅rL@�_�F@�IH���@�JW�}@�c�����@��ί�B�@��ի.@�#�YK�@�cʁ=+g@����	��@��D� @�w��x0�@�������@�x8�'�@���?��@��Q�uZ�@�i�+(�!@��}�t��@��0����@�uFtg$@�pC��G�@�s�uj�@��j�J�@����|� @���Zr%/@��<A�>@�����'@�>�l���@�D٪G8@�Ⱦ���@�&�3��@�;A�c'�@��mI���@������        ?s����tr?����h�?��N԰��?�D)'u�?�9��?��Q�?��Aw��?��UQ���?�sبHb�?���B%b?�N�>?�@ ]���7n@uDv��O@ӕ<���@
y�_��	@h\���@PL�3�J@��+�8k@���{λ@��h��@8�*��/@���q@ �c��c@"�!0�@#�N��@%zE�J@'F����@)'?�dp@+.d�)�@-"�ů.J@/>�zY�w@0�)SY�@1�4?��f@3���xX@4<+�i�@5}A��@6���3�u@8 ��Z@9ь�LK@:�a�P�@<aƎ%�[@=�SX��@?om���"@@�iI4K�@AT��Df~@B+|�S��@C�GX�/@C��(p�b@Dх�P��@E��>[�B@F����7�@G�E2@@H��/*қ@I�����@J��r�J�@KƐ!���@L�Q8��@M������@O�eS%@P �;�ã@P�X�a��@QQ$~3�a@Q� <��        ?3y���?f�1����?��1�ݍ�?���?��5?���)��?�Cv�a�?̮�Sq?ױ�D�j�?�nxMm�?�b$�{�?�^?0�1?��hR|�v@�����T@
}���@j2���@y����@�8�@!�I�ӊb@&0�c�@*�-ɻ/@0+��vE@3JyNh�q@6ͷ����@:�3W;@?	��RU@A�*��>@D���в�@Gu�ϻ�@J�,�*x@M��O^@P�aV)\�@R�k5�TO@T�p�I�@W#X��y�@Y��Tǔ@\P��;0@^�:��@`Ҝ�m�$@bUC����@c��L&O�@e�?(�0@g]��M�@i6T"�B@k&]~MK@m-����e@oLnN^�@p����CI@q�dR��@s���E@t^})��@u�O[g5R@wE˓��@xo��kc@y��	��@{i3��+@|���p@~��O˷�@�$�ω�@�5<e�s@��6�\i�@������@��
LN�@��9$�7        ?Qn��㻧?���X��?�G��:x�?��VF�?Äcq���?��+�T�?�]��U̇?�D&:;��?�a��?�0�*@e@U�쒥@
�;n���@{���T@����K@�tm�D@#��O�8@(�g�<�P@.��ک�N@2�Y�+@6��k��@:�Π��@?�6~�m�@B������@E�áփf@I;��{�@L�7�T��@P��d�	�@R�<�T��@U 0���W@W��'�	�@Zt81p"@]e2@`C�[�3@a�z/�V@c����R[@e�|�3%@g�S���@i��o�ѡ@k��v)Y'@m��W�8&@p*q�~k@qe���@r����|�@tX�2�@uf�i@v�uM��@xSfߩr@y��o�@{v"�G��@}�uoc�@~Μ,��@�G�ﺸ�@�.��Bo@���R��@�S%@��5�@���7�@�in�)@�*,^ij�@�B�Q	�@�a��v�@��Kd�J�@���dY�        ?��Yx@���c�@j��xP:@.��k�s@:X�Oe|@D�yo9z(@M��Ӈ�>@Tg�Gy�@Z��nk�@a*B0@`0@ef�%��@j*G۾��@oyu���0@r���xmT@u�"�}@yp	�!�]@}H�F�N@����r�@��z���@�eȼS9_@�����C@����6��@������@�mb���@��~­�@�؍��r�@���O��@����f@��TC��F@���d�@���>@�=����@�zE��m>@���M���@�\@R@���?�Q@���c��@����@�@���ڝ@��O����@�t�(�@�:LfC@�����QO@�||�d��@�x�y��@�~$5JƤ@��$a�M@���_�@��(H_f�@��vv��+@�-p��@�[x�q�@����&��@���d^@�K��3�@�����JB@��j/L��@�L(g�ԛ@�N�
l�@����Z@ã/W�̕@�v�x%@�N� ��        ?k��)?�Ff��i�?�=L��?��"n��?�� ����?�V�7�M?��04�d�?��j�8j ?�2�d#�?�!�y��J?��lƴ�;?������@Qp���@x�Ox�X@��5�@�:`!��@��"!�@�Ӌ�@r�O�]@�e<���@�Q�!�@�Vs�Y,@�#�y�G@!r��֘.@#*��@$�q��9@&�z��Y�@(�EyrF@*��M���@-2�5���@/�S/�a�@0����ћ@29|�X}�@3�-�B@4�@0n�@6U v���@7ϛ�.G@9XA��8@@:�1;�o@<����r@>Hv���@@��c��@@�Ty��@Aި�b�J@B֥r�z@C�dk^�@D���H�@E�=��@G'�,A@H$��>,�@IL��s	�@J|��&@K����ɽ@L��U�{;@N>��0t@O�=�@Pu"��b@Q&ry�5�@Q��>��@R�̥�"@ST��}�@Ti�"��@T�Ѵ�k        ?E��W���?up"�H5?��㌩?�
msF=]?��`���?�f�T�Eu?��c�l��?��.ݐK?�:,Es?���0�[�?�d!y%�@�%�G��@g�tZ�S@�_w�W$@^��./�@ 3t$g:@$]��@):�h�@.��� ��@2�D��˝@6P[N&dF@:p,�rO@?1@3�@B�Q&@D�d5ԗi@H	���X@Kq����@O&�>,�@Q����@S�")S�@V�n3l�@X��0t@[CBJf�@^PƏX@`�p��Ds@b+��9�@cݵ�E-�@e�`D��l@g�)}���@i�bL_$@k�Yp48@m�[���@p�\�J�@q3V�'V<@ro��SBd@s�N� @um��@vt-��[p@w��vvz�@ye�i`#@z��a@|��|�@~5���3=@��?)u@��
 ;�@��ڞ+��@����܁�@��D.��@����~��@���'G@���[���@������v@�����W'        ?V�BBX�?���&4ʭ?���R>��?���ٴZw?����?�~W3l'?⟲��@#?����?���S�?�7��qd@@�ev�J{@����@��}��@@���?�@ ��}�}�@$�"�6=@)ީS+�@/�G�t@39���	�@7	���R�@;S�Gy�z@@^�[a[@B����n+@E�f�P�@H�	�m��@LH��ͧ�@P]"�!	@RTd�@T9KH��@V�\�b��@Y	�G0@[��no]�@^}�e�@`���g->@bNB����@c�J�|�`@e�9�x@g��KE(�@i}�m%>�@k���g}�@m�&:�k�@o�$�I;@q����@rS���#@s�`1��@t�H<kD@vP�L;@w�R�@yB��L@z�S26ԛ@|quJ�52@~ SԹO}@�&kG�}@�����@�ƺ�R��@�������@���D=RO@�Ǭ�x�@����LL�@�����@�d���5@�@ʅ�,@�u��+        ?��đW$�@S;Y�D}@"�"�r�@-���Ui=@:W~���@D�hU��@NX��2��@T�8�L�@[��uP&O@a�?����@fB��@kT�N<7@p��^9�@s��
W@w1�����@{w=U#"@L`�t@���DB>�@�w��좝@�/�J@�T�3�e@�A���H@�Pc@��x�@����<�@��ﵘ>@�?Y�(@��D܀kG@���3c@������V@�#�E��@��� ��@�۲���@���y]&�@�TPpO,�@�y��K#@��ug��@�ͦ�$p�@��n���@�o�v=�@����'�@��<���@��I��@��#�A@�L�]�b�@��y�Z/!@���6��O@�`�S6;�@�հ�C@�V߇��@���.�@�?YoG��@��W/f @��b�N�@��ah��@ò�\w��@ğm`��I@Œ�8{�@ƌ��#L@ǌ4�N@Ȓ�Ï1�@ɟ�A;@ʳ�x��s        ?\����?�$�
�Jq?���)V��?��cdI�?���C 1?�"��3?��(���?��4Rs��?�haҟ?���B��?�15Y�S�?�f8v�?����t?��AO�p?���U�8�@ �,	��@}�X%�&@Z�ل�@���}R�@
�Ʒw��@E��'Ɇ@�C��(�@���#<@�g�ð�@ܹs�c@u�A��@y6�
�@��tj�@ M��o��@!��ߛ��@#$�5D�@$��[R	@&B����w@'�cD�@)�)��@+z���
@-]�C��@/Snp���@0����%@1�fe�V�@2�^ܬ�@3��@��@5%RNyN@6[�F{c�@7���dZ@8�i��@:;��@;�� cù@=1��@>tו<�@?��JT@@����g@A�q#�i@BQ��7�@C#���}�@C�3��@D��(8�@E������@F��u{e�@G�(�m�q@HwnA���@IkvC�5@Jd=B��V        ?O�:�:�?|j)��?��̂�?��u,=y�?�os��?�.���/?Ե(� ��?�!{�?�5�W|�?�`9��`�?�V��;D@ ��C�+@0��w�@zV��@�k��&@��Kk>$@�}L���@"7���˗@&4�����@*ȷ���9@0 �YT�@2�~�9 @6D���]�@9��A��@>q��f@AS�w��T@C�.#L�A@F�ݪe��@I����@L���\Q@P6"�8�y@R!�JM�@T4 p��@Vm�@jMa@X���f�@[^��L�@^�Ձ��@`}Ǫr�O@b�xK��@c�l	�@e_��em�@g/���@i^�Dt@k�4��%@m4�Cۋ@oios�@p�D`L@r���ڪ@sRxzvh@t���&K@u�)��t@wjH��0�@x�z�/0�@zj� 9@| ��O�@}�1c�2�@X^�ez@��<5��@�u��bq@�f}�{�@�^8G&�@�]�=�6�@�ev�A�
        ?<^G3L\�?i���(%�?�+����C?����N�?�ϗ����?����?�i#����?�Ǵvj�?�V ��?�rX���?�0j�;=@Xk�n�a@
�0(0��@�l`j�@���>�#@iV@���@#?Џ�`@'���7�@-v�"/�S@1��@�O�@5qsS�C�@9v��m�4@=�O�\7�@Ay���1[@D<S�/އ@GD��(�@J�u�U@N3j�f��@Q�1��@S/?�܏�@UymV�@W��v==@Z����R@]e*G:[@`4"t��w@aΫ�r�@c��*��@eQ��l��@g;=h�܀@i@�uBQ@kb����@m�|�V�@o�nl�K@q<sT�q�@r�M��}@s�ߔ�eg@uRsgA��@v�O��@x\��I��@y���	V@{�-�*�@}j�Qٯ@<��U��@��I2!7@��&���!@���|5@��0Ɔ8,@���Ej_�@��>�0	@��[�n:@�-�0?^�@�j��=@���2�R        ?���66?�H�]>�@���f�@O_���r@'%sH�@2!ę� @:-Z���@A�Ľwz[@G�� :<@N�
g{@R���D�%@Vݰ���@[x��y@`GfO��h@c�@�'@f"�Fîn@ixt���C@m�J�)@p�rg��@r��r��T@t�mi��@wN�7�\�@y�1p{�@|��k���@���y�c@�fb'�@�C��~�@�ׯ�ڈ>@��b�.��@��r�gM@�ȑ<��+@��~��55@�K��5��@�ܹ#��@�"�b�)@�xq%�@�ݻs��
@�R����@��E����@�m�"��@�����@�ʀ�%X@���9��;@�4Ԋ���@�)3�S�@�&��/	@�+HC�׿@�9��@�OAX��}@�m���ø@���K�|@��u_���@��3����@�</��q�@��Z]�Q�@�ԥ�S��@�-8�ք@�F�ec@��� �I5@��#bD@�o?B�V@�/Rԙ��@��P��bv        ?X4͗l�?�|Ě��K?��>t&�G?��L&�c?�K�g:�=?͆��M�7?���=�V?ޏ��q{?�j�EՋ�?�`'�T?��r�CE?�lƎQ��?���h�p?�s4=+C@Ud�Z��@/�ٹ��@J~�Grm@
�u��<@H�\W�@���@.�fY�h@j�Y;L�@�9�?�G@S��?��@���'�@���H@!m���d&@#�r�@$��B�|@&t�}��@(PqL?�@*ET劘�@,S�I1B{@.|����b@0`M�38@1���Ϲ
@2��p_ƒ@4��@Y@5p{CY\M@6�P\�S�@8L8�P��@9�<ZA�@;`Y���Q@<��k�W@>��JSZc@@3�����@A��l��@BD�dI&@B��M7��@C�}c�@D�x�@E�u�"@Gi���@Hbح3b@I;S��Z2@J_-"6�@K��r���@L�Zw5�z@M��o�@O2r��R@P;��׆u@P�`��6@Q�s%�c<        ?W|�˹�?����ɤu?�����?��k�?�V^/V=?ߜ���X?���x{?�D^;D�?�d��r�@4�1	�@~����@#G��H�@��u��"@�����@ ��V��@$��?�EF@)U��Eo(@.�wu��e@2]�/j�F@5��m�>�@9�hM/�@=���c��@AE���@Cֺ�}�@F�����@I��oux@L�s��@P:��[��@R�PL�0@T!��,�@VG���@X�ߙ��@Z����@]�5E���@`�ڮ7]@a�Ռ���@c	̚�G@d���J,�@fB;VeY@g���U��@i�N�*W'@k���x��@m�iy��F@o����n@p����@S@r��78@s7*�+@tlw=�l@u���r�4@v�3��4@xQ���vA@y�:���@{'{�u@|�L�q8�@~.���@Đv���@���^�س@��(��Q@�j�^���@�P�Jms@�<�l���@�0T$s|7@�*�����        ?3���>A?eE�(�?�r�{�7�?�<����J?�MGO	?�QH���P?ϋGR��?ڿY�?�mZ�@+?�b���8?��=/@�@1�U�B@�F��d�@�.)�y�@�����@���p�@!V���@%D��Fn@*�0�cO@/��y��@2���7g@6�o�T��@:q��h�O@>��uu�@AͰ ;��@Do�lP�@GO���\@Jn��.�@M���ag�@P�J˱�5@R� [�@T�۽o�@W�ӑ�@Y~��
w}@\���m�@^��Ǧ�*@`�
/�}�@bdiE��@d�/Ԛ@e�甋� @g�ũ�2�@ij���@kfzߩ@mz �J�@o��1�U@p��E@r#�Jt�h@s_��<@t�@�4��@u�~�k@w^����l@x��tHQ@zL���	@{��1bWx@}qiU^>K@��Xv@�g�����@�I z@�3��|�
@�$�D�!@�kS�Ӈ@���r&X@�%y���        ?� �W��}?�R�ǈ�@:����@(ͮ�2�@7,)�5\@B�(�Gt�@L�+v�G@S��&e|M@Z
���e�@`�p�C9�@d�DRU�d@i��N�I�@n���I�Y@rC6L�b@u]���k�@x�QBD�@|Y�o}��@�߃9U�@�0����@�e ��)�@���G7��@�4`����@�Ϧ���@���J�X@���'W(@�;#��7@��Z^"��@�{=;e�I@�9���n�@��ɡB�@��7�6C�@��1��@��\��\@��Uj���@����K�@���5��@�.UTp�p@�w$��@��|�`��@�.o��g@��
�\��@�[��A@��k�p�@�5CP��@���V��z@�©{j�@��DGOi�@��C��m@�n�F�?�@�_o �@�V�sF@�T-A?8Q@�X$����@�b���I@�sDw���@��l��u�@���KT��@���@��@��T�|8@�''֞�R@�/9@�@��Sȴ�@�pDh]�T        ?E�Ӡ��?wܙخi ?�K��@�?�R/I��?��sF<?�^����?�[sҖ?Ֆ����?�G�zTw�?�(b�*�6?�_��9�]?�Qۅ�0?���b��?�D��6Ё?�o�4�P�?�	�:�@Y� �@�n�K5
@�3~���@�`d�+@��K<�@)���@.:'/=.@W:#D�@�8$��}@Q��u@���k��@x`�W�@!2�p�;�@"��F��@$`�\<,X@&�h���@'�=`#�@)�(�rh�@+������@-�f���@0usՃ7@12�H�ƀ@2ehz���@3��is�@4��$!g�@6L~T|�W@7��j3��@9*�K;�v@:��]��@<Al2�ݽ@=�<��;K@?���2#3@@���g�@A�u,��@B|��i}?@Crq	?�@DpO��@Eu��`�@F�K|+��@G��@H�&@Iݎ�f)�@K�۞M@LD!�҄@M�xs��'@N͠�Ki�@P����^        ?<%o����?r<���B?��O���?�?<���?��}���?�]q((C?��\Vk?��74;P?�`e�-�?��:��?���7a�@:���u@	���0@�ι�$�@Y��L�@ �H"4(@$�ާ��
@)�7��@/�d�7�G@3�u��@6ʀi��@:�lk�p�@?�ùaU�@BH��M �@E�EC@H�Ԃ�@KX�KS�@N�s㔱�@QW6@_�@S`�{`@U�j&D�@Wނz�cg@ZTz�|j'@\��M��;@_��`\I@aL�J��@bԹ��O?@dpz�;�@f }8��@g�=�Z@i�����P@k� e���@m�=���@o�,1�Uc@p��p��!@r �pZ� @sO���@t�0q)�C@uЅ�S��@w"�"��0@x�ǵn�n@y�1�fEv@{eyy�6@|���Lc@~}���@�c�d�@��Ya7jj@�Ľ�E�@��pBФ�@���E��@��o>  @���s>�@��ʋ1�        ?(5�~i ?\��>&�?�l�Z	�?��	��c?�AAS�?�;���w@?�J��K�R?ו\�{t�?�,�Z���?��#�D�?�
!�%"h?����\��@&��<@�i���@�j��4a@�7�+D9@ h��u@$����@)�U;T\@/,����@2҃ ��W@6|��6�D@:�~��C�@?1ٞ�tX@B$;���@D�g(C@H��T=�@KZ�ř�q@N�a�Yf&@Qt����C@S�ӣ�j!@U��)
Z@XD�$}V@Zܹ�N�/@]�lR(�@`G(�h@aԿ��;@cy@�?�w@e4�wʖn@gX{�j�@h��*�@j�l�e��@m���$@oI<�n�'@p��@���@r [�@sAY%��@t�&�N�=@u�M�8��@wR���@x�T$��@zK`K#�:@{��5�@}y�����@%��q*@�o���a�@�S2xc@�=��m$@�/~/�u@�'���xY@�'\���@�-�T�@�;U����        ?��d�_}k?�v�����@�LO6�@`ر�N0@%j-M��Y@1�ץiR@;��*��@C?�D]U`@J &��@�@Qf`M��@U�gF0�@[&a���g@`����g@d(��!S@g���jb@lzh�d
@pZ>����@r�0�_]�@u��3O:H@x��٢�@{��rT�+@���fgT@�������@���W@����)L@�0M
�@��[�ˣ�@�JE���@�	Յ|58@�������@��MWqZ@��p.e�@�t�ǳF�@�G��k�@�2���@�6F*��@�RUT�v�@�C�l<�@�k`\ۭ�@���ޚ�@��O%�@�1�N�m@���8��@���/�@�sg�@��jqD��@��8��1@�4F��@��*e���@��z��@����,-@���Ai�@���E�@�����c@����n@��h�>�@��6�t^�@�����@�!����f@�U1S�y�@����br�@��S0��*@�&u�d3�        ?p����=�?��݆���?�8BT��u?���?ՄUb�i?�.�N�;?�h�?�U��>Y?���Ε%?��R��j@q��L1@�E��P�@$���]@P�j�@��^d�@ȗ#��@�]�J�,@p���F@ �T���@"���@$&�e�h*@&b��F/T@(����S�@+@�`!�@-�Ҍ �y@0S̛T�@1ǎŎ��@3L�4�a\@4�q&�$�@6���[�@8EHi6
@:��5@;�K���~@=�p��?{@?އ��@@�Ӫn�@BsOz�S@C'0��@DLY�^�@EzQ���@F����:@G��|E�@I=�͉ @J���f�@K���_\@MW��UA@N�}�׃G@P"�;ǯ@P�~�qWE@Q�m�!5@Rzq�u=�@SL�2�0@T#�P�o�@U D�q�@U��.\`�@VȘ���@W�
<]�@X���m��@Y����k�@Z�L���~@[��4p@\���/,@]�^�ik�        ?N�?�9�?}�$w0�?����A{}?��#����?�y��*2�?�����?�4Jb�"?��hu��?��cT�?��n���@�n)C�@����mt@���]@.�۟Y@�~��f@"��zm	T@'��#��@-J�#�@2ȕw��@5諫yxR@:Z�z��@?d�,3_*@B���ߊ@E�>��Ev@I3�˧�@M83;ej@P�[X�Z
@R� 	��'@U|�5�m@X4�K�@[":�8@^E����@`�VmTSN@b��0���@d~�W%@f����fk@h��+���@j�I�O�M@m0���5�@o��2�0@q����;@rqo/���@s֧���E@uJV���z@v̄>���@x]7#!�h@y�u�)!�@{�F��T@}f�a\x�@1�Љ�@������@�y�@�2�@�u}+.�@�xt��;i@���Wl�@���m�9�@�����s�@�΢�[�^@���%1y�@�&���@�]�!wy4@����B%@��x�(�        ?Si��XE�?�{ذ�/�?�$W�h�'?� Ժq%?�j6�8�?�x��+_�?�B�nxEj?����φ?��n��ȋ?��"� ?��S;�@Af�Qh@�kJE��@�_`�)@��`(��@mY�)@#Ɓc��g@(��� �@.6�zy@2A,�T�@5�Μw�@:�MnJ@>���M� @A븹c�r@D���{b|@G���<��@KfO
�2d@O,,�
!�@Q��8�y�@S��V	[�@V=R���@X��%*d@[���o�@^{�$}&@`��W8:@bt���ge@d5��,�@fIv@hܸ5m�@j�d
��@l=ȚIX�@n��\Jcg@pq��_@q�j5��P@r��y@tX)���@u�����>@w9��Lx@x�����@zV�2�;�@{���P,�@}�_��r
@rqtT�z@��j��f@��W�� /@��'��w@����nhw@��A��P@����z@����z�Y@�ߤ����@��Ǘlt@�:���        ?�^6Q�@=bN��@�^�z=@/�K�a�@<����N@F����@P�%�n�@V�����@^4�O�G@cH>>�w@g�/J�`�@m:7��	~@q�y'��@t���v2@x�|EY@{�h�fC�@Ւ��@��ӨVJ@�a�<�V�@�ؖ��@�x&��}@�@�N��e@�3KO��-@�'�u�@��z�1@�������@�SOV�@�7�R���@�2clٺ�@�B�9��@�ib���@�R�Ln,�@�{�`��@��~�w��@��G�T�o@�7�x<�l@����:�@��?�y�@�V��U�@���희@�L�#��K@�؂
�~�@�o�?�ܦ@���.x��@�_��=}T@�<e���@��Eo�?@��0k�@��O���s@�醶���@���dD!�@��R�ax{@��.�c�@��(/��Q@�����@�%��d�@�E�L��@�lɜ\�@��<QAs@�g$wK�D@�$�j:@��6>��r@�IR��q�        ?bωh.�?�LX��?�w�@��?�J�~WAi?�C�~Go)?�/��Q�Q?���G|�i?�V~��`?��,����?��nF�t?����!4�?�)�MD��@#�^,@��<n@	8%`Yf@C�pCW@���|@7�~q@ʧ�B�@��2ol@��_�#�@�钭�r@!�@�@"�ذ=T@$�M�=5�@&ɡ��9�@(�cc@+/��ȓ�@-��Z��@0��h@1YPu��"@2�G��?@4+�ո�@5��EGz@7B5+��I@8�����@:�Mz���@<dҪ>�f@>=����@@Ni�Q@A �nAZ@B#InĆ@C)H�vp�@DB�ьZ�@Ee�C�}	@F��1��@Gɳ��@I
|��b�@JUH�|y@K� �pc�@M	� �@Nr>���@O�X7 ��@P�l��,Y@Qu[j�	@R>�k�_@S��U�u@S��r�HU@T�l�̔�@U�����@V{%:�F�@Wd��s@XR?{���        ?`�
OփG?���P�?�𽍟��?��)I7Ԡ?�M�p��?�&���?�~��di�?��g��V�?�� p��w?����L�(@jM�{�@��s@���]��@��7��@�w�[@�����>@"U��A�@&Yw�E@*�MQh*@0#�ҷ�@3%�;�0@6��7{.@:V\DW�n@>�:@A����
@D4����@G	9�^�S@J ta�8!@M}N� <@P�����@R�P��'@T�C�+Q�@V��5�@YZЭ��@[�'(��@^��N�y@`�����)@b_�%V@d*�Lz�@e�
���E@g���s��@io���@k��L�O�@m�(��Xw@o�櫔
�@q3�T�t@rI��\@s�EW��@t��Y0V@v9hޮ�L@w���6��@yyi�F�@z�`Ȫz@|9e���@}ܮ�?�@�e>�1A@��["C��@����M�@�}�n��@�t��v0^@�r��j@�y��@��<s�        ?C37�!_?s)�~��2?�!�WQ�?�}��?�W�u�!?Ļ�^�:?��qw@?��[���?�J�ڰ??��_�P?��Q5�aN@ ���8�7@�w(A��@@�d-}<@�܌�@@Y��Ũs@ f��+g@#�#D`�@(zn��"W@-����@1�;��Ը@5?	 �P�@9rÌ��@=O�J-�<@AS��@C��L~I�@F}Ԝ@I�\�v�@M	����#@P_C��yC@R`��zv@T�p�ݕ�@V�j?
@Y\�)��@\Y�Ξ�@^��'��@`�tQeD@b�Y! '#@dHM��C�@f�,��@h��st@j�:_@l'�Q��@nd�g1e$@p_j5�c@q�1
h@r���@t@Z�%��@u�Z��@�@w$_��@@x����`�@zI�	5?(@{�_x�
@}�?��Nt@�w2DT;@��S�x,@���.�%@���R{�@��Sy�@��&r)XN@�����@�H�W�@�;�p�/        ?φ����?��S���@BjjI�@+��� :@9	��_@Cڸ@�I@L��4�@S����G@Z#�-�:@`�_{�x@d�I|��?@iP�/Fg@n_箔�@q�O%��@u��@x[��?}@{����h@�<�s��@��f�M_@�X�U��@��q��C�@�gh4�V�@�0��>I�@�'A؂@�%�b�@�Ϲ�E@��x��$@�k��Z$3@�^�|�R@�kg����@���~9�@��@'�@����\,�@��M�M��@�u�bmI@�o&�@��S��9@�C(z�f@����b�@�M���`d@����#@��9F���@�Fw/>s@���L@�@�o--��@�_��m�X@�XZ�<��@�X0��0�@�_�tL�X@�nn+4��@���6JV�@���w�>�@�Ȏ�|�@���ףru@�*�.�D0@�g��T�1@���֞+@��e�Y��@��G� p�@�TPnU�@�T���@¼[N�IY@�vjP�v�        ?s�����?�(��c�?���2f?��B�etI?�R�3��?�vT�T�?�J�~���?��%dE;?�)Qfv�@ 1A� N@PV`�8%@��z���@)��}^@�T���@"]��[�@��2��i@a3��@ ;p�AlI@"noĀ�W@$�$��@'N¸�`[@)�7�=�2@,�/���@/ډ�Z�@1��B� t@34�u��@4��$/X@6��V��@8��7X�@:ݲ��P@=�R�@?E��qj@@����Q@BQ�+��@CNb
	m.@D���k�@F]AQ@Gq-�¦@H�h�@JzƜ-:�@L<Y���@M�5��P�@O|W���@P��kL�@Q�gh��s@R����n�@S��V.�@T����@U����@V��.�@Wݢ�X��@Y
�����@ZALl}�@[�΂ƲO@\�[�͜�@^!Ǆ̷@_�*&I!@`t�RP�5@a.��rd=@a��=��@b��E0��@c|e�U��@dK�E'��        ?V�I�n?��"�� d?�<̈́��?��xÙk?ũv9�"�?��;W=�?���
�\?�����w?�'��&?�7d�)��@�
�d-�@�}�V�@��ځ�@�fHmSJ@!==?��@%�~{��@+��љ�@1)�wc@4�.,@98u��?�@>+-�޲�@A� g�G@E <ܔ��@H{��y@LT�j%��@PI\���@R�b��O�@U%�/W�P@W�x�Ƒ�@Z�㩾�@^�#F�2@`�#���@b�e-�1@d���?�@f�-:��@h� .D��@k`9(P�n@m�� +�@pJR�ƙ@q��r.mb@s0���@t�����@vgC��@x!<��O�@y�0~�d@{�k��t�@}�3�bC�@���ξ@���7=@�k�׀4@�HL���@�|L,AE@��p=�S�@�����
@�[4�(�@��՗T�8@�'�݆�K@���!�@� r!�#�@��f[m��@����}'V@�tl�@�K���e        ?[Do|f�?�q6!�.�?���49�?��¬}6�?�عF��Q?ڹ�Vj?���^a+d?�x�5�O�?����@+�K�U'@s��>@J����@	!��`�@#[߅[��@)L?d���@0:�\z@4{i0�@9u童1�@?7EO��I@B傚 � @F�����V@J���/Z<@OhEl�Ry@R@�i�X@U
����5@X���j@[Z|���@^��gD��@aT�ͷ�@cYC8�@e~Mw���@g�;'`�K@j+H~@�@l��"�8-@o]�S�Y@q�xG-@r�9z�]	@t٩�@u���+@w[#@�H@y!���F@z�tc4�-@|�Dh���@~��b���@�e͋ �@�r�{��@��!_���@��l�H�@�խ�q��@�	���'@�G�3�$�@�� ��G@���8Z@�:"Z�a$@���Bf�@�
 �(�?@����.E@��k@�B�I�9�@�
�^��K@��ޚ��}@��Cg���@�{��s        ?�pWS�y6@I��T@+ua��p@>p~�E�@K���|}�@V�8_�_@`;��7�Q@f�iw�n�@n�kP@N@sW|H��@xMc]�S@}�T6��@�<�̳@��^$��@��t����@�߳�"@�MY ᡭ@���hJ@����Ћ�@��.�M:9@�� �K�&@�9z�ا@���]7@�m��HM@�0����@�p#�-��@��WL��@�X����9@�����@�j��2�@��W���@�uZ@D2@��c��@�͉�A�@@����? @�t<�Ĩ�@�e�v�I�@�k�*��@�Ì�7=@���̃@��E����@�-�봶�@�gR�tS\@Ƭs	x@��ID$�@�Z���@��*/ߧ�@�8ę2�R@ͻ((�e@�J�6y @�s��r�@�H�i0^�@�$j����@�-&J�@���*>�@���g�݇@��@Bpy_@���@�@��?	�q�@��1�>�*@���t�@�%����m@�L&ꃵ        ?N�aQX�?}�6��.�?�t����1?�|Tf�]?�m>��מ?�K���P�?Д8�Q��?�+&z��S?��m٦v�?��g�Z��?�(5<?��YѪ��?�����?��5b�?��j�=}�?�$ƹ���@Z��\�@�A��i@y���@	SK�WO!@_�淶@�+I��O@��c
�@\���s@K�7l�@VQ7aO@|Z��#@�k�5�@�)�1�@ Lc�o�@!�6��f@"���*�@$\�{�'�@%�Eɻ��@'\���_�@(�#t���@*��e�Z�@,L܈I��@.5��JA@/�mMx�@0��a�K�@1�.�w
@2���w�@3�5h+r@4���k@6��JE@7$���S!@8J���.�@9x��D�@:���3T@;����x�@=3"͡sG@>���ך�@?ؖ>ַ�@@�ЈwL�@AOh�X��@B츎x@B¶D-S@C�`�"�@DF
�<:�@E�,׊@E�^9��@F��-�U        ?0҅�@@3?c!�X2*?��$w�)?��2")D?������?�b�f��?�=�d��?�.,��?�
�#U�`?��]ɪW?����u�y@`��9y@)Kx�g@�{� ��@��\�$�@ 1vH�v@$Βa]��@*PlD}�@0g	 ?�F@4/l�^@8��f$��@=��T��	@A�51�@D�D���@HZ��O�'@LQ���,I@PY��*j�@R�z��@Ue܆�&$@XF1,�V@[e۷Q�I@^�9t/'@a6Q�T�@c,5�0��@eFu��b�@g�<m�]@i�K��@l{�5�@o2� �B@q
:��.�@r��9��{@t.���@u�1�@w��5C�@y���@{��廲@}���nߞ@�nr��@���sy@�D�P3�q@���m�j@��� �$@�4�<:_,@������@��f�@���Ԋ�!@�Iw���@��Ҡ��M@��Ａ�@����v@��f�&@���O��@����uBb        ?S3,�Q?�M��-�?��Ҙ�Y�?��8�ɐl?®�\?�dˎ�uF?�7�-�-?�9G�Gx�?�y�?���a�$l?��-�*�@}���v
@	�.���@�gxO@WF`)�@�� �$}@ �C��0@$mp�@(�+D��+@-�����@1�B����@4�����_@83U�(Ӊ@< ��6�@@�+(Kg@BiVϫ�@D�d��;@G���R@J�����.@M���!~@P~��
�@RG[�4�_@T,S�	��@V.&�z�o@XM����@Z�Cj4�@\�i.@��@_Y8
A`@`���k��@bOZ�P�i@c����(@e,�1��@f�ˠ���@hEI�4��@i�n�?@k�7����@mW�&�X�@o%����O@p�BT�o@qwQfH@rt"�f<@sx�Ͳ @t��:6@u�:�c��@v�Lߌ�@w���
_@y D'Ԉ�@z2@��@{k��6�Y@|�o�g��@}��C�j8@Gݯ�YV@�Pt�s\        ?����}��?�{���@��7���@s��n��@)�=��@4�&��Q�@>����ɷ@EW�)�D_@LTq@��@R(�KG@V��n�@[�f�a�@`�+�K@c��A���@f��C>.@j�SP��@n^�Q3�N@qC����5@s}����@u�o0
@xh�Mف�@{��z�_@}�FMӮ@�{�ԑ�@�2:>"�@���ں�@�~��(��@�U6lh=@�A=SL�^@�CL��0~@�[|	.�@���tԞ�@��iy�2�@���@�M�Q<�@��&%nQe@��5�@�<.|��@���gC�@����@��,�;��@�oSTz@���li@�#'d6;�@����&�@��{�wfq@��"2�rP@��|����@�����(�@�rj�V��@�i	�R?@�eS�u�@�gYW��@@�o
B>9�@�|[�eh�@��Cy.��@�������@�ű Fc@@��!KT�*@���s��@����@@�9�a�;@��S���        ?vhu
�?��{�H'?���H��/?�m�uafv?ѓ	XX�k?� 3z��?�sZ�,�?�w��f�*?�Qm^H8F?����ɬ�?�C�ޗ@ �~p�?@��#LS)@mK�i'@Y���"@��N\�@ vĕ��@�`�<�l@T%D�|�@:��2ǡ@V��/3@ T�;�<@"���@#���Å	@& ['�S@(!nk���@*b�sȫ@@,���@/I>�@0�����@2\O���@3�m��?5@5Z;;�@6�Ӊa�+@8�EzK�@:\�V�~@<+�(W;@>��	�=@?�VN�@A��|h�@BE^g�8@C���@@D;�L�G@E`��
��@F�c�*��@G����@I��3�w@JL�.@K�3����@L�g{�S@NZ� ��@O�g�|�@P��!���@Q^Y��K@R"��G��@R�ѯ:��@S���K�@T�&�@UcJ*�@V?1=jV�@Wأ���@XLv�ߗ@X��8         ?U����?�y.H�Y?��&Q��?��,odw>?�}��ޭ?ә+Aӻ?ߜs$I�?�'Zn�P�?�,�� ?�+^˲�@dE�
�@xY��;@00Ǳ@ ����@���$�Z@ ���@#��-d@(M���@-V>^�nW@1������@4�+�8b�@8B��}��@</Ο���@@?񚌆�@B��Ч�@E*�k�@G�n��0@J������@N#�0���@P��}A�@R��?�	5@T���z\�@V�M2�@X�4�rE@[)��q@]�GM��@`��VC�@ao��`�o@b�TI��e@dS]���l@e��i�Y�@gy>��@i$��8�@j�y����@l����)@n�wb��@p>3h��G@q>k���@rGJx�;�@sX���n@tsM0��?@u��t��@v��0bR�@w�BL>:(@y6����@z~x<y|@{�v}�q@})ʣ�ŗ@~����vn@��ʉ�@���7I��@�x�Z��|@�=��g'L        ?V#o"$&�?��շ.�?�pc�ٿ?���Pq��?�����u�?�juh5�?���y�r�?�<�`��?��A��?�;|�`@����"]@
����@��2�@���r�@a��B�@#=�)xQ@(B��@-�|G
�@2O��O�@5�'�ĵ�@9�o�g�\@>�����@A���y@D�&W��@G�T�,��@K�vU��@OZ�k�=@QŎW�_�@T"ml�@V�;��K@Y%�%B.6@[�`X��|@_���w@a'�G�@b�w���@d�Z6J�@f��}@h��;/�@k�<��y@m]�ѝϔ@o�m��$@q7��7�@r��$:E[@t_i��@u�{�Mݽ@w����@x��v
W@z��f#�'@|QA���N@~5V�N�.@�-V�k@�t�H@�/��v�@�LWٌ��@�s���# @���7��@���u��@�.qԎ�@���u�v@��(N��@�P���E@�ȝ�N@�L��#D�        ?��{�:@	MOf]�_@"�خ�,@3ƊE>]�@Af��S��@K>��@S�{��i@[ �+�2@a��?5uY@f�L��!@l��4�@q)�� @tse1�[@x'�ׁ�@|4�5��@�M�+#@��_��i*@�C�7@��@�	���S@�sd�4F@�53E�_@���z�d@���CDn@������@���V��D@�Ϸ��?�@�!,P��@��F�?;@�x��<t@�t���^@��+F�'�@�h㐤[�@� w$>-@��D���L@�j�@up}@�>p�&@�&�8�?8@�#�/�@���U�@��Do+�m@���J@��l�a��@�'_���=@�e����@���R�mb@�awW@�_���.�@�ɬn�;�@�?6���m@���u��@�&�8��@��qi@�Ɣ�4�4@�%_�@�qP�r@�e���@�R#ĸ@�E;`�T@�>�n��9@�>�9^%�@�E��ȷ@�R��%��@�f���        ?PA[�[�-?~��e�?���oI��?�/f�۹�?�H�P��?���"���?��`w��?�7��i�?��sQ�)�?���2<5Y?�9���D?� �'�%�?��Z�È?�߲`�?�aŻz�@*�Dׄ�@���X@ϥh��@	��a>��@n��]@��r�O,@��S�@�c��e;@��\xf�@Ss/��@��Rp�@�Ʊ?�G@ �,���@"9�k��d@#ό��ǁ@%z"��U@'9�
���@)��oޯ@*�Y����@,�'��	�@/f��ʢ@0��ˇ��@1�:&��u@2�gz%@4*U��@5p��@6������@8*z9@9�x?��@:���� �@<~k�M�s@>
��7�K@?�')��@@�r>��@A{��
�@BXX��@C;Oe�c@D#�?,8@E+F�r�@F�[jx@F��W�4�@G����O@I�@	L�@J�yϯ @KvTu<@L6�/Fu@MR�/%g�@Nu��U�:        ?)���V?_/�H�5?�<i�s!?�����?�Z�$�|?�?pKe?�F��0�?�	ù�?��=#v?�"�n�3?���k/d�@ �iC�z�@>:���@5�	b�B@{��~�s@[�,��}@ ��y�2@$�1x�ug@)v�D�ƴ@.�����;@2���ro�@5���@9ύ����@>{of`�@Af��k�S@C��V;�I@Fς�˰N@I��|J�@M3U�&j�@Pd��;1�@RR�d�@Td�B)�@V��w	}@X���͒�@[��`Ey@^4<	�,@`�y�Y��@bT2��
@c�u�o:f@e]�� �@g*�tKՐ@ia cx}@ku����@m.�J�k@of��o�]@p�և*��@r�;�3@s_H�EH@t��"��o@v��=�3@w�S4#�u@y&�@z���S�U@|_t�`�v@~�CYk@�3�@�@��d<���@��?6�؆@�ސf	��@��1-? @� [Š2$@� :���@�JX�n�K        ?JS��q�?x��\�#?����ODy?��+���*?�:�Ψj�?˼C���?�^~�5�y?�el�Y,?�z�?�n!�(�d?�����o�@�Z�u��@
��z�R@�ﭖ'�@��jT�@�p��@!�$A(@@& ����x@*�+ ��@06�2ɼO@3O9��$@6ƞ�p~@:����l�@>���,0@A�H�:[�@DPV�V� @G
����@J�.��0@MDԌ��@P[Ec��@R2��&@T(��m`\@V?wb$@Xu�Q�y@Z�1`O�@]F}��@_�:�J�@aP�����@b�	V�@dE��.��@eܔ��H�@g����mh@iD6��y@k|&i@l��F��C@n�2U��@p���I#4@q�ia�@r�l�Bk@s�
}@uu�/E@v[��z�@w��*Ɗ@yts��@zm�(ɟ}@{�jv�^]@}fX�w�h@~���dp�@�J��]h@� ��Bʟ@��^ex@�@��]Q�.@��3��p�        ?��>O/��?����{ָ@��dW�@�c��2@(U�v1#�@4��@>�R�;K@E-c�%ђ@LwG'(@Rw�wG?�@WO��R�@\��Iz�@aq���8�@d�pR��@h�[}�RL@l��%<�@p����	Y@r��/L@u���b@xQ5����@{Kf;t;�@~x�bQ�n@���!֜@��)͊&�@��s��]@��Sgt��@��J� ��@���A��^@�P��b�@�������@�,��G`�@��m��
�@����ף�@�f;���@���v@���	�&�@�1E�=��@����k[5@��d���@��;��G@��3:��@����*Qk@��u	�o@�ڞ��j�@��oH鵋@���[��@�A���0@�u6����@��tG:f@��*ssC,@�A���(�@��>����@��R�@�,
w�@�⾾*"]@���T�C�@�\d���@�r��Q�@��Ҽr�@��=�U��@����!@�VQ�"��@�.�x�?�        ?U$���w?�#����?������?��[
�V?�D��	K?��m�jt?�$��O��?�ě�W�?��6n?�v�)Q?� � ��?�5wD��?���秈?���8�?���dR��@ �|֋�@���@1@ǻ"�+@�@�V�,@��h�C�@�`C��@9��m@�7��@'b��@ ��`@TҘ�i�@�Ȉ��@<ڸ
�@ Yz��8@!�YT"?�@#"���d@$���Va)@&2�i�T	@'�O��k@)��Ein@+V�.�h@-4��,r@/';'�V�@0�v�eP_@1�;�@Q@2�/'�&@3�/��@5���M�@6S5��@7���H��@8�G�)�@:P�q��@;�Uc��|@=5���Lx@>�n�\9�@@%n4�6@@�T"@Aǈ6���@B�W{�"@C���@DfN�K\q@EQh��{�@FB;���@G8Ĉ=�E@H5U�-@I6�F[U@J>�WA��@KK���v        ?$%e��g?X�O���b?y���O?�/��b�w?��t��J?�*�"nDn?�nS{�;?КT�t�?��~ϒ�?��':�|?�~��[�?��ȤL�?��Se�@�2*{�"@���Y3&@���I@�H�W��@��*!@!�W6��@&0�}��@*��5x��@0�W��@3IuI<�@6w<3z@:E-V�q�@>~����@A�~�匏@D$�@��@F򻜋�.@J �cA�@MQ���y@Ps�V�s@Rb�n��@Tv]�}��@V�=��@YrF�@[�'�9��@^N��-MR@`�g���@b���z[@c�T��@ejMa!OG@g5L��@i*q�͘@k2�Vܚ@m)��L,�@oYD����@pѵ~� �@r[�Ā@sDݖ%9�@t���%�@u�vv)@w\_�k�@x�,��Ɵ@zaI��@{��zȇ@}���V�@^�}Y5g@������@��*���@�xoc��t@�wx�~��@�p/�Pr        ?Q�&�ӂ?}�4���s?�k�i��%?����No�?�a�����?������?���J]a?����3?�:�~��;?�#�Y!9?�]u{=��@NI���A@���G@D>����@z':_�@��p��@�[�Dŉ@"���G@'�t,��@+֤�{w.@0��i�@3�\H�N�@6�x�!�@:�3��a@>�(�^�Z@A��}K@D�U&�@F�J3�A'@I�q��k�@L���&@O�߲�@Q��y���@S� =i<@U����8|@W��J�(�@Y��.���@\`z�g��@^�F��W@`�Y$~_@b&ӌN��@c� �k@e#z�[6�@f�i70�@hjB�e��@j*l-���@k�IEɿ�@m�>^@�.@o�[&S�@p��?ГU@rAJ�	@s+R����@tT`\|�@u��Pa%t@v�,+r��@xG6�C�@yj+c!F@z��F
�@|;�"�q�@}���@=�Ȭ��@�h�d8�@�9I���:@�9��        ?��;��P?��Wut|@��K�d@����:@(뇍�9�@3��l��@<��`R�@C��N�E@J��g��@P������@T��f,�@Y�����@^aVA@a��Vջk@d��D�g�@g��X�.�@k?��=��@n�8lg4@qm��ݶ@s�/F��@u��.�4�@x(k���@z��(¢�@}` �y@�ƆAJ@���,Em@�1�q ց@�ܣ>}[�@�������@�v N�;@�ea����@�l�Jl@�����@�@�b��=Zm@��E\��@����#@��3��@�Zxt�&�@��(��m@�-<F�`C@��-m2v2@�?c>�\@��1%@��Ց�g@�+�i�V�@�:l�[@�	�y�@���6�Y@���<и@�N�;��@�*c���@�G���<`@�m����@���K��e@��cR贙@���,-@�W�l/Ng@���D���@��>S�@���yE{@�bG�fA�@���B@�����        ?H%���K�?w���#�?��C��?��)���7?�844�7`?�+�G���?��Wk�L=?�h�]2�?ۃ:=�?�䛛|6?�rG
0�?� �L+�?�Oka?�\�ܭOs?�8��t9?�'�5���@ Q�۩@Á8��@m錑@S��N]@uܳC/�@��{�6@?g��2�@4���L@N>�"b�@�[~��@������@|13/�B@0�.�^0@!�M�Ͻ@"���7�@$'��çf@%�A3�@'��
 ^@)�����
@+y�o��i@-�ػ')�@/�6;\�f@0�����@2&���@3`����@4�.���B@5�%6��@7Y\�wD@8��} ��@:@�d�@;�i�R�@=\?]��K@>���#R^@@Wp�{�@A6~��@B����L@C	�CJ,@C�8}ۏ,@D��Cicb@E��bއ@GSz?*�@H1s4��@I2�h^�@JS�%�#@K|J"�s2@L��HҮ�@M�AOW�        ?/Z����?bI6{`��?�|�Ί�e?�ZQ��P?���+AQ�?��?���?��`�~o�?�f��B<�?�7E�)�;?�?+fc�?���X���@ �<^�@�X �e@���-@�"E��@�%{y@!1K�E�n@%�Cw)@*�����@0?��с@3�d�y�R@7r��� +@;�iHGH�@@N�0�.u@C
���@E����o�@ILTwW��@L���{�@Po��X?@R�/�Sx@T�� ��@Wr��{�@Z*�fEG@]N�R��@`�����@a�g��5�@c�\߶��@et*�w��@gv��;*j@i�o��#@k�\����@n5���@pY��O��@q���d_v@s	�i�#@tz�5�o@u�����@w�QL�!�@y5D���@z� H@�V@|����%@~����@�>��Y��@�>�k��<@�H^Z@�[H�i�@�wˬ�@��=F�H7@�Ύ��5�@��;(0@�MHy��@���-�p�@����	H�        ?I��D�J?x<	�w�?�l�_ #�?���-�I�?�S��l�?˜9s���?�Zhl+�?�/��H�?�UG�
?��0�a�?��k�l�~@����g�@�w�>�=@}��Q�@
͓�D@�ʒ�w@#}���Ht@(C�%��l@-Ӝ��/�@2G���@5�@��~�@9���$�@>�p��@A�	��}�@D�wV�*�@H4A�@K�d㓐y@OU:le�@Q�(���@S�V���L@Vci��@X����1@[��afJX@^�G�/A@`�G��T\@b�Q�݆@dCZыr�@fy`��h@h ��G�3@j1ss��@l��� @nJ��'=@pI�)P@qxj|g@r�wR4��@s�C�c�@uLا�Ƌ@v�?��i@x�f��@y��n[t@{�re��@|��Ѧ��@~68��[N@ܦM��*@�ǫ�N�/@��1q}�@���}i�q@�x�F���@�kRS)��@�d��K�@�c1=��@�h��*a@�t���K�        ?�$ܔ}K�?����y�@U#0Ԯ@��2ރ�@%ӹz%+@2���@; Oa�>�@CeǾ��@I���t��@P�ۙrm@T���$�@Yⅻ+�@_c�Ӳ�;@b����@f(��}�@i�S��@n�yה@qBʘ�I�@s�>����@vb]�?!�@yF���@|fa���M@���Nj@���j)��@���έ��@��w)b�@�缃y0@�A�,�@��l��6@�hM+��=@�����@��ŝ� x@�(�a�j@�ϕL�@��'��@�_�9k	@�H�`D*�@�I[]B��@�a~���@�ȳ��mG@��TK�>@�� �	@�YA�o@��	f��a@��D�j@�Y��@��Z�E��@�BX�D)�@�����@�^�"3һ@� U^	�@��AC׌�@���s:@����F@����S�C@�w.	�@�pq��)�@�p�Oi�@�x]�@�@��,���M@��O9�F@��ՙoaQ@���� \�        ?b��>��?�(�δ�?���W���?����[?˨��u�0?���m���?��ڡ�?�01��?�]�#��z?��=NA`M?���)z�?��j΅��@ST�'�M@��%ۼ@#���@.��}@(�+�2@y����@�3�E�M@�2/�~@�MYC�@�༇Z�@ �m���@"h�-�G�@$X��i�v@&g����@(���Hͣ@*�b����@-Z�3�|�@/���E@1SI+@2�mzOU@4?�W���@5�ߔ2p@7v}]Nԯ@9.�w2@:��VIi{@<����@>�%N_>�@@g�Q̻L@AuK6#1@B�tq�O�@C���$~�@D޶aGm@FXmh��@G]����l@H���AC@JL�I� @Kv#��x�@L쩈+�@Np&Z��@P Ga�*�@P���@Q�����Q@R���"��@Sc8��)"@TL�c�R�@U<t� �@V3O���@W0,��P�@X3�G��@Y>T��@ZOP/�\L        ?E�9����?x<А��?��#N��?��jU�Q�?�q��*\j?�t��wVy?ؖo7�?�_�� �?�D_�hKM?�xZ�?��@Q/F��@�N[|@�x��@[���@��+e��@#"�$�1@(g\�3�G@.����G@3�T��@7F*���a@<.@(�c@@��k��y@D�]�Y�@G��)�_�@K�t?. �@O��e��@R[����n@T�K�r6�@W�D}
P�@Z�E؆L@^S�M�0@`��+mq@b����@d��i9y�@g.�d��b@i�R�N�$@l���@n�@$Ur@p����H�@r&�p��@s���g@uGT)2V@v��c�@x�0�`׍@z��[�hE@|k��6A@~e����y@�9�s�@�JJ��@�e5I_2y@��g����@���ևp@��)��P�@�9W� @���6� @��Y�@��@�I+�i~K@��P6Z��@�6���G@��G��.a@���/�`w@�y�e�ģ@�P���        ?6�y��$�?iC{I�?��A��<�?���]P�?����L?�$;�<�?���}6�?���,3?�SȦn�?�.���0�?�Q/�kD�@ JS���A@*���E4@xk�2$R@1g~}>@�/�5dK@�M�2h@#&bbD��@'nܽ�=@,U0|-e�@0�{�Si�@4����q@7�P]�@;h���aq@?���p��@B(��E�@D�(0b@Gr���@Jk̙G6�@M��*V{�@P�Nj���@R[vʩU@TOiʢT>@Vb�X`�@X�+ĘP0@Z�FTt��@]_�b���@_�e�],�@aX��@��@b�Ȉ.@dIZ���&@e�W���@g�k���$@i?
����@k���@l��j��\@n��qe�@p{-�I�@q��ٵb@r�����@sҗ&��)@u	���@vG�v�@w��Uv�@x�mD5�@zUC��L�@{�zN�uO@}Kc�w�j@~�Sn�{@�<Ϧ@�@�O�Ò'@��W�U�P@��6��        ?�\�i��?�v��@��0��n@+̻Y�>�@9*� w��@D
!Td��@MS��}�x@T;`ZkE�@Z�d,Sk@a��lv@eV��wJ@j ��
@o_����@r�
QIy@uԟN��I@y]�y???@};�=5@���^�h@��ll'l@�����6�@�4�	�@�y=7�@�@,n��@�����	�@��6���@��3�oy�@��)Vl@���{{}@��=:�5@�N"c�@�	���S#@�e����@��+o�@?@�U��3�@��MԆ�@���<��@�O٢�K2@�!'^��`@�xFC��@�F�8?%@���$��@������b@����U�@��3� �@�"���1@�f[��@��ai��@�`I�q�@���X�@��Ux���@���TER@�B)Bu�@�[q[�}H@�3�ӖF@��<�hF@�������@��8L% �@��*:��@�ܪL�py@����|X�@��\u�@�r��j+@� %8��q        ?iнf�m#?�Bp�9�?�����?�- 4>5S?�
�K�]�?���.�M�?�a�exPI?ꂲ6�t�?�b��� �?� ʓ[?�X�[��@ �֢��J@�u�cp�@G��ˇ�@�>�V2@ ;x�@�f2�(@�PJE@�����@-[j��@��}k�@�OQ��@ �˟A]�@"�"�o�k@$Pw`9w@&˯f@'�r�6\�@)��(=O�@+�oӀb�@.�BJ0@0(-s���@1P'7���@2��0m��@3���5j@5�	p!i@6g�T��@7�
O �M@9<꯳6�@:�`w�@<D{;�s@=�B�syg@?~����%@@�v����@Au���@BZ�݌m�@CF5ef�u@D8��HW@E0��*D@F/��~P@G5s�jb[@HB�4��@IU_�1g.@Jo��W�Y@K�����@L�ļ��@M�� $�f@O��N<[@P-]��H@P�Y'���@Qt�nFc�@R�r�B@R�N��R	@SzQ��}�        ?PU��&Lh?����x?��f\��?�|I$�LD?����?�Q�8ި?����0v?�Z���V?��vP�L?��S[�@C���@~�,��2@�`R@���`��@?���@ c�m��@$2^��˛@(�,�o,�@-�]eB\�@1��K�#!@4ᙅ{��@8y F�@<u�76�@@n&+�@B�%�̈�@E{̚O@HXξ��K@Ks/*sd�@N���G�@Q2�bL<�@S t���[@U0Qz��@Wc?"˶�@Y�>O3�@\6W��%L@^؛+��@`��p{�@bI��i@cס�=�Y@ez����%@g3!��@i�#tH�@j���,@l�^���~@n�ќ���@p��v��@q�Kb� @r�l�v�@t T�/�@ui@d�C�@v�l�E@x#CV#@y�|���v@{��{�@|�h<ڋ+@~=e��Yu@�����@���x�$�@��w�/@���y@����Zԁ@�����"�@��6���(        ?E�A`�?s�l���?�
�����?���C_?�8�&@�?�l�@�`?ЅW����?ڗ$U�u?�u���_�?�PP�|�n?��=���X?�E�:O��@�k����@K�q"�@�=e��L@��-��@�cuk�X@!�|�LK@%�{�c@*6"J���@/`�6�ߋ@2�7�V*@5ݢ�2�@9��r�Q@=�:ҩy@@����'C@Cg�,��@F�?��@H��AȘ�@L�No]~@Ot�``@Q�m0Ȣf@S��Y@U�PB�!�@W�)R�A@Z8�n��b@\�ϗ��@_r��#J�@a&~�A@b�~V�=�@d>6����@e�$�@g�"hNʅ@i�.᰼j@kv+���R@m}}�_]�@o���2-�@p��*��@r��5i@sEہ���@t����}"@u�BN@�@w.��?�@x�{m2�@z}��>S@{�6g�+@}L �d@~��i�U�@�4uG�+�@����O@���
�φ@��жv�@�֝��}�        ?�ӆ�?�@ Pb��@��uР@,����@9�
�t�@DN���@M����tf@TA|���@Z���$@`��H�W�@e-�f@i����@n{��Iv�@q�x1��@t���@xzN��@{y�8u�M@!!�C�4@��ފ��@��RH�7�@���QY@�&Nh<C@������@�B
���@�Ј�n�@�y�+Q#@��3��Z@��h
y��@�U��^@�"k�@��4���K@���/�@� �e���@�K���@�0(�L@�Zȍ�G@��R��@����[@�"��H�B@�~���e@��D⑩@�^�*��<@��OG�@�s���M�@��Fi�@�_����@�<���:�@� ���b@�Re�:@����J�@����Q�S@���3���@�<eX�@����@�)_D*��@�Hm;Ce@�n;�&�@���6��_@�����+@��|�'�@�(����@�Γ�	"�@�x5.��        ?h�f'�j?����[@�?����O�J?�l����?�+N���k?�ȣ�ŭ>?�Q!*�4?��q?����D�?���*W��@ �0���@���l�@��2��@I�pp��@ב���@�-��r@����@�FF�i@�}Z@ D��t�l@"!����@$9���@&4A��@(j&�@5@*�����@-2��H@/�V}�@1<�^�U�@2�Rt�:@4 ��w�@5�D��T@7E6į��@8�IMj�$@:���><V@<~W�r@>`�x�@@*0��_%@A-��K�@B;Hf$@CRɚ_=#@Dt��:9@E�K�̮z@F��ۙ��@HF�O��@Ih�I�\=@J�����@L%�����@M���&eh@O��c�N@PJG4�@QT���@Q�Ny��@R�u�e9@S�TjP@Tj��X�2@UN����@V7��L��@W&Ӆ�F�@X$Ȥ@Y��@Z nԛ@[�FI�L@\"���^A        ?J��c��@?|6_�3�?�B�;1��?�ל�V%�?���.�$�?�sHa?�,?Q��?沄༤�?�n(!�X?��my�b2@`"�_��@	~=�@=��/:@�7J6l�@�����@"�c�&�}@'��
ߥ�@-'7��@1��g�A"@5i��U٤@9�-:8p@> 6���@A��RK�6@Dq�6��f@G���:@J�U��͚@N��[��@QL;�@Sr46�r@U�Lf*Mk@X:�w�!@Z�&�#ti@]� `n��@`WV�@a�Z_\�@c�S�
P<@ea� 0�5@g@��]@i9����@kK���|�@mx��f6i@o���@q�93�@rSH�2@s���q�G@u Չ��s@vn����A@w�
��8@yy��]��@{YUWp@|�*�3��@~��4EK�@�,��E݂@�A�,�@�k1��m@�CFz�@�-�u6P@�F*&?�@�h����@��wMt��@����"}�@����y@�\"��        ?i8���Ş?�n� �?���6,�?ž} !��?ԭ�w��?�z��ƴ�?�a��e�?�TnD��?��:aߦ@f�k]�@>���Z@�I�H|�@#0G�@f�1�j�@"n��Q�@&�Ç'Q!@+�Į4@0�S܇�@4#����@7�A�X��@<��|�@@Y����@B�K�y:�@E�+�#.;@H�R]�2�@LG�S�/�@O���pb%@Q�W�Z��@T(u�+%4@V}=,�@X�|���@[���t@^�	�J�@`�OX��@bgz@�?@d�2of�@e�O�d@gٚ�99�@iޑ�ڜ]@k��E���@n9�9R�@pH��3/�@q�W&�G@r�f�p(�@t � gAI@u��t��@v���Tnr@x|��@@ztS�!@{��^�+@}]�b@��`w@�t��v>@�c@=���@�Y���E@�W�4�AA@�]�:e�|@�lU4m@��c�.@���b	t@�ǣN�
�@��� ���@�.����(        ?����*@�!��nQ@"����@4�Ϡ��D@B�����@M���N@U�ؕo�@^@p����@d .��T8@i��iY��@oߎ�,�@spU�8�k@wLp.��@{�tm�,@�� A@������@�.8�FI�@�-H�jY@�oջ��@�N 4-@��"���@�����M.@��W�]'@���M���@��k��>@����@�pR%��@��!�]C-@�C���/�@���'�J@@� RU�@������@����@��5[N�@�TG�-��@����V@�څ}�=@��+��B�@���L�ƀ@��H\[.@��&@N�@�����m&@�
���@�7��u��@�j�C�@��l�?@��ۂ�"�@�D��z�@�����`@�
�y��@�~a.�+@�~y���@�C?R9�@����ʶ@��]��Q�@ò�ni�@č���c.@�n_7�z&@�T�H�t$@�@��s@�2kDʹ@�*'r�@�'v���N        ?h�Q���?�-K��?��c;�?���Y�?��^��`�?�I�a�N?�̫���?��w���?�"�X@?�.�$VO?��2hڮ�?�
f�)�d@iv�y@@����$�@8���@�dimB@ωAc"@>@�1v$@���@;�� @��#�e@�N�!�@ g��n�@!�T���@#}�G]G@%]�~23�@'W��o @)m&4z
�@+��o���@-駎P`@0(�%W޼@1j�
W��@2��K3�@4z�p@5��K���@7 �b�?@8�U�U�{@:"e���W@;�.$1@=~>f���@?A��9sY@@��p@AzfY�@Bq�A�r�@Cpa]j[Y@Du���wP@E�����@F�WX�o@G����;�@HҜ���@I�(-�-@K*�)��@L`�N@F�@M�����@N��F�Z@P\$ \@P�P��e@QkV �@Ry�a}�@R�HQ!��@S��TY'�@T=T���@T����/�        ?6&}}T��?f���?�n�ga�?����Հ?�z��I7?����[�?ҋסT��?��w�%��?����E.�?��K}#?����^�@:2ư�@v��=»@���{s@P���0@!	2���@%�O��z@+����@0�d�V+�@4`b����@8�"��z�@=<��
Z@AA���%@D1�n���@Gs>>(�@K�lk=�@N�]�F@Q�o�C�m@S�ҙ�7@Vw��Ŧ�@Y.�D�x�@\T��J@_9uR�|@aH,��@c� �8e@d�A�5@f��� �s@i���`�@kU=j� @m��)���@pdp���@qi{����@r�|�^Z�@t<ªI@N@u��Z�@wV�Un��@x����ǳ@z�i��l~@|���@~hG�!%@�.8��l@�2U��`@�@|KqCG@�X�@�~@�{mMe/�@��{-��@��~>��@�"j�F�@�o�8�(@�ǯ���@�*���L@��e/�V@�Cp�ߨ        ?Z��{X�?�;G$\]?����)�?�����?��KH�\??�:����]?�?'Pwe?��uզ�?�Q�u��?�5G��r�?���|��@?V��P@h�(d�@��\@��ڐ��@'z�	U_@"?�̢p�@&�PZ��@+�.���@0�K�Uƞ@3�H��l@7i%���@;n��L��@?�:���@Bb��:k�@E� L��@G�pތ��@K��GU@Ny���<@Qə���@R���R�'@U	3��@W8�0��@Y���_Z�@[�����@^��L�7@`��:D�h@b	�ź�@c��y&�@e� �$@f�L�J��@hd��@j(�C�V@k��ms��@m�$w�O@o���e�p@p�1&a��@rX*�Wz@s)��z7@tP&08��@u�!Z�[�@v��]�8�@x�QP�@yTZOF0�@z��V��@|Wj�@}�\N���@	�3��@�J�k`�@�'ݸ�+@��1�]`G@��G¶ڽ@��w��z�        ?ί<1�T?��2V�@�M�A@%��G�@2r��A+@<�^N�v�@D�X��J@L�ac�@RUu�n@W;2�>��@\��7ï2@ap��z�@d�=d�O�@h�}/,�C@l�Yn��/@p�<΢7@r��	�i�@u������@xPA�lh�@{L$h�Me@~|�%d�d@����K�N@��yr��@����a�@���
�4�@��X{)9o@�!E�\; @��.��@��O�L@�U_��J�@���>HG4@�(��i0@���6� �@�=��I&@��'�KX@���5	!@�[]�ǂV@�22�Ĵ@�*Q�P@�	�͵�@�}�Զ8@����K@�5.����@�Ux�.>e@�~Ә�p@��Rz_��@����@�2 [�5�@��J�i��@���#<J�@�8���C@��c�#@�����F�@�JCmܯ�@���j@���Q���@�����/@�t��]�!@�K��9l�@�'y�<@�c0N�@��g� .@�ّ��f        ?BN#vk��?r*T�Q�?�f�(�?�[��0?�J
�?��8����?Ŗk�I@?οVҢʞ?����_?ۢ��>��?���ȿ��?�S�K���?��v�?��i����?�,��z?���i<i?�,R>_ls@ j���j�@��+�<�@�
d���@�=M��@+X�~O@��]�@��.�x@��8���@'�f՞@��A8%q@�-|�q@�fV9�@ _�t��@!�>�(pB@#�F	.H@%F���݀@'���N@)`XK@+k��N�@-3� ��@/s%D���@0�T���}@2&K��]@3s�F�;�@4� ߈@6@�@��@7�J���@9S����@:��� g_@<���ݮ�@>{�G5)�@@,�*	6�@A&4=��@B(�度7@C5�o��@DM��@En7�:�@F���Tڗ@G�M��F@IB�Ӎ�@JY����J@K���@M���o@Nv9��,@O�Vq7ȓ@P�m��        ?+_�O�6?a>��50?�5zH�]s?�1��?��39zW ?�M����?�2��9P�?��N<\�p?�Q�@sbA?���F�p?��o_�2�@�Izc�@�c�� �@���V@�zv^�@ �)ky@$S�����@)f��]�@/I&%�}@39f�@6�䗢�@;0d�o�@@k��A�@B�k�B|@E�iD�IT@H��&O4�@L�u=�M�@P:] O4�@RYp���@T��gJ�@W��@@Y�ݪ�T�@\�Q���@_� T@a{uh�@c8��a�&@e\k���@g	 0:@i��+)�@kQ��=0@m�P5��x@p�$�d@qW���8@r����:.@t!�/�S�@u�Ζ��@w4W��?{@x��$��@z��vu��@|_̀v@~A}h�@��j��@�!P'�Q@�1�8���@�M�~�WA@�t�1ؾ@��yV=��@�����@�0��8@�� �t�G@���R��@�\����c@�ڃ�.�        ?%�ӭ�]?]up��N?�������?�WH��N?� lԛr?Æ���?�䡡,��?�����?����<�9?��.]�Q�@ P%�]m�@�OiU�X@iތ��@F�vw��@��3O�@#$,Y�@(_��ψ@.��
�#@2�o�p
�@6��U�D�@;�-�Z@@~P���@Cx�^1�#@F���"@Juz�x`@N~�Ge�e@Qt�7��@S���1@Vva�o��@YE�V�/�@\J�*B��@_�t7�@a}�]_@{@cT�v,��@eH�����@gZ��rx�@i������@k�od�}@nG�XI#�@pj��Тy@q��)��@s)g�aHI@t��V�@v*���\@wĠAH��@yo��(�@{,ݠ�ɔ@|�j�V��@~�ԁ�	@�g"Y!Md@�ip��qI@�t�@(@���h��@��� �!]@����:y�@��r��x�@�9{ʪ�@�|�5���@���'u�@� Q���@��D�o�@���9!�@�.kB��        ?��[b-W?�_�r���?��'�t�@.G۷3>@���@"@����g@+��[�@3ԑ����@;\,3�@A�<���~@G0���v@M��� 0@Q����V@U��_@Zgg1�b@_j� w�@b�3����@e�څ\�f@i���N�@l�Ƹ[*�@pk�/*0@r�s-�@uʭtV@w�9�
ܘ@zrbH2�@}r��H�#@�T��i�@���]�@�߲�ͤ@��(̗�@��#�{!0@��˗�<@�`����/@��(`0@��1��&�@�3\�hK@�}�n��=@��=���@����*k@�>Za��@��c�垢@��v<^#@��[3ٹ@���g?dX@����z�@������@�/��k��@�c�����@��*��5@����`R@�L��-�@��81��@�*�����@��
���Q@�>�W��@���ёxA@��2�y�@��ĚǞ�@��|���@�n*d$�@�^����#@�V�Tf/@�TϺ	�