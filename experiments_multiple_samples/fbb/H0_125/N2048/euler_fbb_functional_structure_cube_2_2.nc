CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T103545        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�E��10?���5��?��WU�o�?脨ާ�y?����FyM?�uSer�w@Rt���@���r�@��>*U�@� "Ǹ�@U4���@"P��*N@%¼�7�@)��w��@-�Dn�T�@0��\��@3JX�zy�@5����]@8h����`@;3�sy�@>$��?)�@@����G�@B>����@C��D�@E��h.�-@G��:`�@I�0a=��@K��oA�@M��ϼ�b@O�,EZ�@P��qH'�@R%���p,@SVr��&@T�v��2j@U�؞)]@W ��Wp!@Xv�2SVM@Yս���@[>���V@\��^d@^*#�5�G@_��xi=�@`��I_@ag�2���@b6��tJ�@c
-����@c����"@d�P\��@e�y�g��@f�-KJ�@gl&��r�@hYc_ځ @iJ����2@j@����E@k:�{fkV@l8��.�@m;
��c@nA���"�@oL0�m��@p-{b�U@p��ފ�@qBd���.@q��=���        ?��B��&Q?Ǆ$��H?�/�A�a�?�؀��?��ҝ�)�@�`�/�@����}@�n��@ � ��i@%�B_o�@+p�h��m@1��3��@4��#��+@8�\¦�@=s�#�.7@A: W[@C�N�$4�@F�B���@JB4��@Mp��,\@P���\�@Rr4�M_@Tz�5���@V�-&{@X�ۘU\@[B��@]�ŗې�@`,<�7��@a����-M@b�j~R@di�S^&@e�_G�@g�r���`@i(��-�@jک����@l���x�.@ni'Rdh@p"�
�;�@qe��f@r�&��@s��ܱ>@t#���|�@u5�t�/@vN���Ȥ@wn�}2��@x��-ҍ@y���v�#@z��Q4�@|5���@}x���,@~���W@�	R�V	�@���-�b@�dD��k�@����f*@�̼�A��@��i���@�B�u3m@���jRr@���%�S@��W���@�V1�(3@�#U呖�        ?�������?�8.
�?��-�`�?��ڷ��?�5����@�I�?�@l\��Ae@�]�p��@!_E�l7@&�Ôk%@,���M_%@1��v��i@5��A?@9�|����@>�NIhy@A�HA|�@D�`����@G�jY�v�@K}g�˨@N��Y8K@QE����@S]�cښ@U+�p��@W_;�{�@Y��(�'@\��X@^�p���@`��~��@b
5���@czXI���@d����~@f�*8�^@hz�ȝT@iǕșA�@k}^��@m@�3?�@oo;�@pw��C�<@qmr2y^@ri��du�@sl>'h��@tu@�@u��/�@v�֪K�@w���R�N@x׏J��\@y�QB�]�@{,�L� �@|`�46�@}���@~��q��@��;_m@��ɇ�5k@�[�ng�n@�,��� @��jc&7�@�cO�|�@��`^�B@����nJ�@���h��<@�<Փ�M�@������@���ʠ�o        ?��u�xg�?���Mu�@��hJa@��9v�@*��>Q��@4{*K�w@=?�1X�@C���y�E@I�	dh��@Po�n��@TV �%@X���c�@]st1�ˋ@aU`�Vf/@d)|��l�@g6.ݴ�P@j{�,��F@m��Y�:-@p�Tv��@r�>.xk@t䗁�|�@w^'��@yb�y�R�@{�$�@:�@~R��S@�z(��L�@��[ �2�@�F�{'�@���\��@�J�hw|@��c����@���nD@�7��Qe�@�����@���_	,H@�O����@�B���@�<�E�Iv@�=ѫD�@�E,n��@�S {�W@�gIg���@���(<@@��/.@��w��D@��5Y���@�,=�叢@�f�(�@�� ��g@���Pc�A@��mu�5@�G}H@���ߟ@����/r?@�Vi뮨;@�aY� @��i�ٻ�@�����j/@�@��
z�@������@����L�1@��CqB�@�[CR��        ?�(h���?�o����|?Հ�͘x�?�:
�q�?��{�?�"���@9��`@	�	���P@�l`���@����@�b{䘒@J�~�W�@"� 8���@%�l�YEi@)1���m@,���H�@0R�J�?a@2b�d�^@4���e�@6ݷܧAN@9H���@;�㢐�@>x��Ң'@@��Ƃ�@B!�@C�����y@Ejs1�$@F�[���@Hf��3�4@J N�촡@K����t@M��b�?Y@O��BxЃ@Pɉ1Y��@Q���\s@R�qǖX@S�zM��}@T�$C�PW@V
]��}R@W+� !�@XR7���u@Y��2g�@Z�~��@[�;X^�@]-�4꿷@^s���@_�"��@`���@a5	�x�@a��i�@b��*a'@cJ%	�,Q@d�+���@d���D��@ex��y@f8�n/�@f�OU5[@g�Z"]gZ@h�X�$��@iS��>W@j a���a@j�a�|3@k���=`        ?����.?�axF�?�B�S"g?���]o�?���Xo@_6��@@�1�4N�@����@�j���@$딃qN@)���@/�M4U05@3|�OC��@7yNOs�-@;�S��Ɯ@@_Ӓ��@C�U`��@E�a�{�@IC�@LW���@O�H�/�@Q�,�p!@S߰P�C@VC�jfQ@XB��hB@Z���q��@]�랚Y@_��x7a�@a9G-l�@b��(ֳ�@d	�H��@e�6��i@g@+���@h���$k�@j�-'cm,@l`w�W&@n2��h�@p	����@qF���+@r  ��F@sК}�@t��O\�@u&{5��b@vA9��<@wb��"N;@x�?�_��@y�i
*�@z�B�P@|,�+$7@}o�0��v@~�W�H;�@�����@���@?�:@�^A 8@��g��K@��b��@�|�3|@�6�԰c@�����@��C�8`�@�x���{@�?�$���@��Q�n9        ?��|�h�?�x*sY��?�x��Iy�?��fdD�?�o~ƅ�@@��{@K��	�w@����c!@�7��0@#C
0�Hf@(m�n�= @.N�G�ȕ@2uY��<{@6"W�\#@:0 Y��y@>������@A�$lj@DTm768�@G"tτb@J"!ȓ./@MT�E��)@P]R"���@R)��dpX@T=P�&@VC�f�P@X&��'d�@ZX��e�@\���4�>@_Yz��@`�gC��@b�fnn@cb�B���@d��)�n�@f4����@g��H��@i7	̂�@j����J6@lh)�l{@n�m`c@o�e��"@p�����@q��s���@r�A�j*@s���-@t|H�e�?@uw����@vx����@w~g�>�]@x�b-�@y�b�{�@z�X�B�@{�3	ɵ@|�䢠@V@~
^���@2�b��@�/�Õu�@��~�4�@�c�aq��@� �B���@��g��Y@�B* �W8@���1�@��8؉�c        ?��ƠH�?�����V�@�hE0�|@|�����@$��:�iY@/�q�	P�@6��XC�@>|�5yE9@C�;
�@I#p�%�@O�Xט�@R�����@Vc�iX��@ZL�zƐ@^�����@a�Ŏ�3@c�_&�@f���b@iMji��@l3��:2�@oBC��`^@q;�$�@r�yb�[@t�n�Q_O@v��(0�@xj7وL�@ze��?�@|t ��@~�:���@�dn���@��o�U��@�����@�褝!@�&��
*0@�m��P��@��2Y>�@��.aL�@�vfҠ�d@���6��@�Q�gȯH@�˔	r��@�&�*��L@���R�8@��6M=�.@��M�6@�SD��?@�(�o�7@� �����@���榫�@�����֝@����@�� ��J@�q�.���@�_j��Ǖ@�P�;Cxf@�Etɯ�K@�=���,@�8��h7�@�7�����@�����@��K�H�@�#nL�D@�����        ?�K�㽂?�ڎ̐�^?�#����?���U�`?�µW�?�?G���@
�ҋ�@ܮ揶@���p2�@B�V5i@���T@ U��!�G@#_" U;@&����c@*4��"�@-��f�>@1���*@3+ 6טF@5p+����@7��%�/S@:Y(ASv@<��.�#�@?����I@AP�����@B��8���@D`�-�[�@E���u߉@G��~p/@Ij����9@K7==º@Mf} +@N�U�Oe#@Pzuc��@Q~*�nL@R��(3Z@S��K���@T��NCb@U��ӛ��@V�j��@X)#w\�<@Y^9j"�@Z�:ҟ�@[�!�@U@]&�°@^wxM�7�@_��\��@`�tE�ˁ@aH֞��M@a��D�fi@b���^�u@cs�#��B@d3t2zB�@d�F��@e�P)�c�@f��$դ@gQ��dRr@h!j��V@h�V`�@iɱJK�@j�jKL[@k~-,ה@l\�����@m>�uB�        ?�4���C�?�8B9q?�KlC��?�"�LN?�1�xI@�7S�+@#p˜��@���Zt^@�CO<*@#�sԅ`@)[����(@/�"[E�w@39�C�I,@7i!��U@;\�i���@@��
<�@B���1h@ET;1�>0@HL���@K{f���@N����@Q>�,'��@S(8�~9	@U-N�9�@WM���@Y��Wsv@[�8��t�@^S��@`p��F�@aŗ~AJ�@c'�H�E=@d������@f�eZT @g�e֝�`@i7s ��H@j�Ҵ�*�@l�r�٫x@nO?6�tJ@pY~��@p�B�q�@q�t#���@r�Nݔ&�@s�b�?�@t�%�Q@u���]@w8�&2@x(��(�]@yH/��Z�@zm��@{��r�,�@|�q�u�%@~3#�O@@�eo�@�B/Qn=0@���A=#X@��X6�)�@�8�d^�@����c�@���o'M@�Hk�r�@���Dh��@�����(�@�p�s%u�        ?�"k����?���)_]?�n(��Y?��SQHM�?�0�g�T@y�+�;Q@��T� �@U�Q��@c�̶6L@$nSʠ�"@)����@0D44T@3�-�=�@7u�%��@;�����@@:��H�@B�B�Q@E�mM]�@H�ڗ[�f@K��a��@Ot�B��@QW|���h@S?;*`uC@UA���[�@W_ɀ|z�@Y��yQ9@[�ͥb@^[x�M{@`r�#$�@a�8���@c%3q	�V@d��HNNE@fx����@g��"\�@i+67e�@j�tvP�@l~���H@n;8+U�@p�"��@p�p(r�?@q���@@r�K���@s�m�J�Q@t���O��@u���_��@v�[2jN@x���@y4'�;h5@zY�D��c@{�&� �@|��Ļ�@}���i�@-<<�j)@�8�5��L@��銧*(@��e8�[@�1.�u�@��>:�)-@��7@/҉@�D���@���`��@��V�*"@�p� [�        ?�QI͡�9?��@r�@*cI�@*�[@&��w�Ñ@1��ׅϥ@8�!<� �@@��y�W�@F��f Z@K��k3�@Q2���~@TϽ�Q�A@X��΋�@]E
K��@`�7Y�Q@ca��ӳ@f����@h�m�v�@k꣖�/@o=��!�@q:�#�@r�b�"�@t՟�v��@v�Z��Q@xů�5i�@z�F��N@}	�Ԧx$@K�v�@�Ђ�
�@���
#�@�EEi7@���y��@��5]�m@�@QD�L@���ޔ��@�m��Y@���$g��@���Ś�@��X���9@� KJe9�@��.*�r�@���R��>@��&���@��0h&�@�c�����@�LFF(@�9EJ��@�*�E���@�!
�z�9@���n��@���+�@��Ƀbt@�&��c�@�3t:d�0@�Dd��Ғ@�Y�.�Q�@�9���2@�Ȉ��Z�@�Y�}C�@��)�8@���i>
�@�D�.��@���A��	        ?���S��?��t�6�?ԚXTW*w?�aE�`�?�.`����?�%��	�@�u��@��s�D�@1p7I39@_�
@g@5|@)K%�+@!�8'�@$�e�q�@(,����@+���y�K@/b�b8E�@1�)'-:@3���.W&@5�2=�ǡ@8>�XqM@:�cȂZ�@=-dIo�@?ͥ,��@ADp1�SA@B�f�!�@D'��w[@E���1�^@G>���a@H����AC@J�v���j@LA�}L��@N'���@O�@�qM@P�z�T�@QΎ��ߞ@R����@S�m8Vг@Tϝx���@UۉJ�?C@V��Z
^@X;8�%)@Y ���S@ZBƹ@��@[j��w_@\�ro��>@]�����@^��A�&@`  �@`�e�:��@a`2i7�@b2+��@b��	�О@cVmHy0�@dy��]�@d����!D@ea9�Ȳ@f����@fȓe}�@gd�xa@h8F&h�@h�0�f�A@i����;        ?�׋b�?ķ��gI�?ܪ���_�?�GD�͟?��w�|@�M���[@UT^�,@�n��m!@��hx�-@$�d>s�@)��s��@/�z��@3����@7z}m�Q�@;�MN�@@W�O��@B����m&@E�3���@H����@L*ֺ��`@O���~4N@Q���K@S�P+^�@U�]o	�o@W�߳���@ZI���@\��:���@_>)��K�@`�<Gq�n@bQX�5$@c�\#?�@e;7=� @f�ج^�k@h\-���@j�y�I@k��9�@msy��y@o@��%"@p����f@q�K���v@r{��r_@s|8͍/�@t�G�*�3@u���O��@v�K9p�@w�!���@x��X�@z&A_/E@{01�_��@|b,��@}��}��@~נxa��@�y�fZd@���yͅ�@�Y2����@�,\"�w@��֌�H�@�_&�	��@�x��+@�Œ��'Z@�|�b���@�6&�t@��*H�1        ?����?���Yj�?۷�F�?�#��?��A:j��@�.�?��@	�@;�@ެ���@���Q@#PM�w�@(��`c0@.�	S�{U@2���/@6y[�z�a@:���*�@?C캂�m@B$J��9�@D���e�@G��B�f@J��I.�@NQI �@P�`�l�@R۾�l�v@T�ڗg�^@W v���@Y=��/��@[�c���@^�ₓ�@`P`���@a�+�6A@@c>�E�2@d���-��@f��d�@g���c@i4����@j�?P�@l��>A;�@ne��!{@pe���@q�y*'�@r
H�~�@s
���6c@tڢ�r-@u��\@v4���4"@wP�"n�@xsOq�|�@y��N��g@z�ƺ%�G@|�e�g@}A�X;T@~�-���f@��c�#�@����u�@�<w_��@���F	~@���R3t�@�S�5��i@�@x��>@��#�hXb@��&p5f�@�IA�}�@�m��        ?�[0]�S?�a��O�@p0��@�T���@$"����@.�ϯ��1@5����@=�1%�H@Cb��^"@H�s�K��@NC����@RP#T��@U�D7	 q@Y�ǋv@]�dZ[�@a"Vm@c]���[q@e�܁59@hz�bO'�@k?�fy�@n)U P@p����@r2Ԑ���@s���#@u����w@wa�Ӂ�@y> ��N@{*��ba�@}'�����@4� ��g@���m*�@���*C�@��1��^@�_nx@�2`}�ʴ@�h	����@��C��0�@���^yv@�6�@��M�g6@��� Rh@�E0'�{�@���-s��@��_��J@�IR5�o�@���W�x@���h�@���o�Z_@�U�����@� ��2]@��D���@���ow��@��b�H�@�l�N�L@�G�7�@�$���{6@����Q�@��=�B5@��X�,T @��AT�@���-oæ@��^�e @�ADS|��        ?��G4���?Ž����?��0H���?�B�+|t?��I��m@1��m2!@Cz�]�@J��u��@�Q���@y�n�9@ ?��"o4@#��1���@'3�],"�@+$�ŦR�@/e�w`�@1��e+�@4kb���p@7����@9�4a�$@<��K=�@?�#yf�[@Az��qT�@C*g��)@D����E`@F�s��<@H�bB�@J�W�+R@L�"䰗@Nݏ���@P�7��`@Q���2,�@R�^���8@T�78-l@UM8�ol�@V�K?��@W�E��!@Y<M9U"�@Z�71�W@\K�i}@]w�u���@^�R)�@`9�v���@`����@a�6�p@b�!Y睊@cf#����@d;	��C�@e���@e�X�%�j@fЯ�+�'@g��R	�J@h��s�[V@i��M�#@jw8Nff�@ki��)�@l`V�R4�@mZ;Z�l~@nW�JT[@oXw���@p.[��|@p�*)�'!@q7�5X�@q���e0        ?���~�V�?ʽ��@~(?�AUӃ "?��ӏ�^@ ��'�s�@
�� 0�1@�tI6@q�( @@"q]��@'��^:�@.gx���L@2�7J�	@6�Dr|�#@;��uj�@@C�"�@Cl��|�@F L���r@I:��IYe@L����e�@P5Z>�@R0I�o�:@TJ��5L6@V������@X�����@[V�!��~@]��ބ�*@`S8HGD
@a��9�	(@c9�x�=:@d���y�@f]��!�O@h*����@i��ͥ��@k�TS�X@m^h���@oC�*�_m@p�F|C�x@q�
E��@r�-�SF7@s��G�
@t�c���\@u�[��K�@w~�L@xA��*�&@yv��Nc@z�O+���@{�c�O�@}<�
xk�@~��%�N@�@���@��U��@�R`du�m@���Й@��X���@�|8;�^�@�;P%��@����*y@��+k��@����t@�WḺ��@�&<`e�@���ߊo@�̝�D��        ?��1����?�Y��i�?�
���b?�Wϑ�@�'��@
��C�@�M�[@�D��@"�u�
�I@(I��oI@.����ؾ@3��j@7/�N��c@;�K3�@@lg�[�@C1�q\��@F4n��@It��V�0@L�Q�T@PX8s�FX@RU���N�@Trd�8O@V�?fxp@Y��5�@[�4	z�@^(��	@`h^���@a���s#@cLi�([�@d�O��h@fl���[�@h��A�@i�#��@k��,a�@m^e���@o?O��P�@p�Q���@q�#��:V@r�7�V'@s�*f�I@t�*9�,�@u�6���@v�3��&@x#��(@yRɷr��@z�C���n@{�r���@}
F�<+�@~T���B@��l;Ơ@�~� ��@�-cn�h�@��p�5��@����̄g@�L���D9@�<�9��@�ƛ��@���;�qX@�LH8ϯ�@�����@�ݣ�yj}@�����@�zeo$�        ?�54��'?����]@$o\N�@"�:�)I@/�@p���@8��sO@Ai�|x@G�C3�@N��&��@R�h�F�{@Wn����A@\^�nRH@`��֖K@cۻ��@gnH���@j�Hxk�@n7Mn}��@q�&�h@s-D���m@ue4���@w�a0�\@z2�7Aa�@|Ǒn���@{간�@�&^���@��'��r@�$��R@���ja^%@�]�2
6@��t��@�϶`��X@�����@�y��-�@�1�s�@�-��AF@�0)��5�@�9bn��G@�IA�_@�_���F�@�|��I�F@��*���@��qb6s@��-�G��@�0�U�Z@�m%�D�@���K�3@��i���@�#z�5�B@�ͫ�#-2@�z�7�0@�*��zš@��a���Q@����ׁ@�K���s@�'��@�ÙW�ީ@��͛�@�F�k�hU@���ކf@��� ҥ�@��9��y@�k��V�@�:\ �>        ?��k���?��-�D?��j7��?����3��?�\�|=?����{H�@s޿K@�٥�X@�[�6]�@T�C�[9@���=�@�2\ԫ9@!��ɽ@$�T?@'/��z�@*�C��$@.:t%�R�@1����@35��w@5EM ��@7�Ij��a@9����s@<x�j��@?�}��@@��6���@BX�h�g@C�.��,P@E]S���@F�?�*�
@H�Ѡ��z@JJ��`��@L
l�,@M�=�;1	@O�A�/@P�-EC@Q�4����@RƧ0��r@S�ueG}@Tڐ}�̿@U��0�t@Wo�(@X'lM�a@YL�|UP@ZxH����@[��O�
�@\����h@^�_�`@_`-���@`T%��@`��x���@a�O(�D�@bP|���@b�[Ay�q@c�����@de�9�p@e�30�@e�\�^9@f�]�<m�@gO����@h 1�@hԖ:.c�@i��P��@jc4��u        ?�&�2	�<?�b�}?�ۘ�1?�>�y�q'?�e=>äv@�?t&4_@Zx�O�o@��� hk@#�c,"@"rNc�p@'�
�I*@-_�%l�@1�('��@5�#��I@9Ȅ�&��@>K`��f"@A�̽���@DJj�4��@G/C���@JK�Gm�@M�#��p�@P��$_x8@R{P8� @T{�X˅�@V�o�IZ@X�!�	X�@[,���0@]�L��@`�km�@aq�ܜQn@b؟z��@dM����@e�N�t@gd����@i���@j���/�-@ltnmo�1@nAYT�,/@pWǟ��@q0��w�@q�.jc��@sH3��/@ts��@u�)R
*@v5։�	�@wT�mx�@xz����@y��+�P@z�(��L@|�9h��@}V��W��@~���7@�k`*@����%��@�N��H�@����{��@����\$�@�j��ww@�%g�
Q@����0�x@���9w�F@�g)���@�-׭}�p        ?��%��?��eX�?����1?�u*�%��?�R/�u6 @!i�m2�@{-��k�@1���21@��敊o@#�V{i@(��TE4@/*ۑ �@2����`@6�E5Q�@;!lwM@?��Y�B@BkELV�@E.%�'�%@H(�p+�W@K[Kr��@NƤ�o�S@Q5����%@S$x��[�@U0=��!�@WX�#<�@Y��b�=@\_7HA@^�$�9�@`����/l@a�߈�A@cWB��@d�$t��@fY`�B�]@g�/KA�@i�$��@kH|x��@m
,��@n�#6���@p\+`C)@qR_c.�@rO�Wo@sTg�ץ@t_ii�Uv@uqղ6B�@v�B�c3�@w���8!@x� ���@zTHPD@{6�%b'y@|r��^��@}��<l��@~�E:b%@�'㓜_@�ӂ�5��@��z[=�L@�4�޾��@��_���@��CZ���@�_j�x)�@��'��@��m����@��=0,��@�p7��        ?��"�v�?�&VOw:@c�z7t�@hj��@"@�M�%�@,�����@4"'l>,@;i1E�9@A���V@F�U�V@L<Q�Z}U@Q%���w@T{4���=@X*-��@\����N@`)J���n@bq2Ƣ�@d���O@gvO�ON@j3����(@m�\���@px^E��@q�=�.f5@sV!D�]@u���
�@v檦�S�@x����	�@z�ӎ�>�@|���k�@~�W�UGB@���]Y �@���t�!�@�� �BD�@�Hr�;^@�=?�0�@�ͮXe9@���|��	@�OV�8h@�z��Wp@���1�@�JDFrY�@��yǹ�A@�O��R�@��L��@��&%/��@�n�f^�@�<9{w�^@�[�E�&@��+I�Rv@����|�@���<���@�vH�OR�@�Yp_HT@�@'�Il@�*9��@��Ap��@��G�-@���.�x@����1�@��oȟsQ@��,<P@�wk`g�7@���k@�J        ?���$k��?�0�LYp?Ԋ/\.��?�]��G�y?�-N�.~?�"P�:~�@��0e��@���@)L��'3@Sl*��@�O����@;y
4�@!Ѽ18$K@$�(.��U@(��K�@+�~H2�G@/C�?��@1���0�+@3�A��@5�JYh�@8'��� [@:�����@=��;@?�ϗ��@A5ᦳ#v@B�]�o��@DCU���@E�y�m��@G/���@H�a>�m�@J{����@L5�=�@M���J@O�B)V?i@P���	Ag@Q�}�2�^@R�
3�ZX@Sȕ ��@T��-B�@U�^�L�@V�zU@0�@X	PW��@Y'�)�a
@ZK�^�8@[u��G4@@\��A�@]ٚ`e�L@_���(D@`)��aE�@`�+�E@aqO X��@b�}�@b�w����@cpn�Tb�@d����@d�jIm@e���K=�@f=�:��~@f�&�d�H@g��� �@hq�YZ@i2IQ ��@i�nz���        ?�!� �2?ƭ�1���?�N��:��?�N�"�V�?���ռ��@��s@7�.I@��t�8@ q�iѣ@$��/�@3@*�R�ع�@0�k���@4'�5���@814d}0@<�GǗ@@�>rX��@Cl��Wv@FM!�h��@Ie�xW@L� .�c�@P ��| @R���@T %�٪@V���V@XR��b8@Z�劳��@]EF@_�)��t�@a&C�C�@b�*n��@c�B�a��@ey�W8@g���6�@h�u
ac@jL�FB@l���J@m�ch*^�@o�o$�@p�Gq���@q���<�+@r��R$u@s��o�x@t�J��tp@u�X�{�;@v�$�nm@x�T�R�@y;�2$4@zi���^l@{�ͫ��A@|ؖ!�b@~�KQWG@af�?�@�W���Z�@���\u�@����b�@�_ ��i5@�_�%I@�ț���o@���3�&@�=�\�v&@�����@���X�t@��L�v+        ?��[�Uh?�h	�$SQ?�]�T@�?�	M�Hq?���d �@U�r��@svo�@���}�v@ �".i�&@%��C� �@+�˻"@1u�Pf��@5`Q��[�@9�@�l/@>�N��	@A��aAw�@D��y�@H��5�@KpwK-��@O��_��@Q��.'$�@S�'�?�$@U�D�<� @X#e��&@Z��bH��@]5(�2�3@_��� @af��@b��dt��@dty:�Ѡ@f�5�_@g���9��@i�ϟ޸a@kZx�|��@m=��a�y@o2ƫΖ@p�q8���@q�3\��@r�D\]UT@sԞҪW�@t�;��@v$�z??@wX"���@x�[���&@yظ���B@{%/ƙk=@|y�$p��@}�D�`��@:�I�F@�S���J]@�� F�@�� �tKI@��?��@�Tk�@���b�@��{j�f@��\:�d@���r�^�@�l)�~m @�IJ�M4�@�*6x�1@��mv�@��XD��K        ?�<�A�?��Z�+@
�oJ�{�@�G��$�@&�gɝ�@1g,�@8�_��ȷ@@�A�"��@F$݁#��@Lzc-�@Qbe|��8@UK/̢@Y,cD<@]���@a8�d��@c�d8Ky�@f�eM��m@i��ch0Y@l�hy��@o�����	@q����@s�����@u} ��Z@w~|5�?u@y��֗@{�
�@@~�S��@�.�		Q@�eu�}C�@����hJ@���a� [@�G�W� �@��iD��@�>���@���mD^@��U-�@�����@����@���V���@��+��+@����,�@�]��D��@�= ��5@�!*���@�	��
@����D)�@��b}d�@����v@����n�)@�ց�@��\:a��@���3e"@����j#�@���G��@����;�@���B�@��s���@�28��W@��y�a�,@�X����7@���e�@��G���@�!~|���        ?��s �p�?���h�?��u���?鶱��'t?��s�@ ])?�V@"�RZ@�@�LR�@��%�@��cq@s)7�D�@"?�H�X�@%�i6'��@)�%5t@,�s��@0u�I��@2�ւ��@4���#�@7E����@9�٧�	@<l��
�@?-��
6@A��@B�P,դ@D�� �@E��[F�@GYF��l@I)T7�@J�PS�S2@L���+O�@N��@PA�8�@QAwL<�:@RH#;��@SU�̡Ճ@Tj4p�@U�|�_e@V��2Յ@W�)�i@X�b"�4@Z5�QGk@[q'�Y@\����@]�����@_J����T@`O�I$@`�.���3@a�� ���@b`�d7��@c%&�=@c�ZdF�@d�{
���@eK�ph�@ff�䖪@f�#v&�@g��k$��@hd���t@i1.�tx@jR��@jӼ����@k����@l�0��
K@m[���9        ?�6��U?��fPNG�?�j�$�?����_c?�OQ�#��@. �]s{@�T��@��x<�@8Y5���@"`�}��@'Oj��^F@,�%Zz@1��@5$��E��@9
��@=H/aE��@@���z0�@Cu�6��@F's;���@I
j�qͭ@L�:�[�@Od��j
0@Qn2=G[&@SB��A@U0��bF@W7,!sǕ@YV��*�Q@[���gb@]�L)s�.@`%-�k@af��hn�@b�S�\�@da4��V@et�A�a@f�<9J�@he�M�s@i��xh�@k��`�B�@m*��N�@nٕ�@lp@pJ5c��@q-�q=@rϛ9Ɩ@s��M@s���I@t�����4@u�lӞ-�@v��
"��@x	n��8@y��>@z2��J�@{P,~���@|sGkԼ�@}����@~�v7�b@�|�u"@���i�`@�;�O�O@���h�&@��&:`@�*�1-�@��o��Cg@�����        ?���B�N�?�70��P?ޙT�>?�Ƨ��o?�����@Jb-�.f@v�S��c@��mo�@�#�o��@$ ��rp�@)~����@/�_Ͽ�@3;�cl�@7����9@;DT�A�@?�S��\�@Br��PN�@E)����@H#J�@K5��H9�@N���/�@Q½�|@R�hEؕ@T�@x�4@V��~V'�@Y0���
@[}�wg8e@]�2@`4Su"4`@a�c�/g�@b��W�4�@dJ6��@e���1C-@gF�'۲@h�xFK�@jy��S��@l&�h�1@m�Ŗϔ@o��5�@p��4��@q�J�5�@r�(��S�@s�җB>�@t�ԅ�o@u��$�@v�|�a]@w��!(@y8_;.�@z*o	�@{W0�{)�@|�x���@}�Bح��@���9�@�%� �y�@��<�K\�@�v���@�#�ߴ�@��I�GF�@����\j)@�=KQ'K@���S��@��� �@�t0J6J        ?�$�&�?�o��fgx@�m� t�@�'�N�@'Dʊ���@1�,��C�@9/[MhP*@Aw�6��@F ����@K�I(�s�@Q8��\@T���1@X��%�^�@]j_@�@`ۿ|$�@c[�n�@f�_h-F@h��a��*@k�F� �@ok��s@q:���@r���z?@tڷª��@v�K��Q@xтYϴ@z�?�Z�@}ct-��@d��:Y�@��/ϕ��@�z{��@�[8��ER@��]^{�@���HF��@�a�^�mA@�Ͳ��eg@�C��� @��:r��@�N�����@���Eŧ@�@ySظ@�j�@��@��3�"3�@����ԋ�@��%����@��:�6�@��@���@�po]�$@�e|P.E�@�_I"��@�]O8�T�@�`���@�g,@!��@�r�0IB�@�����,o@���闿K@��~g��D@�fD���@���T��@��$�ju@��4�F�@��MS�P@�L���@��'d�A        ?���2A�d?�?f���?֧���?�r���I?��b�(��?�ɡ�P(�@d�LI~.@t$���)@���V�@[W���x@s{.�@ ���\�@#��0U��@&�����
@*z�bKS@.MD�l@1/�P9X@3YT��@5���3@8
�jbX(@:�s���@=;��K[>@@��D�@At蔒�@B��"J�@D�sս�L@F,tõTY@G�۸���@I����4�@Kn�-��@MM���R@O<}&�@P�K��@Q��3���@R�s�yd@S��x.8_@T�$�@V oSb@W3���@Xf�Ľ�@Y���4�@Z��FApH@\+�k��@]|Q��.�@^��� _O@`o�F 4@`�y�n��@a���@b=H�MX�@b�	i1�@c�X����@d�6�2�@eI��`}@f���ӭ@f�/�nLA@g�L�6�c@h��G�T/@ii$K��@jFҡ�5�@k'�j4��@l���A@l�{R�@m����        ?�^���޽?Š�$x$h?� �wy-�?�s�Z�%�?�Cc�H�@m0�w@�nښgb@w����@��[�{�@$����@*I�#�@0W��i��@3�A�`@7�>q�?!@<g��Rd�@@���/��@CH�]��r@F&>��(@I;�Ǹ{@L�Ās;I@Pc�Ě@Q�Xأ�@S��ҫ�@U����6@X.�9�X@Z~���[@\���S@_rH4�x@a
��#�@bj_�@cׇ)|S�@eR>�v��@f�k��e@ho�T��@j�G*��@k�r@mk7��@oI-��g�@p��±�@q�yԗ��@rya�=@sw�����@t{ڜ�&@u�S"к�@v��[z�@w�|\���@x�]btv@y잔o��@{9�mC@|CZ�q�J@}wu~��g@~�Te1�@��.$��@����DL@�@��"�@��̙�1Z@���x���@�A�梭�@��BAL�@��P�7@�[6w�~�@��.��@���d���        ?��"����?���!?���_?�N�a?��g�go_@�-��0@k�`@�7S�$�@������@#ms|�,�@(�GO��@.�;|��@2إ���@6�W�$�@:�tot��@?�r��@BL� Nd&@E	G� �5@G������@K$?�TK4@N�4)Χ�@Q[
�V�@R�q,��x@T��@�@W�\�*Q@YH� *�@[�t�TJ@^P�E�0@`J�VQ�@a�j�Jע@b��4��#@dk��ʨ@e����LU@go��A��@i>��L�@j�	�Ղ@l[9� W�@n�����@o�Ug�f@p�>Ue��@q�P���@r���)V@s��Ŗj@tҸ
�@u��r�xV@v�\A	R�@xMy��0@y-���O&@zTC��T�@{�5���`@|�ic���@}�ӎg�9@-h���@�9�HX�=@��qa��@��W,j\u@�49��5@����c�@�����@�I��$�@�r��S@���ix�@@�x�ay��        ?����?�D�st��@
�B|�v@���'&@&�G(FI@1X6s��@8��%~8j@@�1{]@E�63Z�@KکĨ}�@Q:�Kz!}@T��x]@X� �@]TT�BJ�@a+$h'@c��5@f\�����@iK �V�@lhC��R@o�� ��@q�C�L��@sk�*@h�@uW����@wZ�:�Y�@yu)�o��@{�����@}�C�p�@�'a�P=�@�b�Gj�X@����@����M�u@�W��D@���dU�@�3!L���@��k��@�:�G�y@���x89@�m�A��o@��rhJe@��$n�@���Ҝ�:@����y��@��
0��@����\��@�yw���@�s�).[2@�r�ھ��@�wr|,�@��3�fV@��'8�04@��IE0�@�����B@�� �F�@���L��)@�7u��@��&)�@�D�cV�"@����%�@����@� �]q�@��u��k�@�iB�`c@�n�b��        ?�k��;,�?��A��0?�آC�k?�Ԝ�?�m4��T(?���LôA@ք�e�@	i$;B1@~p-@ǄH7g�@��+(�Y@���v�@"PO;/aJ@%s�2
�@(�{�ڡ�@,x�80�@0-�!Aq@2=^��@4mR���@6��,�p@9,&%@;��<%�Q@>i jeO@@�k&�[@B�>.�@C�s����@E.w&\ڈ@F��4��@H�6q k^@JM�[JX�@L!��%�@N�ȝ@O���<��@P�z�S@R[֎p�@S�7��@T.�۾�@UN���@Vu���Z�@W�G^��@X�5i"�@Zj�%O8@[[��Ν@\�T=�I@]���PPJ@_S[zGQ@`Y�7�[5@a��W�@aČ�Mw�@b~���0@c<���.�@c��WHo@d�A�g��@e��Zn�@fT��e�
@g#B��n@g��M�>@hɏ��@i��E9��@j|��X2�@k[=i4@l<�1��@m!X�-         ?�2߸�r4?Ƃ!��^?��_Z�9?�B�t�D[?��v<@�Wv@���,�@��*Բ@ ,���@%0<X"�@*�$���@0�+}�H�@45+�ҌU@8<z���@<���j@@��e%�@Cin	w�@FDjy�}�@IVc({��@L��%.
�@P7��@Q�z��@S䭿�uv@U����8�@X)z���@Zucq0��@\ݺֳ�@_b"e�{�@aL��@b_��d@c���*�@eF(j<I@f�y �|@hd��ćl@j	PtQ�@k�=�0��@m{R�C@�@oI>R{Z@p�x�R�@q�.�v�w@r���g�@s��d%�@t�'�,�b@u��E�pA@v�}� �@wѧbHǯ@x�m���@z�E|W@{P�MӇI@|�����@}ŲE�RE@	�k�p@�*%��U@�҅�˼�@�~����@�,���K`@��N[q�@��W�=�@�J԰�F�@�����@��r�/�@��>�Gp@�H�b^�        ?�4bw�4?çR�!��?ۅр8�|?����5+�?���ͦq\@��;V�l@��L�K@��C)@a<����@#2�V|
@(l#4k�v@.bfZ���@2���@6Ka���:@:m�Z`N�@>�ic�@A�x�$-@D�����>@Gz+T#Z@J�*�E��@M�yX�r�@P���ͣ@R~)^��@Tp
���q@V|@>IԎ@X��).��@Z�XAu@]>�Kw"�@_�d��П@a"�\�+@bwc�@c�&����@eHH2֡�@f�jm�jG@hM|��ƛ@i�l��}@k�"{@\�@m5����@n�3{[@p]�AY�@qGy���k@r8�� g@s.�p���@t+yu��@u.'�΂�@v6�ꮲ�@wE'��U@xYWR+!B@ys9�]�E@z���K* @{��ѳh�@|�a:�>�@~]0�W@G�|�@�A)�+�|@���
�@������
@�(�UueV@��6!�O@�zDR��@�&ƽ�~�@�յ��@���1��        ?�G
:5|?󱽤O�@
�(�@�=s�R?@&
݋tۤ@0�m���@8+���@@i��?�@Eq�E�@K.
%�@PЋ���@TeItJ�@XU�x�%@\��r�,@`��
�94@c%Y[��G@eԫm%��@h��=<�R@k�����@n���~��@q.�HG@r�B���@t�I	�@v�,�;�@x��p.E�@{r)���@}A���@��&q[s@��&A��@�?:�J�-@�����:U@��4�F�Q@�C����@��G���D@�(�"�o@��88�7@�:�e��@�Ԕf��@�yCPebA@��l���@�q�'f��@�T.��>�@�<
�G��@�)&���#@�u�ש�@��AO.@�{����@��x�
@��H��@�#dz=��@�3�#��N@�Ij�1�@�c��2L0@��ދu=@���C�p�@�g���k@��r�Bv@��}�Ug�@�2��[��@�ЅY@�pwq��@���l�@��)Z|�        ?��|�:�?���=�9�?��7z�]g?���Bk?�<=��!?�����@�<��t@
_�(4�@	1�l@y��y}@^��E�@��z��@"��B4�@&	{2I-@)}3N�c�@-0�U�w�@0�A@3WJ@2��#��@4�I�@7=�o�p�@9�٤��@<Mj�Z�@?2J"^�@@� B�f@BgdF(g�@C�3�1h�@E�^��a@G2�C-�3@Hꄍ:��@J�bВ��@L�^,�q3@Nlf<�r�@P04��-�@Q1���1@@R:�N�@SJ�4l��@TbWh -@U�6����@V�[d�4@WԽ�e �@Y	W���@ZE"^ޔI@[�d��@\�B��@^#�,O�@_{�:��@`m�K��j@a!��C@a�����R@b�c��q@cP[a`N�@d�r��@d��5�{@e���I@fk�9ݢ@g;Wױ�+@h��c;@h�7��@i�g���|@j�@A�E@k~;��C�@lb�f�K�@mJ�>�b�        ?�[�Q�d�?�gSte�?ݖ�95��?��K�=?��&��@�Y�@[p�{Q�@ ��S�t@'��q@$=gSe��@)�SU�@/󻑟�g@3}UT��@7g�C�C�@;�ĝ"��@@<���o@B�_���@E��
��@H����@K�.*Hq�@OCUd"�@@Qt�c��@Sc���"e@Unp� @W�/���V@Y�� Iͧ@\2���i!@^����EZ@`���Y�@a�E��v�@c\ZP\�@d�㘫j�@fN̢ �s@g� v�L�@ivjo��
@k�V�[�@lҐ=Zz@n�$521@p1N���q@q��ٱ�@r�^��@sD)��@t��V�/@u��@v!�f�g@w4���@xM�|ˡ@yl۸iR\@z��&v��@{��&,N�@|�nV/)�@~#�-��|@_��8�@�P̒dK.@��h�� @������l@�C�؆G@���r@����e@�N����H@������@����2G@�q����        ?�W6a�?�>g�X�?ݳ�Wi�k?�.3ǅ�?���S�@4�q|@}��tAw@/�{�@Du�=�@$e1�2�@)�+�̈́w@0�3�X@3��GIk(@7�{
+��@;�5��@@Z�͜Z@B���^W�@E�m<S�@HɥaZ@L��@O{(��s@Q�W�G� @S��U�y�@U���*�h@W�'V�Yx@Y��q%�@\]^z�v�@^��;�e@`��kޔw@b�
�&@ct�B��@d��[A#K@fh=����@g���1.@i����Hy@k8b��2�@l�9Ѩ�|@n�u�9@p>�O~^6@q,�n^�@r �V|qk@s��~!@tz�Z�@u"@��QG@v/+n�# @wB-�)�@x[9��E�@yzBj�S:@z�9/��@{�:��A@|��Y1�z@~1&�0�@mGИ�X@�W��7@��7�G $@�����r@�Jށ(�@���b��g@��c�oA@�V�8�@�
�
~��@��)"�p@�zVe���        ?м�S��V?�)���t�@
����G^@cvD�\�@&b��8j�@1&���P�@8��N�T@@��'�3�@E��f�N@K��n]�@Q<��L�@T�Z*��@X��w3co@\���Qc@`ۚ�sܷ@cf✸:@f!)�4@i
l�Q�*@l"�8ܶ�@oi��ye@qo����@sA��[@u+px��@w,��׼@yCۮ��@@{r�~3D@}�=r�޸@�
U�%@�C�Y��@������@���HN�@�3�y�Kp@��A��P�@�}��@����mߙ@��2fO�@��c����@�<�e@��/�Ƶ\@����X@��e�Q�@��8߰@�v���'@�dM�B�@�W��qn�@�PÌ��@�N�gy;�@�RN���@�Z��~�@�h�?�.@�{�L�N@��?\-^�@����d�@�Ԁ��@��iz-�@���jq��@�-��*��@�ɋ�w��@�g���V@����Z@��[��=@�R���A@����ω        ?��g�
Uh?�2����?֛��fj�?�g�����?���r�"`?�����@]l=�'@j�h�47@�<$Xա@S�O`�@iD9S�!@ ��[�ۂ@#�!˒�@&�$��j@*ju�2�@.8���)�@1#���@3IC���@5����g@7��ʗ��@:u�p��*@=�:��@?�zy"�@AZ�Ðt@B׶��66@DdB�C��@E��n�n@G���J@Ib �"K@K)B�k"e@L���˜@N��a=�f@Pj����@Qk�WT�@Rr� aQ0@S�#�:?@T�ϙq	@U��B:w_@V�N��0r@X0���@Y3���H@Zl�GP4[@[��H�&@\����{@^A�@�T�@_����@`y��@P3@a+%���@a�=1�A@b��զ�.@cT�qG}�@d~n�@d׉����@e�i9��@fh>�c@g5x���@h[��I@hګ�"��@i�`��@j�n879@kk�445�@lMhg��@m2=�:!m        ?����f�x?��Q�ߛ�?߀�?�k3\�?��XYz@8/]'��@3�]�@#��V�@ ?���@%)��~4@*֟oÂ�@0��'K5,@4IH���@8Uſs@<�	u`V&@@����O@C�\=ޓ@F`M�X�1@Iw�x�@L�vaК;@P'�T���@Rl,�5�@ThG	�@V|�N:@XO��#C@Z����S�@]�>j�>@_���h@aА;]V@b{v]i��@c��B&D�@ec���� @f�G�Ո�@h�0����@j%j3�l@k�؃�U;@m�`*q:@o]�:�(�@p�����?@q����@r�=خ�Y@s�
Sܤ�@t�"bQb%@u�~�;�M@v�joҌ@w��2D��@x��m"@z $�*@{*�O�@|Z���o�@}���7!@~�[���@��H�0@��	��@�T�����@��8���@���!~��@�]�:�"	@�pxԘG@��Q̿^�@��E ��\@�?J��	�@��bY�,        ?�J1_n?��j�|�5?�.x7>��?���s?�/�X!$@�/m�o@j} `R@��r(�g@}�����@#�:��@)2N˺��@/B��(k�@3	Rmi@o@6�[o��'@:��B^X�@?����$G@B?��%@D��F@G��8��@Jܪz(�>@N!�>�^@P�6�e^@R�#�M�@T���<�@V��ʰ1P@X��g�d�@Z��ή�
@]Q��tvI@_�d�`H�@a%1ՠ_@bvOyLE@c�����@e>*��@f��G��@h7���Z@i���$�:@kbs�Q��@m
��@n���pZ@p>���y�@q$}?;h�@r-�I��@s��|,K@s�|�-G@t�>�?�@u� IFe@w�g��w@x����@y#Ƨ��@z=3��I@{\,���@|��û@}���7�@~���@�kX9��@�����U@�DJp�hf@��٠uG@�����S@�3��Dd@���>.�@���4,��@�::a�~        ?�)�&��~?��*��@�C�ͪ7@s3�
�@(�ǌҷ@2w��"�&@:[y��wn@A���/��@GPV����@M��`?w@R;���@Vb)�N@ZP$<oQC@^�0lON�@a��J=@d�x�3<<@g}f>�9�@j��� ��@m��X���@p�|U�(�@rc����@tGE���@vA�7�@xSO�� f@z{���@|���Ɨ�@�<G�>@���O?��@���,9�@�J��F"@��)Q�@��[�@�n�Ҫ�@��8.�,@�fUB��8@�����p@����Y@�'��:�@�i$ԃ�@�Co�ѓ�@�"ϊ*��@�?�5c�@��Ò.�@��C0f�O@����'�<@��_�#�|@�����@��}�,Y/@���hA�@�߄�i�@������@�XF���@�"���{O@�B�6��0@�4fG�e@���@�`��c�@����!�1@���'w@�5���rQ@���/	�@�z��v @� ��0h�        ?��+��<K?��U����?؜q���?�G8'��u?�k.NQ��?�x3��k@�+@�K�@��O��@)�#���@��{�(@���	J@!ٱ��ZJ@%,S��@(�CE�Z@,�V\t�@0j��?�3@2�^%~@5�� $@7���rD@:%����@<�|Ï�y@?��1/@Ar��`{G@C
���@z@D�]*�t�@Fn�f�&@H:_��V@J��B�@L�JE�"@N|8��z@P�U���@Q���@R.!Y[�w@SMC+ST�@Tt:M7��@U�鹞��@V�4c��'@X��$s@Y\.3:a-@Z�����@[�Y4l8�@]W$<�@^����@`ۓ���@`ȫ��YV@a�⽌J�@bBw���b@cch�3�@cɞh-�@d�!�G�c@e]�i�@f,��R�@f�89��@g�o�'�@h��
�%@i��s.�@jg@�`�y@kI�	��@l-�:�6@m�/V�@n ����@n��Us��@o�	t{.%        ?���+eo�?�-f���?২gՇ?�bj�x�?��<xN��@���[�@MAv�@��Mi�@!U�����@&����L@,�8&0@1��f�b�@5�����@:��I�@>���X�X@B_X0@D�j{@G�0M���@KIu�{��@N�+�@*@QJ�TF^�@SI���@UdX���@W�@����@Y��}��@\as.@^�b�0#)@`ʸ�y_(@b,u�+"@c�Ǝ��d@e�@VP�@f���M�@h9ć{�d@i���=ȇ@k�K�I�@mL�>R�@o7����@pw���;@qh�嵥�@r`qJ�.�@s^E�:c�@tb--V@uk�y@v{��1'�@w�-���}@x��5;0r@y͟�c�@z�g#b��@| �N��@}R���1@~�Q�S��@�Jz�P@��ն�l�@�(�J���@��7a#:�@�x[��@�$`��,@��m�ɴ�@��P��2@�6��G@�쯳�:@��!��0:@�`f�        ?�"��O�~?�/l(��?�1	�>H?�M�U�?��
��@K�ɴ!@R��~��@aze��@ r��Z�@%v:�q�@+B�e@0�V��'�@4��(�:�@8���ؔ@=H����k@A�tU<@C͂#v
@F��f��t@I�%��ۿ@M�6��@PQණ?@R. ���@T%$����@V6LZ��X@XaA�>�@Z��G1��@]��yY@_z�W�2 @aT=6�@bY�T+:@c�"��P�@e&��N��@f�W��w�@h#�+�6�@i�6&A�@kO��P\@l��z)��@n��bۂ�@p4u�n?�@qS\	��@r�*���@r��j#�@s�1M�@t���ò@u�d~9��@v�� ��@w����@y��:@zm���,@{:�&�@|[	��"@}�8v�eS@~���_iL@���0@��^IМ�@�&�C��@�ƋL�@�h����@����'@��ۄ��d@�^~E���@�
�L�<�@���J�        ?�U�O7�?��Ə��A@�g��@lZL���@(�w�m�4@2��g,WF@:�>L�q@B;�ÆR�@G��,ׂ�@N�DR@R�mV��>@Vh0i�m�@Z���p�@_Q�8l`�@b+j�长@d��X�f@g������@jү��΃@nD^ED@p���@r�P�ږ@ty`I
Z@vwz�#@x�w��{I@z�j�M[@|��T�K@RV�Q�@��MF�@�"Y����@�o9�v��@���Wb��@�)��@���L�5Q@��.��@��J���@���~��@��"�9�@�NW�@�{��K�@�T��=��@�2�~�N@���N�@���8��@��־9�@��K����@��9Q��@�Ǒ�Vr@��G��$�@��N�w��@�͙����@�����@���x��@����xs@�~�n9v@�� v�@��/p5+@�6����@����Ɉ@�_q�T.�@����Uּ@��ul��@�+.�47@��A(�        ?�K\"�3�?���&�lF?��A꩏_?俁 ?�^(M�?�����2=@�[����@	~�Z��@�ek8)�@��~�@��\n�X@�y̦h�@"W	���@%y���Q@(�h��E@,w�N�@0)��c�Y@26oBg�@4a�X-�~@6�C��g�@9QǍ(�@;����!@>>=s��@@�kFf@A��J4�@Co����@D�|���@F��ߡ��@HD��&@I�bA~l�@K�9`ǯ�@M�V��p@O�����@P�~���@Q��N���@R��9{~7@S��ۿ'�@T�����@U��{�>x@W"2j=�@XK�$�s�@Y{���`�@Z��ȃ��@[�}����@]4��<�@^����@_��q59@`�@�W'@aCJ=+$@a�~��R�@b��O�u@ccV�Pϕ@d�ʗ�@dݩ���@e�w0|5�@fdU�h@g,?m#@g�+��&�@h�w��@i���T@ji��?F@k@:�%��@l��{ �        ?�.��Li?�ZGV2?ۼ׷�$?��?��9���@�{8tҏ@��.q	W@�Yxm�@^��Ĩ�@#2���
@(p=��qZ@.n0�a-�@2�QϺ��@6aad[��@:�^X�@?+�7��J@B�=I>Q@DѽK�Q@G����Fo@J�s��@NH�7[�@P� �e�3@R�GS*@T�'����@V��9��9@Y9a��P4@[��m���@^���|�@`L��<S3@a��O�v�@c	B�]@d|A��Cq@e���Ϗ�@g��#�3�@i*9W��@jՆ�/C�@l���� @nU�%� �@pb���X@q�Bcˤ@q���/m@r����)L@t��@u`����@v#�B��*@w=�Ţh#@x^L2�-�@y��E;��@z�T�!6�@{�sHŏ@}"v��&@~c�n�?@�bX��@�|���ƣ@�&�,ի\@��7�v._@���.6�@�86����@�����@������S@�e<����@�$�6[�%@���-��        ?�F1�cf�?��0?��#T�c?��<��?����>��@��2��u@�kRi�A@��:Q�@4��W�@"rI:�ؖ@'{��C�a@-<=��y�@1�8���x@5z#�V�@9y�)��@=ۨ�	@AP�P�v@C�9[�M@F�R��'7@I�j�?a7@L׻Y��@P�U�`�@Q�Z�� �@S��c4��@U�$g!��@W�\�=O
@Zz$N��@\`v��4@^�F�t@`��Z�S�@a��J@cH슂a@d�pL9@f!��F��@g�K׎@i,��g�@j�+���0@li���h@n�-]lw@oל0�'b@p�[��|?@q��)�@r�lں��@s�٘x�@t�$r\{@u�@G{(@v�!s��d@w��<X
�@x��U9��@y�ؐ�6�@{ ?��x@|$fx�-@}Mh�/�@~|
*�c@����#@�t��2V@��e �@��Kw9�C@�YoN1��@� +Q�@��	SKV@�Tl�b`@�%���        ?����m�?��w���@R4��ā@9���@"��E�!r@,�H˯8@4�w�L@;�V�A�@B;yň�@G�Wc�@L��ϖ�j@QF��vPh@T�AA�~@X0��>�@\�\̒^@`"��w@b_�^/4�@d��*L��@gH����,@i�P�P�2@l�m��O�@o�0;�@qh���	@sv�=%�@t������@vz8�j�@xN8z�+@z3�) �a@|*�
t�T@~3S���@�&��;Mo@�;���@�Y��ު@��{$QDN@��l�m2%@�����U�@�&w��%�@�n{)�k�@������@�S�a6@�x����@���:��@�R%-�M@�e�:�@�&AÔ�@���򵴷@��S���M@��ヮ�@�P �X�?@�$3Wm5@��y{z2@��ű�4@��D2I��@���44�\@��y]��M@�l">�b�@�Zs���@�Lcٽ�}@�A�	��@�:�$��@�7j�aA@��y� Z@��H��k�        ?�����Kn?����h��?��K!N!?�ں0
8�?�E/{�;f?�V�W��@�
ԃ�=@��XV@5^_,�@�'ƅ�H@/@3 h@ �|�[@$'��6up@'���cT@+Im"H;A@/?��{j?@1��R��@3�����@6[��x@8�Q�0.�@;�� ��@>C��A�@@�i<���@BC;Qp@C�sIC�@EM�Ó� @Gx����@H�p�t6@J��l�%@L{�`��@Nn�IL@P8�L!�@QA����@RR�k]�@Sj��@T�~9B~�@U�e�pWn@Vޮ�]�D@XO���@YQ?�ft@Z�r�b�	@[��c�P7@]3w9yd�@^�*vI�0@_��yc�@`��ux�:@ab"Tm��@b���
�@b�k��9@c�����J@da���c�@e)ы8�f@e�t�{��@f�m�t�@g��\��@hlNu�f�@iE+/��@j!Hn��@k �|ɹo@k�'��@l�ۜ?%@m���ڵ�@n��򥇛        ?��h�S6$?�4}�!:�?�����	?�U~'���?��@ṣ�@���0��@)��*n@��ѥ@!+�ڕ��@&`MS��@,e&Y&@1����6�@5{+n�P @9�Y�ƃ@>�i��5@A��ɽ�@@D��k�@G�8]��'@K$��t�@N��[��@Q$)����@S"����p@U?���y@Wy�T�E@Y��&&P�@\JGS��@^���so�@`�÷8�H@b2���ح@c����@e1{K�A)@f�F����@hk��I#-@j\>�|�@kሃ���@m�a���@o�؊-6@p��iPT�@q�2���c@rî���@s�Zߪ��@t�/WQ��@u�#�t�0@w!/��8@xJHw2$i@yzf{��@z�_&%�@{�_~@}4{�́8@~�L��@��i�7�@��4vD�1@�FP����@��ɘ�h�@���r�S}@�j��Q��@�(.�l��@��瑔Q�@��㾅An@�t)�]0@�>���_�@�9i�/>@������        ?�\��ɲ?�X��dz?���R�"�?��MwB�@Q�<���@��}?�@HZ�>g�@X7���@# ��(n�@(���n�-@//���@3J⍣^/@7q%���i@<��ߗ�@@������@CU�A��@FX���@�@I���!��@M�*B�@Pk7��4?@Ri�üN�@T��zB�.@VŇJ�7�@Y#S<˅@[�'��.@^?!���@`~�	��@a��}9�@cm)��g@d��u6]g@f�G�*@hLT`b,@j܍ ��@k��^�\�@m��z��r@o���)1�@pի����@q݆��|@r�P�Ug�@tls��@u$���>�@vL#S�P<@w{}?1��@x��7��@y�îI@{8F�*�@|��"��@}ܠ��O@:2#��@�O��%�Y@�� x�@���D�T@�}�֜
�@�>��n�@�۞C��@��kH�4.@����..
@�hB�V�@�;~)M�@�<�W��@��yRA7�@��.졈N@��Y�ܽ        ?��� ��?�?�^S�@;]
tx@!@���@-�a9n@6;"���@?2�b�@E���KH7@L+�Z7��@Q�Yц�p@V�I��^@Z��ܿ׌@_� ��\�@b�*lPt@e��@E�@i1ȔqH@l�O1�f�@pAϯ,��@rC�#ʔ@td*�!�p@v���'��@x����$�@{z�:9�~@~���ak@�eQ�\@��Ȉ�@�I'3���@��`����@�hd�@?@� �N�@��~�o�"@��f�_�@�V�Z_@�6|q@��@hI@��_-��0@�����W�@�����eU@��-Y.$@�χ�%H#@���O��@�E-|�I@�H��:�E@�~ڱZ��@�����}@���tGf�@�J��(1I@��N2_)@�zE@�)��r@��r;���@��t�2��@�K����@�.�s9@����$��@���D�\@�P�3�	�@����@��eJK@���~(/@����@�\?ί�"@�4`�A l        ?��y�Lod?�h.� �6?�f�`�f?� �� ?�˦X��?��Uf@4�泂^@	�5��O�@˘�^@&�>��@ �o��*@[�m5@"����I@%ǣR�UV@)3����@,�ǟ>E@0df���@2x��x�@4��-v9�@6��	�#�@9n,�@;�p<��@>�uu��@@��f��@B,�@�%@C������@E?Y��q@F�sF� @@H�ݩLѳ@JG}MzW�@L9��:@M���} �@OιM.š@P�,&N�<@Q�弓}@R��5YJ@S�����@U X��@V)��]@WK�۱��@Xt��|@Y�1c��O@Z�5�g�g@\��x�M@]Yay%S.@^�s�uS�@_����b@`����M�@aQ�WI�p@b���F@b��p�wG@cm��[k]@d('r*R@d�b���@e��̶rL@fh�y��@g/>`K@g�n���@hą��5�@i���R�@jea��ǿ@k:}��@l��TE�        ?�.�M$�?�t�q|?��`��V?�:/X��?���ZVqf@~I�x�@�)���@��l@ ,;KTI@%��J@*�Oww�p@0��s�/�@4=p��e@8H ��@<�&l�!�@@��+ȱ@CusM�إ@FR���Q�@If�+.h@L���î]@P�r�@Q�	O�s@S�+� �l@V.X�	�@X7:?}�@Z��SG�@\�r�2�@_p�<	@@a��Γ�@bf�a6]�@c�lf?(_@eL!V��@fӨV��@hh�# )r@j���|@k���T�@m{p[r�b@oG���T@p��F6o@q�k�7�R@r~�4�@s���@t��%���@u����@v��
5�{@wǻ�vƵ@x�E5�@zit�?@{C"���@|yg����@}�1��@~�w�"��@�!�{��@�ɦ�o�@�t���k@�#H�<�@������@��o��2@�A$;��Q@����M�f@������@�zv}��4@�>:��        ?���&�.�?�y��5�?��oST�?��u���?��j���F@	q�㫄�@�|�1�@����j�@!�ޑ�*�@'`I��*�@-�S�F�@2rQ��;6@6����@;E��2@@ qH��@B�#�A@E��rP�@H��ٕ�]@Le_S��&@P59�?�@R	�꾸@T%F���@Va'i�@X��a,@[9i#1�@]�y�@`I� +Z�@a�%1@c6��]��@d��3k��@fd�w�r@h���66@iҲ�B��@k�����@m��* S'@ooav��@p���|��@q�-�Uk�@r�3qS@s�>���@u��z�@v(ߧ��@wVЖ6h@x�^�KB�@y�|ٌ��@{0Ӳ�@|Z4�>�@}���xV0@����U@�5S��2-@��%�s�@��H�� �@�^!El&@��4�#@��n���:@���j�j�@�p�>i@�>9�V\@���t@���3q�@��v.��@��Q`��Q@�s{�/��        ?�����?��6�Q@��q��@o:-Cɻ@(��m���@3y8z��@;CV-^@B~�	͉�@H$O%��z@N��l��@R�m|��c@V�8���@[O+���@`��^��@b��S�@ep�|ZA�@hnc��@k����@n�ĐP�@qG�=,�@s)H`	ӆ@u"�*�m@w4�9��@y^���GJ@{�\��}�@}��,0GE@�5���B@�y���z@��(
>O@�%����@��sSVl@���x�{@�~T)*��@�$�+@��[�� b@�=�Lg@��ē���@�Pfa��@�1u�-Q@���&�@� ����@��d>�~@��"�"��@��3�"��@���E@��(�e�@���M��@��~f6@�#>���;@�>��&��@�_�CE[@����֫�@��6qX?5@�oh�g�@�	����@��{��<f@�E���(@��iK�|�@���r��=@�2�C�@���-��@���i�Y@�4JQ��        ?�H��go)?�����,�?�H�ݲ�?�,_���??���1�p?�����@���\�@	��l@N,+ғ@��8FF�@`�ۙ.@@���+@"A��{�@%m�7l�_@(܄?Q	M@,���ݟ�@0A��(@2\�^� @4��^�-�@6�@���@9x+���{@<��4d@>�w̙��@@�>t��@Bb��lC@C��`�l.@E�I�+M@GM�9s@I#�#��@J�_!�O*@Lɴ7 �@N�Μ��@Pa-�ޗ@Qk@��@R}5�|�@S��Ω��@T������@U��S�@W�s�0@XK5�~֐@Y�!�fx�@Z�s���@\!�+�]@]w@5Ϝ@^�@����@`NӰ�@`�	b�c�@a�I�X�L@bH�Hu@c4� m�@c��	c��@d��	?�@e]8�9c@f*���D@f���9@g�ю	�@h�;%F�@i�۰���@j_�o��X@k@�k��@l$�:�M@m Z��8@m��� b�        ?�����?�
>��)<?�k���J�?��}{P?��t�u�@�"�ջO@z�1Z��@�j7&�=@�7d^)@"R�}�@'N�2��@- p7z �@1�E�N^�@5K�ľ̹@9B��+@=���R�@A-�q�bN@C��+��@F�ۮL8O@I��r�@L�y���~@P���@QӽZ��@S���,�i@U�ٚ�'@W�]���@Z�m��>@\]q ̻;@^���h@`��)w6�@a��
�Ó@cU�'j��@d�Et� @f8(��C+@g��V
G@iN��Z@j��>Z��@l�KV�Wa@nQ�af"�@p"��@p�+�@q��|�@r�^�:Yw@s�F��-�@t�'�OH�@u�����@v搘A�A@w����W@y��@z.�]�z@{R�jq�@|z�)�q@}�J+�@~܏EA<7@�
�t�	�@���9�@~@�KP�r�a@��uPwQ@�� ���@�?@�^�@���+i��@���ЛyQ@�I=D6l        ?�+�|<�+?�>] ?�r���C�?�'wk{Eg?�b8�J@�Zݍ}"@RiX:yC@��C�@S���H�@$��@;�@*:�:W�s@0_"4L
@4����@8.�5w	@<�;~���@@�v�~)�@C�`�d@F��M�4N@I��RZ@MQL�@P��#0�@R{�* �@T�5�riQ@V˖9���@Y"��@[�����@^,t���@`p:uI�@a�p.�>Z@cR1���[@d�L�� �@fq�.��@hCl��F@i����I�@k������@mf?�dՉ@oH��A�V@p��?���@q��snNK@r��}���@s�l� �@t�w����@u���b�5@w[�wD�@x1��� @yc0-t@z�!���@{�p�d@}����@~k�YOQ@��p���@������@�<Oy�@��KU�`�@�����&@�_I�@%�@���R@����qp@���kߣ�@�dҽ�K�@�-��d�@���+��F@�����        ?˵�b��?��a-ᷗ@U�M�E�@M��'k�@"�T0���@-#�/��6@4ْ)~�y@<X0���@B�j��(�@G� .� @M�V��@Q�j��@Uʸw��@X����K@\圎5��@`����M�@b��.�O@e{��"�@h$��(OV@j�$�^�@m�Ф�^�@p���	�@r-�|x	u@s�x�a�@u��e�@w�o��C@y�_���@{���X�e@}���e$@��ΤŚ@���,�@�6�R��}@�j-���@����xq@��H�<�@�<��d�L@��2,@���}��@�a9Y���@�ԇ���s@�P����X@��3��i@��.�_.@�{�"�(�@�J�0���@�k=PM@��.��@��`��d@���Ru��@����9�@�y���u;@�d���x@�S_br�@�Eۓ�Y@�<�ܚ�@�5�N��@�3rSS��@�4�E�D/@�99�)@� ��Re�@���|d��@�.5�Q�@����͖!        ?�2k��Ԅ?��ތE�?��z��P?��I�
?�Z��?���{�@���I@	��cf;@��ލm�@�Ŗ�m�@�}kG�?@���f@"\���^@%t2jQ#@(Ƨ�k9q@,T<�ã@0֢���@2���T�@4,0�2�R@6fm��;@8�E�ª�@;0�R�Xx@=��no�g@@6u�M@A���ׄ*@Cml�9@D�T�r^�@Fw7<�@G�b�7qx@Iam[�@K<<>@L��O�B$@N�,${Y6@PG[��@Q=��o}@R:��V�@S>`
i��@THD
ލ@UY#OHr@Vp7���@W����@X���O��@Y�V���@[у��e@\C���@]�z�~�D@^�e���@`��bV�@`�/E�@a[�UIV@b
T��'@b�]��+@cp�(�@d(� 4 �@d�Ż��<@e���?@fb���N�@g&]��U�@g�-��6@h��"'@i�VSp+�@jR�>�tM@k%��e4        ?����S'?Ĺ<�c��?������?�I�q�?�
�|�Rn@�Mmn֛@*�����@���@�3�5��@$%��Lo@)�C�:�1@/��H���@3,�L@7q�%�]�@;����{�@@L@<�Lr@B���u��@E��� '@H�l���i@LQ�	��@O����Q@Q����»@S�jM�/@U�p�/�w@W����@Z!*��3@\����@_/p t@`؄̼��@b7��h�B@c�-f��@e ㈪�@f�ֆV*0@hC���@i�`i�|1@k���iÔ@m`���Y�@o1b[ԑ�@p��­�@q~�'P@r{�>�5@s�D�M%@t��$L)�@u������@v���p��@w�H-P@x�����_@z)�KQI)@{]��AI@|�ՕZ�@}��X(Mz@ `���K@�7�h�d@��6V��@��|�5�@�>��e@��vcu@��!\i�m@�b�3�;@��vf�@�߲��J@�����i@�h�� CM        ?���S^?��Α�?��IY�yw?�>}]~��?���z��@�� Fk�@��&��@��	�a@L�Aڄ�@#ߴ�@(D{�)[^@.$�����@2`�ҥR@6s�D�@:H2s%@>�A�@A���ID	@DK��f��@G���Z@J$i��*@MG2���@PTb��j@R�r��*@S����x@U���&�h@Xp���@Z8��5�@\{�n�� @^�����@`� �A@@a�W���@c;Z ;&�@d����Eo@f  �0]�@gs��H��@h��4:�@j|�՞�7@l�� ��@m�0��V@o]VU{O:@p����@qi�L�~y@rO�S��V@s:V�LO@t*No�b@u`ʊ�;@v}&,r�@w��k��@x�Ϡ<@y%fbHF@z3��M@{ER+�@|\F�T@}w�=�@~��9�/�@�V�AҊ@�r�K%�@�	0�r�Y@����?2�@�<�t��@�ْ& �@�xxұ�2@�bX��        ?�6���u?�$y*��>@�����@ꧯ��@$S�	��@/+��@6C����@>6�EN�@C�r���@H�6��.�@N���1)y@R�Zu�@VI��^}7@Z1WUd�#@^jm��D�@az>��@c�%�gJ@f}w��@i:��j+�@l ��>@o-LV��@q1��5Q@r�8���:@t��٭Q�@vvA�7�O@x^۔�t�@zZ�� V@|iu�ƪ�@~�(.0�@�_��vT�@��QD[��@�����@���4��@�%"D7h�@�mV��p�@����O�@���)K�@�|7�+��@��}��*w@�]���at@��д�ӻ@�1e��c�@��M�74@�Ś��*@��I6�=�@�kS�;I�@�D�����@�"a��WJ@�Tg���@���I�@���M�9@��PUP��@���o��@��h�	��@�����@��]M�=�@���7�*#@��̴D�@���h(@�b�~}��@��_�ls9@�u�F�Zh@�:1�K        ?���d{Y�?���@�Cc?���or?�ҋ��_�?�d��?��t��@����I@
�ۺtAB@PV:֘@ɡg�i�@Ƅ�ː�@ #qBx�@#%V�\��@&h����?@)���5@-���42@0�_��@3���_@5H&����@7�ŉ-�@:3�LI�@<��ź(�@?�T�D@ACT���g@B�e��L@DYB�; L@E���  w@G��!*�X@IoW巃~@K@�m�X@M��,@O�,̐m@P�Op���@Q���\@R�U�gM@S�X��[@T˟���;@U��D��@W��F�@XKxhX�@Y�@���@Z��%�@\
�+��n@]X�Gd��@^�s`�l@`���Ok@`��z� U@aj�ׅ��@b"�1��@b�@��@c�a1�@d_K!�~@e$���A@e�xz�n@f����G�@g�)'�ʆ@h[�.$�@i1٘
$e@j���v@j痸��N@k�SZ�%@l�G+��@m�p^bC�        ?�#��N?���䢊�?����?�i'�?�N�!���@��1��R@]���}@�4�}@M��'.@$����Q@*"�y�J@0K#�5�@3�{26A�@8���v@<��8պ@@��
�@Ct2عF@Fd~Ձ@I�/^~^#@L���@PL���7@R<2A΢�@TJd��@VvYf�`@X��L��@[)����@]��#ϣG@`*�Kd@a�����@b�?tpX@d|�
���@f3<��
@g�a��I�@iTBV��t@k��V�@l׾cuu�@n�)p[@pJr���@qDl���Z@rEv�
�@sM����@t\}��N�@ur^���F@v��}83@w��W� @@x����U@z�
���@{E����@|�	"d@}ǂ��#$@lwC�@�1��@�ݲÉ<�@����@"�@�>�ܞ��@��gVF�@��s��g@�g�5[�:@�&s`R�@��
�uN@����Txy@�tN����@�>��BK        ?��]�7�?�D*���?�Y�-�)A?����gb?��{vM}@F�����@�i�dv@L<�9�@v��O@#�����?@)B��F@/$�S`�@3 N��@6�xˣٕ@;DT�@?�:��}&@Biʇ,�@E&�\�Y�@Hǘ�Y@KB����@N�T��@Q����N@R����@T�+��Tu@Wm��C@YN*=)9@[�5^�g@^\���@`D�b6k@a���~�@b��O@dU����@eɹ_��@gJ�W��@h�xy\Q�@jn�M9��@lEE�n@m�a��"2@o%pߟ@p�8��!@q����3@r{�e��=@sp9��ŀ@tjf�Z�@uj��@vo9O��@wy�Ӆ�1@x���k�t@y�*M�1@z���`d@{�~2��@|���)�0@~(�^m��@X��u��@�F�B���@���k<@��OI�@�%��� @�ɗ}�'C@�p����@�D	�H@��\����@�t�i��T        ?��@��?��7_@�AX�l@cb��O@$��0�@/����ĝ@6��Mf .@>�{K��@C�U��$@IB�f@O9@u~U{@R���Ng@V�6��-@Z�_�D�@^�UMc+]@a��!���@d.Ϗ e@f���8@i��K �@l���¦@o�* ��6@qu��ޑ�@s+���7@t�CB�C@vҏq2߯@x�_���@zǇ��8@|�ٽQdp@	)P5@��%�
��@���54�@��9�4�B@�6��kߔ@�zf���@�ƛ�vM>@�/z�@�zv!L_@��f�:@�Qt��E�@������@�J�����@�jD+'�%@�3LG#�s@� �|�x�@��j��P@������v@�����C�@�_��V�@�A���@�'ї(��@��2�{@� 9l���@��hd��@�芘�r@��Ew{@���̉��@��a���9@��@#��@��e� }@�l��Z�@��Uʮ�@��aj�N�@���f        ?�-%5�5�?��$Ӄ�R?ؑ���?�+7��1�?�K>���s?��.�if�@�Q�T@M���@������@�L/�@@���R@!���; @$��=X\@(_��'Y�@,(�L��%@0Ty�g@2Ds���e@4���n�~@6��R}�o@9����@<<���T@?��Bj�@A �Ė�@B����@D$�Xt@E�%���@G�u��6�@IS��3�@K-޾-�@M��m��@Ow:n|@P�^5�,[@Q��r'�@R�٭��s@Sɓ��>@T����"@V��` 6@WI��	@X���"4G@Y�lq��@[���.�@\[����@]����{@_���@`:V��H@`�G��@a�DT���@be�	��@c%�Q�5�@c��'ԯ@d���Ȁ�@ey`����@fFoF���@g���6@g�#�N�A@h��_��@i�pܤ�@jw@�D�@kW"�<L@l:f� �@m�N�@nԌ/�@n�����a        ?��P�9��?ʔ�W�s6?��<֓r?���,@ x�*3�@
!ߩ�0P@F.? �@�D4���@"��|{@'{h.,z�@-�f�[�-@2ec���@6^�7��@:Ɇ�g��@?�]Nt�$@B|�>
��@E`�p�8�@H���@K�ʠ��l@Oq;�8�u@Q���r@S�����5@U��{���@X�p�z@Zqy,,ϕ@\��n�.@_�hQ4�@a#:��@b�*�@d	��5;~@e�7��#@g+QOC�@hјsl�@j��vL�@lJK�@nB0n`@o����%�@p���@q��
���@r�JH�@t��dn�@u!���@v3}c�@wT�����@x|݆��D@y�ʫț�@z�zHp�.@|ߋ�h�@}`�~%�@~��?�.�@�ϴ0Z�@���
*$@�W\ǒ8Q@�	(��UG@��!�zJ�@�vB5�bk@�1��/�"@���D�y�@��H9V��@�u�@�E�@�=9�h@����N@��9�        ?��G�\0?�{��'?� n[�?����:�|?�A �n<@��l*@��ab{@,�N��@ �!�@&/md�0�@,4��
��@1�����@5hϪ�|>@9����kT@>7��)@A�$���z@D�J4y�@G˜n�a7@K��@y@N�z��6�@Q<R���@SA"`&�@Ud��pw�@W�9A-�@Z��)f@\��$�@_'��s[@`���G�c@baUiL �@c��ts@el
|�~@g\��@h����K�@jnr۾�@l8 +�j@n�e_��@o�b���@p�f��RH@q��哶@s޻��r@t���@u-g��@vL�&%�@ws��@t*@x�KN�9@y�_(B�@{�j#�@|T^l��@}��#&�@~�V�g�@�"̻� w@��� D�@��?��zd@�:�F%@��(��%�@���&�	�@�o`T�?�@�2m3���@���\�C@��M��@��	zV�@�_�xL0@�2-fG��        ?����Am?���y��@��a�@�qt'��@*��lv�@4n�f]@=)�_���@C���9�@I�3��o@Pa�lW�]@TE�Yꪜ@X�SH�lL@]Y�ɟ�T@aEuW�\@d�V���@gEN�T�@j\����@m�"�ѱ�@p�{V�}�@r��X֤�@t���_�@v�q*m5@y-Ly��@{�����	@~`����@�L���@���x|�@�H��#@�y��Ӳ�@��k^��F@��.ƍ@����R9@���Py�l@�t���z@�2�i�(@��K��@�@��#Hr�@��3\��@��w���@���8�߯@��B�Λ�@��k�p�@��Fb�c@�	`X1@�%���@�Gn�D@�on��}@��g�&վ@��W,�xQ@��m�ږ@�"��f��@�Ĝ8a�5@�h�
�@�>��@���l��"@�e��A@��-#��@��
})��@�y���@�0$�;.�@��ܙ�@����=��@�ay�؍        ?�\�dI��?�J7��v?���g~4?����{�?��
�g0?��4�MR@e��,s�@�:P��/@:�^�@��2�@Q��prn@��W��o@">�K�@%m�V��@(�4�^]�@,����@0E��<��@2b�e�v�@4�h���1@7H�)@9�P�p��@<$]���@>�Dܖ�q@@�l`���@Bgs󲐗@C��O�l�@E��B�i�@GM��q��@I��e��@J��G5)@L���?@N�J(ilR@PX�쫹�@Q`ݭΗ@Rn�!�c~@S����h�@T�I�r�@UƝ_ @V�8)�'�@X$�[��j@Y^}=*@Z��}@[�|`M�@]4�[~U@^���1?@_��Щ�@`�.2��@aXҿ��@b�촗�@b�X�e@c����=q@dL_jLr@edַָ@eٝBlb�@f����A@gs�Y�`�@hEH���@i���}�@i�[H�@j���!7�@k�b��#@l��7[�@mlٌ���        ?�3���?�lcz�k�?���L{�?�U�?�t[�`
�@	Ca��{�@��=���@�WW�{�@"	4TN�@'��0\��@.&�U�P�@2ΉFd+@7����@;�dۤ�%@@|:\�Z�@C[c���5@F}~@�z�@I�/=�F@M��f���@P����3�@R��;�@U��Oz�@Wq`�H�@Y�H��`�@\����@_[�8D,�@a!ؖDn$@b�X���@d=[��d�@e���l@g��p���@ie��:�@k?��C�@m*&ܠP@o%�X3�@p�8�iu�@q��RAc@r��,�s�@s��O�i�@t��jC��@v-5�A�@wb��V}�@x��uԑ@y�f!�Ν@{0�g�@|�;M �@}�1�N@Ag��n@�Ud*|e�@����� @��Y���S@���@�2+@�K%�b�@�!�Q_�@��sBH�b@���u��@�v�l-!�@�J	�s"@� Q�x�@�����;g@��T��i@�����Kq@���',h        ?�&�M'�?Ĺ��5�\?�o�J�!?�JX��?�%:�@�b���X@�����@�� @ F��q�@%RNVy�@+,L.3�@0�D�@4��l��@8�d��,@=�l�{��@AU���]@D��\o@G o����@J^�]�^@Mؤ7z��@P�GbrS@R�OI��@T�zޟII@W��LN@Y`b*�@[�"�Lj�@^b-|a@`�W'0�@a�,g��v@ccH�%-@d�[�=)$@fzZ ���@h3Vq�@i�֠: �@k�1��;�@mZ1�:�A@o6�|e?�@p��"'�@q����F*@r�����@s���+Q@t��(ӈc@u���V'%@v�A���@xAGw�@y=ej+z1@zru}V�@{�i���2@|�:�y�@~:��]'�@�O�s3@�qB ��t@� 8�.�\@�҇��wh@��)T���@�A��C@��P
-�@���k?P�@���W�@�Eqn�@���"�B@���y�5h@��U:�z�        ?����()?�K���@(��u�@/.�e2@$���'�@/�
]e+@6�F�aD@?-܀~ʹ@Ds�pi�@J�&vf]@P'��v�@S�m�i@W�W ��@[���T�@`.�@b�hf�`m@eS�ޮ@h,R\��4@k3��lcB@ni�r�Y@p�Z�B�f@r�GwJ�@t���A@v���C@x�G#$?@z����V@|��'�@;��KH�@���N�@�W�f@�T��[@�������@�Ӳ�)@�i')�1@��e �6@�S`߯��@���w�p@�c牜��@��!2�\k@�L��(@� �GS@��w�R�@��i�sj@���n0�j@��2.�ɰ@����hw@�t��~ _@�f�tɎ@�\荿�@�V�ş�`@�T�����@�V�K�h7@�\�3�Qb@�f"=��;@�s]�͉X@��C�	�@�La>���@��f)ˤ�@�f(F��@�������@���i^�@���#��@����oc'        ?���U{\�?����=A?��DU�8?��}��?�jȱ6�?���q�@�[�#X	@
Ǿv��@Y��g��@��h��@��	�o@ #mx��@#!2���r@&^����@)�}��C'@-�{��h�@0��SՔ�@2薚 ��@5%��ju,@7�p�A�Z@9�k�=J@<��;���@?S��>�L@A����@B�ސ=#n@Dx���@E�oe�@Gc�
`�u@I9����@J��,�� @L���L��@N���C��@PM%�O%�@QOw��I�@RY3㍽�@SjS@dެ@T���62F@U�����@Vɕ^}V�@W�ŰI�b@Y-�nn3@Zi[�Q@[����u�@\��q��J@^Gx6W�'@_���D��@`~�$� @a0���@a�t6��Z@b�C�7 �@c[G���P@dy�޸�@d�ԡ�@e�Q�)SM@fj�;M@@g6�b�n@hi���@h�D�~3@i�2p�y�@j�1x֬L@k_B ~�@l=cn1^P@m���me        ?�+�uE>?�`߫?��(%?�?�@�VH�?�<����@�Sk��@�$M@��n�@vn��t@#<9�ꖨ@(tZy�&�@.i\�|��@2�5��+2@6O��:�@:s�\�@>��L�@A��T��e@D��	�i@G��(}=@J�␮9@M�|�<�@P��kEφ@R��>�@T�k>�P@V�Y�6�s@XٯDpl�@[%g�.�@]�w�,�@`e��kj@aV%�h�+@b�n���@d0c���@e�]��[{@g�T9!@h��}�@jH�k��F@k�����@m�R�A�@ot�H��!@p���U.�@q�-��D@r��l|c�@s�y��T@t��S���@u�<�띲@v�(�
�@w���4@x�4��S�@y�~���@{ ����@|O<-��@}��+ȭ�@~��|n+D@��<�d@���&%'�@�G�-��F@��y��:X@���B��@�JF�c+s@��T�7Ǟ@����@�e�7./X@���m��        ?�B쵓#�?�[�wV�`?ܙ6:�Q?�&�?��X$�@��Ih�W@��ɢ>@�:�@��H�@#����@)m�2!�@/�����9@3O��1O!@75Υ��@;��b�i�@@}�@B��%A��@Ez��߈�@H{/Švr@K���c��@O"g���@Qd�	@ST�|T�@U`�j��@W��{�J@Y�o�-�g@\,R�2L@^�ҾD@`�̈=��@a�d�2�@c`�����@d�׾hg�@fX����W@g��J��<@i���[�@k26��@l��G@n���Z�\@pA��v1�@q2:mc�3@r)�ܒ�@s&^����@t*8`�T�@u4��I@vET1�4@w\�J)9@xzc�E@y�vdW{@z�\A�R@{���EO@}/�zu"{@~l��x.@�_���h@�|���@�$螺\0@����n@�~�}@�/0L�NY@��n�xL�@����P9�@�U.�E @�~~S��@���/��g        ?��+�+?��d@���Ϝ@��m�B@$�+mF��@/�9 �@6�%@>�U�f��@D8/�$�@I���0+u@O�Q£Ҭ@S0jhX��@V�~�Wv�@Z�nE@_D�sn@a�Ġ���@d~3�^�U@g,Ml��@jC��@ma��A@p��@q�-�Y@s�L�-Ι@u^T'�M�@wI��@yH�`kG]@{\W
x�<@}�m�7{=@����<w@�XN ,�@�:A�B)�@�u�K�a@��`6�+�@�
q���d@�cb�@��N奉@�0�@�@�����@�$�a��@��m�v@��k��@���Nh�@���>�$@���||��@�n�\ ȁ@�M�K+.%@�1���@���Ai@�>/Xv,@��!J+J@��]���8@���ᡕ@������c@���a'K�@��f����@��^�>@���6�F@���I�@��6�a@�%����@����ⓟ@�G��p@���uj�5        ?��@M�6?���V��?�~����??�e���?��K�m��?���Ĕ-v@e���m�@mt�头@��Rm@B%@�K�@E�{Mj�@ b��uhc@#`#��(@&�eC��@*�_��@-é�G��@0���6=U@2���o�@5 @
7W@7o��r�z@9��&"=�@<g7V^�@?e�P�@@�h.��~@BZ�@��@C�8��-@Ef�J%{�@G]p��@H�.�	9�@Jd	�9�@L)ܽ�h@M��id�6@O�7]Qx@P�R3�VA@Q����Y@R�G�y��@S�fH.�@U
-7w@V#�SK��@WCdD��@Xi��z�@Y�Z��}@Z�W�m�@\�mD�@]B�2o�@^��}ަ@_�n�]�6@`��.�@a>�F�^H@a�pN��L@b�O9o|�@cT ���@d��Q��@dƁ��)�@e��DuD@fDX��f�@g}+��@g�i�MW@h�5R�@ia���u�@j/�#5�N@k �Y��@k����        ?�J�.I?��y�a6?�]� ߴ�?�ɑQw/?�ۗq� @�l0�D�@�e���@����@u�@� �@"�����/@'�~��+�@-��%��@2/}�-�@5��_W0v@9ƈZ<?�@>:�tcJ@A����;@D,(����@G�j�@J�7@ML|l)�1@P`�.D��@R63�[@T&?�琻@V18�{�@XW}��@Z���Y�u@\�,��_@_if���{@`�*'O�Z@bR�"���@c�����@e&NN�c!@f�̖K\�@h.pVwb@i�+_�Km@kj����@m��с�@n�T��]@pSh�_(@q?����n@r2z�,@s*ʑ;��@t)ճ�՘@u/�O��@v:���b@wL�v�@xcǯ��_@y�|�-��@z�1���@{�܂o�@|�rNjI@~3�A��(@o73k�M@�X(ղ�p@�����+@���IG�@�J�4eG@���W���@�����'v@�W�|@�U�;�@��B.=�        ?��(&��?��E���?ڿ��u?�"�#t�?� h�	�@� �@�i�|�R@�x���@MV�O@"u�y�-@'q�9棸@-g���@1�{����@5O�
(�@9<I��\�@=�ŭO��@A�\�2�@C��7÷l@FU�ky�@I=��@LT�6�@O�F��%@Q�5��C@S`���@UM$��9i@WRaF���@Yo���1a@[�
�0x@]�O�Т�@`+��Z;y@aj,/
є@b�w�r@d
���4@elkX���@f���X��@hS7�<@i�݃<W@kh},�@mn�`j�@n�ع"@p/U�X@qlq)4�@q�'����@r݀�<@s�k�P!�@t���cĿ@u��"@��@v�D�[t�@w�]�L@x�Tj4��@y��F���@z��>e�@|�r���@}1>�)�@~Vn�6ܻ@��t�zv@�X0��0@��iz�'@��Rs3�@�./½wy@�Ϯl�^�@�s��Q6�@��_6uX        ?���|Oy?��Z3�X@����@�.\��@$�Qy@.�
8�@5�<+"�@=�VR0u3@CS
�&�E@Hn� �k@N&���Ck@R=d'��@U�'Ӊ!@Yx5[l��@]���8�@@`�ۘ���@cG)`o�@e�lM��@h`S}�/@k$�����@ntZ�q�@p�T�al�@r%���@s�z/�[1@u�̲��@wZ԰R�=@y:|<b(n@{+���xI@}.N�j֚@BJD0�W@���n�B@���+`@��W8�@����T@�S&��j@������t@�ԧ~=S�@�!�I�o{@�vd�JKI@���@�U@�7����@���j���@�،
��@�ɂ㎨U@�������@�O�k�@��1LH�@��s��F@��[^ĸ@�����Y�@�^:y�@�8�DEs@��p�aZ@��K���@��f(@��@���I�� @��{��F{@��f�|�@��� � N@���E��@�w8��2@�8�C��v@�����v        ?�����%?��Y+��g?��0�P��?�u";��g?�b���}�@ :m8��@���o/�@���I��@�h � @)O�p�`@���^�@"�Y�x�@&�K9�@)�Ӫ!��@-��G�@1;x�g�@3b}�lH�@5�ђ�:!@8n8Ħ�@;+��6�@>W���@@����@B!��4�@C��-`�@E��,�!�@GUr6��@I69���@K)�h+q@M0	M%�a@OHs�'�@P�~͓��@Q׺9|sd@R��y�<�@T.��/��@Ug��҂@V�!6@W��c�{@YCwen�Z@Z�����@\ v�@@]j�(��@^�Gc�D@`,4��@`�i�Ĩ@a�ȋ
@b|�qu<@cIZ%#��@dz�<j6@d�s��M@e�:;�@f�#s9@g���Pb@hh��HY@iPV4�v�@j;N���R@k)��p
�@l�($>�@m��: F@n�լ�@o��y��@p�-��@p���t@q��l2        ?��z���?�6�f�"'?�ŭ�&t5?�"C���?�®�h$@���5�@*X��T@15m�@ YG�'��@%`s��@+6f��j@0�7�8�@4�'@8��}���@=�����'@AYh���@D$����@G,�3�x@JrҨ�@M����@P�?�@R�f�D��@T��(!�@WAM��H/@Y�<��>@\%��&]@^Ⱦ����@`�?�_�@b8�*��@c�"��U@eN*~3�@f�dd@h�[�-�@jiv�~�@l=�91� @n"q*��@p�*�9@q�=\��@r^�$�@s*�\ky@tD�k'�@uf�~�/�@v���j-�@w�8�-�@x�h��ݶ@z<5��
@{��}K��@|�q\�7@~+Ħ�{@�~b���@�xH0�JM@�.�/�u�@��B0G�H@��%�|��@�h�kM�@�-�A���@��#�&@��,�k�A@����#�@�d��6Dv@�;�
�@��C��2@��2�1A�        ?�8��jj?�*<Ve�a?���]��?�޽-&@h�(z�@�_;�B�@�"'@��@�T��,@#Z���-�@)2y�{��@/�}*�2$@3Ҧ�a�&@8'A���@<�q�+UJ@A'[���@D��aS@GAb�u_�@J���5��@Nh��8�?@Q1MF��@SP�|��@U�Cx�@W���}x@Z�$u�D�@]+6����@_�]�W|�@auLI��P@b�o+T��@d��G�^@fH ��@h� UT�@i�^+8)@k�i�n��@m��9�k-@o����c8@pआ�#�@q�A�O�@sCw��d@t1�j��@u]Du�$�@v�'� }^@w�:]:�@yl�C@z]�����@{��`@�>@}PY�@~q��۵@ݟ�F�%@��r��'�@�e��Oj�@�&�6g�
@��D�u�@��
 L�@��f��@�OM��@�"]��@��K�`��@�������@�����#+@���jF&}@�q�F��@�W�?Q��@�A+�Y��        ?���)�N"?���Ka8@߻��@ ���@,F�Mή2@5��u�pV@>�9��@D�D=��@KU"�Ӱ@QRH����@Uoo꽅@Z�ef@_dg�@bG�.CH�@eD�v�b�@h}�u��-@k�}��|d@o�gDҤ@q��>���@s�M_�U�@v��Гc@xdپ7@z��^>b�@}cA%;�@��i�@�m��pL@��Hx�H@�dZ4|��@��/�R�@���/n��@�E��@�ˡ @�����>V@���]���@�HAJqs@�C1��@�EQW�@�M՛�Ŏ@�]q�Wz@@�sޓ)�@��N���@��ZY�O@��ԧ��d@�S1$T�@�I� c�h@��vY3�@��@q�@�C<d4I@�6��޶@��2�v�@����"@�F4պ��@��|��}@���]z�Q@�rf��F@�1�u�@�����@��
e'�@��}R:��@�M��bD@��Ϊ�@�����-@���*��        ?��E�'��?�㐩>�?�k[�z�?�!��Wc�?�t ��@�?��S�c�@�u H�i@���/@(Z�&c�@�&�>^@�'��F{@ �2�_y�@#�t@H_�@'GӯO�c@*��H�Ł@.��?vn�@1l���@3�����@5����@8Op ��B@:�pn��@=�7G��@@#�R�I@A��G{b�@C��X9@D�>��uk@FD(�us�@G�_����@I��O�~@Ks0�ō�@MI���}!@O-��@P�ڬ@Q����h8@R�A�*��@S����Zv@T��Q�!@U�r�? $@V��B��@X��Z�&@YJ]����@ZT�ϛ|@[��QS�;@\�.��D@^CԮ���@_�y�Y��@`r��GT�@a2� ��@a�ŗ��@b�6�ŝ�@c6�/���@c�p��0@d����"@eg��G��@f(<@��
@f뾾V��@g�1C�`@h{J�%i@iF��˪@jw����@j��/�f@k����@l�z#G�        ?�B5ť�?�����?�J$s���?�]֡׺@?�Q��2�@�78P�Z@�7��@���_@�t1k��@"�l�@&�1h�)@,l�@�@1N����@4� �mI�@8���.Wj@<��A8e@@�/�<��@CBs��@E����@H�kQ�;�@K���G��@N���L��@Qa�Q��@R���E5@T������@V����L@X�>�=K�@Z�OU�@]4�PYa;@_�X�+H@a ˸�e�@bE�T]�%@c��3>�5@d�:j��@f[��ނ@g�pp`�`@iN鿕�,@j��Ka��@lp6� �@nݪse@o��Ny�@p�Z�E!@q�ն�/B@r����@sp���@ta� �T�@uX�س;�@vT�&�j&@wU�t�q @x\EA|�R@yg� v��@zx�OK@{�P	�l�@|�v�6�W@}�j"��@~�;��7@�	;>}�@������@�8xjZ�@��v�Y��@�p���@�ߦ�k@����@(&        ?�}�[�o?�g�1> ?��y��j?�U6��B?���-��@S\/<@�_�ݴe@\�8��@���3m�@$��O"�}@*5a���@0NNB4!a@3��>��@7�v�ϰ@<i����}@@��'�8@CS"c�|�@F7�4�}�@IV(�֓@L���P^@P! b���@R��#"@T�}�-@V/Q���@Xo�,=d�@Z���@]JjZ�d@_��K'W9@aN���}}@b�g,9�C@d5o���@e��"#e@gX:���s@i �"c��@j�[eܦ�@lQ�"�@nU��ۉ1@px�2@q�s�}�@r��lL@s#?F�@t4K��2@uLހ�ؙ@vl��m�C@w��u4�1@xÈ�!�@y����G�@{7��TsN@||��fD�@}�l��Q�@&���@�<F�$�@����#�@�����E�@�Y�5v�@�u�ל�@�Ԑ��Dj@�����[@�]8�Q@�&l�y�@����@@��%���@��u���        ?�e~ �3?����Bd�@+9m��@ܸ�K��@&��?}:@1E�e���@8�$ت��@@���ױ@E��G���@KH`j�i�@Pҷf�@TXl����@X5 ��a�@\h�ko�P@`y#}e�C@b��2�@e�vE�k@hHg6�t�@k7����@nPz}:e@pɊ�c�[@r��0Ap@tJ���@v)����@xs���\@z#�|Sep@|?��p;@~o4zAce@�YR.���@���*/��@��M�Dc@��tR�@�BKo�-8@��ý%H�@���7�F@�VS���@��H�N͝@�=��X&M@��-���3@�I�w��h@�n�fx�x@�=K>�!�@����@��FR��@�´k	��@��SI@�@��}�W�@�m����@�Y���<X@�Iic�@�=/��@�4�R�Ls@�0@��@�/MC�@�2R�-�@�9�!�@�C���߷@�(�So�@��üXQ�@�<x�Q\@�������@�W<,�ݴ@��BH>O        ?�6�Nd�X?���z��?�^Lګ�?�1�/�/?��eZ��?����.IR@E����@Y��{n�@�pT�O�@`�/y�@�zx�"@ ���"��@#���hd\@'%DF�@*�$�<�@.�� #@1{vpO�@3�QB��@6���@8��К:H@;D��0�@>��0@@~!Ҽ�z@B����@C���~�@ELT[���@G	����@H��Իho@J�q���@L��a��@N�g�<�O@PbM��@Qu� �.@R������@S�\TF@T�B���{@V�O �@WWEF@v@X���R@Y쐡��@[C�D��z@\�j٢�@^CP6�@_{WO~"�@`y�0��F@a9�F-�@a�0j���@b�c!mԇ@c����@db���#�@e6���#�@f_�_'@f��$Ӑ�@g�^�X�i@h�\�k@i�X6��@j}�K�2@kl�y��@l^�Ͽ%@mS�L�b�@nL�ه�@oI���w�@p$���2�        ?� /�g�Q?�>�l�P�?��<n=@?��j�8<?���|i@)[�^@
�\�)@/�.Y�@�o_�|@"����Z�@'�j:��@-�y���H@2(?q�@5��e�@9��<�N@>e�)q�@A�V+@DG�Ep-�@G �Q}�@J,����@Mnjn��o@Pr>��&@RG�T��@T7;X�>@VA@��@Xe3j�Ģ@Z�f�A1w@\��'��@_m�"��@`���B@bO� 8�@c����@eh�j�@f��4�&�@h����@i�͂`)@kNE��l@l�QÂ��@n��1�E@p;��T��@q$�rB��@r�O�@s���c�@t��׆.@u��>(g@v�7�@w�<���@x+��5��@yD��W�@zc~�W�(@{�ȫ�c@|�TV�1�@}�Y��4Z@?��@�)����@��(�3͵@�mfk�φ@�dϩ�K@��H��@�g���@��C��E@��n ��@�y�ȣO        ?��ڭR�u?�.�r��?�]�d��?��5�E�?��U����@}��(Q@@|�q�@��Ӽ��@��^T��@#��|ħ@)qr��
@/��BV@3\����@7KJI@;�y��`@@5
_\`+@Bγ��aA@E��TS��@H����-�@K���eT@OcK�xH�@Q��>��@S�Z0�2�@U�h��h�@W��#1i�@Z�v@\s��"@^�i�S�W@`��@��@b*�l�@c�DY�_9@e��4�D@f����e]@h.�$�5@i�w�W9�@k��b�A�@mC�֚�@o�t��@pt�Vא�@qh�b{�@rcp��@sd��u@tk��7�G@uy���p\@v�=	�H@w�Cς�%@xʵ���@y򈎹o�@{ �ė�@|U5U��T@}��"].@~��@�w�Ts@��ѿ�X�@�\���C@�	\���@��(��c@�k�=&@�!�խc;@��Tk���@���y5�@�TP�<5@��gPJ        ?�Ѡ�P�?�f� �@h����@T��'q9@$���@/�����@6�
TǶ�@>�;.y�@D�2��@Ix��@O�����@S�ߣ�@V�R):y�@Z�*�@_0��9*�@a�ʴs�@dv*6���@g%��\%@i����!l@m-p�&�@p��Z�#@qȸ��F@s�)���@ue$��_?@wS�EwAt@yW�]�^@{q
�\�@}��1V��@�j� @��ev2�@�VK��>@��\��,\@�� S��1@�<(�8o�@����B��@�	ú>P@�����@� ��^�@��O�ꅣ@� ��#@�_s���@�3�c@)@�+�MҼ@��l��_�@�Ώz�1@���C�$�@��R
ZU@��۰�س@����`�@���F�@���>t@���S��@��g��]�@���|�|i@��Q���@�����c@��!��@�@����@�Y�Ɏd@��L��4@�<p
��@���ksJ @�o?��        ?�VH���?��<o��G?���a��?�Y�B?��S���?���bf��@D\vW$@>���qO@�R�N@&��g�@.����@ \Gԋ��@#a_x�K�@&��Qd�@*)� �:+@-늹�c@0��uI%@3	ڧ�8@5P��v�@7��m�c@:$�'��*@<�e���	@?o��/�@A �*�[�@B��c�@D��j��@E�9,TQ@GT��Tմ@IK�-j�@J�רM,�@L�6Y�Y�@NjF!��0@P(�j�K@Q#{a	�m@R$��}Y�@S,j\�h@T:�-y�@UO\��i�@Vji�Q�@W����F@X�G�F �@Y����4�@[����>@\Nz0`��@]�;�S0@^��Å5�@`�C�?q@`��2�>@adC�+�@b�cKD@b�j��!�@cx���@d0	��I@d�!h}Ɋ@e� C{�@ff��Q�@g)Y4�	@g�ƙ�@h�� e�@i�WWo$@jMn7�"�@k#J��@k�o����        ?�*c�yx�?�{5�9�?�O��ΣV?ﮰ�E&S?�-ҘBD�@�����@����5�@�㴯ڔ@�����@$ˡ�}]C@*o�Y>�@0oy Hۢ@4E�%�@8Qy��@<�QDv9�@@�SU.�@Cb09�@FB��s�S@I[d���@L�v(등@Pܰ�X@Q���"@S�#�Ȟh@V�mv>@XD����@Z��}�=�@]_ �
�@_�j��-@a��V@bx}dTe@c�= ��@ea߉6y@f낚���@h���pT@j(���@k���U@m�C�d�@oiH���@p�i����@q�����@r��C6@s��Cw`$@t�{���@u���S9@v�Ek�֘@w݃UrW�@y I��,�@z)��LP�@{YX����@|��ފ2>@}�D�i�H@`���@�,qAq3r@��c6��@������@�-�}o�X@��=A2�8@���/]\@�K�9�bs@�Q�x:�@��5? �@��(�'��@�I'�zX        ?����AU�?�-}�t?۰g>3�%?���<n�q?��s=�z(@y�\�@_�DNʲ@W�&/u3@��(Hv�@"�6�*mC@'�r����@-�a1y��@23D�L�@5�����F@9�>�t@>n)$�p@Ai���@C�k3�ز@F�����T@I���?��@L�n�<�N@P3��@Q�����@S�
{ �@U�J=�@W��Õ�@Y��z�%@\>�%m�c@^��� CL@`�V���h@a�h���@cs���@d}`���@e�C:��@g\|�ݠF@h�y��M-@ji�"�3@l� ��@m��z�V�@oSX��?7@p�i�+�@qh��ĵa@rPeQx�@s=�6W��@t0����@u(
ݥ�&@v%J[�"�@w'���B@x/��b�@y<�I#Bu@zN�ڱ@@{fO���`@|��Y5h@}���Z��@~�H?'�@��	j�@���m��$@�.�{sZ@��V��@�l?-���@��w��?@��tNӝ/@�Z�+`        ?�'���!P?�[Ƣ��@V+�x@��ck5@&�S�0��@1>��*[@8���q^ @@�)["@E��D!8@K2� �
�@Pľ�B�@TF�.�v�@X-�r��@\M�z���@`h��l��@b��K�@ekvC��i@h+��C�@k�(qU@n'cv��+@p�?����@rc�}3j@t(��� @v���U@w�?�h�@y�"^m,�@|�U��@~-�Ou=@�3ɣ �@�Zh��@��I�SS@@��S��>�@�h~jE�@�Pi��4�@��8��� @� ��s@@�e�t���@��K]��o@�I(��\8@��BTRc@�&�<�e@���Z �@���	Db�@�����-@�Z�o�1@�1�I���@�d�݅�@�����5@��%���A@��7~\�Q@��l2�@�����{@�{��J�@�p����@�i�4�v*@�f;ȼv@�f	��ʚ@�i�y�f�@�8W)qfX@�����S�@�D��~չ@��]��oO@�W�&X��        ?��p<��?�L���)u?۲�P��V?�7#1$��?�ϵ{ya@G�{F�@l�@�EQ@j�ի�g@?Dٚ�@�3�XY�@ b����@#��^	L�@'`�;�DH@+U3X�@/�ŔCQ@2���^�@4����{@7P�DW�@9͟���`@<�I:T�@?� `���@Al;�آ�@C�K���@D�5�R`�@F�� �?�@Hq�5�5@J_��7�y@L^�RB]@No� ��@PH�@�f@QbGb�@R�b�@S���ε+@T�"��@V���@WaA��a�@X�<�� a@Z]��@[]�×Z@\��ƻ@^-�()�|@_���#@`�	>��N@aP���e�@b���U@b�|�^V�@c�	�h,@dk��N/@eT�h�
@f-����@g
VEPJ�@g��ɟI@h��B�{�@i��9 Mk@j�3��%@k�5�KO�@l���f�R@my�e�v�@nsU7}U#@opJS�3u@p8S�B�@p�0���^@q=��g$        ?��U+t?��=��U?��(�7؟?�{s���@ O�����@	��2<]@+kDgO�@��'>�K@"�y^f@'zi/�	[@-�@��RU@2q��)�=@6t�l'@:��B�5l@?֎��@B���{��@E�ވC��@H����@L5�l��@O��0��u@Q�)�1=�@S� S���@V\>;c[@XW1$�x�@Z�m��E�@]I�>�yj@_��Y^< @aZ�O[z@b�MZY|L@dL��0f@e��N���@gz6��@i&ꀋ��@j�����@l��\�2�@n�����t@p6��S˱@q1ŏ_Xq@r41��V@s=�fPX@tN���@ug-�"�@v���r%�@w�p��Z�@x�`;�'@zw���~@{L��1.\@|��;r��@}�B���@@+����@�A�R7�X@��m)�J�@��bڟ+Z@�Z���O@�qWMv,@��|叕G@��� Ҝ@�U|g��1@�d	��o@��
��@������_@��t�t�c@�X0��L        ?�3~)Ia�?�I|�6	?⺱E@�c?�x�/��@2�/��@UG���Z@/\�X=@=M��@"���@(��-�f@/'ؗ�`�@3H�i�_@7q�=��@<�T�@@����-@CVD��X@FW��.
�@I�����@M�Z���@Pd%GgY@R^����4@Tw��~D�@V�C�G�@Y��7�@[z��<3�@^S�{��@``e��h�@a��"��@cA�V,@dȃ��:o@f_i�:|�@h��Bg@i���k@k����n�@mU.m�-@o9��@p�
A�r�@q�,{��)@r��[,�@s�$5r[@t�ɒ
�=@u��ڇ�t@wwM
~�@x;Y4s�1@yp���@z��@{��AD{�@};6����@~���k_6@����@����;@�U�2��A@����;�@�Ɣ<Đ�@���ܪ�G@�D��Ro%@�|�rF@�ϥ�^��@����@�g���R@�8Q����@�-�bx�@��%%s�        ?�i���?������@��J��@"e75	��@.�`Ce�@7���R<b@@�5z�$�@F���s@M\���|_@R�a��"@V�'
�f@[�ʉ��@`x�+�v@cV��H�m@fpCŜ o@i�8�=�)@mU3tV��@p��ͩ�@r�eP��@t���`J�@v��Q��3@yFU�]@{�Ut ��@~L1�V@�|ns��@����� [@�Rv���@����@�_/1�t@���2يO@��*S��h@�W�	��@��?UG@@��W�a}{@�d|l[�,@�Y߲�@�U�9���@�X0�Z��@�a	A�^@�pJ.�w�@����u@����@�@��B>!h@���j&L@��걡_@�Pޅ��@��"I��@�͆�1sr@�
� E��@��E�$��@�[*�P�@���H��@���s�[\@�j96�)�@��Xk@��R����@���>/�X@�Q���@���2�@���9�V�@���Z>@�@�f�&l�_@�3)����        ?�>/
�5.?��d#��d?�H�[?�?�S)��?�vh�C��@4t�QL@@�A�L�@��kN��@E`���@c͐@ ��
�@#�j#aL&@&���AY@*���2)�@.u�w�@1L���B@3��x@�$@5�b�fn@8L�L̒)@:�s+@=��<��@@;ޙ?c@A�l��ou@CGtf�P�@D����@F���#�@HS��+=>@J#t(�p�@L�bz�@M��*�z�@O�봵"@Q	��'@R�&ʿ�@S(AAOM�@TGv�|@UnO[�d@V������@WҚ�վ�@Y�Jڌ>@ZT�
;�-@[�}��k@\�&,��@^N/����@_���9�@`�h��:K@aDwk@b !,�@b�H=!�@c���h@dH+�[�/@e�'O��@e��{%�[@f�W�H \@g�3��at@hZp�DF@i5�5�@j�O�@j�R9K#R@k������@l���f5@m�3��߿@n��1�T         ?�����?ȮW��\�?����{�?���#��?�ՠ��6z@	w��F@�~��U@��`���@!��n]@'`�%Z
a@-�g��L@2nXǺ4@6xr�o7g@:��|� �@?���~@B�~�S�-@E� ���@H؝j�v�@LJ�Jt@O�`��^G@Q��A��G@T3�Ә@VGƐ0*@X���G�@[��݆@]��9��o@`62����@a�%6��@c =�a�B@d�{A�+�@fJ� dd@g�[���@i����*m@k��g��D@ma�Z�@oOx��$S@p����@q��gvG&@r���o�@s��v�Ks@t��Eԩ�@v�f���@wH��9�r@x�>t�A@y��q�'@{�+Es�@|T�Q�)�@}�����Z@
K�`�e@�8}(T6�@���D�k�@��ՠ1I@�j0�B5�@�-J_1]@��P��@��@SK�@��
P@�`��m@�7y�]�8@����Y�@��Vm$�[@�҇o��@���p`�        ?�B^�>�?���0E?�1! �G�?�"�pɻ?�46��|�@�AG���@ 	�~�@���@}�1�<@#�7F��#@)/ތ��F@/>�U�@3k�9/@6ξ'a�@:��"��@?�P�0�@B=����@D��==��@G��0�@Jڸ��@N��ע<@P��J�@@R�/ K�p@T��}w@V�9$Y�@X���e��@Z�C�F(@]G���=@_�h�w�@a�m��[@bk��]4@c����@e.j��~i@f��q�u@h!��t�@i��]p�@kD�~��0@l�ވc}@n���v*@p(����@q�A��@q�Բ9�s@r�c��P�@sזg.�B@t�`*Q��@uд��Z@vՇ.˄�@w��U?g@x�p���.@zk�Ѱ�@{��~[H@|>+5	�@}b�'�QV@~�����@�n��n@�w���_@�	�@�@���	I��@�T+��3�@����S1�@�����@�FY�U�@��D��        ?ы"%s��?�!�cה�@�gQ�3 @�mK�@'��y�5i@2[�L@9���O�@A���M�@F���nd@M���U@Q�,�a@U�(&���@Y���O�>@^v���4>@a�v��ʅ@dWm'R��@g--�\�@j2?!
<�@mf���|@peS �@r.�\L��@t�6��B@v�(D�@x���q,@z>�2USH@||��N��@~����@��I���@���s��e@�-��7�@����_�@����@�X��J;�@�ҿ�]1�@�W�4+��@��7d�@B@��_�t@�)X��d'@�m�#i�@�J��o��@�-�t0�@���{�o@�/��d@����ƪ�@��cie��@��'ƫ��@���e��H@��ڱ�ݜ@����o@�|�:@�%&�{y@�?���H@�^�eN4@����}@�U�Q��@���@��@��ơ�9^@�!;A���@���!Sh@�_#�en@�� o�p@��Tɐ��@�Md��}�        ?�A��p�?�����4?�7����M?���k�L�?�DDM�?�7ì�X�@`"��@����@���)6�@��@{3@7E����@ nԉ�!�@#�����#@&�K���@*�mZ�*|@.tb��(�@1Q��v�@3��/T@5��A�Z@8f@<�F�@;��\�@=�
lU�@@T��T�@A���-@Cg]?4��@E�M0l@F�0�\�i@H{#�ݟf@JK~��'�@L+��@N}{!6�@PQ�Ilh@Q)~T@R���@S1�����@TL��b@Un�D\�@V�0x���@Wƃ���b@X������@Z9>݌ @[|�;	��@\�p��@^��N@_m����b@`ei���@a(qS�@a�xuM@b��?�tm@c? |��@c���{@d�>?W��@e�q�z�@fI��|�@g��O#�@g�P�q�)@h��.ָ�@i�5��@j[_�+ @k4��7�R@l�.�H�@l�q�<@m�
�䕂        ?��Pb�h9?�.=���,?�55٤�S?�����?��o�~�@	�(�,�@����x@6)D�T@!�t|�>\@&�3�SMc@-�M$��@2]6��#@61��1�@:v�#B�@?]6]�\�@B^���]�@EL���[@Hy�p���@K�&�y��@O�??o�9@Q�����@S�$q.6@V�^��@X^�f�P@Z����@]k�Hl��@`%�ʠ�@a|���w@b�!:m@d��\�f@f2����@gʨ�	`�@i��fjY@kQ4o�!@m,0��d�@o�3�@p��K$�:@q��0t�@r��_��K@s�R`{�@t�\*���@u�S���@w�g2�@xN'��G@y����P@z�: ��@|�U��@}f$XD>-@~����t@�6���@�µj��@�yƇ��L@�4`׼a|@��{eQt@���"@�y	/�6@�Ai���@�#C4�@��,#y��@��y�F8�@����f@�\�H�%�@�8���G�        ?�����dE?�F9��]�?�م�{�j?񗋂���?�2�|��@�/KS��@r����@�`0�;K@!rvX'@&���!�@,��)ke�@1�"����@5�n[�C@:J���@?)�bh~@BAI�g @E+��#��@HTsV�@K��98��@Ods�>�A@Q�:uxO\@S�r�	��@U��vִE@XC�.vM@Z�Lѵ�@]O����@`�?j�X@am�4��@b�G��S@dtg#��@f���"�@g���Z �@iu+��V1@k?W���R@m�[*4�@o����J@p|���[�@q������@r����V�@s�$-ՙ@t��ה�K@u�W�V@wb�X#u@x0̹֦Q@yg>�Q�@z��Kϫ�@{����@}3�:�"�@~��Z�w@�
��@��{2�H�@�Q2��޹@� �>�T@��<GM�@�|z���t@�;���@��98�@�â��=�@����m@�WS�mH�@�%��"��@�������@��h)܄O        ?��y$��4?��6��*�@�H�9�/@�Z*2��@(�5I�Z�@3e��iU@;-Y5uJ�@Be����@G�}��<@NS,�J@R����Y@V���Ω�@[W��R�@_�J:��@bp��H;@e2�a�,@h&X:g@kJ�4�T@n��¡��@qWzn�O@r�Q��@t��W�E@v����M�@y�n�	�@{C�%��K@}����O@�h���h@�8h/s
�@��a#��@���ľ9|@�/�\��@�����S@��� ?@���_�H@�M�k@��9���@�,{���@���7���@��L�V��@����8�@�rz���@�TƱ���@�;Do��@�&�G��@��I;�@�	ȅ�)@����@�����@��JV��G@��|�1@�YY��@��P@�(�0*-@�=�o���@�+I�2�@����P@�JG�ZB-@���W��@�qDS���@��v ��@��vxA@�:ms޼�@�֬���	        ?��� ��?�5��m3?�J��pu?�H��A�H?�`�s??��}�"�@�C2c@��v�@Zȼ���@�w���I@Y��خ4@fS/j�@!v)�(1#@$u����Z@'�/8�Ԑ@+(���;W@.ۖ��+K@1d�4�@3x����@5��ȩ�@7����@:a��5�u@<��@�@?�ذ�J�@A#m�Ң�@B�aM°�@D����@E��V'&@G";'�jC@H�X���@Jo(�f�@L(��ꑕ@M�]��T@O��l���@P�kB��-@QĞ^+@�@R�ˮ�#w@S����%�@T����@UԽllQ@V�c��$@W����@Y�|V@ZA���!�@[j��-@\��b}M�@]͋}�}L@_���@`"��t��@`ċy\l@ah�3gU*@b�*��@b�~�E�@ce�B`>"@d"��pk@d�3�<��@ex��x�2@f.��8.@f��r@g�З��4@h^�]a�@iU+��@i��a�        ?�0�d(�?�o��@ߊ?�'Y�	i�?�`����?��Em��2@�����@���u\@��\�b�@�5��r�@#\��MW@(�Ǻh0~@.��ݡ�@2�둚f�@6��9��]@:�A�r"�@?�A��U@BV�MH}@E��+`@HJ�@KI��65@N�`���@Q-��Q�@S,K�]@U(�M��@WQgAc@Y��0���@[�V��@^v��N�@`�Ŷ�(&@a�d_Lw�@cN%{>�@d����&4@fK  @g�uN��@i��G���@k0+�e��@l������@n�D�iRo@pGu\n�-@q9坭�@r2�a!.@s2V���@t80p�=@uD\⢳�@vV��7״@wo]c �@x�	��N@y���@z�V���@|Ώ}��@}D`+�`@~��J �@���@��O��]W@�*�Gܾ�@�Ӌ,i�@�'X�@�-_�8l*@��*n��6@��}U|�@�GMvg��@���
�F�@��=;�VQ        ?��I��?�Q3A7x�?�}P"!�?�Cc[{1�?�Z���ω@Kr���@�"���@�VD �@��3s@$Σc�@)��x?�@0	�٥�@3���@7���<9@<*7�l@@�{���@C;�S��@F'D��@IN&+{��@L�-����@P(oR��;@R԰�Ay@T#�t�g@VO�ȿ��@X�����@[����@]�-��@`<4�}@a~���v�@b�+�Z>v@dt叜�@f�$�@g���3m�@iYb[I��@k^+D�^@l�m�Ï�@n�t�W�\@pY�Cb1�@qWzT1�@r\��1�C@sh�x�E�@t|u�Z�Z@u���S@v���aI@w�3$�A�@y��_�Z@zF�^��@{�k���@|Ƽ�T�g@~�-�;&@`���dc@�[�^�1@�	�dj%@��M��w�@�o�7���@�'����@��L�_�I@��he��@�^P�N�@� �2m4@��M�YQ�@��E�D�@@�x��șY        ?��\r��?�%D2@���cr@6�B_�@",��Y@,��&�d@4&�
C\�@;yQ��N@B �ۮ��@F����*�@L]:��n@Q;Q�YM+@T���Af@X@��:s:@\9p���@`@Fr�`1@b��(��D@d�>0v�@g�(ś�@jRS��1�@m6so�2@p kg�3@q���ѩP@sa����@u���6�@v�9�X¼@x�j�S�@z�@��@|��C⨒@~�����}@�}����@���E���@��0�f�@���R
�@�,#�\%@�V�����@����^��@��j^/|@�6�!C�i@��_���@��_(�ɬ@�Y�����@���_%zs@����,8�@�^!S��@� '��@��CQ��@���]d7�@�y^�ISC@�H*�p��@���s@�����@��h:ӭ@��!6�@��&��/�@�a����@�D�^Y�=@�+�g�D@�Fu�;�@���
�@��>�4�@�⃏	� @�k�!^˶        ?�٢�?��ѩ�yI?�N���?�A}NTϤ?����H��?��W���@ �~���@��D�@��R]�@���1+�@���d5@���/�K@ ����@#X!s/.@&j�}]M@)��R�M�@-A-��\�@0�<;�,�@2�CPKN@4��� @6�;��[@9-��M@;�ƈx>@>2}OMy�@@p4�@A�"�z>@CH�|�i�@D�<5{2�@FZ�g@G�*�\b@I�U
�@@K^�k��e@M&ԯ}��@N�g�y@Pp�j�@Qi����@Ri���P�@SpKk�� @T}���y@U�Os�C�@V�z-��@W�`�DJE@X����Il@Z'J��&@[]A��ɖ@\��:�,@]��WdF@_&Ս�s@`;��1A@`��'�>;@a���H�@bGCS��,@b�,�0{@c�8r>@do`�(�@e-�n�@e��P��{@f�In�|@gz�삕g@hD���%@i=���@i�k�?�=@j�|��_        ?�J��m�?¥v鞚?������V?�d�x~ϒ?�������@�v�)�,@�@3�ʻ@�h'�9@T��Z��@"�#���@'��A�Xw@-���}9q@2v��@5�����@9��,��@>`��tS�@A�5@��M@DO:9�:�@G.����@JD]�s�@M�܌��@P��T�,@ReLP+�I@T\�*s�@Voy<���@X�[�&��@Z�\�Ϋd@]JgX�@_�b���@a1�8BV:@b��_ȡq@c�|�V��@ehYF�v�@f�lv[|�@hy��S�@j ����@k�e�>�I@mu��}��@o9G��A@p��Dm
�@qs)��.�@rh
v�R@scA�	�J@td�Ƭ�@ul�?~U�@vz�g[+@w���S#�@x�"#�@y�`�:�W@z�àѽ�@|�.*S@}N]ݛ�@~�x���@�\\��@�����@�(��k�7@���Mf�@�zR/�F|@�'KJB@����7�s@��Wр@�>Y� �@����|,�        ?��Ff�.=?�D(3���?ؓsx�3?�-D�+c�?��ۋO�@? W��@�)dR��@@�Q�8�@�&��@"�k�@'�L��@,Ȃ�Յ�@1�����@5D#�{@9J��"�@=�.mw�R@AH/�z�@C��pD�@F��6��@I��H��/@M��dI|@PE�S߯�@RK��_O@T�r���@V%�L��@XSH�17@Z�ܩ]Pw@]���@_���%y�@a~m���@bn�
��@c�+�̵@eS�@x�C@f�G�<\@hp�K��@@j�8�7S@k�[�a١@m�ȋ,�@oS��]�@p� m��@q��w @r����&@s��D��H@t����@u��aI��@v�dqk�1@w֥�2�O@x��V �g@z$��#@{U���S�@|�m`�C�@}�G<gTF@x:��@�,��[�E@��M��G�@���?ƛ@�/$x���@���Nl$@����[<�@�LA*�I8@�m�Г~@��o��>t@��=��"�        ?�|�A:V?숑�]�"@��n��@[^@ L� �yR@)5h��@2F�ٮ�@8��r�@@�
��@De���6@IF�~s&�@N�����^@RVі��@U�j��@Y#�e��`@\�?k|��@`�y���@b��.2��@e���3�@gz�k7�@jw�g0�@l˹��
�@o���ʱ�@qT:*�q@r�f�9��@t��z�/k@v;�XĄ�@x X���.@y�<�Le@{�3���@}���.�@�h�*| @��Q���@� <-�]�@�hW\�@�Bˉ��@�pY�#��@��l;%@��#=v�@�)u%�ާ@�w���@�̬qXN�@�*|1H_@��=F�8@��$��>@��[:�.�@�vr��&�@�8PĔ@����<,@��=5N��@��<�� l@�d�Uo'�@�9'^�@���@��uyk�@��p���E@���4�@���?'�@�}^a>x@�j;GD�\@�Z{R�7@�N���@�E��U�