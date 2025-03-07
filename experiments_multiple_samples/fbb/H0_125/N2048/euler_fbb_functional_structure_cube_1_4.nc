CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T110651        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @               ?Ã��3,A?�+F���,?���/�:?�|��L�=@`�Z`��@����@�����@�H�u'V@TU�λ@"->�rh�@%a*x��;@(���]�@,P$ߥZ�@0p��<@1��*6�@3�eY��@6
�hI8(@82e�W�P@:k͗�P�@<�|�]��@?�_�i@@��'ϯ�@A��6k[?@CBl�Tl@D��g�{(@E�]�"��@G@GՔ9�@H�H�R�%@JB�z�t@K~MW!�@L��(Nrf@Nsv�@O���a@P��Xo�"@Q��a���@RV����i@S%�]�O@S�
3�q@T�JH�j.@U�����R@V���D��@W^����@X@b���@Y$�!�@Z
��!�.@Z�V��D@[��Ve��@\ϘI[f�@]�3V��@^�cy"�@_�9W��@`R����@`�vޡ�@aOy�Y+@aϪC�2@bQ��i&@bӁ�	��@cW N�@c��s�;O@da�����@d����@ep���@e��e��        ?��N��[?�r/[�M?�]�Ƶ��@5�FM�@��嶗�@iGh�,@�[F�?�@ ��!G��@$��D-�/@)���@-ک�P�@1�̑���@4C4���-@70gͯ,@:HY���@=�T���@@z]��@BC��q�"@D ���EU@F��W�@H\2� @J)��z@LQ�pX�@N�\{^�@PkF�=@Q�p��@R���7@T�
��@UU�U��X@V����a�@W���e"�@YZ'Û�O@Z�^�RB�@\.�5\@]�<oy\8@_���t�@`Q���.@a�%"�@a��\�@b�"ڍ��@c{���@dN���J@e%C�`��@e���!�4@f��	j@g�`��@h�U�eM�@i�ͽ\��@jo`v�S/@k\��@lK� |S�@m>\}$S�@n43[��@o,���@p���)@p�7w�jd@q�o%
@q�ճ#J�@r<�q�@r� b@s$"�޳@s���҄@t4a�QC1        ?��,��>?��Q�#?�,5���@�2sE@u�â@Oi�l��@�����@ �W��6b@$�(1��0@(�O
ɪ@-����@1i���q�@4&���@7�ٳ�@:���^J@=Zo�pB @@^����@B$
�r,@C���K�z@E��w'�9@G�� 4��@I��t�׍@Lb���@NJn�u �@PG?G�Uc@Qq���@R�&����@S޵�5��@U!&��n�@VkXHx��@W�+��M@Y���)G@Zw>���]@[�AH&G�@]NjJ�[�@^ě�b'&@` �҅O@`��?�/�@a����@bp�/���@c<~
�H�@dv��>@d݋o��]@e��"
@f�΋r@ge��� x@hCܳ��@i$���b@jO�R�@j�  ��@k�Ϯ�2�@lÜ-���@m���@n�"<3o@o����C�@pF�.�@p��`��@q@|���@q�Qj��@r?Z�)k�@r����w4@sB��m�@sƆMm�5        ?��gԂ?�զ�|9}@�%��p@��Tm�O@��.#@#�p���}@*&e�4*@0�Y",e@4�X��h@8��A��n@=�v�>�@AI�Š%�@C� ��z@F���$�@I�Z�BP@L�H\��'@O�^�
�,@Q��V�I@S5*>܉@T���c@V�,V~�@X�S:7�@Z�ũG@\�ğ@^��TP]@`M�mStU@a\�{~� @bq�Gc�p@c�g��o@d�7u@e�I*�߳@f��#�@h0jTk�e@iguĽ�@j�$��@k�!����@m*XJp��@nu��<J�@oŷ@��@p�[<��@q:>JzZ/@q�{�]E@r�
&7�@sNޏ�>�@t�����@t�1Q�@uw�\DH^@v4*9�J"@v�΍f��@w���ɇ@xv;��@y:���@@z��A��@z�C�� �@{���J��@|a9�Ψ@}/��e��@}��_"t@~Ѥ��@�r���@�=�_.7M@��<?��$@�҆ٗ�        ?]"@`?ެ�{��?��*9��?��޺c�D@=Y���@g��m@}��U��@d�Y s@�X�|4i@!:n�~`:@$H��T��@'��U�$�@*� �2�@.~��)w@1W���@3��	]�@5�B�@7*1j)>F@9S{E��@;��tS�H@=��Ikȶ@@$Q_�g@AS+���6@B�b��|e@C٣�3�@E(�$v�]@F��@G��>���@IC�_;\�@J�lx���@L$M�k�	@M�פj�@O �;Y�5@PTmb��@Q��7��@Q�`K��@R��T�@S���K�@TXɎ
;-@U/�:' Q@V	w�Ƒ�@V�/r��@Wſ��Pe@X�u�@Y�6&X�^@Zu���@[_��>_@\L��A�3@]<��J�w@^/�TƇ@_$# !w@`�B9��@`���f��@a	W7'@a��'�JV@b	���w@b�����@c�
w@c�FO�@d��|:T@d�e:�@e'#h�>j@e���Y��        ?�J�ZN��?��\.���?��\(�6@Њ��"k@Z��@�a���@e�ۗ��@ L3�K�@$L(�m�1@(����N@-s���?�@1K's��@4
G����@6�C>�4�@:&�F�@=P�uZ��@@^��|�@B)�u�@D��l�@E�����@HՒ�@JS�-+|@LG-�I7=@N�K��;�@Pj��:b�@Q�v�d��@R��8�ԗ@T���j@U`�C�f@V�:�{s@X9s�@Yo//u��@Z���J"J@\I����@]�c^N"@_B�O!�@`dr7��(@a+R�:�@a����Z@b�C�;�f@c�:ܔL�@dhu�]�@e?�I��@f��V�@f�72�@g����9�@h������@i��NS�p@j�=`��k@ky��`@�@li(��'C@m[Lm��@nP)DeC�@oG��1��@p �`�-8@p�SQF�z@q����E@q���S$)@r")pt @r�~�Xj�@s*�Ġ�@s��^�$�@t6�_�~        ?�=��<�?�z�V��?���vz�v@w���@0�Z��@�N�W�N@o%<+fX@ �`B�X@%(rG�'�@)�{\��@.�;�Q��@2�*5@4�=���[@7�����R@;:����@>�]���@A�&�ӣ@B��N��@D�Y[��@F���sa@I@;���@KO�U�r�@M�Mצ�@O���'�@Q,�`K)�@Rk���b1@S���^F�@U6�ȗf@V]��s	�@W�y��M@Y)�� �`@Z�{A�q@\�9�ZO@]��$@_#:�@`Z`��[@a&�B<�@a�Hچ��@b�4\@��@c��-�?�@d}�I,�@e\"v�@f=�&�d�@g# �yB�@h�P��@h�(��]�@i�馯�!@j��>�lw@k̞�p�@l�wH�_@m�;�Ϙ @n���g�r@o�Q�!�h@p`Bjx�q@p�5s��@qgz���y@q��ʟ@rs�k��L@r��N�d�@s�D��@tƼ�8�@t�w�ނ9@u(RBP        ?��Q?��&?�ɚd�Hg@���@��cO@�"Ζ@"����@(��O�@/�̷��@3���z��@7�
�4�@<Nh�Pf�@@���w@Cl0p��@E� �;�@H|��3c)@Kf�dSR@Np�:�E�@P̛"RuN@Ro��O[@T!47�O�@U�<i]@W��"�0G@Y��,
@[o$Z��@]b��7�`@_br|�'R@`��o@a¶��6�@b�_,1@c� �} @elǋ�!@f)2J�"�@gP;c�m6@h|p��L9@i��d��@j��UU�@l7�C[q@m_<�@n�� )�@o�mr���@p��~�~�@qGi�^@q�s>z@r�E�p�@sP*�޺�@t4����@t�Z#� @ul�Rwr�@v$�Q��@v� ��(�@w�eG���@xY�2��@y����v@y��P�

@z��"L`q@{eo���@|-O��@|�dZ���@}���$PO@~�x��z@]��]y@���ի @����g�        ?�h˼ ��?�x��3�?����?��gW�@#�D�@��ܭ�@m,�$�@TY�4W�@����*k@!4�{�[�@$EE��V�@'��_�C@*�+Y��@.�m��A2@1%v>�V�@3E%V�@5"ty��@7=d���@9j�F� t@;�b?'�-@=�t�i�<@@-!�K*�@Ae���.�@B�+���b@C�kJ� K@E>?Q5"@F�~�l�"@G���1�@IY�1�@J�	�%�@L9Bi�]�@M�����@O3U��A@P\���N@Q#]L*	�@Q�̳���@R�5�5�3@S���fΉ@TZ����@U/̍o�@V�:�@V�K���@W��X�Sx@X�����_@Y�u�~`�@Zg�׫��@[O��y.@\:�k��@]'	P��@^j@_<�M�@_�z}]'@`y�w�@`�b�>d@as����J@a�6iU@br~lh�@b�Ծ��@cu�ꁇc@c�ʿ$��@d|��b�@e4��Z�@e�nw��e        ?Ⱥ�s
�?�;�heCN?�'�B7~@h��|�@c���#�@E�zu�g@�]p��@ ���s��@$��/��@(��֯�@-�]ı�@1�_aI@4F�ة�=@7;D���@:[�q�I[@=���w�m@@�/��{�@B_c�pf@DD��ɐ@F<�^R@HImN>�@Jid�H(�@L�k�u(@N�(�!�F@P�"�`Z@Q�3u�|c@S��}�@TV�@�a�@U��{��@V�V9�@X]��W�@Y��9}�@[4i�� �@\�ӗ�Z(@^*߹hT(@_�mD�Z�@`���L��@ajD�S��@b8j�k�@c
�F@c� ܸԂ@d���R@e�R㖪�@frV�D�@gT�D�o@h9����@i"m�\Z�@j�bq@j��˕\�@k�ُ��@l��
�@m���ה@n�	�i]�@o��@��@phA��_^@p�`,�Q@qk��Rk@q�|ew@rto��@r�����@s�	��@t
����=@t�qѡb        ?�'���/?�a�.�be?�u��s�@Z�[�@�z�1�
@�;�q�@4���E�@ �����@$�"��O@)u
x�-@.\XB+@1ѡ�px�@4��Dh*c@7�n�(@:��y��@>%��47D@@Ӑy�I@B��T�}�@D�N��x@F��2�u�@H�	���w@J�^h[@L���~}�@OA��`�@P����?S@R���I�@SA�=iog@T���!� @U���,��@W.��C@X��Ϲ/@Y�?&@[c�����@\��6�|�@^Wo��
�@_�@/4v@`�~n�i@a}�m��k@bJq��1_@c�e1h@c�A)C<@d�*ڞz@e� [#�s@f|/\��@g\*� ��@h?@�U;�@i%B�΍@j#�N�@j�Ӧ���@k�G��6@l�rP�S�@m�G ��%@nø��:�@o��q/U�@p\#8�U@p�%�H��@q[`Y��&@q����@r_f&�)@r�'s���@shbc�*@s�J���@tu.'�tl        ?��)8�z?������@�
�Lp@w�)��@��*��1@#�\���@*��8�@0��
��@4�c����@8�)j���@=����w�@ARޝ�d�@C�z�V<�@F�\,�@I�K��@L�z����@O���8E@Q�A��˱@SW��:@U�lr��@V�2B�@X�dƉ�M@Z����?@\�?3y�@^ԓن g@`v��@"@a��@�� @b��R��H@c��6Y7@d�6��#B@f���n@g@n�F��@hu�_� H@i�Lț��@j��o�l@l4��v@m~�xh>�@n�s�q�@p}��@p��§{�@qk�A@r�"��@rθ���@s�׋�|@t;�Si+@t�s�kv�@u�ٳ��@vm@���@w,��ah�@w���@x�z�y@yv�s�h@z<�L�{,@{�V�#�@{��.CS�@|�����m@}i�K�D9@~9E���@
sG��@�G�:�@�Xޔ�a@����3B@�/�2)׹        ?�
�MƫN?��9	��?�v�O/�?�L[eT@�2f�#@oo�0ƈ@�u��@⅝O[�@ ����@ �򫝩@#�u��@'d8C�&@*s� �@-������@0�h)�R@2���
@4�/��H�@6�4��X@8���-�@;2��CW @={���0s@?ՙ�,0@A ����@B]��tD@C�	VZ@D�W�ݬ@FE]Z�Qx@G��]��e@I�KN�@Jq38�@K�Gso�@M\j,���@N�M/�z�@P1h�U�@P��T	d�@Q��]��@R��._1@S^m�)m[@T1^Tכ@UDN�|R@U����f@V��p��K@W�0�)4
@X{o(�4�@Y_mr#�d@ZF#ѥ�7@[/�i�6�@\��Uba@]
Ya�-@]���[z�@^��8�@_��߉a�@`opELC�@`��]&@ak�(J��@a��k*@bm%L��@b�l�\k/@cr�@/��@c�A�ʹ2@d|�Ɓ��@e\W[Q@e���=�G        ?�S%Ŧ��?�� J*c?��B��@�8B�$�@W(���@msM�2@p���I�@ RP�h
@$R���0�@(���C5�@-x�a���@1L`���@4	�Y�g@6�;��|@:��Q��@=Hnm+@@Xf*��)@B �֬|	@C�k /�@E�I�b|A@G�7���@J�Gp4S@L-�o�|�@Ng��cF@PY�yS��@Q�ण�@R��LT@S��^-Z@UD��r,�@V�"F��@W���@@YIɔ���@Z�����@\��m��@]�q ��N@_r����@`H�Y���@a��Ji�@a� 
xH�@b���TN@cp��[�,@dB�C�Yt@e�F���@e����@f�$���@g�G��2@h�J��͌@in��9@jT�)�R}@k>%M)0@l)�2ވ�@m�~���@n	�{�/�@n�k�)��@o󗆆��@pv�R�%@p��:]a@qr=&�=@q�_x])@rr�fw(U@r���ET�@sx��d@s� ��j        ?�.*~�r?�w�+w�?���@l$@|�\[��@ ,/��@�/�bZ@|���fi@!��P�@%5��[K@)к�ɘ5@.�T�(@2�s��!@4�>x�6@8H����@;S�W��#@>�aY�U&@A/�X5��@C�B�D@E�:qx4@GO�hT@I?���r�@Kwн�B@M��o���@P��g��@QK64 �@R�7Y��(@Sڒ�h[@U0 ��N�@V��M��t@W�7�҇@Yfq��$�@Z�A�f\@\`���@]��	 �@_{���uJ@`��v�9p@a[��R[�@b0Y�I��@c�j �C@c�OZL@d�f���@e�'��L@f��Jx��@g{k�ɶ�@hi��޼�@i[�&|!^@jP���2@kI�k%�*@lE[��kv@mDp>b�	@nF���$I@oL��a�@p*Ac��@p�����@q7:�2X*@q��e�9�@rJ�}�@rղ>!p�@sb��}>@s�,��@t���臰@u���3)@u�f�j�        ?׋1	�W�?�i���q@�\�~	B@x  �@s� ��'@"��!�4\@(�Y��F�@/~6�!TR@3� )�:�@7���y�l@<"ځ��@@Z�C�ȏ@B�N��)�@Ex�ݾ��@H:�]��G@K���2@NVyd|�@P���M@R=s���u@S�--��@U��[�@Wl�G!�@YB��#�@[$+�5�@]�Y���@_�2��i@`�8�ɠ@a�z��x�@b�t�-ҋ@c��z�@d��J�@e�o͍P@g�'�2@h>��e�@imp�
_@j��>�9@kل.�aN@m���Շ@nX�/.��@o�X��J@pt��ci@q�s��@qƔ�)�;@rr���L@s ��]�@s��c95@t���$�@u7@r)�@u�Z���@v�ZY�-@w_7%1�@x�a�@x�`DX�@y��B��0@zX�:�5@{>���S@{ߘ��&�@|���:�@}m@�2U@~6���0@fe)�t@�ܶ�(1@�M�@j�        ?��G�2�?ݶ	j��H?���V�zH?�;�U;b@�u�0x�@xi �ڠ@��Su@��M��@KO���@!�}��@$���@'O� ��@@*���@.V <be�@1~#�F@3���_@5أ��@70��ME�@9c�o��P@;��u���@>ً�Y@@65���@As�fA��@B�b��V@D	K)Ly8@E`|+��@F���=-e@H'�H�@I�/
O2@K��4�@L�9\�ߩ@N��pL�@O��/�9m@P���@�@Qfu�Mo�@R7q�\��@S�J>J�@S㉄,��@T��"��H@U��~Ա@V~Y����@WcaT�@XJ���q�@Y5��?�O@Z#��My+@[��8�@\��a��@\����<P@]���a�@^�oj���@_���vQ@`|8%b�@`���T�@a�E�G8.@bX���@b����(z@cSc\2�@c�/zV�h@d(C^3@d��N�f2@e@ 3�� @e͠Y~�.@f\e�Go        ?��_�yS?�V�:��?�����@���g�@j�S?��@�%�i(�@��Ց��@!+g�Nt@%Q$.��E@)�ޛ�p@.�~hM
k@2(�!,"@5Ϫ&@8�pû�@;\�&Wc�@>�Y�0�@A2'��@C�<E�1@E818��@G�R.�@I=Mm^�@KsѽR*�@M��.xc@P�����@QHG<C�j@R�UbZ�@S��.�Y�@U.s�2`@V�c��<�@W��u�@Yg�A>F�@Z�i�n @\er:��@]��+Cf@_�K�e$s@`����@ad�n	�@b;�6�R�@c���!@c��2J@d�-��B�@e�gÊNF@f���-��@g��t��@h������@i�MY-�@j~�B]G>@k|���2�@l~���U�@m�K��@n�Q�3b@o�����@pT��q܍@pޱh�f�@qj#8��@q�D-���@r�w���@s���e�@s��]��+@t<M�8�)@tѝ�uL�@uh�@�@v D�f/        ?ƛ> �}�?�n��d?�X��~@5և�
@	�VA:�@J�J�@h�e;��@PA�v�@#}��/�@'�����@,<Ҥ+�@0�� V�_@3.b���@5���#S.@8�լ��@;�Xӳ;p@?7V4��@AL�ps*�@C�0���@D�)l�@F�Q|k��@Hű}f@J����@L�9��@O��l�Q@P�@	Ex�@Q��l��A@R�P_�'[@T+,���@Ufc���@V��3{�G@W�=Z9@YB�)Nl�@Z��~�G�@[�,ͅ�@][3K_�}@^ň��<@`*u�@`�P�.S�@a���zrz@bUʅ���@c�u873@c��k��@d��z��@ew#+��2@fFlX8S@gl1 ߧ@g�/�ӣ@h�p��3'@i�a���@jz�)@�@kY��t@l;lq�N�@m`���*@n�e[�n@n�|v(�%@oْ��`@pc|���@p�R�s�@qTF�.!@q�U}|@rIy��xH@rů���        ?٢�$���?�7�JD�~@7����@�.��m�@�G�@$ �}8��@*��&8��@1��ː�@5<ۀX�@9�-r� @>�c=�&�@A��(ClB@D�lF�`|@G����>@J�����@M�(d?�~@P��A�E�@RL�q,@T/� M@U�~rW�@W�g��~@Y疾�:�@[���5@^8�C�@`�/�-�@a<�w�9@ba5�@c�31�ES@d�6[H�@e��9�}�@g5��W�@hz��k�@iƁ��	^@k��@lo�����@m�	�o�\@o0y�&@pLf��a@q�+@q�L�}�@ry�
���@s8��z�
@s�w�ۄ�@t��8�G�@u�H6e��@vNc	?�@w�l��-@w��qd<{@x��`@y��[�!@z_{;
@{6��?�@|�(��@|�d��U�@}����}@~����@���i�@�75�&��@��!���t@�	8�@����ע�@������@���H�@        ?�W4�1Kg?�x?��ZC?��哨?��B�j��@(��L9�@�/?i!@rZA}�;@Z�V
q@���+�@!8���@$I)�� @'�����e@*�	��@.����VE@1&���s@3�L�}@5$1�rI@7?�� ѕ@9m�I ��@;���vP@=��H��*@@1%�,4�@Aj׵�W|@B����#�@C�b�#p�@EG�4��@F�ޡ/�&@H?_�O@Ih�0��@J�m��G@LL�gv��@M�2rw�K@OL����@Pj�0,@Q2��F��@Q���N@Rˌ�w�-@S������@Tpa?�چ@UG{$��@V ����_@V�ƄG{@W۫��@X�6�A��@Y�ds���@Z�.�I@[q��w�@\]~�E�@]K�NX�@^<�xV̞@_095>�@`��w�@`��c�F@aTJi��@a��v# �@b
Q�>K@b�?�@c��)�W@c����8@d�W�o�@d��)(�z@e� �@e��z        ?�oEt��k?�ű _?����y�@������@[��G@ut��@p�����@ Sͺf@$TS*&�@(�պ���@-}��&\D@1P����@4�=t�@6�<��@:.#��@=R����@@_ 	�}�@B)\j)I @D���k�@E���ԃg@G�P�Ax<@J�Iy�@LC0T��@N��:\�@Phc�1��@Q�9��C@R��Y��X@T6���@U_��E0�@V��2,I@X;�J��@Yq����J@Z��� oV@\P#̘��@]� hƘ�@_Mrwk��@`k�gT�@a4U�b%@b �ʮ�@bЁ��F@c��e�@dzߒ���@eUF;�w�@f3��D@gM]hӾ@g��!е@h��m�M@i��A��C@j�9CyU�@k��$���@l��M��*@m�j��k'@n�b��*@o�h�l� @pI9PD��@p�<	�ȸ@qN�8�@qө�R^@rZ���@r��q#�@sk����@s���h��@t���,5"        ?�SƐB?�p��'�?���&4�4@p��w�@��k@����ܬ@]�)��@ ��BH�@%��.E@)�^����@.�Z�TYn@1�'�,n�@4�q�Z
'@7�t�7�@;4Zćn@>z� � @A�	0�E@B�fӷ�@Dֹ����@Fް��F�@H�&>Q�@K+�9'�	@Mp&J8wG@O�39�p@Q}.ҟ@RX_�{Z@S�}�,�@T�$,�@VK�&nj�@W�ƹ��n@Y_;��x@Z�AE5�@\m<o@]��N9�@_�C�@`X����@a'P��X�@a��c��g@b���Y�@c���
�@d���b�@eh�j�@fM����k@g6���j&@h"���Ώ@i�x��@j��ȸ�@j�B�uB@k�4���\@l�zE
�@m�	jز�@n����>T@o��۟@p��V�T@q<�R$
@q�~�f�@rN_V�@r���,O`@s5�ZQ�:@s��I��@tS��䒻@t�R��J@uw�"��        ?���Mg?���Bt�v@�lj���@�,�p�@V���z@"��L�C�@)6�_��!@0<L��@3����j@8&�Q��@<����F@@�<r?W@CJ�f��)@E�4+iB�@H�>��5@Kţ��V@N�D����@Q4�^O@R���s@Ti��xR@V0rA|17@X�h7@Y�)��א@[֜���@]���cJ@_��n��@`�����X@b	V����@c����@d<3�3I@e^!��@f����
@g�i̟m�@h䊆�%�@j�d���@kXL����@l�´q�@m�(t��:@o+j/���@p=�S�]F@p�|KG�@q��AA�.@rC�L�R@r���gV@s�xF��_@t^����@u��Ƕ@u��b�<-@v���wF@wJ#!/t@x
Rb%h�@x̎ubUw@y��`��@zV����@{#��9K@{�/"�Z@|��g�@}������@~ReX+��@#��⟭@���;x�@�e�	d�@����Q-m        ?�����d�?�I�n
��?��7�|?��K����@p���@Q��o@����@��l�p[@��M�I�@ ��Q%P�@#��%�R�@&�3ۮ�@*@���vz@-����@0���5�P@2��GZ?@4�}TU�X@6��&#��@8�1��o@;k�d��@=S��ߘ�@?�k��@A	���^@BE�YMH@C���@D�
�}|@F(0�y{@G�k�܈�@H��m_C@JL���2@K�&dT�-@M2}��t�@N���i@P�k��/@Pޘ�s�t@Q��E{�@Rr<+��t@S@���6�@TB(��@T��� ��@U�B䷸Y@V���I�@Wu�ƍ�@XU���G�@Y8ك:Y�@Zw�p1@[ʷ�(A@[�ʠc��@\�mܙ(d@]ϫG��@^�v���9@_��g�r�@`W�<��@`��ت��@aSJ�hݘ@a���'@bS�6#T�@bա.oV�@cX�vt�l@c� ��Ur@db�hIª@d�>�ǂh@eq���        ?�Q��y�?�́�L�?�����$�@��t��@1H��@�͊��@w�[�@ ��b:��@%#���9@)�J�^9�@.���@1�w�b@4Ԫ��Ʊ@7�^т�A@;s�Sf�@>i�C�)�@@����@B�x��Y@D�bt�@F�%�
C�@H�VB��@J���V|@M4D6�d�@O�+�l��@P���r`�@R&u_ѿ�@Sf�P$B�@T���~@U�v��:@WX�ן@X�nO�)�@Z �{���@[�&�ŚO@]. ��Y@^�w��t�@`p�K @`ˤ4BW�@a�Fe@bbF>ã�@c2�)Ѭ�@d#<V��@d��WVɾ@e���E4@f��M�TY@gs�>�	�@hV����d@i<�X�\T@j%H�Cy @k���P@k�c��}@l𢣐f�@m�L#pQ@n�OoW�b@oԨ�@��@phP���O@p�o�s@qh'��R�@q��[o�@rmϼ�k@r�^���v@sv��hm@s��i �g@t��P���        ?�v6�f7?����?��P�W@�����@r( -�c@��.�@���X�M@!,���;c@%d��~W�@*c\�s@/���%@2<>f]n@5!��v�T@86F��9@;x�|�ָ@>�H�)/;@AA֓(iR@C%��m,@EZ�q��@G*Q]a�@IK��K�@K��W��@M�+B�]@PpJ�ˮ@QI�g��@R��
|�@Sӈ�)E@U%�}�@V������@W�L_C?�@YP-̔Z@Z�J�^:�@\@d>0�@]Ī A~@_P����@`r/:��@a?��XB@b7<A��@b�G.�^V@c���a?�@d�9~Q&�@e{��@f^Im�Ip@gD�l��U@h/��@i�N<g�@jB<���@k<vAb2@k�m��1@l�˦}�@m�L��I�@n��qȔJ@o��ɂ8@p}�{@qr.�@q��X���@r����@r����]*@s$Y.J�@s�i>g@t=��+>\@t��^<3K@u]�t�        ?�úC�K�?�l� ���@s/Y|`�@!�</�@�o���k@$R�7-K�@+1��5@1C��Q�@5g�;5SF@9�X@t�G@>��۱�T@A����@D�����@G�[j�р@J��:��@M�]��U@P���H�@RR��ft@TX��[ @U�%U��@W�����@Y���#��@[�o?�C@^� `@`���@a/c\��@bP�l@cw��G��@d���-j@e�g��b'@g��Ƿ@hU銊��@i�����@j�T�j��@l;Ŵ��@m��[K�@n���~@p*�� |@p� <@q�7��~@rPݢ�v@s�tb�@s���7G@t���qXh@uR 
E�@v�"��
@v�%��@w���U)�@x|T�XC@yL��S/}@zi�-P.@z���0��@{���@|�耀�
@}��J��N@~`G̩��@@�.��h@���]�5@��;w�+p@���4]@�lX�>��@���ebKy@�X��EC        ?��5>i�?�: �@P?���-ו�?�*��נ
@���@;2y.@y�~i@��yF�@�xo��@"ؾ����@&�f]<@)��V�@-ń;��@0g(+���@2V�)�B@4W�>�G@6jn9H%�@8���,@:��X��k@=��{ �@?Y%�_@@��v�U@Bbe1$�@CVq1�{@D���Gv�@E���q@G>���@H�x-��@I�'!��s@K`�g[@L�YaY�@N?�Y^��@O��s�^�@P����^�@Q]�v7��@R"�����@R�鼛��@S��g�[�@T�t���>@UOX�$@V ���1%@V����K@W�;��@X��N��@Y~z��'�@Z[���
@[:�Ҷ�@\,���@\����`@]�mV�K�@^�>��?N@_�..a�@`Q�L���@`ȲL���@a@�{i%�@a����@b4Y�?y@b��1�S@c,**@ׁ@c���{E�@d(-e�u�@d����~@e(?��        ?��C�!�;?�R/
*?�8�V�/@1Dz84@h�$�%�@C%H��@������@ u��/2�@$z(���@(�(9���@-��6�N�@1ej ��	@4$I�l�@7c��tM@:%��U��@=f��1��@@h�;ň@B2f��@D���F�@F ��o@H]ɦg�@J����@LF�6@~@N��QD(@Ph,��H@Q��~�@R�)B,�i@T�Ԟ�@UY��"�@V�-�*݇@Xfg$�c@Ye~޸vX@Z�T�z	�@\>�'-�@]��<0@_5�fy�@`^=���@a%�}@a�\�u��@b�7�W@c�<wӟ�@db�"��@e:c/A�@fMy>�@f�_�͚@gԉx��@h��_�g%@i��:��@j��bsp@kw�'�@lf����@mYUޞ@nN�x���@oFdyE]@p i� ��@p���Y�@q��V[@q��Ò�A@r!���A2@r����M@s)����@s�I��E@t64�mI        ?�l���"?�|�3.F�?�Ƕ�<@�����@
�zǅ@�n"��@�؉̤�@ 	��W�@#�j�_�@(FS�x��@,�o���3@0��yj@3�1O!8@6��t⒈@9�xb�h@<��
�~�@@�"�@A��t��V@C��{N�b@E�Ό]�X@G����@@I�U��-�@K�jV�B@M璌���@PQx~��@Q?u49��@Rr��p*@S��I�@T�����V@V;	w%%�@W������@X�Z�)@ZJ�E	��@[�wW8-@]%~�pm'@^����F@`����@`ѵ7�_�@a�M��`z@bbDشWP@c/�J�,�@d ����@d���ێ�@e�����@f���Z�@ga��vH�@hB
��]@i%.*���@jEr�VG@j�D�t��@k��Z@l�����{@m�>N|o�@n�m,���@o�NJ( �@pRk��]>@p�/�~@qO�#��@qЁ.��@rRf��@rՉ�բg@sY�y��@s�v=t��        ?ؖH'�i�?�\�L�;g@L����@����|@g��z��@#0���.@)x2CY��@0>ڀ=��@4ε�e�@8J�H��@<ʵ80��@@�1lRh@CUQddoy@FE���=@Hд���S@K�cL+�@N�0����@P��q���@R�+�|'@TS��,�g@V�!lr@W�Y�#{@Y��A?�@[��R��0@]�z\f��@_�9{ݥ@`�:Y���@a��IZ�@b�%��_@c��4�^@esRe��@f:I�'�@g_E*6�@h��H6�@i����@j��⛷�@l!�܈@m\ָVV�@n���&@o�,�V)"@p���ԹA@q;��k{@q�Q�u"@r��b�@s9�vj��@s���@t�0+�~@uI(KI��@u����@v����8j@wh��
�@x!R6PI@xۢ��G!@y���//�@zUU3t�@{��d�@{վ�h&*@|�n%��@}\�:�@~"�H60@~�1@�@�$�&��@�>ڜ.E3        ?�t�4?�׌/O�?���=��?�b�Ĳ�@LU�� �@��u�e@z&F��
@���.��@G��� /@"*|�ئ�@%d\z5�@(���ѭ@,h�A@0�;<M@2����@4*�7�@6>�a�Zt@8ty���@:�.�y g@=�7&:@?����3@AB�$</@BL8�:�@C�H�o@D�`��H�@FY��|�@G���:�@I6���w@J�+��@L1�4��J@M�#��}�@OK�*�@Pq����"@QA��+@R�n� O@R�G��j�@S�M����@T���@U�pU9!�@Vgp���\@WN���~2@X9���@Y&�k,v@Z�(��@[
�Wg�@\ ����@\�vQۢe@]�����@^��P�_�@_�*uY�i@`}����@a6���Z@a��a
�D@bC؈�@b�P`j�`@c���>@c��I��@d0����@d��ҽ�@eI�s�ɰ@e�Yß�6@fg�>z��@f�z�>��        ?�4㭤�R?�TK7�?��Z�T�@Zи컽@��s<|�@�,�k�B@#�jU @ ����t@$�ޗe$�@)d�Ճ	�@.K��7�@1ɜ�3��@4�ƭ��@7�Da]�[@:�&lyhb@>(��]=@@��P�F�@B�����@D��Vf�*@F������@H�Ջ��@J�
�\@M"�G��@Ou)����@P�F;�@R)` }�@Sn��KrC@T�21�7�@V�Xz�@WtԬ�z@Xݷ�@ZO `Ğ@[���_�@]J�7a�@^�5�Lo�@`3���@a �<�$Q@a���<̼@b��i\�#@cd��33@d[ݓ!B@e<��$@f�腶�@g}���@g�Kk��@h�D���@i�m�%�@j�
��eO@k��z�A@l�v_r4z@m�-�C�@n�-�1j�@o�k�@pho3	T�@p�S��D@qv����O@r �^Q�@r���S�@sW��O@s�;�B>H@t4��V��@t�[No6@uW��9np        ?�^h��[(?��3[4�P?�յL{��@�y�z�@�Ή�@��Vx@q��@ S���@$UO\��@(�Uy�j�@-}��>�@1O�$��_@4�%�ʣ@6�ᓻe�@:l��	@=S��k@@_�y�M�@B*xY�@D	�;�@E��PiT@H�%^�f@J��5��@LJ�Nl^5@N�H�\�=@Pn�=�Y@Q� Sl#�@R�C�.@T�H�܊@Uj�亳�@V��\�<@X�F9�@Y������@Z���� @\d"�U�h@]���/@_e�~�@`x��9��@aB�iQ��@bh�4\�@b�'��@c�b��@d��y���@ej����@fI�/$@g,^�CV@hR�(��@h��+T2�@i��f2�@j׭�]�@k�{y���@l�d��Gc@m�^5_�@n�]���@o�Y��,r@p[$ v�E@pݐ�_:@qam$��@q�^8@rmdSl@r�u���@s~�~��a@t	����-@t�ώM��        ?�R��?��0٪C@�|��(*@�$�
ϭ@-���e@#�sھa�@*IA�O�@0̽�h��@4�3��+:@99G8�|�@=��6�ͺ@A��}�j@D2!��@G	���@JЍ>��@M'�w�@P5����@Q�bY�@S�Y(���@U�h��	�@Wh�k~<@Y]X���@[a�`�_�@]t���h@_����<�@`�bZ3�@b�+�	@c)7��Rl@dVZf�e@e�6S�F�@fĭ�}'�@h�n�iz@iL�Jr�7@j��@�K�@k�g`���@mHA�:@n����q@pڀ<(@p��O�L2@qu6���@r0g�R?�@r�p���@s�$��%N@trx�ں�@u8_%ŉ�@v �q��@v˭B�R@w�����@xh�Z�@y:���A@z� aP*@z�M���@{���	�@|��,l@4@}u�`��=@~T��'^@5�����@�Z/%��@�~�⽥r@��j�~@�f�5�Y	@��`���@�R��5�h        ?�)�"Q��?�9�4�o?�JJ��?�xEz�D�@�6�<e@����R�@8=���	@�?۠@cA����@!b*=��@$[�eV^@'S3��a@*�s�O@.N&��l�@1��*P"@2�h�� @4��O�8�@7� ���@9D��m9N@;�%O�9Z@=�;qБ*@@J�H@ASf-��S@B��Ɩ~!@C�9�L��@E/��3*�@F����@J@G�l��:�@IQ��T@J�W���@L7ЭpZ�@M���*׳@O:+��D�@Pb�(��~@Q+�e�O@Q�j�L@R�p�١�@S���XB�@To�L1@UHF:�@V#�/%�a@W�u��@W��;ھ@@X�E�C��@Y�[�9��@Z�+TD�@[�����@\t�D���@]fTl���@^Zr��Rs@_Q� Z�@`%��r�@`���K&h@a!�u^��@a���M�@b"����@b�ܠ��@c(.�52w@c��\��@d2;>�G@d��$VҴ@e@Z����@e��{]'        ?�ɂ�ys�?�f�3L?�$ڂcZ@Ǐw(��@�Hr�2@1Cz)@���'u_@!,���ω@%c����@*�VO�@/	RO�+}@294��@5)�͝!@82ls� @;tﮢ�@>�+�@A@c>g�Q@C$)$�	@EB�G?@G+Mଖ@IM����@K�����@M�= +
�@P��eu@QO6o�|@R�2���|@S�q�[Զ@U0�,���@V� 	��@W�DC�z@Ycܕ�@Z�kw��@\Z&L��j@]�"ƻo�@_r>!�� @`�+Bn��@aU$�"�T@b(�9��@c ����@c��K|@d�f�C@e��&��@f��:?��@gm�(I
�@hZ�5�˂@iK��ŗ�@j?~�G�@k6��ppk@l1.e���@m.�36S�@n/����]@o3P�
lX@p��+�@p��&U��@q(J�9G@q�C�w@r9Na�[K@r��eϺ@sO����>@s�P�I�@tl�I߸@t���@u�nܱ�[        ?�`���J?��p�f?��)k)ތ@��E&�Y@
�Y�c�@ ����6@`��@ J,}��P@$J��Ҙ@(�"��@-s�����@1J��/@4	SP�6�@6�4��{D@:
W�c��@=J�x@Dm@@Z~w<@B"�u�s�@C���9J@E�1�ӌ@G�[	�-@JS۰
@L,�@-ž@Ne#%R�6@PW?2\i'@Q�X���@R����hQ@S�؈? @U<v����@V��i��@W�R)��@Y:�T>:@Z�#�b�@\�s��@]z�7s��@^�4�G[@`9�4/K�@`��gt�@a�\@�@b�8m�#@cY���@d)����@d���RM@e�%ʈ@f���@g�Ķe�@hf�?7�p@iHj�j �@j,�����@k��Ȓ@k�� J� @l�K�/e�@m�uF���@n�;x���@o��tȇ�@p[<��Bv@p���@qUٌs�@@q��)��]@rUK
L�~@r�Ǖ� �@sYj�ŧ�@s�0���g        ?�p>Vl��?�B	�l�@6v�A��@tYu�H@]T��&@#0�QbeY@)�YP��@0K��"�T@42R U�Y@8p��#�@= ���@@�ǌ�@C�����@F?��"�@I]D�=�@L�k*	@O:i�	e�@Q<�M�f@@R�á�
�@T����a@VvjA�2�@XQL�d[�@Z:TZu@\0b�6Jx@^3���@`"/nԈ�@a0�5�n@bEq�\�W@c`3��@d�ޙS�Z@e�Q��(@f�mEsp<@h@ݛN@i<%�20�@jx�q��@k�")�;D@m �	͞@nL�֡�*@o�.�#`~@pyV��-s@q&{6�bz@q��9�|�@r��b���@s;�/P��@s�B=r��@t��6�@ue�?"�d@v"c�@v�U����@w�U��j�@xeY�=@y*Y���@y�J�!.�@z�(ɍҝ@{��F�2@|Q�f�N!@} '�d@}���%@~���*@��?�8#@�6iJwK�@��?��['@���2�+        ?�yֆx��?މ��?���o0c�?��ɍP��@?��K@�d�v)@YΧ�x@4K���@y�_�@!{_sik@$�����@'Cx+��@*��Z�I�@. ��@0�3L�@2�=�0��@4�ŢmD@6�k���@8��O쉜@;�z�6@=?A���@?�H�X�@@�-k9�@B"�Lj�@C\.�E@D�WHV�@E�bR�#@G4'C��-@H����@I�M���I@KGg�<�+@L��/��G@NI��N@O�8捅�@P�*���@QE泩*(@Ru����@Rͷv��@S��l�0�@T`�u@U-)��O@U��&�@Vΰ��NB@W��0��@Xy��W�@@YR�t�@Z.�n	�@[t�e@[��Ȓ@\̰�#�@]�mwu�@^�2B�ӊ@_}��T(@`3�-˦E@`��K�p;@a a��B+@a�OZ��@b�@�P0@b��Ɠ]@c!�Ot�@c&=p�c@c��h�@dw�I/H)        ?ș�V$��?�:_�u�?��q�{�@��q(o@2!/�[@ x!�>X@��q#}@ ]�PX
�@$_�'v�'@(�:��	�@-��V)@1W?�<@4�_��e@7��U@:����@=]��0�u@@e_[-M6@B0]Ոw�@D�Z��p@F�M�T@H�65E@J"��Kշ@LN򲊈G@N���w�@Po�̴ݴ@Q� ���@Rې�ޓj@T���@Ujn���/@V�����q@X�E@Y�gG)�@Z�}�,��@\a:��|:@]�ض���@_b?W�F@`w+�K\@aA����@b���T{@b��i�@c��)�@d��7"`@eiȫ?�J@fI�T�1�@g,ɷ�u@h}SU�@h��,HX�@i�V��<@j�ؑ]@k��K��@l�:��@m����c�@n�m�(�*@o�=����@pbhު�@p勭	��@qj�]�t@q��ᘨ�@rx����@s=�!�3@s�EW�T@t/��"@t���p�        ?�Ah��6?�2�A?��C0H�@��kؼh@
�Z!�<�@�L�@6����@ ,ࣂj�@$#E��@({)��S/@-1���.@1!ش���@3ב��%@6�Ƒ���@9�]���B@<�Rd��	@@+V�e��@A������@C�p�Z��@E� ?T�u@G�h2p�@I�#7�ڊ@K���ujD@N2JK�@P"7=љ!@QK+/Ls�@R|K� W@S�nRF?@T�m]�� @V?!=�)@W�a�n�@X��B��@ZE�XF��@[���-@]׭n��@^����Ǝ@`�C��@`�V�J�@a��]@bN��4oD@c���V@c�1�@d��	��G@e��K9��@f^���@g7��-0@h,�ì`@h�n9V@i��r�n�@j��㈈�@k�*�U'@l�P)�(#@mr��0r@n`Ze�@oQ.̹�E@p"A�l�@p�(&^�@qG%�r�@q��'�M�@r $0@r�ч�|�@s��ax&@s��!�        ?�}����?�J��J�a@;����i@�ߌ@W��Ee@#(��"@)pW@�Z@0;l�z�@4S��W@8Ip?!�@<�8���@@�#D��@CU(��+@F����M@H����2@K��TC�@N�
,g��@P��/�V�@R�kO.��@TJ��!�@VH=��Z@W��K�@Y����i@[�!�[~P@]|S���@_w$9&��@`����^�@a�>�_�=@b�@6�2@c���{�@e �X��6@f{�[U~@g@�GIc@hhA�C@i��$U@jĒ�Ϋ�@k�����@m3q=ڧ@np�k�A@o���=&[@p|@#vr�@q!3��@q��
R@rp�D�/@s�D���@s� �q@tv?Ev�@u&=��X�@u��F�R@v�[d�@w@iZ�<@w��<'@x�Wc�y@yi$m�H�@z$t78�*@z�>���@{�|c�?@|_%xt@} 1�T�5@}���@~�]��L�@kp,u�`@��a��        ?�г�~�r?�Z/7�A?� ��D|?��^��~@89�8@ͫ���*@�:<��@��锲@@I�m��$@" r��;T@%Kn��z@(�#����@,%`���@/�a4֓@1�`��?q@3ͩ@5�t�s�@7�6{���@:/w���Y@<r���I�@>ƧC��@@�W\�@A�6~$�X@C���@DY��H�<@E���Yw*@G�ޓd@H_> wik@I�(Ws�@K/�|S��@L������@N�&�Wx@O�	J�U�@P�-��k@QST�n�7@Rs�W��@R���@S�|��U�@T�Tp̙@UY�?@V/{H��@W��0@W䟛/p@X�3w��@Y�dj/�@Z�(7���@[nw�}QN@\WMl\�V@]B�iaX=@^0fN�U�@_ �!.�<@`	��*��@`�W�9U@`��?$V�@a|W�U�@a�1�=	@by"�B�@b�'ڋg�@cz=�AA�@c�aߊ'@d�%��s@e� ��@e��x�	        ?��_n<?�<j����?�.��d@��b`	@����@&�P@އ�uو@!::[�=@%o��Л@*J�ǪA@/E����@29�ؽZ�@52/���@8+k�6g�@;i7 ���@>Ӥ��$@A4��+��@Cu�G�@E	���@GBfՆ@I3���v@Kf�3@M��B9�@Pk�㧛@Q8GN=��@RwZ�_�W@S�|+M��@U�tǋ(@VjJ(��l@W̫o�.@Y7���j@Z��I�f�@\%�&b�@]�a�v�P@_4���+�@`c�s|�@a1T�/	�@b�H�Ď@b�~NG��@c�$�4@d�ss�%5@el_�x&�@fO�P)��@g6�Zc�'@h!i[��@i]�g�@j ��z��@j�jM�Ŀ@k�h,R��@l褡��<@m�ɓs@n��1��@o�W��T>@pz���S@p��F* _@q��O���@r�H�@r��&sS�@s$��h1@s��YOʞ@t>�6"�@t�"�`�@u^�j��        ?�����'�?�z2��?�~c�8�@,1�B�a@
i���@V�����@u�G���@^F��S@#�T�R�@'���}�@,E�YU�@0�dmmOW@34�F�Z�@5�}�V�V@8���;�@<����@?I	�aI�@AW��	9�@C�+�1@D�L̛��@F���rW�@H��W}�@J�B�G@M���K*@O6b.Ɂ@P�����/@Q�?��L@SQp�!�@TH5�ޚm@U��4Þ@V�X���c@XKw!��@YmPt;i�@Z�Eĺ��@\*	ˁ�@]�x6�-@_s�Z��@`;o��0�@`�Oߔ�@@a�N�J�@b~^m�ng@cEuW�D�@d�"�@d܃=�F�@e�`e�
3@fWF�@gT�k$��@h,���"/@i���E�@i�;�W�@j�m��+@k�6�u@l��V�t@muc�{]�@n_����d@oLt1�O`@p�/mD�@p�����@qx�eKV@q��$bJ@r�R�Gh@r�!�e�L@s�B�$B        ?����\4?���*���@�k�`V
@X��fiF@�0#޷�@#s����?@)��RJl@0}�Ө�E@4lѢx/a@8���j��@=Kb�[�[@Awv�y[@C��a@Fp�J��@IQ�s�mz@LT���|�@Ox2 ��}@Q]ςY!-@S�i�D�@T�&�(��@V���@Xz�߿�'@Ze�/k�@\]���@^b��T+t@`:Qa8@aIk܂�@b^�$�K_@cy���@d�hm�>@e���ܠF@f��P��@hJ�[\�@iU2�@j�%e�@k�l��@m�:��C@ndE�؊�@o����@p��Z�Wx@q1�j��@q�gϱ$�@r�)��|�@sG=�'s�@s���K�l@t�?��,~@uq1���@v.2ϲ��@v�r�2h�@w�ב��v@xrXo�mq@y7��jf@y��^@��@z�.��@{��/�A@|b[a�F<@}1Ӧ=%^@~-�M3�@~�a�-��@�i��J@�Ap��r@��hg�@����|}        ?��q�=6X?߃"^�?�o�fGē?��J�.��@�?��J@�f}�@ ����@8r�@��a2��@!ڭ��o�@%��{q@(b��6�@+���s@/�<::�	@1��E�-@3�6tz{@5�Af���@8RN�j@:?��~��@<���>:6@>��=
��@@�M�X�v@A�&@C;k�μ@D�]"E��@E�X03�@GI6i�;6@H������@J$5qsM@K��:C�>@M�(�� @N�����[@Pظ8r�@P�S��@@Q�)�-*9@R�De�@SV�hý}@T-�����@Ug�pj�@U��ہW"@V�/"jc�@W�pb��;@X��[@Yx����@ZdEOv@[R�{��x@\C�		@]7јG/@^.A`��@_'>�,�@`_߼��@`�[Fm,@a�F���@a������@bb���@b���wE@c���6@c�pc�@d)<�-]�@d���#@e9�-��@e��]&�=@fN��T�o        ?�j>	D�?�+3�g�s?���iD@r����@Y���\X@>!�MeX@��,?2@ xd�@��@$���`�#@(�y
o�@-�-�3��@1pL���O@41�У�E@7��u"@:6��2 �@=x:�[@@q	f���@B9��-�@DҤ~�t@F���.@H����@J`�:�@L=��X��@Ns��e�j@P]9R��*@Q��|��7@R�]�&#@S�̮r2�@U:����_@V�����G@Wׇ�np�@Y0�d��@Z��$�/@[��d��@@]e���w@^��VV�@`*=䣭t@`ꯌ�c@a�1��>@bt�R%=@c>,jֹ@d
���:@dټ�@M�@e�����@f�u(�;�@gW�P(l@h1骐|�@i�5_��@i����z@j�u��)�@k�����n@l�KM�T�@m�W���@nn�V%_�@o\�/;��@p&S�{G�@p���D}@q٢C�@q�J*x�@rӇ�ր@r�r˚܌@s%�U��@s��ao        ?�k�����?�ð�
%?����;�I@�ϒ�8�@}�8Li@��&�@ȃZ�x�@!0Sﯢq@%h*&yp�@*?�2J�@/pR��@2:s��Y@5���@802ҭ��@;o�ڑJ�@>�.U�$�@A:"�U@CQ(�@E�x�H�@GF0U@I;��&~@Km�C��@M��G��}@P/ۚ�\@Q;�wά�@Rz�5�+�@S<���@U�2�=@VlS����@W����@Y8� #
@Z�C�}�@\$�̃-�@]��}@Y�@_0��4S@`a2U��E@a-�Gp~�@a�'>Lw�@b�-�
_r@c���Bc@d�;~@ecڇV�^@fF��&@g+�� [�@h����@i���%@i��2�a@j�n��@k�U�s,�@l�S�+�`@m�]?��@n�g.���@o�g5k��@pj)�k
5@p�Ȇp�@qsgT�lF@q�&[\�M@r�J�`:@s�i� @s���(!�@t"���L�@t�i�E�@u?A���,        ?�C����?�qED/I�@o�H��@E`��z�@�fF���@#g��s�@)��j)�@0y�@Y�0@4k"�\r�@8�w�I�@=Qs��@A#��@C��~�<$@F}ASR��@Ib.,�@Lik���@O��چ@Qmd�`2�@S!�@�z@T�aU��@V���_�@X�ٟѩ�@Z�f椷N@\��#��|@^�H?�Q@`T��U��@ag��m��@b�6���@c�Һ�@dƙ����@e�mWj�A@g$.���@h[�z�&�@i��߭��@j�й�+�@l$Tk� @mq����<@n�/�)�@p6�s�@p�����@qm��V�f@r �oq�@r֠��w@s����(�@tH�E�x@@u{�@u�3�z,@v�}a8@wHl;?�@x,w@x�0�Q<@y�F�k=@zhT�� @{5Q�#7@|4����@|���ؒ@}����a@~{��}��@R--�w@����7�@���Z DV@��d�>�@�]�77�        ?�٥]��S?�!�#&{�?�0�؂��?�Y�|�@�"N���@y�kj�@��f��@�+e���@�d[|7@!w"��!�@$��:,�@'���(��@+M~�l5V@.�
�		�@1Z����@3S\�\�~@5_DG�@7}d�}�m@9����@;��o@>B�����@@Sp�b@A���@BΘ�[�@D�|y@Eh���-1@F�Y��1@H �%�f@I������@J�GP��@Li��|@M�t-��@@Oe���@Pv�-?-@Q=o�w!<@RC�wT@R�fm+%@S�����@Tv=��M@UK�՗ch@V#�� ��@V�^3�@W��n�2@X�ô�Ĉ@Y�UA|;�@Z�k`��N@[j�n�4j@\T���LL@]AJ�+��@^/�a\�@_ ��w��@`
�n{�@`���W$�@a �.O�B@a}���@a������@bz��_�@b��J$S�@c{�ϙ@@c����{0@d�����@e���v@e��>j\�        ?�.�6c�?�͗��?��ċ��=@]��%��@�Xx�*@�+�5*?@ �*��@ �Ya���@$ں5���@)Y:���6@.9� �z@1�|'^x@4��k0y6@7��VIj�@:��g��v@>�{H��@@�����@B�k��@D]���@F|j�W>@H�.)��@J�D��F�@L�Q����@O2�[D@P�G�@Q�S�L@S=��@T�vob�@Uן�1j@W19ֲk�@X��8��@Y�.��^@[oA`�-�@\�9}:�}@^j���r @_�S�flT@`�&@a���p@b^���@c1ڦp+d@d�d���@d��&�@e��=	�@f�%8��@g�z5�#*@hn3��_@iY!��8@jG6P�LH@k8dE�k@l,�b�Y�@m#�D��@n�|@o&�WP�@p�;xڽ@p��;z�@q���ū@q���T�c@rr���@r�L2�@s*u]=U0@s��uG�@t>�b�7y@tʊu�mC        ?�$d�=�$?�a@^��?�u��@Z�X���@�pZ֘�@��7F�^@<��!��@ �ɒ���@$��ݯ	@)��7���@.u�C���@1��r���@4�u�И�@7�+�ʅ�@:����@>Q��TIR@@�^�G@B�IX�͗@D�8G�@F�v��@Hѡ�I�@J�^��@M:R��@O�%&���@P�?9��@R2��7�@Su��˾�@T�-���@VDs�@Wt�	���@Xڴ<���@ZH�l�4@[���@]= �dq@^�����@`(9uM�C@`����:'@a�����@b�
Z�J�@ch�Nu�@dA�:~@eK0u�S@e�S��|�@fᾡ�OY@g�~�O�@h��G
;^@i�ǡ�1�@j�5���@k�¨���@lza��G�@mt���@np�b~)X@op5D�O�@p9T�,~]@p��h��q@q@M���@qłʨ�@rLXE}��@rԈѪ�R@s^�K�@s���Vv,@tu1�x�@uhC���        ?�g.wD��?�:�-l�@-�+�@4���d@I���"�@#�}C�@)f�G���@07�u#L@4�kױ@8HH$��@<�s̍@@��k�@C\uhy@F��K\@H�Ŭ4ߐ@K�5
��@N�"�+i�@Q
��@R�q�`v@@TmX�|�@V2R�=Ľ@X�xB��@Y���d�K@[���P9k@]˓`-t�@_ѐ���@`���+ڷ@b �n_OV@cv_Vfl@d/�w�]�@eO�
$D@ft��5�2@g�u�4b�@h�9\�DZ@jn��]@k=���9�@l|�}-@m�_K�â@o�/�@p*�̑1@pӎ����@q~���%n@r+�.�@r����k@s�Xx\@t?��v�J@t�P|偰@u������@vfX3j@w!�/��@w�3v��@x�}�6G@y_��J��@z"���1 @z�p.�@{��ζa@|vQ�HAG@}@S.�.�@~��#0@~�L�֒{@�5�W7�@�<Y���@��`G��        ?�D��+|]?�A:�~�?��<�?��Z�Țw@���{.@�uk�M�@^�� L @DQJmX�@��_�@!(�ql�@$5�<kM�@'o�xT��@*�q:Ā�@.b�txz@1*��Y@2�H8+T�@4�J=�@7�'�
@92@�t�@;g7�7�@=��<��N@@Q����@A4�kƺ@Bnfn�*@C�C�D�h@D�u<�@FI���@G�'cj,�@H�Z�_;6@JdH��b�@K��̟~�@MA�A�N!@N�G� C@P��wP�@P��R�W@Q�z"�j�@Rl��˩�@S8p�R9V@Tҵ�l@T��&i�@U�,��@V����@W\�#\��@X8�@�m�@Y���g�@Y�|Ch�@Zݫ�N:�@[�l1#@\����zR@]����E@^��.�Kj@_x��Y@`6��۽@`���d�@a,��ƍ|@a�5-���@b(�#q�@b�-x���@c(�$�S@c��|B/�@d-����@d��vK%�@e6��        ?Ȳl��f?�,B�{?���5�/@�]���@D��M�@.P��O�@���@ j႔k@$o��@(��ҳ�P@-�x��+@1a}�RI�@4 �D���@7i(vw@:"�ٍy~@=c4M�s:@@fG�ُ�@B/��:�@D\׺�Q@E���$ @G�^Su@J@��5�@L9A���i@Nrw
��@P^&E��@Q�ս��:@R��q�/�@T @+�+�@UF���m@V�t��X@W�Lȁ�-@YI97��M@Z���)g@\�U�-'@]���c��@_rv;{�@`G��T@a��e��@a����c@b�� ,k�@cn{0;�@d@��Յ-@e�@e�&�
@fʀ��d�@g�`D*�@h�P'��@ipH�3��@jXA�b�7@kC3��@l1�6��@m!��x+�@n���Ǵ@o�t��@p��]��@p����@q +���X@q������@r'O&~@r���2O@sH��}�@s�VK[x@t�#PU        ?�C�	|�?�I]��?�a��L4�@@(.�@�lb��@`K�.�@&m�D�~@!c��ˀ@%�4���C@*;�*�E�@/;>��`@2L��2h�@5)��-@81�aJ_�@;e�)7�@>��͘},@A%RU�E�@B��F�t@D���`@F���$R�@H���@@K'@!@MOR�PZO@O�?A֭@P�< x�#@R+�Qui@Sh��;��@T�ɔ7��@U����"�@WO��-�@X�� nkn@Z
���@[|�Ÿk�@\�E���e@^j�a��@@_���_@`��<��@a���BZ�@bM�vb@c\:�G2@c�D;N�@d�o4b@e��JwF�@fwZƠN@gVk��@h7����@iz���@j36YT@j��X�J@k�Z�޻!@l̯�\`�@m����@n��<��x@o�$���@pT�@�k}@pӉO��@qS� ���@q�#�6��@rW��T}@r���Yq�@s`瀃й@s�C��@tn�EL�        ?�>߅��W?��y�2Z@���F6;@g�
r�@b^[t�@$�!��1�@+g�g�y@1���� @5�Ӊ��&@:K��K��@?:]���@B@
xt�@E���@H4np[@KnS,��@N\�i��@P�Ư�Vh@R��GA�@TyD���@@V^o���@XS�Es�@ZXRqj@\l3�}x>@^�ݭM@`_��])@a�0��@b���q�@c�L��f@e(����@fA��=,�@g�9�U�@h�/�%Ɗ@jE0n\�@ki]1@l�]4�Ai@n!,s
�s@o���k�n@pw����"@q/�n-8J@q�K���F@r����h@sgj`�=�@t)奚�@t��&9��@u�z�G.�@v�|N�s�@wL�,���@x��P@@x�����@y�*&�D�@z��X&�@{m�P�%�@|G��� �@}#��`@~���@~�l�Z��@��=LΜ@�T�q���@�����Vp@�<U9�=@��?q��@�'dsrG�@��{:�]        ?�@�f��?�=�J?��j�}B?��{<�:@����Q@	N�f&�@�;�C�V@��~^l@�h�bhl@!k�Կ��@$������@'�?ٛ�@+q�r̅�@/'����@1��I��W@3���<�@5���
Z@7�ʴ�Fe@:Vd��@<q%+�s�@>ڱ�A@@�:����@A����B@CAci��@D�<�^�@E�X}=�@Ga��i��@Hѩ;�@JI����@K�	�F��@MO�̠Ĕ@N�(�\��@P9�C�ac@Q�J��@Q�Q�R[�@R�!Y�@S�09C�<@Tao��@U?���m@V!C��'�@W��-�@W�?pWJ�@X׬>�m@Y��	#�@Z�!�?�@[�IL]�@\���6�=@]�{j[�@^��n��3@_�e�ך>@`G,���@`�`��$@aJ�,b(@a�eB��E@bS.��@b��[�4@c`5�\g�@c�i��	@dq�˯;@d� eŰ@e��Z*]@f��K��@f�z�	        ?�"�
��?�WD�Q_?�O���K�@	��L��@�1��R�@ZGI��@,�y�Y�@!r'���Y@%�UÃ��@*q�@��@/��Cb;�@2�w
ֳ@5z� �@8��o�R@;�-ˁU)@?n��P�@A��
`�@Cz�ȋ~�@E|�Xvʏ@G�mDˈ�@I��#Z�@L���n@NV���U�@P_���sV@Q��583@R��_�@T5���R@U������@V�^{�Q@X]�IIR7@Y�<����@[N� �ٸ@\�	�U@^ad	�c@_��&�t�@`�����@a��7A��@bs�_	@cMC��ϧ@d+6Fx��@e�
n�@e�l�K�@f��r�>�@g�g��n�@h�W�w׆@i��έ4�@j����a@k�Т浃@l�`��H�@m�<��~�@n�Y3UP@o����N@pX?�@p�� �@qg9]On3@q��%�@r|sP�F@s	J��e
@s��"'�@t'SY���@t�y��J�@uK*>Ѻ@u��^���        ?Ƞ�Ė�?�Ƌ)�=?����ۥ @�!�J�l@i�%}Z�@���*�@����M@!��\��@%R����@)�c3��@.�b�siX@2$>r�@59\^�@8�
4.�@;K\�d@>� �QB@A"5W4��@C �z�>�@D�3�"��@F�,����@IFݭ�@KH �@M�Y�R�@O��^��@Q%;�p�>@Rb�����@S�dאt�@T���#e�@VP��m�@W��4H�w@Y�9���@Z��=�h@\G���@]��r`�@_���ĩ@`Pvofڔ@a�2�:)@a�Ζ|9�@b����,h@c��`��a@dr�_���@eQ8^�5�@f3J]�b@gP���@h ���u@h�@�NO@i�ƬKke@j�R#��@k�Z.B�A@l���@m�7ұK@n��4�Bw@o��`Tr@p]�bK��@p�@�-�@qfB4�4�@q�}^c?@rtt�R�@r��$4�Z@s���l@t�W@t�2�:�@u/|P�Sx        ?��kӓ��?�S���_@b&�C��@��đs�@.j��C@%,u)lL�@,)wn�ز@2 ��w�@6U�Jf@;y�~0R@@b�^�E@B�L/hB@E����Wt@H�Q�z�A@K���㎂@OT
,��@Ql�v��x@SBY���@U)���<�@W"�JՒ�@Y,�E�%k@[G�?&�h@]r��C r@_��QFG^@`�y<�@b(�1Po/@c]&�fH@d�h�i�@e����O@g$	��n�@hs�s�b`@i�rt*o�@k'ST%<|@l�xJ�\@m���We@oc	���l@pl��l�@q)�E+�f@q��|��0@r��|@� @sr����`@t;#�`}@u4��lq@u�ג���@v��]��@wv�����@xK��յ,@y#!�π@y��tQ�@z��Y�@{��59��@|�A��'T@}{7Q��-@~`^")�@G�˴��@���*�@��I!)=i@�锪@�|�F�EV@����n�@�oB$;�@����q�3@�es�� �        ?²[��O?�����?���B�?�=���@t}�"g@p.J� @����i�@��M���@1��Sˉ@!�.ZF|o@$��3 �J@(���M@+���7��@/7��(�
@1��ںXL@3����9�@5�OD�9�@7�UOzJ@:Y���@<g��Cc�@>�|ʾ��@@������@A�yl�@C4��q�c@D��su�u@E�qJ�n@GN���K@H��r���@J2���-g@K����i@M4�8%��@N���v@�@P)�7M@P���V@Qǌ�}��@R�m$3j�@Sr�DK�@TMS�3@U*�J�M@Vv_�*@V�P���{@W�.�ԋ�@X����@Y�� �V�@Z�L���	@[���l~�@\��0;qH@]{�7�@^v'�;��@_sZG0`�@`9��Xi9@`��X���@a=c�K�@a�<�xT@bF^����@b�Ŭ.�@cTm��w�@c�T�"��@dgx��;@d��G��|@el�gk�@f8���@f�7|�C�        ?�@��[
?�$)��!?��pv��@kjraa�@�t��@��E@I1��w@ ����֩@%F_j1�@)��:�@.�0����@1��᎔@4�#�� @7�1����@;<'��^@>qPz�3�@AG�fS@Bߓ
e\�@D�'��,�@Fۨ�y��@H���$�@K)��)p@Mo!�u�@OǷ��r@Q��lE@RY�/(8@S��k�@T�sg��@VN%[��@W����;@Y�q�d_@Z�ij��i@\d�h��@]���gO�@_!�T���@`[�I�0e@a*]+�@a���^̑@bҿ4��S@c��"9n�@d�a6�Ig@ek��|"S@fP�>�'@g8��j8+@h$����@i��h@j�)Gh@j�Յ
�2@k�)���@l���U��@m�:�b @n����@o���c�@p���bO�@q��Q�7@q�h���@r�<I��@r�Re��@s0}O�4@s��'�@tM$� ��@tݗ&�I@uonZ#Au        ?�}#I��?��T(�/?��9p��@�{bw@6�]�a@(v���@�G�xe�@ i��f�@$p��D�@(���@-�5?��@1iDh�{s@4,�=a��@7��w\@:9l��|@=�[�G:I@@x�u3��@BFb�p�@D(e�x�@F����@H&��m=6@JB�dW�@Lqt�E�J@N��2��@P�ꤗ9o@Q�Y��+�@R�sz*y�@T4Hk�@U���@V�'��]@X0Z@ez@Y�t ��G@[ Qh��@\s΄���@]��l�r�@_q�]�@`}P(V��@aE�Ji�&@bf:�~@b��@���@c�%Q$^l@d��fi�@eb�
�@f>Zܑ�7@g�?���@h =�K�@h���"��@i�A���A@j���J�W@k���"@l�4p���@m�/��@n��t���@o}_W|��@p<�Q].�@p�"X�1�@q<�,�)@q��'ua@rA�O0k@r�`Hғ�@sK�"x@s���~5@tZ���        ?�)��u��?�}u	lQ@ �f�F@��(�@����@"��� @)<,�lU�@06�`Q<@3��v���@8%�u��P@<�o�fF @@�Xp�b"@CD���3�@E�-��@HŒڷ4j@K����@N�:]��@P���lK @R�9k��"@T[Qc�@V���P@W����]@Y�l�q�@[���;0#@]���h��@_�ʴQ	�@`�b/it�@a�O-�"�@c
��w�@d%w�ܳS@eE|+�J}@fj��m�@g��p�x_@h�;�@i�ewL@k5ԟ0'�@luDF�^@m�����@o�9A�p@p(^B���@pѭ��z@q}K��:@r+,���`@r�I�S(@s���>@tBۊ�@t��&�@u�y�g��@vlKS���@w))����@w��C�v@x�����@yk�Ξ81@z0�����@z�Zq�ʄ@{��~7/�@|����E�@}V����@~%.�G@~�F#�6E@�1v�@�Mv5{�k@��;���        ?²����?��"�<�N?��me'�?�.��;�3@[`�ud@8��~;@�%�_�q@f��^f@�=~���@!)����@$*��MB)@'V|�:�A@*�Pyۏ@.'\�?1@0�
��@2ǯ���X@4�k�J�@6�5�'��@8؋ka�[@:��
��=@=5�'s�@?z��t`�@@��+@B�`�@CQ�iA`@D�ބ�g�@EؾT�@G&tk��r@Hz�0��X@I��^($�@K7r�E@L�T ��j@Nv����@O��VJ6_@P~o�D7@Q>5Jgj0@RM���d@R�H��K'@S�ʷ��@T[���`-@U* �Bp�@U�����@V�Ɣ'�!@W�*p�.@X~0�G�E@YY�:�a@Z8�_!�@[˱.�@[��|@\��-�v@]�(*+6<@^�Ү/�@_���8�)@`H��#�@`�vC��P@a;sY�[1@a������@b2��8��@b�/Q��m@c.�Hs��@c�6o���@d.�1���@d���>�        ?�ҥ
yU?�Vg�o�?�DyN��@#wh���@��:.Ղ@\�%=�@�$���5@ ��&��@$�Uj6�6@)�����@-�_�k@1��fsZ�@4R8����@7Ex��H@:dko'2�@=��^1@@���z��@B^��bC1@DA=t�)@F7'���2@H@``�7�@J\�K��Z@L�V�;�@N�f���9@P�����@Q����@R���g�"@T@m�s��@U�:k��-@V�93�Ƈ@X<C�w�f@Y�4=}@[�99�@\6�A�@]�	t9'A@_|>l�@`�۸^L�@aK*�g3�@b�o��@b�D_Y�7@c����!�@d��B�@ehZX��@fD���b@g$�.���@hڹ _@h��j��@i�JW2�L@jÞ��1�@k���*�f@l�P��@m���U\]@n�ˊ�
@o��I�@pE�Ek�@p�6)P/@qG�[\��@q���LU@rOg�$�@r�!��)�@s\(\Y�X@s�w�s�P@tn4�,        ?���RM�B?�F�zg?�L]����@Y�4��@
Z�"���@��ΡY@�����@�`*��n@#��
9��@'�'OÈ@,���Clm@0�4���@3o�-�z@6A:�KM�@9;�.�<^@<_�b}@?��ظtD@A��C~R�@CY`]��@E7�/ʮ&@G(>���3@I*�!��@K>��!��@Md	e�@O�Ps�W9@P�V��@RW��_�@SP cd
@T���7��@U�q:+w�@W�7$�a@Xm�]N�@Y�@��@[)���@\�!�@^T�>[@_z�ϗ�'@`|�#�kW@a?,�8�@b3xz�T@bΔX��@c�C�x0@dk6-}DG@e>b�P�p@f�j�d@f�;@U��@g��4��@h�}-$T�@i�3(���@jr��)�*@k[�f�Ͽ@lGI���@m5���z@n'=�hI@oz��T@p	@L��@p�$�Y*�@qf���@q�8D�*@r�Ǔ�@r�6�Vz@s
Ǹ��6@s�����        ?�u6��:?�|�Ζc@håw�L@a�OP�@M���J@"n��Y��@(z���v/@/?�reA�@3X�����@7c.��q@;�@P��@@.����H@B�����@E9;���@G�K�8ys@J����~@M�UW^�@Pg�&��<@Q���(ڞ@S���S�4@UYT�OX@WG����@X�-���x@Z°�U-8@\��Y�/@^�J�KӶ@`Mb4df�@aRQ�&��@b\��Ԭ�@cl���k�@d��^T?@e��ߍ��@f�,e�A�@g���f�@i
I��@j8�d��,@kk�BM=@l�tPm@m���CZ@o ��7��@p3#�B�@p��5�F@qJ�ֲ@r(��KzI@r�6<ۯ@s�����@t1�d��7@t��T{@u����L@vMϹm@w�C(�@w�*�¯O@x|Yu� �@y:��^@y������@z��yq?�@{���N[�@|Fa��Q�@}�9��@}מ��L@~� u�̰@p3��,�@���u�?        ?± imx?���3I��?���X�D?�/
���/@_é��@FΏ��@�K�3��@���[�f@�d,à�@!T�+��@$g�)@'��g�7b@+̚Qe@.���=�)@1>�i��A@36.aڤt@5A���N�@7`��M&�@9��Q���@;��p�B@>-ŗe�@@J���8@A�}�7@B���؈b@D�/´:@Em��!Q@F�lld�J@H.�2��@I��ɟ�@K皈N@L�Nsr#@N	����@O�	���@P���imQ@Q[\Rm	$@R)pm@R�����@S�/|�X�@T��l'��@U�g9��t@V_�31�@W?����@X#&�:�e@Y	���¿@Y����@Zގ�vZ�@[�'�M@\�g��Ln@]�Do�'@^��t���@_���u�@`N�1�l@`͚9p��@aM�"��@a�WUX�@bRy���@b��:�@c[AE�r*@c��e@di=�Z�@d���cv%@e{�y� @f�
��        ?�䓳�P?�[��	�?�GX�b�@%�ܩ1n@�؝3i�@`�ˑ��@�犌�5@ ���S~@$������@) �xVL�@-�~K@1��s��@4d�`V�@7],�:q�@:�5����@=ҳ�o	�@@�ܑvI�@By4�q@D_�j�@FZ�_Ya@HiMJxV�@J� Ϯ @L�����E@OH���@P�yC(k@Q�I��8`@S$��G@Tl3��z@U��Y�ѡ@WW]��@Xtv��&�@Y���L��@[MG����@\�}��)|@^Eg����@_���F�@`���@ayt:�@bG縑a�@cF|9��@c�,�!�@dɎ��Z@e�a-i�S@f��[\p@gj,ms�@hQ���<@i;7I�d�@j(��-(@k&z9��@lْ�Z*@m�:��R@m���K��@n�e���@o�?MOD�@p~�d �s@qU�RF�@q��!�q@r8Y��@r�=���
@s��X�@s�Z4 [c@t/i�� �@t�ʪE        ?��$�֒�?�P���*?�U�K�@cD��@
j��&=n@���3@Ч+?�@���J�@#тw��@(4��{@,�[ɭ�{@0ڍ�
`*@3��g�U@6W��i��@9Tq���=@<yw3l+@?Ů&@��@A�*��@@Ch��1H@EF9���J@G6Q��'D@I7�ZyRh@KJ�=���@Mn�,�3�@O���qB@P���t@R��@SP?)�@T�&!W�N@Uˡɖn@W�mֽ@Xd�!�@Y�0�D[@[�>���@\�ݳJ@]�+0{�@_^�H�>Q@`l0z�]�@a,�8�@a�/4B��@b�b��:y@c~�)-�]@dJ�
Qk"@e0�<u@e�\dշ�@f�f���@g�B�Jh@hs�o<V@iQ>[M)e@j1E��5|@k��35@k�0q�*\@l���6ai@m�Rh�t�@n��r�@@o�^ob�c@pL����@pƆ��4�@qA�F�N�@q�
<�@r;�'�@r��}�Q@s9��ĺ        ?��.P�?� 데�@�lFx�@کU�c�@\>�@"��ȬW�@)-��{��@0�
�i@3ꦦ�w@8�&x@�@<�/O�@@�^t�b@C7�!�\@E��Eh��@H��Q	@K�B��_@N��o��@P�q�^�@R������@TM�ߝ�@Vz-J��@WῸ9��@Y��q���@[����2�@]�[1�K�@_�����U@`�,�@a����@c���@d�4�En@e;��(D*@f`�+we�@g���e�@h�:�
6�@i���@k)�,"a1@lhT�w��@m���JOY@n��lw��@p 8(l.z@p�կ�@qs�h��@r �z�jg@r���)N@s�>��l@t4��}@t��z�@u�g�J��@vZ�Hm9@w��K��@w�{j�`@x��*~�@yR����X@zD�s�l@zْS��O@{���/?�@|gd~�X�@}0��6�@}�8&w5@~��@�L�@�R�aW@�3�"��@�����a        ?Î�Z�g�?�-@���O?��*B:c?�|U]��@`9�U�w@�1��;@�����@�Φ��@U��=�@".�k͕�@%dP=�@(��P��@,Wq&@0\�eN�@1����Z@3��6�K:@6����w@8<4����@:v~w4�@<����a�@?@�o�@@ň�a�@B{E�@CJ��ǅ(@D��ʣ�n@E�)�g@GL̴�@H���@J�����@K�S��@MVG4�@N�r=thr@PF��U@P�D��@Q���'@RnMf�V@S@;�� ~@T_Ak�@T��B��@U�&T(@V�r��$@W�͢[0A@Xm4j/@YT'+�#@Z>/��}@[*���M@\8g�.z@]s%3K@^k��(@^�~���@_�|���@`x?3=@`��?@ay��q�@a�F����@b~��>P@cI��$�@c�ZM��@d��L@d��l+v@e![$8��@e����/@f7[��	P        ?��K^G?�Gk����?�8aA:"�@����$@��`D5+@)."�=�@ݱL�4�@!6w4��@%g?`v��@)���T�@.�	�)_�@2'�xU@5��6gL@8	q8L�R@;=Ѥ��!@>�Ǹ�=@A=
�c�@B���y@D�z��Z�@F���@H��5���@K"u��{c@M`lL��@O�Va�f�@Q
rz��@REdaY�O@S�\	�H3@T�2l���@V+�Z}��@W��g��@X��uBb	@Z_x߃'%@[֠��k�@]Uߑ��@^��k'�@`6�e�@a|��U�@aа���@b����@czA6���@dT͔�N@e2O����@f����@f�k@�tD@g��ֆd�@h�!���@i��[�$M@j����@k�Q(�n@l��.��@m�V��g@n��>Gg�@o��*�7@pM��M@p�L��@qVİ�<�@q�y���@re�MsA�@r��k�P@szLJa@tD���@t��@�8�@u"˓�        ?�L��?�ʄ���?�� �@���k&@
�QD�S@���!@F^��@ 6ß�u@$/�1���@(�]'��@-DN[s��@1-nF��@3��
3=@6�f���D@9�?�1@=�>�*@@;��c�e@BfS,�@C��'��@E�P��ک@Gȫt�ݹ@I���E@Lr��VU@N98�F�D@PAi�#@Qn���@R�# 0@S㳇��-@U*��p+�@Vy�ُ*�@W�|�|i�@Y/?񭤌@Z��s�{0@\�ᨳl@]x��Y��@^��lk�8@`<��3��@a���p@a��D
g�@b� `L@cf�}`Z�@d9y��W$@e�|E�@e��Ox @f�M�"i)@g��zc2i@h�o$.��@im	�\N�@jU�qvyF@kA"	L-�@l/��K�N@m ��%<�@n��e@o�[X�@p��2�'@p���|@q �J��@q���%�9@ræ�f(@r�F�<�4@s��Y@s�!U�@tr�j        ?�u����?�m"��@A-rC�@ԫ߿/�@��`}@�@#����@*��I�L�@0��4�Q�@5/ag@9}����[@>D<`��@A�;��kZ@Dd�M�@G@��k)@JBppKD@Mhql;�#@PX�YiV�@R�*�4@S�R�@U�B�D�(@W�-���9@Y��?��x@[��V�`@]�?��-@_ǟ&���@`��xu��@b�1���@cCZ���@dp�����@e�0�eT�@f����x@h!?��vt@ih�ˢx@j���F @l
�S @md����@n�f��#@p�ƽ�@p�̳��H@q�^��@r>�.��@r��X @s���B@t�
�ae@uGL��^@v��g�@v��
��@w��I��}@xx��
T�@yK7?Ŕ@z &�#�@z�rΌ?�@{�q$��@|���ݻ@}��T[?@~kpB��u@M�f2[�@�H �Y�@���M�@�I3�;@�vzJd��@������@�db:��        ?�,����?߿�6?������?��e� d�@���kЄ@%/�w7�@0q�`=|@K�F�@�D�@C$@!����@%�ƭ��@(zA�@,~2���@/�e��v"@1Ԛ�@3�H��@5���I@8'�3��]@:i�#�@<���9�@?%�ϕ�@@�r�n�@B޶��U@Ca{� @D��j�@FȄ�@Gy��_�@H��x��@J[����S@K� I�V�@M[�wΆ�@N�2ZՍ�@P;���e�@Qu���@Q�{3�!`@R�%�r��@S�Ѽ<?@TX����@U4�u��@V<�R��@V��v��@W��p{@X�!*���@Y��m��c@Z�*�֙�@[�	Ո�@\vf]���@]j2�r�@^`c-���@_X�M��@`)����@`�})<@a(4��u@a�u6K@b+R3��@b��a�@c2<=Ql@c�x���@d=��t��@d�E��@eM{I��@e�ד�̉@fa.�AS7        ?��A�		?�4�(d�#?�*qн�@���[O�@��nr��@*�f�*@����P�@!@Hj��@%y9n�	Y@*?��"@/��cU`@2Cq��@5&����8@884n7@;v��Ň@>�6jF�@A;d����@C/�QDV@E�����@G� ��@I48Q~@Kc�u]I�@M�O5�ll@O��9`4�@Q1�o�@RnQ"�5�@S����Z�@UJ1&�|@VY-kqA@W�xY�b@Y ����@Z����\�@\jq�ɀ@]��� z8@_W/��@`N�Z-/�@a�i�ֵ@a���F�Q@b�kNfB�@c��׽@dkF-h{�@eHr��@f)99�v@g���@g�R�A��@h��3��@i̫KWQg@j���l�@k��`�k�@l���[VO@m��_�F�@n��"6��@o���a�@pQ[5y&@p�*��.�@qX[d![@q��Ճ@rdʴ~��@r��㳉�@sv���(�@tO��@t�a4z��@u��;v        ?��~�@�?�\�;�?�@M�|�@�b9�@�j��2�@`H�@4���@!v��{�@%��*U}�@*u3�1�@/�����@2��*�@5y�9��@8�{�?z@;�����@?hkY@A�x�La@Ct���'�@Eu^��Rz@G�2�B^�@I��K04�@K���DW�@NGn9N�@PV��YE@Q��u�Y3@R���p�@T)��>P�@U�s�vJ[@V�Al?w�@XN�.�@Y�gG�A�@[>{�o��@\�`X��@^O��W#@_�Gk~p@`�)l��:@a��Q�
�@bj<�	�Q@cD��+��@d"��Cl@e�j�H@e�fd �@f�F�N��@g���@h�Dʎ�@i�Z#9�@j�,�Ǌ@k��,��@l��[_8@m��TA��@n�I�|O@o��T'��@pU��8@p��N��@qeb����@q�n]"��@rz�7�~@shf9�@s���G�@t&qu$@t���+@uJ��Ǘ�@u޴F��        ?�)����?���ևn]@���/�@�b�ي�@=����@#�u�X�@*Tաo�@0����&�@4ګB;�	@9=	�?@=�l"�@A����^@D,�����@F����VU@I��vq��@M~�Ջ�@P%��dz�@Q�/���@S���v@U`�C�ξ@W=�&�s@Y)��ђ�@[#���P@],	�C@_A�-�@`�G%�@a�1��@b�&)m�@dMf2��@e6h�/2e@ffU�;��@g���%Gs@h�UO`�@j��i�@k]�r�+�@l���@m�]��@oNW )�Z@pTA1�cm@q�o?u�@q���'B�@ri�;���@s 
�j2�@sؘ����@t�K��	�@uP%@a�@v�r�@v��>���@w���ktC@xW�5d��@yi���{@y�"-(�@z����@{~>>���@|L�p��;@}�s&��@}���@~�c���-@���N��@�7~48��@���iC�@�*�P�@�=_�1�        ?�x�+`]�?�#�n��?���+#�?�X�3���@;���5@r ��@YGV��@r��i�@�890;3@!����@%! A8�}@(y�U��}@+�����@/�j�D@'@1ŅH�&@3�=�r@5���,@8&����@:>��>��@<���*�}@>�8��Z@@�.G���@A��S��F@C6�Q]��@D���,�@E�-���
@GBF(�N@H�$[��w@J�yV��@K�����@M
.-D@N��TW2�@P��{�@P��?�o@Q��e�@R};�`@SQ�7W�n@T)�V�c�@U�G��}@U�H)F�@V���@W���j�@X�qM��@Y|=8d��@Zj	 �=@[Z�ʾ-w@\NB�o�1@]D�b�@^=�
��@_9�q+@`1��\�@`�����&@a�殄�@a�%9�@b&�F�	E@b��.I@c3�-���@c�G���@dE�^0��@d�����@e]L��@e�q�M��@fyH�_        ?��D�X?�g���?�x4li�@r��Av�@
w{$�@@�)�CJi@�	V�5>@՗H)�:@#��I��@(Z��pw@,�P��s�@0�9[��@3��mY��@6]��bt�@9_��{�}@<�.S� �@?ߔ�A@A�
���@C�ɚ�@Ee9��̥@G]z�;�@Ihelu��@K���Ш�@M���Qc,@O����+�@Q$9~��@RV��	@S�\T���@T� ��]�@V�f�M�@Wp��Id@XˮB,r@Z.nPE�@[��J��@]�O�@^��|;%�@`�x;1�@`�8�8�$@a����M@bZ����@c)�	*�@c�+bBW@d���V�@e�9�e��@f��״��@gg�} K@hKR1.F@i1��@jA'�v�@k�y�;@k�;L��@l�$��O@m�E/�@n�kaˇc@o֏A�G�@pj����@p�֬�s@qnK=��3@q�-��2�@rwz�ƶG@r�-���@s�C�r�@t�y�        ?�r�5d�?�μ���c?��v �O�@����@$�}�@Ǐ�@i�P�rF@ Ma�l�@$K��mb@@(�W��T�@-l�.(�@1E��\�@4."�1@@6�N,«@9���� @=<'ǝ�@@R0$�
�@B���@C��EF��@E���.@G��s���@J��7�@L,©Qc@Nh�Xh@P[�boF"@Q��Ԛ��@RĘʵ{�@TKf5�@UP'4��V@V��H��D@W�M�Im�@Y`,l�w�@Z��G��@\=��G@]�����@_:�F�C'@`bq��@a+"�%S�@a���v}@b�y7wK@c��,�@dr�j>F@eL�� k@f*��F�@g�h��@g�y����@h�l�4�@iÞH���@j�I�~@k����� @l�5BBhq@m��T ,@n��-�H(@o�tX���@pD��֒@p�m`,@qI�h�q�@q�ny ��@rT��7�@r�+<&@se
\��~@s�W��@t{ h�l        ?�8���H?�)Ob7��@�:O�W@�=l�`@>��ٟ/@#�?�@)a�(�Y@05Ȫ��@4�6��@8LmZ��~@<�Y�4��@@օ�>&�@Ch2�&�%@FY �q@H��Yل@K�g�Vsl@OAW�vm@Q&��Fu@R�Z��@T���'(�@V_oVb!%@X:�K�M@Z$��5��@\���E@^"���jl@`g��;@a+�M��@bB�	+�@c`�Kv[@d��-IY@e�0�h�|@fފ'w9�@h�k8�@iQZ���@j���{g@k۴��2@m)�gƀ�@n|�f$`�@o��Gօ@p�)E��1@qLħ��@r �
�O�@r��~�
�@sq�z�'�@t-�Ƀ#T@t�z��t�@u���.r@vq >)@w6���@w� �w@xɉ����@y�-��'�@zegJx�@{6��@|	)���@|�n�{6.@}�����@~�<bxd�@j��g�B@�$!0��@�����&@����"@�vx%C��        ?����s?���|�?�.9�#kV?���K�p�@��-�W�@��Z@��W�=@�?�\o�@m���z@"3:%��g@%^���l@(���N�@,98��@/��}}e�@1ژBxe@3�� Ӊ�@5�q��|@8h]���@:2i�Y��@<s߫��@>���6�@@��X�@A�	�p��@C	p��C2@DP!�^!@E���a��@F��4'(@HNO!ˆ@I��'�ð@Ki8�E�@L��I�!�@M��R��@OyIR2�@P}PW���@Q@�CAh�@R]J��/@RОJȡ@S��$�RJ@TkE�^@U<�����@Vp�̎@V��=���@W���'¨@X��9�)@Yx����@ZX�E���@[;���@\��$M�@]r��F�@]�m�܏@^ړv�@_��g�h�@`[����@`�p�Ҿ;@aNB���p@a���b�@bD���@b�͒���@c?���V@c�im�t�@d>"��@d��� }h@e@Qt��        ?�7�k-��?�A��$?�y!HRp@L���/e@���7\�@�]H�bC@�{.�g@ �=��c@$��z��@)ARn[�@.�:N�@1��L���@4y���@7s��=$@:���j�@=���} @@�,�3<�@B��e!ϕ@Dq-�Ff�@Fm���q�@H~-7L�@J�$᤯@L�KVc�@O#E�^��@P���(��@Q�*M=��@S7\辮�@T�MI��@U�Ջ8�@W+�P��B@X�"����@Y��bl�&@[kK� ?7@\�����@^h���G@_��B�\�@`�|h�wY@a�V]v�@b_��X@c4Ey���@d?³�1@d��ӎo8@e�����'@f���aq�@g��˧�@hyQ]��.@ifG�� �@jV�ŕ!�@kJ>�.�@lA*�u��@m;TY�@n8��Z�W@o9/��@peA��@p��"sB�@q&�;b�@q��׀>"@r4��f�b@r�ǩ�@sH����@s��6��@tb�l틮@t�mQr�        ?��:Q�o�?�P>��K�?�QҎ�I@\|�s@
[��&_@�"5|y@�� @�uA�&@#�
:��5@'�z�N�@,�t�\�@0���E��@3d���@62��[b@9*[�'�@<Ig{5�@?���y+�@A~T:�Vg@CGnb� &@E"�|�8@G '��P@I�<@K�B~��@M?�]�q�@Oq�]�@P�5C���@Rй�5�@S2+�Z��@Tj��@U���3�@V�:��W�@X>ʟu@Y�
Uf5�@Z��Y�'�@\Q���@]��uf@_*��@`Pw��;@a���@a���V�@b��+~��@c[��u�@d&V\|,k@d�,0�@e���)��@f�޻��@gl��*.�@hE]Q<?B@i ���8�@i��e���@jߛa$n}@k����@l�%�.�@m����9�@n|�z�hl@oj9�y]-@p- ��g@p�[ї<�@q ʧڃ�@q�i���@r4��\y@r�(��g8@s@��=        ?���E?��a�1�@۱t8K@�W}��@ܬ�T`�@"�c��@(��v�/�@/��n�b�@3�����@7ߪ��H@<NBY@@��F�l@Cܭ��@E��;w<@Hj�mV�@KM ���@NNU}��@P�z�n�3@RS�jz�@S��:m@U���x�@W|�q5�@YN�3���@[,큋j�@]�*��@_��:)�@`����@a��ǘ�@b�D�5�k@c�.�@d�_��@e�"�@��@f�@��@hHx<��@iI��@jw�*�@k��"`��@l�j`�@nm^��@o^�,e0@pQ��O��@p���T�c@q�X�h�@rD�s��@r�ۄ��@s�[�G+Z@tI�p�$�@t��J�P@u�y�W��@v_'�9q�@w�<�-@w��b�]@x�� ���@y?KR�@y��ٞr>@z�}rM��@{yX�Q@|:5V�Ī@|����# @}�J��_@~�,[��O@N��wQm@��|4��        ?�p=�m��?ބ=$̈́8?��8�f�X?��H���@3W�i�@�pk׼@��VF�@l{1k�@�����@!E6 %�@$V�m̂n@'�d��|�@+��.�A@.��\�cE@1+�pp�@3
�� @5$X�W:�@7=l�Il@9h܍�W@;�Ek
:@=�E��y@@*��x�@Ac>lL��@B��(PQ�@C엖�@E=���@F�"�Nɜ@G��O�@@I[��L��@Jɢ-P�@L>π2�V@M��֐j@O>"d��@Pd*z!	@Q,a��3.@Q��,S@R���O,@S��>��@Tn}��@UFI���Y@V!��/+�@V��W�@W�ޭ��@X�-�B}�@Y�6�]��@Z��3@[��uh)Y@\rO�I�@]d����@^Y|��@_QQ��!@`%�5�
�@`�X�R@a#��m�@a��.�'�@b&�ζ޹@b�R�n�/@c.�.��w@c�����M@d;�����@dâ2�a$@eLѐ���@e��"}�        ?�����?�L��;s�?�6�LQ��@�+��U@v���`�@S�b�s@�1a���@ �t��H@$�W�ѧ@)�-�i@-���i�@1�Cա�$@4^<k��@7V�D��4@:|3�Fg�@=�?V�
�@@���n�H@Bw�-��#@D_!!�@FZ�Y�ˆ@Hj��9N@J��ugb@L�P4��w@O�,ۘ)@P���9(�@Q�C�<�@S+f���@Tt	�a�@U�O�ozE@W��=R@X�C����@Y�=��@[^Eo&[@\��~L={@^[ZC@_囅¨�@`��L��R@a�x���@bX��`�@c,�dE�K@d���W@d����:�@e��h�ey@f��ƪ�e@g�>��A�@ho�L9�@i[,�8�-@jJ{$w�z@k<��6M�@l2"��@m+$��@n&�U=t�@o%5�6�@pO�SQ�@p�qq�!D@q����@q����@r$$�nn�@r���� ;@s4�IU׉@s��� �@tJ1�jy�@t��/��~        ?Țx~�s�?�T`���?��1��@��ET�@>4�ў�@�j�eY�@{�j��@ ��}\8�@%�����@)�2���@.���س�@1����M@4 �j\�@7�j�G	D@:�g���@>H���@@�Mը;@B��;�[�@D�I��4S@F��0
�Y@H��3Jy�@J�d��V�@M�Ǩ=[@O_�A"O�@P�H�Q@R��ӵ�@SU�.o"�@T�����@U���a�@WI�f݊W@X�I"ّC@Z�קr�@[�N	1A$@\�\����@^�$��@`�j��@`˔���@a�˛���@be�9 h@c7�+)�@dz���%@d���@e��Z�@f��Y� %@g���ۑX@hl*��7�@iU�V��@jB7O��2@k1�`�6@l$�nb@6@m;�M�@nԡ�l�@oSVc�B@pV�qa@p��SV1�@qᶰ��@q�4Ҽf�@r߯�8s@r����@s()^�A@s��;�.�@t0��qT�@t�����        ?������q?�l�o�@r��}f�@!ባ/�@��m��@$V�$Q�s@+h���@1K��5�@5t�̉�J@9����@>���@BH����@D�ک���@G��#�@Jשp��@NUFzh@P��+�>@R{��W�@TO&a�h@V3b:ޛ@X( ��3@Z-`�z@\A�����@^eչ���@`L�+��@am�Q':@b����@c�m��_@d��H? �@f9'�@g}&[?�W@hǺ�wA~@j��?�O@kp]���@lͣ+58�@n1B���@o������@p�0��@q?�ʗԝ@q�`�L֬@r��o�@s��IA��@tF�$��@uL�g��@uڅs�_�@v�Z�7Y�@wx�4�@xK�ox��@y!)	>B@y��qo@z�s���@{�=j޳@|�n{E3}@}p��\�C@~T��hJ�@;�@���xz�@��)JU�1@�������@�u%��@�����@�ga��f`@���`�        ?�6Y��?߿
7��?�~�p=�X?��j�`o�@��+��O@٪�~ן@�n���@�ysw�@Kt�f�&@!��KA.�@$�{�|&@'�'^k@+?�ƀ�@.�Z�y�@1C����@31�� �a@52�S�V@7E���=@9h�3��@;����@=�d��@@���@AL�w8�@B����{@C�xЗB@E+%�@F\�D'�@G�[X`[�@I��MG@JqrD�K>@Kڴ ���@MJ>����@N��5@N~@P�M=ϻ@P��Y"6@Q��q��v@Ri���RH@S3OC���@S�Ԉ8F^@T�Ga�A@U�$K=Z�@Vu�����@WM1�a��@X'#l5(�@Y�5N��@Y◡H -@Z��F�I@[����8�@\�����@]v		k�@^`��;@_MD��,/@`���=@`����E@a+F�:�@a��6���@b�w�k@b�<+�C�@c �$閦@c���W^@c���!%@d�IH�q@e��}        ?���I���?�j�u.P?�ZqZ^@7�3��@�sye�A@t�3�Jl@�.�Y �@ �Zhj&�@$��y�I�@);��vfs@.w�<�~@1�K���R@4y��6�@7t����@:�6R��@=�C�^@@����I�@B��Ά�@Do�'JUm@FkGj�D@Hy�`s��@J�2T�g�@L�se��U@O��Z@P�5�U �@Q�4�4,@S)�S u@To�U�<@U�z-�@Wpǝ��@Xr��A{�@Yظ ���@[FX�+�M@\�r�&b@^7�R�r�@_������@`�{`�@ak�V��@b8(����@c��| �@cڦʀ�V@d��+��i@e�'̞��@ff�o��5@gFMb��@h)���Q@i��V0@i�y��|@j�$a�a@kѳ���]@l��婊@m�NP�>�@n�B���@o����@pR"�4�@pѠR�!@qRi8��d@q�w\���@rWĠ�]@r�K0U�@sbΦI�@s���@tq�@��        ?�c���ws?�%�O?���	:H@��J^�!@
��ky��@�"x���@Y�R�`@ EZx]�@$Df1E�i@(�琁��@-j�5��@1E��$K@4=�$�@6��
޻@:��oM�@=H��S@@ZK�l
�@B$���P@DE�e%g@E�u�{}�@G��7֥a@J/ҧ�R@L=�[��@Nz��La @Pd��R�q@Q��"�z�@R�ͤW@T�vi�@UV�Դx�@V�t�C�@X '(�@Y`��fjy@ZȆ�QC�@\7�D,@]��b3��@_,���u@`X��gڢ@a�XѸ|@a�E9���@b��D+@c�?v�[@dX�,Xn�@e/Z�� @f	5U�xj@f�2#�>@g�F:a�@h�gP��@i���X��@jx��b�@kd�;9��@lS���@mEb�@n9����@o1J�	t\@p�8I�@p�Y�gt@q�$��@q�ÿ(M�@r��\@r����^�@s��;��@s��3.)@t-:���        ?׽F<A�?��J�v[@�����@�3aN�@���MK�@"�2�%q@(�e�c@/�P}�K@3���9,@7��q���@<�j:�@@@[\��@B�I,��O@Eu˰�l@H5����@K�z� @N	;8�@P�B3��@R6���+�@S�7x���@U��!�3�@Wbo	�@Y6X�(�H@[ � @]˫�@^�;�[i�@`���v@a�W�A@b�3�bz�@c�����"@d�G��{@e�?>"@gVz�:�@h,r"�P@iYx�˱@j�Q"��@k����@l��,�/@n<��>�T@o�'
H(�@pd��\��@q_�=	^@q��g�Q�@r^�#@s�-�B,@s�Z�-V@tk8�Lf�@u���@u����z�@v�����@wBxE��@w���j@x���/-@yxQqJ�@z8H���@z�U��e�@{�.Pk�@|��ux%t@}K$��	�@~7�X��@~���3�r@�vx˝@�<�)v�O        ?�;:K���?�-���.?�g[�la�?��ʆ��*@���t$�@��NW'@-��H@���5�@?E�.S@ �n��@#���ƴ�@'&����@*�F��|�@.�J��@0���-r@2��=-�@4̛[�4�@6�;�W�~@9z����@;>��0@=���{u@?�zm.�@A(x�v�@BgFF٤@C��3�y,@D��C�/�@FSN'��@G��n8�@I��� @J�vUc�@K�r��(@Mv��g^�@N�-�&;@PBZ�Δ�@Q`Ҿ�@Q�2�2'@R��&��@SyM@Bx�@TO*�s�@U($��X�@V*��Df@V�+�06@W��xqW@X���J�@Y��r>X�@Z|�	��@[iO��S@\YP�L�V@]L	�H��@^Aqn�U�@_9�"ܒ@`)���@`����@a�����@a��S�@bwB:J`@b�9�߅c@c%6�X�B@c�h�#F@d2���u{@d�Ta���@eEw��@e���^�        ?��j�_�s?�{�<ұ�?�_f<��@_�����@
^q3!B�@��>��@�>2��@��E*�T@#�oDe@(
s;��S@,�6��@0Ւ)yg�@3��w�E @6W}��i@9X;�2�@<��#�@?�6�~��@A��|C�@Cv��߳�@EY��7�@GN����*@IVV�
�@Ko��$�-@M�-�6
�@O����-�@QT)�*@R?�,�@Sv��o��@T��W�J@U�#c��3@WJ�T��@X��t'�@Y� �xv�@[b���@\�e��@^BZA@_���ޘ=@`��	c�@ac>��S@b*v��~Z@b�1��u^@c�-����@d�\�J�@eh����@f@\��+@g��~s@g��69�@h؅tW��@i��k�2@j�.�X@k�PW	Ĺ@lwE���H@mf�l.!@nW��Dps@oK�a�ע@p!O��);@p��'$@q(�(�c@q��\��@r/�F�@r�p'��@s!G��v�@s����        ?Ǿ��!f�?�����?�(�p�sE@3��l@��f�Sp@e�<�@�,Hz�@ ����N@$�x���@)?5���4@.$%1�Z@1�[�:@4�F���g@7��TV��@:���w2�@>>��q�@@ͭG&R�@B��3��@D�r���@F��Y�6o@H�[p�{q@Jס˖>@MJb���@Oe��v�@P�%�1�@R�X3�@Sc����h@T�W�e�@V�!@Wd* W�J@X����f\@Z:P,R@[�f�\��@]0���@^�e�u؂@`#�Ic��@`�q�u�F@a���g��@b��I�b�@ch����^@dC)��H�@e!'�J�@f�G�J`@f�>]5p@g��׆J�@h��(ke�@i��$ʶ�@j��v�5@k�{�[��@l�k� �@m��Qh/)@n��;�8Z@o�~n��@pF&B��@p���7@qOV��,@q��U�@r^:�Ó`@r��OMf@sr�'f��@s��^��@t�oW���@uF���        ?�-_F]o?�?�-V@(��>�{@,�oD�@ K"�l�@":���@(9���@.�7���@3)9���v@7,�ix�@;}�r�}@@n$�f{@B}�e���@E���`@G�j%໕@J�����@M���5��@PO��r�0@Q�wpBvN@S���,<Z@UA�:%�@W�ӻ�@X�A�^�@Z��ב�@\�R+���@^�t�r��@`H�j�E�@aPZR3b�@b]��Q}@cp�`/�@d���D��@e�x���v@f̩�`[O@g�Q�h�)@i%T����@jY���s�@k��|��@l�m0~@n�F�k{@o]
�֗p@pUi�@@@p�֔L�@q��t}+>@rVS'CI@s�:�@s��{q��@tk��p��@u!�C
x�@uٲttW@v�ѓ��@wO��I�1@x��ҍ@x�
�U��@y��-��@@zS����?@{Z��0@{��i٘@|��f@}t�^��@~A�V.��@&��eY@�F���@�Y
"J�        ?������?��u/*.?�
f�7�?�5i��2�@�F˝�@@ǰ�r�@����٪@��K�@ʌN"Wi@ ��X뿓@#�- ��@&��x��@)��Z-Џ@-eD%�l@0|�6�@2X[�Ϩ@4F5HU@6E�qVz�@8V4��@:w@�ҍp@<�و���@>�~�K3F@@���jo@A�G��[@C*QѠ*@DEjLB<�@E��?�h@F�iނ�L@H-���"�@I�<a�gV@J�F�M�d@LS��Z@M��p�@O8��4�@PZҊ^C@Q��@Q���+��@R���/@w@So���+@T<1Â�E@U�X��K@Uݘ��@I@V�J��I@W��efY^@XcwfB`y@Y?�)�q @Z��@[ D�:(}@[�&��!@\�oVK�
@]���N�@^���J�@_�UxH'�@`=q�:�@`�X�oR�@a0]gd_@a�|?M @b'�1�<@b���:t8@c#J�J��@c���Ȯs@d#�̵@d�t m|�        ?Ȇ�ax?��4Q?�����@�n���@
��8p�<@��au=@NL>~n8@ :�G�@$3��7��@(�~�Ď@-J�㔥�@11�Աo0@3�,���@6�A����@9���>�@=�"�6�@@Bt�T5�@B	��9)@C�c2�"�@Eԟ��0#@G�?�t��@I���} @Lf�{@NPX��P@PN�ܿT�@Q~H�74�@R��A�;R@S����v4@UA(�@V�
�%�@W�$�X|6@YOR	[�@Z�o�߆@\+[j9C@]���^�@_&D$f@`W_-U��@a[�Ӿ @a���	I@b�&��@c�۝.��@dc
|jh\@e<��:?-@f�����@f���bd�@gݗ? L�@h�u$�%�@i��͍4@j��hk�w@k�#�(�@l�N;�'@mv!�O�@no���9@olK��"F@p5��N@p�;�J@q: 9o�@q�;� ��@rC���@r��,��@sS��~��@sݜq�=@ti��j/        ?ƚF3ol?�����&?��;��x@�a
��@	�v���@9"*`v0@Q��:��@4��%@�@#mp�^@'���^:@,+5�fώ@0�R��I%@3&S䱭�@5�_2�@8����W@;��oL�^@?;n:�@AQm1o�&@C,d��@D�_��@Fܞը�@Hه� �@J纕Pn@M��ra@O6��m,@P�F�(�@Q�:�&Hr@S�=��@TJf��Ƞ@U�R@���@VϝE�@X&�C��@Yq�y���@Z�sm�n@\/����H@]�7���@_	���@`?��R�0@`��\��@a��iѠk@b�2�&��@cK�%���@d_����@d��=ai?@e�<�y�s@f�o�3c@g]lQLA@h6(O3��@i�he�%@iﱠ��X@j�i��~6@k�����@l�����$@m���r@nl��i�@oY��=�@p$���[@p��Co�s@q��^h@q�&X��t@r��g��@r�V=H�@s�̷>         ?�@U��D?�@�HYLL@'z �Cc@*�o�n@���x@":��k�@(:_�M��@.�N��6@3.��I�G@76m�kz�@;�	�"��@@�����@B���g�@E$f� {�@Gݪ�iF�@J�C�8�#@M�/7]�@Pc����@Q�,��-@S��7�O@U]�ώ��@W!���a@X�d�R�@Z��ÄEU@\�� ��@^� ��u�@`[�Sl%|@acL����@bp�>���@c����@d��ң{�@e�â���@f��9�@hB�:�K@i2�}*Mt@je8�Z@k�����0@l�֡��@n�3�@o_^��@pT��2F@p�\�8�@q��ܟ��@rQ.ȇ<�@r��]�@@s���,{M@t`��}��@u�3�@uʈ��N@v�j'\��@w<9��x@w���K�p@x���s0@yt�Yt�h@z6Bt'��@z�W�&-@{�1�4ʸ@|�ʛ8�!@}M��@~��@~�	N@�	U�@�?x���q        ?�d0�T^?ގTE���?�ߦ��MJ?���TYw�@I�d�=�@;�?�+�@����@��P�al@
�����@!s����u@$��Z�@'�DY?)@+hvF�"@/ٿ$Ѧ@1xu��@3z�  .@5�>9A@7��q� @9����NU@<J!m��M@>�$�U�N@@��J�@A�vm0SR@C ���@Du���f@E��(@G7Lׯp@H�����@J���l�@K�0��W@M�59�A@N���/�@P�*@P�0��$@Q�}� @R�~�A�?@ShL��@TC|���@U!��ul�@V��@V���$J@W��6��@X�[Q�
@Y���4@Z�t�H��@[�@��0@\��� @]�]j�\@^����f�@_�b@�m�@`B[d�@`�pfF�@aI��4@a���.y@bW�3E@bߪt�}�@ci����=@c����o@d�vS�}@eNpjm�@e�g�S��@f.�,)��@f�D���        ?�T13��V?�:��o�?�$��7'@2�ĳ_@
s��\@c�H�`@���}�@���<�@#��#��d@'�Q��k@,����b@0���i;�@3h�ڌ�@6=���Þ@9=�J7@<e�}���@?��鑔�@A��bჂ@CgZ��s�@EI��r3@G>��c�|@IE�/��@K^4z�#K@M�����@O���p�@Q�ax9@R4�y?��@Sj�d�NV@T�%h���@U�Km�j@W9�(���@X��Kǳ@Y�,,���@[K�zc�@\��@��@^%�{\V@_�d^��@`����4@aN�h!�@bJi�+@b�Ǡ��@c�d��45@dw��@eHӄڞ<@f���O@f�Br��@g����0@h�bK9�z@i��IX�e@jp��)�@kVި.G@l?�xs�@m+�ۉ�@n!�T�@o	�a�d@o�R'�(@py��IF�@p����@qs��Px@q�V:�@rrd�? @r�W��i@sv(6�1        ?��6&u^?�J觇��?�t<4��@7܈ .D@9����R@�|���@�9��V�@!���D^�@&�X��@*�f���@/��a�;�@2Ȏ{*��@5Ə�I�Y@8���X��@<T��G�E@?⯚�\�@A�Jj9@CÿY��@E�H �wS@G�~up�@J#��PuG@Lnh'|]�@N�^�h�g@P�FuG��@Q��AF��@S1"G�H�@T�ٔVo@U�d��o@WRe�M�@X�p����@ZA�[��@[ƢñMI@]T��V�@^��>�@`E�m�I@a��b�K@a��R�G�@b�"q��@c�m���@d��F[�S@ez+��5@ff��|@gVͣY�+@hJ��N}7@iB���@j>����@k>H��	@lA��5c@mHg�ͤ�@nR�cS��@o`�f�/�@p9C�9�@p��"b�w@qP�3�@q��ӄ�_@rm�,SQ@r���U+�@s��/�ۖ@t&�U��@t�}�j@uS���@u�ù�@v�a��S        ?�@Օ��?����O�@��x��@؂tD%�@�����@$���4l@*�U=�k @1��	�)@5=I�x	@9����ˀ@>�[ʠӗ@A�yɜ�@D�gB���@G�$�	�j@J�e�@M���&8�@P��V7�@Rlhp�4�@T@�l��@V%�d�A�@XA	e!@Z �Yh@\6I�^�@^Z���_g@`GN����@ahxX�!@b����Y"@c�3B�ѿ@d�z�8��@f3���}@gw/3��y@h�V�]Y@j�Qb��@kh�닡�@l�c�H��@n(1<��@o�����n@p���8@q9���Q�@q���v@r�C�ɽ�@sx�i��9@t=���T@u6Qתw@u�d��j@v�-0�@wk_�x�@x=!� ��@y]g�iz@y��#2�@z�'���Z@{��IDz	@|z�i��@}Z���c@~=\��[�@":�L��@��r���@�y]�8q�@��'�Q(@�ft��@���,�:H@�V�e�^@����w�        ?=���E?޴B<�!M?��ɭ���?����@Wj�A^@I��(@����G]@����O)@�du��@!mf��Fl@$��$�F@'ՙ�Z46@+Od2��@.�N��h�@1b���@3_�r��@5q	�ǹ@7��w5�@9��� �@<�����@>u��o�@@rw���@A���p~@B�ڤ��@DM?q�@E�ك��@G}��X@HrG)�h@I�O�T@K\=ۓ�j@Lܱ���k@Nd�{k|�@O��%#�@P�6��)@Q�݊� @Rf#ގ�@S;�>٨<@T�&�@T�5;@U�hى�@V���^B�@W���@X�}HQ�@Yq-?�xe@Z`�>�P�@[S����@\I`��,@]Be(;V@^=�ZC^�@_;����@`� ��Y@`�����8@a$ ��Z@a��2���@b.�<��@b�^�uq0@c?+��B�@c�FQ�<�@dT��,W�@d�QGY�&@eo6��H@e�Sa�"@f��BrJ�        ?ɍK�9L?��'����?����]@���j��@M�To�N@�n(�@�$�_�5@!&ϔR@%0]'��@)��ER@.��P��@2�td�|@4ޠ��̵@7��K�R@;���K�@>}q�0۸@A"D��@B�öH@D�/h��C@F��bv�@H�i��@K��o�@MZj����@O��P�30@Q���y@RD,���@S�� ��!@T��D�@V+�͞��@W���ߍ@X�2:�@Z_�!�(�@[ֶq�@]U��E�@^ܬ�I�:@`5��w�@a �)֏�@aϢZ��@b�0���g@cxc��/Y@dR/����@e/��}U@fc��@f��*���@g�q��@hǏ�Y@i���i�@j��{���@k����[ @l��p�@m�w�eY�@n���B>@o��<�qY@pJ�mُ�@p��
f!�@qTP�b�@q�K�͒�@rc�p�y�@r������@sy
���m@t��
�@t���Rv@u#��_�{        ?�����?�F�G���?�Mf�'�@\� ��F@
c�`��}@������@�qd�>u@�)V�2@#��6��@(��?��@,��z�S@0�7�y�e@3�?k0ߑ@6gz�s��@9i��=�@<�z�˥�@?�Q��E@A�>�Y��@C��m#�@Ef�� mj@G\����@Id�����@K~�
��@M�Ba�f@O���>"
@Qf��@RI Uxc@S�غ��@T�4g�#@V*�O�@WT׉�@X�W�p@ZĚ4�@[m�4�l@\��d@N�@^M�$3�@_�>7��@`�<F�@ag��D�@b/oh�B@b�\���@c�嶚��@d���'�@ekQ�F��@fBB��@g�o��@g�����@h�<���@i���(�y@j��P�,	@k�91�u@lrŌ-K4@m`7"��5@nPMw�Z�@oB����L@p!J8"�@p��|�o@q0׊�@q���^�@r3_��R@r��,��@s	wG6�@s�:���        ?��#��v?���q�9C@��jDܹ@g�!^Y�@����c�@#�J1��@*��@0����@4���o��@8��q4ŉ@=���q�>@AWdΖS�@D��;�@F�r��_�@I�֕��@L��@n@P�\�L@Q�Ls�?@S�v"��@UT2suN@W5�Md"x@Y&�XN�@['c��xr@]6���G�@_T�?�j�@`����X�@aݯ����@c���|@d,x���@e]#��
c@f����"@g�!r:@i�J�p@j_�{)�z@k��zz@mrcC>�@n_��1��@o�5m�Y�@p�;h�s@qI�8�@r�hgG@r�縄j
@sz�B��@t;-�2a�@t�#1�@u×���A@v��hW7�@wU�j�~@x"���c@x�X�@y�Q:�%@z�����@{l���7@|D�>:�@}��"@}��nY=I@~�)��&�@�݄�zD@�N�w�X@��?2Y�@�4��d�@��F g@��2:K        ?�$��R߫?��%�^'?�N�8(UQ?�z�5�@�y���m@���Ě@3�B�@Aq���@Z���8@!���I=@$�*U'�@'K�Ǣc�@*��z<6@.C@P�.!@0���ٚ�@2�G��/�@4���?c@7� #��@96U>�8�@;q��3#S@=����k@@o�y�@AE����U@B��.�hJ@C�V�?@E޸���@Fq30�@`@G��3|�@I3��&@1@J��$!1�@L7>�hm@M��bf��@Ow���T@PH��?�2@Q5a�1�@Q؛SI��@R�
���@Stsl��@TF�DS@U���h@U���M��@V����@W�A�O	�@X�k���@Yo4b[ �@ZT����Y@[<�rw�@\&�!zp@]��"@^*�ͥa@^�� �)�@_���0ɏ@`o�˞<0@`���_��@aib����@a���j@bgi㚅$@b�����@ci�z�r@c�Bʹ��@do�9��@d����,@ez=��q�        ?ɏ�G@=a?��p�(�?���#E�p@���@Qcsٸ@�RsG@�9��{�@!�6ƚ�@%J�HU��@)�=
�@.��\�@2)����@5���d�@8!,/��@;c���@>�R��UQ@A7�RtV@C�71�@E��q��@G!�P��@ID^��@K{HTrK@M�HS��@P5�� �@QJ�I /@R�#̺@S؎���@U-?"\@V�u�f(@W�o�g�@Y_Y��|@Zև��d@\U�Il�@]ݚ�~Ǹ@_m5��@`�V��r^@aQ���Q@b%Sx��@b�r��@c�=�vu@d��AO�@e���q|�@f|�E��E@ge�S�@hQ����A@iAw��o�@j40Uw8@k*C�le@l# �2�@m;��x@n[7q�4@o p�"�@p�8�bb@p���x
@q�燘@q���D@r*����@r��gP�@s>�=z�b@sʴ�e@tW�r�H@t�N�p�@uu�_�e        ?�NC\-x?�u�]�t?���<İ2@�^�S�@.�noW@�9�s��@�|��@!m�0Yl@%6��'��@)�5R�@.�6c���@2�է*3@4�M�V��@8�O���@;Cfl���@>��Ơy�@A ��qz@C �{8�@D�}�xh�@F���Wz@I�v���@KL3/z�@M��&��@O��L
@Q'�t��B@Re��{��@S�9����@T��k��@VSo<Ԝ0@W������@Y13PD�@Z��{��@\/�@]�^p�Q�@_&O0�@`N1V�p@aw�r��@a�Sn:&�@b��9�%@c��O�/@di���.�@eFD�lB�@f&�I�@g	$NB_@g�`U���@hؿ# Rz@i�4��>�@j��2:5@k�2��|@l���F�@m��)�	�@n�7�L�@o�H3�<|@pG�Bm�@p�`����@qL���2a@q�c��@rV�1L��@r���74�@sfi�/�8@s�.���@t{�f��@u/��5�        ?�c��2Y�?�FW,T>�@=ո�}@�א�@ffЍ�1@#5��#�@)���%��@0M���P@43 ��@8n�-�c�@<���P��@@�JC��H@C��G
�@F7+��=@IFm��@Lڣ�<@O(� x�@Q2��B0@R���
�N@T�����@Vd���-W@X<��i_�@Z"'6��@\���M�@^�̮��@`vɧ�l@a����@b.�r^(@cF�v��W@dd�Hf@e���B@f�����@gޭ��@iΛ���@jI���bW@k���@l��q9��@n�֒��@o[ �U��@pUt}.�@p��||Q9@q�eBC@rZ�^�=@sE�8@s�
�`s�@tr�q�4@u)��TR�@u�B(@@v�jS�:@wZ)n��@x��qǳ@x�V�K��@y���):@z_�j�x�@{%⹮A,@{����@|��#zO@}�5ۼ�@~O j�r@oY��0@�wDBP@�_� �(@�� ��i�        ?�[Mt���?�Y�̯a?�9k�cg?�����7�@)���Q@�2O���@Jڅ\/@&�)/N�@pbU��@!a�r�@$
�ހ@'OѲ�i@*��P�u@.@\��@0�<D���@2�H�r�&@4�l*;�@7�%���@9(�\���@;a��/۪@=����U[@@"H���@A8���8�@Bv94���@C��X��{@E��8F�@F]5��M@G�$�ۘ&@IKN�qU@J��ݕԛ@K��T%�@Mo��2�t@N�1ɯ]@P9��r�Q@P�M��I@Q���/�@R����@Sb����@T4L>~��@U���(T@U�P2�\�@V����|r@W��h.F5@XwR�t��@YY���h@Z>��t8@[&$��A6@\d��2@\�v�) J@]�:�@�8@^�Zl
��@_��k8�@`b�'�@`޹�Q�@a[�L�|�@a��`�4^@bY?d@b�D����@cZuv�V�@cܢX��]@d_���<�@d��U��@eh�!�h        ?ɣM��?���� �?��kCkA@��F߮@D��xa@����m|@�3�;��@!�7�@%3����@)ȝٙ\�@.�¯j(�@2����@4�01O�@7��a���@;7O�q��@>� }7R@A�����@B���pw@D�yslī@F��n�@I<��U�@KM��2�@M�uH@O���*V�@Q/]C+m@Ro�9N��@S�R�J�n@U9��V~@Vh�lA�@W��H���@Y:��M>@Z��J%g~@\.6�@]���Q�-@_Ca�ʹ@`m����@a<N��q�@bx����@b�v�K��@c�8��Z�@d��h�01@e���i�@fg�%>H@gP�s[@h=��=A.@i. _��d@j!�&�'@k��]�@l4ZՅ@m���n@n���6�@o���@W@p����a@p���h�t@q�L�V@q��R��@r,��j0g@r���<��@sD��g@sһa~�@tbFs�C�@t�5M\�o@u��ʔ��        ?���8��?�M�ڡ<�?�Rg�}!@_@�J�@
d<�zH�@������@ȕW��@�F���@#ɦ�F�@(��C@,�t}�:@0ҽ^�I@3z�U-T�@6M36G+�@9I����@<m5���@?�߼�Q�@A�����@Ca�Ȗk"@E?�1�@G0�ֵFU@I2�)��@KF�~���@Mk��-@O���=@P�f��@R��,ǽ@SQu���D@T��\�@U�\H#4@WK}�@Xi��@Y�@ⲙ}@[ y���@\��[�@]�E���@_g����@`p��B$G@a0Ӳ���@a�;s�8@b��eH�@c�E�B�@dP�����@e DE��@e�	n�@f�Ү}�V@g�ҟ�g�@hz��h�@iX\I�@j80���5@k��Y�I@l PەC@l�<�H�E@mҰ�=�@n���� �@o�G�\@pP{ҍ�;@pʠ|ڬ�@qE��f�N@q�t���@r@};�@r��S��@s>үF�Z        ?��kp��?���vc��@���ݿ�@��a��@��^Q	�@"�̥[.%@)�9p�!@0�A�}@3����@2@7�B�*�@<h
r3�@@�/��V@C����@E��̎#�@H�2·Gi@Kl�
5@Ns˓@P�/�L7�@Rm�;x��@T)�k��@Uڬy�}@W��ڐ/@Y}��(/@[c���q@]T����@_R�9d3�@`�C���[@a�;�lZ@bɛ��@c߽�c}�@d�[Ǘ�$@fWp�U�@gB���@hm�Ŗ�n@i�o�+�@j��R��@l!��V@mM*����@n�ߴݪ-@o�(�.p@p��&Cy@q;�
@q�Uߴq�@r�=�*��@sB>hi/+@s�N޽G@t�d-M��@u[s�+@vq:�Ko@v�U;5�@w��9�@xB���@yV�;@y�3�n@z��Č�@{F�M�'>@|���0c@|��0���@}�D׳D'@~eY��^@0�U��i@�(f@ٝ@�fj��j6        ?��a� ��?�9ȼx?�<Ӯ��@?�m-j���@��N�	�@���L=@ɕ%<.�@����@5�\���@!�tBc�L@$�}����@'���q�@+r��ad @/F��48@1x*��@3v�;�M�@5�u��@7�����@9����@<4*�l��@>�����3@@�A~n3@A�4$�7�@C{�#�k@DX�2S#@E�cY�|�@G�N��@Hy�����@I����1@K_��t�@L݊��L�@Nb]`�m]@O��;.�@P��Q5@Q�l0���@R[��L9@S.���;.@T@�� @T��+N?�@U�u�^��@V��>�$@Wx%ӆ�r@X\)\�W�@YB��V��@Z,B$�ƶ@[=<u�Q@\ÆCS<@\�ď(��@]�2�a��@^��q�K@_�;F�@`i�ٜj�@`�U*7�v@ag�Ab"�@a�{��@bj|���@b�m[p4@cqr?�#@c����q�@d|��p��@e��]��@e������@f+^�7(        ?�*u�.?�=N�is?�{ꁌ�@RGw���@�	���@�E��c�@���@ ���G@$ף��t'@)V����@.7�N��@1��Y@4�H.���@7���MxD@:�'�i@=�t{)�-@@��<ܸ@B����r	@Dwu�1V�@Fr|�{�@H٫��@J���o�
@L��Ǔ��@OD�a��@P�A�>\@Q쟨�@S)��,m@Tn�y�k�@U��fʈ@WMǚ�U@Xo��oJ@Y�zuI ^@[B�ֱ��@\�JU�"�@^3W&[��@_����@`��T㚶@ai;!sg@b5]_�^-@c��j�@cױM��@d����I@e�g�7@fc��J�@gCݷu�@h%����@i\�FQ@i���p@j�w���@k�����@l�\	�{@m��3�X@n���l�@o���9�@pOr���@pι8�~@qOH4ɋ�@q����@rT/B0��@r�;+uZ@s^h��@s�ƅ�4@tl����$        ?��_4^?�eU��p?� ���@e+FV@�[���&@��P��@P#�TH@ �����@% qO�@)��%��'@.��P�m{@1�5q#j�@4��  �@7�J���R@;�>/+|@>j���51@@�*��9@B�-�lM�@D�8m�@F�b�Kt@H���KY�@K��ӌ�@MU$�y��@O�W����@Q����@RB�LT�@S����A@T�wz��@V+�
M��@W�OH�t�@X�8��/�@Z`Af�2N@[�E���@]V#X�@^ܷ�yb�@`5q�L&�@a BÒ��@aοO��Q@b��#mf�@cv}��g�@dO��8��@e,.k,�@fJ�z�@f�Q�f��@g��5�35@h�l�cZ�@i�/����@j�Do�'@k��ӛON@l��Hm��@m}R-Xx�@nx���@ow?`ݐq@p<1�i:�@p� ��@qAg�@'{@q�p�@rK�t�3@r�D���@s[��3Q@s�P��f�@tpHTb�~@t�y��        ?�>d���%?�#� ?�@i�f�`@� \@-<�*@#
�RB�@)G���?@0 ���@3���mI=@8��f[b@<��C�e@@�:��)�@C2u�e��@E��d��{@H�T���:@K�p��#@N�5߸E�@P�ڱF�[@R{�%��@T*:Ѱ��@U���@W�-�7Q�@Y���=_�@[i����@]YEVa�@_T��$�p@`��@��@a��l�@b���7�@c���<�@d�{¸-�@f<�.�@g5���io@h]��fu@i�����@j��~�s@k��,�5S@m-Z��L@nlC D@o�j�$��@p{^;�|@q!D��5@q���"@rrx�7�=@s�t�<@s˝�R+=@tz��O�@u,.\C�@u�&'��@v�ݭ�',@wJL��8@xh�o-b@x�+���@yw���&@z4���0
@z����'@{�	Xg�q@|t��F�@}7��z�@}��
��#@~���D�@��a4�@�(��	