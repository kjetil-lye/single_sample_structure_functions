CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T104853        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @               ?��|�:�
?�9���?ޟL�iC?�(	 i'?���'��?��E-^j@i�O��@�����q@&T�~�p@�#h��@��)��@oژ�p�@)vx��@ ��69�@"��4�@$D}y#@&��"�@(�'�!@+I�'��@-�h~��@034��@1�Θm�"@2��*R;@4UMU�5@5ɞ�� @7Ga���n@8�h�9�#@:^�� w@;����{,@=���h@?D����@@{�
E�h@AYHȧ��@B;Zj�`@C �{rL@D
��E~C@D���;��@E�]0%T�@F��k��@G�B"�
�@H�U�Cb@I��BO@Jۅ�&,@K㍻�ZV@L�)��@M�Q�i�+@O�iƧ@P�� �@P�nʞ�@Q/ny�@Q�Sl���@RQ\�}��@R��hF�@Sz�LK��@T��B�.@T��"sì@UD���<@U����@V~�EV@W�ۈ�@W��(�h@Xah��� @Ym�Z�^        ?�E`��EM?��c֦?��Ջ�_?�����M?��bi]QN@J*��0@n\���@_����_@�����'@�Ky��@Xݘrq�@ ���'Mj@#CG���V@&Xl��@(���W&@,^�@/U�O�/.@1\����@3 *f0Y�@4�U]I�@6ۤ��n@8ҵz[.s@:�-�%\@<��@?�sl'f@@��Po�y@Aʷ�D��@B��_�Y@D&��@E_y%�7�@F�Uw;�V@G�)	��@I3�E��@J�\F
��@K��3v%@MElW&w�@N�ԛu߈@P[��.�@P�����@Q��'�@RG�{��e@S�e=��@S�ߗ�+?@T�����@UjŨIg@V9���@W�cY��@W�r�!�@X�s#@Y�\x��@Zt_>�.�@[U˩�@\8rw�Z�@]q���@^
�k#�@^�5OJ�@_���wX@`h�|�Z@`�k��@a[�����@a���H�@bT�7pO�@b�܍��J        ?���@�.�?��;Kձ?�$�Z?���ك?����\�@q� a@	��6�@�K#���@���F�@W����P@?j$ҍW@!��ܱ�@$��xؽ@'��2['@*����o�@.����@0�H�p@2�E#Aݠ@4����K@6z�����@8���B�&@:�3X�@<ز��d�@?�8�Y�@@�V�\l@A�>}��@C&�kr��@Djh��7@E��v̍�@G	YW�8�@Hd�K��"@I�)��F@K3?6#@L���Z�]@N�נ��@O��o�6@P�җ��|@Q\�n�$@R(I9V�@R�Sg�r@S�ڱ.��@T���4E�@Uy6����@VU��50@W6��,@XX�ჿ@X���4A@Y驇���@Z֑Q���@[Ɩ�&e�@\��t��2@]��c?o	@^���cv@_���Y�@`R���@`�4�Ji@aU ��@a�V��5@b^��KL�@b�1G��@cm+�r�@c�}��,�@d�'L�<        ?��پ} i?�mO�y�?���ɪz?�A�4��@}D��i@HY��4�@9��C@�R}u��@ (�Z�Ƣ@#���Il�@'ek��S@+m�*�@/�X�=@2"���yI@4��c��S@7
�R���@9�NFD5@<h�d�A@?@_f|l@A�:�ML@B�m�G.@D3��w�@E��[ �@G�
=�}@I7虎	@J���,��@L��
��@N�7Eb�j@PEQ�2.@Q=rxn`@R:�Og��@S=����@TE_�1�@UR;0{�@Vd��@Wz�{�T@X�A�m�@Y�{�@Z�Z�*�@\ѥ�@]2Ҏ��,@^eP6�H@_�=�x @`k�����@a�dxp�@a��mW�T@bQ���J�@b��M���@c����@dJT ]�@d���Q@e����@fUs�m�@g��4��@g�:���@hr��s��@i*ڽ�ȃ@i��X0x@j�31���@k_;�j�@l'���@l��1!�S@m��3\	�        ?���r�+?�NF��j7?޽�a?�8�z�/?��s�?��IP���@���^��@�W��.B@�*�}� @�f��%j@FI� �@��Ԁ��@�(��*b@ `��j@"�2��H�@$�#�zw@'
���@)s��(��@+�G��@.�$B�o|@0�=�:��@1����@3g[�)�@4��o��@6\M��Xw@7�.{�p@9xi����@;�[�X@<�\>�W@>h�ɒG�@@���m@@��mmf@A���i@B��Sk�@C�	Ɂ7@D����/�@E�H�\(@F�\`�Ƣ@G�z�)�@H�R�,|�@I��ڏ�@J���v�@K����h�@L��gh *@M��~F^2@N��A'Is@O�G3�%k@P���Bh@Q��P�@Q�N|�n#@R4Q��l@R�r>��@S^^OI�K@S����,M@T���X�]@U)M
I)@U�Dw�̬@Vb� t�@W�|�;@W����j@XC����@X�v�@Y�p�1�        ?�^���6?�5����?��9y;]?��h�x�?�?V��Є@3Z�99@	���l�@zL��qK@��G�>�@���w@�ߙ��@!~����@$C�A� @'4�q��@*P>��]3@-�a~�@0��U��@2L9Ғ7�@4*Q��@6oDέ:@82�p�@:5@��#@<]F4�6�@>��l�\�@@p�+u�W@A����';@B�`8V�@Dg���@EZ��Ұ�@F����J@H JrF�@I^ąɴt@J��w�@L2�����@M���a�@O$*��4@PS���\@QP��-@Q�;��@R���S�@S~k\�"�@TQ��[e@U(�gi+@V��Of�@V޸VBO@W��##�[@X��{�M�@Y�:�9�@Zq"�Yg@[]ƽAk@\K�u|�[@]=�E�k�@^1ی��@_(�FLO?@`J�G��@`�rռ�@a�4$�@a��D��@b��d�B@b��,{��@c8�M�@c��,��@d%�]���        ?���7.�?�03�?�=�Bפ?�W��Z�?�gf��g@�yW��#@���Z�@�^(K@�,�|�@A����@�0�@ �J�/��@#�{��d�@&���H�^@)��<��@,�\�|@0r�b��@1ͦ`���@3������@5��)k��@7{��ŭ�@9��Z�@;�б5�@=�G��o@@J�8@A)�%O�@BX9���@C�����y@D��`(@F<=��n@G`��%4@H�E��˽@J�@Kv�I�;�@L��,�@NTaH&�@Oͪ��G@P��ɏ@Qjtp�$�@R1]ǡ;�@R���=H@S�3�_��@T�
$�j�@Un���@VEP�?2y@W��x �@W����W@Xݜ�i�@Y�!�I�@Z��o9�@[��c�u@\}y-��s@]l�!�7o@^^ٙ��@_S�*�n@`%��F�@`�~�"@a!����{@a���ҩ@b"�[�\�@b�}1�ǀ@c)g)�w�@c����J�        ?�hh��?�0m|�E?�8���?���Q�@"@I{�P@,;���@�g@;��@��A��*@ �^�ɮ�@$#˹h�j@'�W�ce	@,~�V@1@06	����@2��6>Ɓ@4�;9�-@7t��R�@:!�E��@<�y� �@?����@APf���A@Bղ����@Dgts��@F3�ר@G��}<;@I`�#���@KΘ�@L����]@N����@PN��	^u@QCq���@R<��0�$@S;f�I�@T>gu;p@UFh|��a@VS��=@Wd.��
@Xy��X��@Y���v�H@Z��Y��@[�c!��@\���S�;@^%��J�@_Tk���@`C��@`��I�S@a|d��@bB�ީ@b�Cٶ@c_S�i�@dňk��@d�9%,.�@eRq8CQ�@e�gޫF@f��AWW@gUxcb]@h��.-�@h�@��@ig�A"�<@j�ʵp@j�4u`��@k�e���N@lA)�Cm2@l�z�x�        ?�
�MmZ?�Y��{�?ݲ��=?�LX�1�?�&��j�?���ϐ@�Ln	!-@̦,��@B��hC@��W��@L����@��1��@XgF�n2@,h��@!�n���@#��l{@%�v�,�"@(/�Nv�l@*�ܪ���@-��Q�u@/��@^I@1!Z@�t@2o���@3����]@5?�9�8@6�@@�(@85�§��@9�%��@;P#�iK@<ꆩz�>@>�~��4@@rdLY"@@�JΖ��@A�:7P��@B�4�0^@C�,{4�@D�
4[@Es끘�@Fe�_�l�@G[!(Ѷ@HTat�d�@IQ_!���@JR	Or�@KVUu��F@L^9�@Mi�� ��@Nx���@$@O�_S�@PPs�u�@P�&HwA@Qkc���2@Q�^�b��@R��|�@S I����@S�2�rU@TK����k@T��v��@U}��e�@V�D��@V��3T}	@WTYKE�l@W�e�y�@X��6�0�        ?���p1�?ӎ��M?�z�ڵ�`?��%�-+?���_W;S@��	=�@	�p�@��ݍ�@F|ܴ@n�tbC�@)����Z@! l/Qs�@#�̇��:@&��*�8�@)ʷ�P35@-� �N@00����@1�ȳ`�@3�rY��@5� ��'H@7�*���j@9�$G���@;ه�(~Z@>��S@@$��Ƌ�@AL��X��@B|���^1@C���p�@D�;a��?@F;77�s�@G������@H���ǧB@J;�}��@K���4a@M	,-�X@Nz���*@O񇭝;�@P����4@Qy�r�'@R?#̬�>@S�]Zp�@S�ꠦ|�@T�Ti�+c@Ur��	��@VG,��@W3�؊�@W�@����@X� ul�]@Y��-?!@Z�4qُ�@[|Ui��@\d"���O@]N��9FJ@^;�s�Y@_+6zE�@`�F�2J@`���1��@a����@a�C�Z-@a�7��b@b~[�3�@b�����@c�)t�e�        ?�T�8�Q?��q~B?��'z�?��N9?���H3�@Q���@}cA  @xB����@�X�$��@��c�k�@}
S��@ ��o(ݼ@#b<��J]@&4/�
�@)/?�R��@,RP����@/�W@#V�@1�*��:b@3P�("r�@5->F[�@7riD�D@9�Aϖ�@;+�E��@=K���+@?|GĹp�@@�D���@B�}[@C5]WZ��@Dl��H)@E��*��@F����s@H:�I�M[@I�����@J���B�@LG�l9�@M��==�F@O����5@PF���}@Q��`�@Q�P��@R�d�۳@SKř9�@Te��@�@T���Z��@U�>Q;@Vb8'�@WSH��,@X)�����@Y1��H�@Y�, �@Z��]�v@[���<G�@\�U;*@]hoٖAe@^QK��@_<+C��@`��2�W@`��k�H�@a��iw@a�!s@a�_��d&@bw�7��@b���At�        ?�A��?����e�?�?���"�?��b?L] @"����j@��9M��@���8J'@�� �)@���"%J@#G	\�E�@&���5&@*�S��\@/��'\R@1Ɲ����@4�ܚ�=@6���Qߝ@9!�=2�@;�� Uzw@>�d�d�+@@����6�@B7̂瓽@C����u�@EWr�(;@F�a�_�h@H�4��@J`Ft~~U@L$���{�@M�_��4@O����}�@P�����@Q���@Rζ�@Sи�<@T׷�բ@U�,h��@V�d
�i@X	�#�J@Y$8.�@ZC-�%�@[f��^�@\��?��@]�����H@^���l�@`E4��a@`�MV�[+@aM�NL�@a�ݲ��^@b�YM݉@c7�ռ@cߗl�@d�O0i�@e5��@e�Ս�@f���㲈@gD`qB=�@g����&@h��q��@ie��4�@j!��@jک�	H�@k�9��,@lWw���@m��N\�        ?�t̠t?�f���,?ܽ�.�#?�k&I�?򗝎O?�F��'�@cFK&B@@N�h��@��q�9�@���q&�@�Ѱ
��@>����@�oy��@��<,]@!C��)f@#TS1�G�@%{1B���@'�w8T�@*n�_צ@,ml��n@.��>��c@0���bd@2>r�@3^ވm6@4�)��S@6'�\��-@7����d�@9]�Dk@:�-T�]S@<
=��@=������@?D�nͥ@@q���W@AE,��:�@B��.b�@B�8G �@C��$ͥ�@D����v�@E��J�@F���D�@Gk#�t��@HXҝ+?�@II���'^@J=B�0�@K3����@L-w�'8@M)��!�@N)N,WF@O+ե,l@P�r��@P��f^&�@Q }�=��@Q��}�̃@R.VB%@R�)$���@SA:� �"@S̆{"n7@TYu�CE@T�L�~�@Uu���@V�tg�@V�
�#h�@W)��EG        ?��ѿX?ӄ�� ?�p���V?�v�b�7|?���A�%�@���^�@�{(�g@
e�u�@����N�@M� �@���l*@!8�i1@#�Xu�C@&��xXVC@)��B�4@,�eA��@0V�e@1�u�Cj@3�j�L�D@5t�S�@7gR��+l@9kp	j��@;�y�p@=�]G�@?�����@A���i�@B;J���@CmrS�@D�
c�	�@E��:���@G/��l>�@H�o�r@I����@K1��f@L�j!6.B@M��~e�.@Op��I@Ps�8��@Q2'3�G�@Q��;O�@R��w؁@S�y��8@TK@�OP�@U��/�@U�:O�@V����@W�_����@Xlvw@YHK��s@Z&�e=��@[��E>@[��r��P@\�Mhā.@]�D���@^��lC��@_����&1@`B��7K�@`��R?@a6u&��@a�1��˃@b/���@b�|�)�@c,G%�j�        ?���ճ�|?�R��h?�*�a�?�HlR��?�Q��k��@���d~@Ѵ�+�H@�d�%TF@ᦓ��{@2ϭ��@०*rd@ �-�Q�1@#�=v[A�@&�B�Jtz@)�����@,�����@0�!@1�6�/@3��vE�&@5{1t	-@7q�w�#@9z9Kw8)@;�>�P�8@=�yO��@?����;@A$#Vp�b@BR�~C��@C��Sr�@D�T��`@FF�@5@GZ��Z�@H��f�m@JƵ.0�@Ko� �@L�]�;�=@NJ�=�.�@O�4Ϋ@P��J\��@QcJ��9�@R)1�W@R�M�}k@@S����1�@T��r�@U`nm���@V5�H��6@W_����@W�Ć��@X�b��@Y�0%Q�@Z�$֦�@[s�/R�@\]`<��@]I�;4Zu@^8~��I�@_*8)�@`��u�@`�}�@ @a"��@�@a��� @b,2��L@b������@c�cl@c��5�Y�        ?��?�?�0��p?�����?�!�J�v�@����v�@	J0�<@_O{X/@�ڌ㍳@���\ٮ@"���,�u@&LS�M)@*&U[�B@.$3���@13��$c8@3p��UY@5���<�@88���~�@:�9�9��@=c0sx5�@@�:=Z�@At���@B�P���=@Db��H��@E�-�N@Gy���fQ@I����@J�s"h�@Ldw8P��@N��>��@Oٔ�&�@PЧp���@Q�����J@R��؜�@S�����@T���ʢ@U�Q���l@V~�fu'"@W~��m8Q@X�zU0�@Y��j�*@Z��w�g@[��։�y@\��z�!�@]ˁ<@^䀏?�s@` k>��0@`�;��N@a!�h�?@a�� �N�@bIC�]�\@b�gy땶@cw��&@d@_�
@d����@eG�t$f@e�MM��@f��C�@g$
�}@g��Bt/�@hi-����@i�nZi�@i�� M#Z@j[;d��        ?�|\~9\?��P�L�p?�a�Ċ�J?��9�P^�?�7p@�#?��"*&N�@\�����@�]fZ�@.H�PM@�����@���>#@���	�@i���p�@ 7��r�@"U�@$�&g�p@&ߋ�f��@)I��n:@+��#C�c@.e9P$w�@0��ȡ�k@1��0C�@3\bۂL�@4�c��}@6X���@7�g��w@9~�.�y
@; ��(S�@<�j����@>��t���@@ m)�'�@A��?v@A�q�DX@B�ӂ���@C̴[�>@D���D�@E����@F���є@G���d=@H�z7��@I����i@J��*dK�@K��`�Q�@M_�{��@N*&!_�@OI��	l3@P6�
�?@P�J~R��@Q_����@Q�<��
f@R�|3�@S+�^�+�@S�n9��@Tg�� @U�(c̓@U��6��@VM��\@V�2��H�@W���z�@XCy�@X�_�@Y�^S�K�@ZHA�e�        ?��d�<n?Ԃ]�c��?�z�2��?�Z�5��%?��o���r@���ס�@
MIb���@��fVD@A�Y��@��Y�"�@�v��@!�[����@$�OS���@'�>��X�@+��c�|@.�-�9��@1uv�[l@2�tC�K@4��S`��@6�tl�ta@8�`�U��@;=a;6�@=S���i@?�N�}S�@Ae�/��@B:c��i�@C{�'Ȫ�@D��aM��@F;��?@Gr�֝k�@H�
�)E�@J?O�X��@K�SΑO�@M*�|HP�@N���B@PP��B�@P�6ad,@Q�����@R|�?l�o@SOXN��@T$��"3�@T�,>D[�@Uڰ�6�@V�xUQ'@W�x�Te@X����hX@Yl�'�AP@ZYX
��@[HȽ��4@\;:�Y@]0���K�@^(��t�1@_$4�u��@`#��@`���K�9@ah,��C@a���@|�@b%���@b�E�@c(6.e9@c���=� @d:w���@dŀ^6��        ?�3�W�?Ӛ�ۏ?��(�*�?�AjϏ?��q+-�@�]���@	b,���&@M�gEsd@Qy��l@�.�֨�@|��z�@!N�Ɨ.@$2�j��@&����t@*���o�@-A��X�@0R(dl�@2�CxG�@3��hl@5ש�B:6@7�?��8m@9�c=��@;��fn�_@>-��p)�@@6���[@A^�ߎ�7@B�ȯ��]@Cƍ�_�@E�U�X�@FL�+�T@G�=�2�@H��ȁ��@JMmK1k�@K�-�"`@M�ܳ�@N���os'@PK��@P�~�i�@Q���x7@RI~��&;@S34W��@S��gT�X@T���x .@U~��O�@VS2�@�:@W*��W��@X�,�@X�8A���@Y�Od�]@Z��pRxE@[����g8@\q��ȗ1@]\���h@^I˳Q.@_8�HW�
@`?�r��@`�y`ɗ@a
�j��@a����=@bUF�@b�I��@cb{g�@c���r�        ?���i��?������?�V;�S?����U�@���@�&���i@3�ZBЦ@6:gx�q@ �8��.@$���h0@(���
��@,��?!d�@0� C:��@3ڈt�@5�EẄ�@8&1��<@:�j~�@=ķh؂J@@_�r=V@A�T8oߎ@C���`�@E+'m/4@F��e��@H�W*52k@Jla9 �@LE���@N+�ۈ�@P-� ��@Q��()M@R͸��;@S�z�V0@T)�bd�@U>�!i@VY�z@Wx�Ң@X�`	��@Y�H�$�@Z�A���@\*3��)@]ckn�@^���N6\@_�5���@`�2��@a;����@a�]��@b��� Z@c:�"q�@c�n�d@d���
MQ@eN^1r�v@f��:� @f��-�@gu��9�@h1�Ś~�@h�� ��@i��x��@jq��6��@k6��y/@k�R10k@lĀ0��=@m�� e�@nZ��-o@o(�EB`,        ?�Ֆ��F<?��܃��A?�N���@?���x�!?��0.'?��J�Տ�@�[���Z@���ڢ^@%N��@�7�/@:�*��@���%P�@N��@'�?v�t@!�$z��@#� �5��@%�td3@(=���o@*��ɺ^@-C�m@/��m��@1(Q�<�@2���Ml�@3�o���d@5[��S�@6���-aM@8Yt����@9�Xʵ�0@;|mT�@=��g�d@>Û�X�@@:8���^@A���!@A�����@B�A��}Z@CƳ��J3@D�I����@E��I�@F���I��@G�k;Aa@H�}&��@I��Ξ��@J���"�3@K�"�{�z@L�	J��
@M��w9@N���ځ@O���V��@P�'��J1@Q����j@Q��H͉@R7�
�Il@R̮��G@Sc�a�@S�AQ���@T��L�j@U0��0(@UͲ�!�D@Vlz���@W�%���@W��C �@XR�%8�@X�����        ?��C�?Y�?ҞgX��i?い��z?�C���?�U0�X{@ؙ�ik�@֭IJ�,@�u�@�&�H�@/�g\��@���D�@ :c�Nk�@"�\S�}�@%�cϢ�@(aKU�d3@+e��qu�@.�~@q�@0�m���@2���xx�@4o�J���@6I����@83Ӭ��@:-�S��!@<7qy�~E@>P89u�@@;�7?\�@AW��<A@ByN��F�@C��t-�$@Dҿ����@F	���b{@GGD�O@H�a�V�@I�����@K&���L�@L}��L�@M��/%.�@O>1+ɵW@PS��c]�@Q"4E��@Q�}��]�@R���,�u@SB�m4h�@Tr*�@T��$��@U�?���@V^#��@W+�ř�&@W��[��@X�p褌�@Y��h�}o@Z{B+��B@[UW{Y"�@\1��� @]���x@]���'n�@^�vG�@_�Fc���@`Q��M�@`��-��@a=��_D@a�c�^@b,��$[        ?��!M?�-��!�e?�Oo�6��?�D��'��?��d�AfU@�$$B�n@
@�H`�@��I_פ@	!y��@��b�j�@�J���S@!�=����@$�.�#�@'Ԙ�k�@+6��x@.f�	�@0�����@2�xq�8g@4�=ľ.@6��7Q��@8�/%U�@:�B��K@=/�p\�@?z=� ,�@@�"��Dn@B!����@C`����@D�'��E&@E��`]N/@GO��]@H�hB���@Jq���@K�]��@L����'@NwsL�9�@O��d��@Pûq�@Q��O][@RYzW3��@S)Y�(�y@S�|�;@T���;��@U�Ve�@V���7@Wh��J�@XKA$WRP@Y0�̒��@Z_�m	�@[�l���@[���'C*@\��m�@]��)���@^�h(�O�@_ǭ���@`a�3�s`@`��@-a@aa�I��@a㥬 6^@bf��K�@b�K����@cq �G*@c�񶀋�@d���        ?�|(&���?����Iu�?�)��Q�?��=�d�@9|y4@�.��@��r�@c�j~?�@���X�@#1Ν�Ϻ@&�)G3Q@*�ǈ���@.���ŷ@1����/�@4J~�d@6y����@9�p3�b@;�nX�X@>q���ɶ@@�B��@B!�uZ@C�[��B@E<6T<�@F�)X��@H���o�+@J;�S��@K��P��~@M�pv�@O�Q��#@P�.B��@Q��o�@R�_�E@S�	�X�@T�*�ž@U�(K1Dl@V���-R�@W���ǿ@X���O��@Zz � @[9���:�@\_ص��\@]��Q��@^��v;�@_�*����@`��./�@a0����@aйq��@br�7��@cV�:~�@c��b���@df/+6О@e��i�@e�ț��@fk�q���@g��H"p@g�/���9@h�g<@i8��4�@i��1@j�W�t�@kf
��@l#��֞4@l��)sJK        ?�^8���?�=�4�?܍����a?�UO[v
�?�l�/RJ#?�׼�e"@-T(�9@���d@4[�̗@u�m��@����Q6@�폜W#@K�1֫�@��Q;{�@ �m����@"��!��@%���y@'3Z8��@@)vb'P@+̶�q�@.6��f@0Y��7�@1�?�n��@2��,L�@4K	][�O@5���L�@7e.��@8�{m�ߌ@:�ML�n@;�b�H�@=���sN@>�^�M�@@��06@@�[�Fo@A�rKq{@B�n��U@CtW�t@DR��i�@E4b�L�F@Fj&'�P@G��w��@G�9��o�@H��m�@I��}�w�@JµmůT@K��\vLQ@L�α���@M���z�@N��1\yx@O�鑴�R@P_䲝�g@P�ÐC�@Qk��q�@Q��Nc8@R{��@SFz�fJ@S����R@T<K�@T��fJ�@U=\�]\@UΒ��m@V`���B�@V�'��        ?���V�0y?�fj���?�U`�5�^?�`���$@?�l#�7i@�o
�C@���XV@��!,:@�mR�B@9�38��@��=W�@ �khy9@#����@&�qg2��@)�|+�"@,�/=�]@0�2�@1��+ۜ�@3����d�@5w�ܬ�@7l�e��5@9s5��s@;��2��@=�w(�@?�f���5@A��$[�@BG
P�@C{�í�@D��(��]@E���)'�@GC��<�`@H�R���@I��[۰�@KL�j�cC@L��? N�@N^�/!@O�{�<Fj@P���G@@QE���T�@R	%��v@R�/�O�&@S�_����@Td�7N��@U3����@V�@��>@Vڅ?x��@W�.n.@X��耖Z@Yi�����@ZI�AV	�@[+��y�?@\"d�@\��!f��@]���Mu@^�`�l�9@_�s���@`W�P.Q�@`��(�Nr@aL�rwdX@a�>��'T@bF��4�%@b�#��^.@cD��Qd�        ?�)�}���?ө,�չ@?��<Pw(p?���/m
�?���v:@'�al�@	��Li@k8��g�@xy�@�U�c<'@���t�@!u�.��2@$;F�#t@',�/C�@*Ic�2*@-����p@@0Xn��,@2J�#1Q$@4)� h�@6?\���@8�G�<�@:5�p0�F@<^%x�@>���;�K@@q�V��@A��s'�@B�M�9W5@D웨�!@EWR�x�G@F�V�zȤ@G�ҙ�Hj@IT�����@J���,�@L!�i�7@M������@O
�,��@PD�)2W@Qe;�m@Q�Q����@R�u��!M@Sb�7�N@T2-0�^@U�
���@U�$�sU@V��?*i+@W���V��@XlDdiQ�@YMc-3� @Z1Q[۩�@[m�@\z�?Ț@\��;z��@]܃w��@^����@_�'4<�@`\o�?�w@`���m�@aV��qg;@a�#��)A@bV�ļ�j@b�$"��@cZ��6R�@c���1�        ?�_�
�P�?ަ���Ö?�%��S?���q��@��hX��@�ď@�@�#b�%Z@I��t�x@v^�t@#=��"@&�j��EM@*�k�"@.�H�T�@1�+�DU�@3☞�%7@6K�x�; @8���w>�@;n"A3L�@>%��$@@z�~��3@A���.�@Cn��u@D��6�^=@F����g@H/�WP��@I�����@K���9��@MPPƦ��@O#��@Pv�š1@QeA���@RXqKf�@SP6n�KS@TL{�/gK@UM+!���@VR/�� W@W[vq �5@Xh�^JC@Yz�T��@Z�"���Q@[���1@\�Vו��@]�Џ�� @_'}��@`�z垊@`�%oz�@aJ�"�@a��r$x�@b���"1@c���&@c��*�E@d`*.5�@e���1@e���گ@fO}��l@f���@g�N�K�@hN;ܰw�@h�д(sM@i�	)�h�@j[���@kTt5�@k�`	+|�        ?�ܡ*|W�?�c�uq�?�m�����?��'�?�lr'��?����L"@�씫�_@�+av�@���Eƕ@���c��@$cA��F@�ң�j@�яP�T@ �5?`@#�z�v@%f�q©@'�L<�M�@*@����o@,��XpG@/{dr���@1�/g�@2���:��@4 s.î3@5�D�n@7���@8��Ÿq@:G�xK=o@;�P6�@=��\�7@?j��p�@@�%�(@A�rƙ@Br�E�wf@Cf?�,�@D^fƏt�@E[&fwj@F\m����@Gb,��[@HlQ���@Iz�s�a@J��r�pZ@K��9�ͱ@L���Lی@M��iO�@O~�Q�@P���b@P���sK@QA��dQ�@Q��x��@Ru�O�@S�:bC@S��S.,�@TRTß�@T������@U��9�*@V>���S@V�tI@W��g.@X;L�|;v@X�7p=�9@Y��	D:�@ZG,a�W�@Z�1G��:        ?�����?Ӊ����?�|,�Y[U?�y�	4?���B���@�!
V�|@	��%��@]�m(@M���@f���z�@I�<O�@!�glii@#��>ò@&�yH��s@)�� �]�@,�{��u�@0"<�p|@1��(�@3����/@5��e�@7��Ƥ��@9��
��*@;��9�
@=���3&@@Zg��k@A7����@Bfs̝л@C�� ���@D��L���@F ��"N�@Gm��<�@H�TZ�bu@J9�u@K��ǱC@L�S@N[KS��R@O��G�-@P�}<%��@Qj�9�y@R0��ij@R�m��<@S�~���@T��,<�@Ug	�7�u@V<o�'�@W�#
I@W�O/#�P@Xη�r�D@Y���-@Z�O�H�@[{m�q��@\ea�@]R!o�9\@^A�<<�@_3��}ő@`glޖ�@`�2���@aN��@a���Z!@bf8 c@b�X��:�@c����m@c���,.        ?��k�#�?�b����?�v��Fp�?����?��U��1�@�~�b��@	)r�IT�@*�5���@'Dq;�@��XX��@FK���@!1=*�"�@#�VNX�@&�.�HC�@)���K@-���~@0A����@2�@�	@3�c��^@5�甊�@7�]+���@9�0��A@;�y�m"�@>1k�{@@;A��6�@Af6�yb=@B�p���@C���@E#?�,�@FcW&�\�@G�GY�ǫ@I�j�$�@Jr�ܖ�@K�WW��@MMn��@N��	�3@P"!�\�@P��y��@Q�|�.J�@Ru\|[�w@SB�i��@T'jp�@T��
�P�@U��n�@V�LP�)@Wu�Ҷ�@XV<%~��@Y9���4@Z }�U�u@[
#Q"��@[���:@\�K��.)@]ؾ�D0�@^�tZ�}@_�B�7@``����@`߇@J��@a_�a` @a�r���X@bdq�+�t@b��;�&>@cnm '�U@c�b)�        ? �艴?��|}?�_2�"�?���k��@S���l@\��� @E��FR@�D�8C@ s=��R@#��/��@'K�	�I@+Tx���@/����M@2X;�i�@4�+�p@7Rߴ�R@9����}�@<mTOn/@?K�h��@A#7�ύx@B�H�A@DF�{a@E�n�x��@G�M�Q@I^Yo2O@K*,f��@ML���@N抓��@Pk[I,��@QiQQ���@Rmk&t@Sv�ݰ�M@T��ɋy�@U�!��J�@V�'緜	@WӋ*��@X�7�q�@Z"G!��@[Q���@\�/�I�<@]�?߮	�@^�:V�� @`��*��@`�O���@aim�z0@b���@b��՘�@cilV�"\@d�g��@d��+s}�@e}@�nč@f2�dL��@f�lJ�g@g�K��"@h`& �B�@id�2@i��^՛@j���H@kd
w4�@l*�E@l��8~�@m���@n�n9~        ?����B�?ͣr�$R�?�@:؂�?�b�=R??��Z��h6?����)d:@��pF~@��cL@P��	�@�#)?�@f+�v>@��ʡZ@@q�׳@ �uߞ�@"&Q�j�M@$M�\:�!@&��v��e@(�<Du@+N��ɪ�@-�
��N�@03L��:8@1��X���@2�#��@4RIcw$�@5ŭ���6@7B��a�@8��ٖi@:XO�rJ@;�J���@=�7wM@?;� *<@@w77ְ2@AT�j�?k@B60(���@C��K?�@D^��\b@D��NY"@E�A��)]@F�s����@G�ku"��@H� 
�]w@Iψ�@H�@JӞNj�y@K�X?�-�@L��@M���� @Ow���@P�5�V@P��O�RT@Q*���s@Q�, ��@RK��o}9@R�l6�S�@St�N_<I@TV�g�@T��U��@U=���@Uفx�֍@Vv��1M@W��%uV@W����%�@XW�h�@X�6�x�H        ?�����&O?ӡ�H�օ?�_�"'�?��g��?��F���@��ꑷ@	h
x�@��%t@C�@e�dL5�@C�p1^@!��`!�@#�����n@&�N*6�@)��@>
<@,���R@0[?@1ԍ�r�@3�Lp��@5�{���F@7xW�&@9|A(��@;�Ԓy~~@=��f>89@?�(7ü@Au�̈́�@BAJ�Q'8@Cr��+@D�0 N�@E��\�*�@G1���X)@He7��@I��`�SR@K.څ���@L�\���@M�7��Vo@OfNH��@PmA�U�@Q*\���5@Q�j(�W�@R�[�O��@Ss%ӕ�@T;� ́@U���@U���[,@V���J�a@Wy �v��@XO���c@Y'����y@Z��'��@Z�
̙�@[�e�k@\��g^w�@]�r��n@@^n�UZ��@_X���@`"['I�V@`��@aVj��@a���{�@bxӇe@b�jv)�s@b��=e        ?������?�����?��"3A�?�5k;��?�,�6��r@p�JW�i@��p�KX@��!��@�3/E@����@��=DG@ �W��'�@#]ZAd��@&'���j@)۱�_�@,1��˞�@/n�wd,�@1h~b6k@3*��> @4�N �p@@6�! ��@8�-�6y�@:�.�z�@<�`��9K@?�_$��@@��8���@A���@B��vI@D:�S�Y@EH���+@F��5`a@G�JVV�S@I)�6�@J[:i���@K�Y���@M	f*諢@Ni>7�M@O�����3@P���L��@QU-�ݶ9@RJ4��@Rͬ�3'@S��?�U@TP~��;�@U��8�_@U�G��b@V�K�:��@Ws�"��C@XBg��.@Ymt��@Y湾R�)@Z�GAK�S@[�S`�@\nX|u�@]JF*:�L@^(��Eԝ@_	6A�l)@_��eVy@`hd6�j@`��޳�(@aPs���@a���5@b<�x��{        ?¢	��f?��� �?�> ��:�?���{�>U@;VJ�d@��lE�@Ӳ��R�@m���e@�G��}�@#3a���@&یa���@*���6&�@.�x��u�@1�����@3����@@6gf�؃p@8��ae��@;���U�@>L�{�@@�#�b@B^�[�@C�n��{@E!5k@F����7@HS���@J'��@K��� y�@Mn[x@OM��lm~@P��I8�@Q����T@Ry�̧��@St:}�b@Tshg ��@Uw'���@VeV��*@W�O�L�@X�p}E@Y�f���@Z��gb5@[�À�}�@]��A�@^1�r7@_[ܥ�l�@`D�`,�m@`���س@ay#o+\@b ��U�@b�櫶��@cU�0��@c�{e�0T@d�#�a>r@eC�sߡ@e�K�B?@f�k&z2@gB� �UH@g��As��@h�Q���@iQ����@j;�n��@j�S^I|�@kq&���@l)�t�h        ?�(2�\�?�p�ɣc?���3���?�Z~���?�0&�@�D?�������@���x�@����'�@U&�0?�@%;I�e@Z8Q��@ƣt��x@gߐ#�@;��i��@!��GK��@#���@%螭�B�@(-�8]�r@*���s�@,���B��@/wx�c@1���_@2Y*���@3��B��@5�,ƒ@6�h�SW�@7���~��@9|�kJ<P@;f���@<����Ä@>'�n��@?���@��@@��9@A�ْ��@Be����@CCF��9@D$IqQϓ@E�A[H@E�t�f@F��]ȁ@G�m��/�@H�8kH�E@I�6�!1�@J�\�ʚ�@K��vk�)@L��j�<@M�Fl��#@N����F�@O��Lm�n@P\�X���@P�}��kM@Qkj��e�@Q���9'�@RyI�o@S���@S�	���@T'��$��@T��:�_z@UIsM�c @U�6�p�)@VpD#�*B@W�Sʚ�@W�)>8�n        ?��&�?Ӑ��n�?�{���	?���P�c?���X5�@��_���@	|���6@�X�n�@e�Ԍ@j�4�n@$q���@!8X�!�@#�G��~@&�c6�?�@)�2{��x@,�c��Z@0.z�Q\@1�����E@3Ȼ��?@5�R"W\V@7�X��˱@9�o���@;�<����@>i;X��@@'�x���@AQN,�2�@B���s@C����@D��l��@FH%����@G�`�}_�@H�!gf��@JRC+�ٱ@K��0���@M(!eR@�@N��v���@P���@PΗ��Ϳ@Q����ɨ@R[�v��@S'5)�v@S��P��?@Tǰc��V@U���0�@Vt�>���@WO�#�?z@X-��S�@Y����@Y�tR�@Z�54��@[����EG@\�8c9�P@]�hM+��@^�Vh�Y+@_��Vo[�@`>(
b�@`�&�r�@a9u;�Hl@a�ɖ�@b9�.h\�@b�7��@c?w�-@c��\�w        ?���jD?�L��Yc?�V�&$y?�km,�=�?�������@��i~Fy@	 Ņqs$@��x�@Y:�:@`�!	'@r��ä@!?cែ@#�!��	�@&����@)���v�@,�X���=@0"�mtl�@1��v[@3��+l @5�����@7�PI'B@9�rS�K@;�� rR�@=�xYz�@@�Ȍ�@A9�����@Bhlfy�v@C����@D�g;_\x@F#I����@Gp�&���@H���ܺ@J ��(�@K�Eb�Z@L�V��@N\��kd@O�C-��@P� {�Z@Qi�V���@R.~UA�@R�@\w2@S��YR�@T��$�K�@U_8\~�@V2�P.��@W����@W����.�@X�|��Nn@Y���;@Z|�.+�@[`����=@\F�.Y`@]/�a�@^��h��@_�t��@_���u@`u�ѡ)B@`�s�q��@al2�<�@a�Y�F@bg.��@b�e]��@cf����        ?�����?ߞj�5<?��N� �?�\���VO@����i�@VA >�@<���=e@�=#z�@ !�r�@#��0�@'K�F�Bo@+F'X�Zi@/����@1�1nz�N@4Sh���@6�|
�Fp@9VbbK�@;�(����@>��#�iD@@�|�N�@BFB��@C�v���@EY���n@F�i}\@H�����(@JG�bvR@L9s�<@M�fSL�@O�E�CI�@P��+��@Q��nk�@R�#�,�@S��1��@T�{!��@U�:��K@V�E�@W���6�@X� 2�T|@Y�����@Z�9Nu@[��#��@]���8@^41���@_Z��z@`B����N@`ٕo6��@ar�y�Q@bK���{@b��dr]@cHM`Q@c��ql�@d�w���@e.2"?4@eӪD�p�@fz�IF��@g#���h�@g�\r�K@hz��ʠ�@i(�y�@i��(�@j�>l�S@k;�fϮm@k�K���        ?�O;9�?��|�F��?�3����L?�ÞQpm�?�!Ł�?�qM�?�@E��|L@cjۤ��@
�z�6@���8��@�A�ݧ�@}���f@F�CK@ "�XK�}@"=	�,@$q���@&��Ԣ��@)"���s�@+��\�P@.2*�
�@0m�I$�^@1�y�ʖ�@37ۼ-�Z@4�����\@6+�ݮlJ@7�``0E@9H�h�e�@:�����@<��qR��@><��T�w@?�}\6>
@@ܖ�,s@A�l}��@B���&@C�J�U�@D�2��7�@E�U�tfa@F����p@G���ʴ@H���x@I��Ɂ	@J�����@K�)��@L���Ҿ�@M����`@N��(��n@Pm��<�@P����@Q)��LQ@Q��Sԝ�@RU����@R�Q��
@S�����@T$���z�@T ��S@Ub*H�vq@Vb['�n@V�B���?@WJ�/㤞@W��،E+@X��MP�_@YA���@�@Y�0��        ?��e����?��Ct�?�u���?��!5�ڰ?��N�U@��-�@����@�����@C�BD�K@j��N��@���1�@ `0���@"�$K���@%�$�@(��I�^�@+�����@.��/���@1 _�pB@2�¶��^@4�[F�@6k�*.�?@8V����@:Q����@<\���2@>v'o�G@@OB}%�}@Aj�����@B��<'�@C�?L��@D�/px��@F���)_@GY����@H���0@I�b9�@K5��{�@L��QW�@M���v@OHV�fհ@PW���b@Q��c�K@Q���{@R��-)�y@SAd��)@T�g;K�@T�M����@U��]��@VU���@W �T3��@W�ӳ��I@X�,�u��@Y���=&@Zg!1�>>@[>��t�@\����x@\�ӧ���@]�`\t�'@^�7�Ѵ�@_�T���@`>Xo�I�@`�# �C@a'���@a�	�{�@b���5        ?�#�:͛�?Ӡ0�=��?䷘Y�?��$]�{�?�տ�-�@�n��@	}��qڈ@`�+�i�@jY��h@צ��^@� >ƥ@!g�Q�p�@$)�5Ds@'��]�m@*/���Ee@-q��36@0m3�ܸ@25xJ�@4܊/3�@5�����@7�Y�,�y@:�}V0�@<5���UL@>j��W�@@XunQb�@A���r�@B�k��@C�]�@E6�ۗ�x@F�ϐA��@GԽ��@I/1�3�@J�={��@K�<�a@Mj�vC��@N�~3*�@P0?%߱�@P���غ@Q�����@R�I3�@SN�e �4@T�M�@T��)oR@U�<��-@V����K@W~*��T@X]����u@Y@S�:�@Z%�*$�i@[dI~*�@[���Bm�@\�=_8�@]�;��>�@^�0�a��@_��hZO@`^�rn�@`��+/.@a\P��=@a��ͫ@b_6��^N@b��qD@cgF~��@c�5��g�        ?��da�*?ߥ�M�#�?�3�`�??�u<��v@��҈_@|x=f@ZX^p�Q@�Ց+�@ @&�:��@#�2V�W�@'�u;W��@+��6��@/����@22�� �?@4����%@7AZ�@9��ܗ@<r����#@?H�c�ͻ@AW��Q�@B�P� �&@D2�b�Z@E��c�a@Gz��G�@I0��ys@J��񉭉@L�����L@N��5U�9@P<�AF��@Q3{��Gl@R/��1�@S0Ԧ��@T73XU�x@UB�w�%@VR�@َ@Wh�G�=@X���Yx@Y���	xp@Z�'L8@[��6�@]O��u�@^I/��yy@_~yYbq�@`\,��@`�����@a�e�R0@b?O[���@b�^�3�@c���i��@d5(��C@d�r1_I�@e����Zb@f<��k�y@f�W�P<@g�	��!�@hU��o�@i�9�ʅ@i�D����@j���T�@k;؀ߕ=@k�ʡ"�h@l�y�J��@mz��X{�        ?��,�?���
��k?�kw��	�?��8���z?�D?�=��?�l����2@�}8���@$q,�@�,%y�b@?ӂB�@��p�@�]�Y@��x�,k@ ��(��)@"�Sܚ�@$ݙ��D�@'0ʂ(�@)���;M?@,�h
��@.����BX@0����@2]j�c�@3����Q�@4�'�1`D@6|�9v@8g뀚�@9��{��@;<q�+@<��6@>��L|6@@'�\���@A	����X@A�cҽ׆@Bٍ��M�@C������@D���ך@E�-�Z��@F���r M@G������@H�?y���@I��"��u@J�,ˋ��@K�[pD`@L�IԼz#@M���A�@O7C�3�@Pm��r@P�Rk8k@Q7Y�Ǒ'@Q�"�f�@R`��y��@R���!��@S��	Nz@T+t�?��@TǼbi��@Ue�w7"@V/Jv�@V�N:���@WH�� �@W�>���K@X���Yz@Y:T��@Y�"N7?�        ?�����L?Ӄ���N?�oz�/�B?�u@Lk�?��Y���@����S�@���d$%@��.��@����@KO�l�`@�Bq#�3@!�)�r@#��,���@&���$�@)���O�@,��p^J@0���z�@1��{E%�@3���t�@5o��_��@7a�BC��@9dY����@;w�`�J�@=��W���@?���4�@A	�ϕ%@B3-v-�@Cd���@D�V�$�>@E�ȸ%@G"Lꡐ�@Hoŀ�P�@I�����@K#�Ɖ@L���;O@M��#�@OW�3�_~@Pfb�;�%@Q$�q@Q��Hp@R��]���@Soqſ�g@T9>�6S@U�Tj�@U՞��N.@V�jy�e@W}u�0��@XU����^@Y0��*V�@Z(KiA@Z�@�~�@[с�V�@\�"�=��@]�\b��N@^�)#CҲ@_w��@`3���aI@`���;p@a'X�U�@a�J��@b�e:�@b��oE@c1eU��        ?��C�-՞?�=��\	|?�L{7�?�c�&�?�x�W��@�W��N,@�g+ʌ@|�^@��L�@M�T��	@���xz�@!!���6@#�b���@&�J�^@)��u8m�@,�p�,X�@0O��j@1Υ�)�@3��"��@5�cִ��@7yoC�@9�R��3@;����@= ��<@?��u�o@@A#��@d�@BQX�E]@C��	��a@D����G@F��%Z�@GU#�is@H���0?@J�:��6@Ke����s@L����p@N?%:=<�@O���uDd@P������@Q[�3��@R!�[xr@R����0@S�7��?�@T����@UU�$�r@V*�1+}:@W�����@W�S��o�@X�NOn�@Y��_�j@Z���@[eC0��@\NE�g��@]:[+��@^(~�m�K@_�л҈@`�?H.y@`��B�˩@`�w�/�@a|I<\�@a�b�d�B@b{�f� E@b�\�]�@c�4�K�        ?�8bh�o#?�	�t���?�ܫ!�n?��S��0�@�, �@���`�@�e���u@t��!)�@ t�j��-@#���Zv@'ʵ-�9@@+޺CV�@0X�6�I@2d�]�@4��(���@7TG����@9��,R��@<��Uo�@?��n��R@A@Dka��@B�=�;��@DX�u�BW@E����!@G��d�N�@IV|����@KK&_m�@L�1/�*@N��Β;�@PMh��F�@QC*�j�M@R>�@S=��E�@TB���L@UL[���R@VZ�s���@Wm�E!�@X���0��@Y��)��@Z��:�i@[�:�0�@]��B�S@^@���@_rp���I@`T�����@`��+��@a�|B��P@b3�3F�@b֠��@c|2췭�@d#�(3�@d�2՝2_@ex���X�@f%�K-c�@f��m@g� kY��@h8Ӱ��@h�u1i�@i�ߗM @j\b�i�@k��<�@kћ�( �@l��%��@mM�䐪        ?����V?�̚�#U?�
��,?��!��x?�?���?���Cr@aS�/@���w,�@'�A��)@�1�t�@�eR�d@�>$��#@I%�a9@ !v a�9@"8RQyZ�@$hNf�9�@&���͞@)�a<��@+��8&]�@.���-�@0\���`@1�f�t i@3 �T�S@4�Y�Rpz@6BR�ޮ@7�:5�Tw@9$����@:����Sh@<`��+*@>3���@?���1�P@@���P&"@A�pj;\�@B�z�`�{@Cx��Ou�@Di6�ǿ�@E]����@FVKq�dT@GR�<%@HS!
;{@IWG�_��@J_+�Y
@Kj��Cp@Ly퐞:@M��v��@N��2VC@O���@Pm�z��@P�\� {�@Q�e[�{@R#R<��@R�}G,E@SO��!�B@S�*���4@T�n,���@UI/�c8@U�����G@VZ���gZ@V�6����@W�>����@X@�$�\G@X�Ȱh�@Y�A%��        ?�y���?�� �ў�?��~��R;?�4�?�d�%�3@w�ػ�@
���� �@5��A��@wz�{oj@$�`��@8Q�z@"X���p�@%E�0���@(b�A��8@+����7�@/%���@1eH�!�@3M7�(K�@5JX�.)�@7\C5-�@9��H{7'@;��3�)�@>
�1b:�@@6Ē��@Ap-�ԭ�@B���F8�@D zA�Y@EU��[L�@F���	��@H�22��@I�-��(�@K���@L� ��@N
Su7�'@O�}c�'�@P�=�4�@Qip*�@R<��BН@S%P��@S�!��%z@T��듰@U�F�q@V��mB�@W+��iV@Xk�#���@Y\�+�@ZO���@[FI��o>@\@Y�%B@]=�}�Wq@^>#1O7@_A�<Co�@`$J�^��@`�:Ѵ��@a/����@a�����@bA(5jC@b� �J�*@cX�iC�@c���s7@du�s�#@e�a��@e����        ?�Z�}�?��D�mCn?��cКm,?�(���`?��	[��@D��e�@i�F�?g@[E�/z@��ȫ��@�K��.?@V����/@ �4Ojl@#AZU�*�@&
_�a�@(���#u@,*�j�@/N�p0�@1W���u@35����@4���^�@6҄����@8��g��@:�7�@<┹�f�@?��, @@��S��1@A���8,@B�y�|��@D�����@EO��=#@F�J�d @G�w��U@If�U@�@Jq�9�Q@K��:O@M*�v��@N�w���@O����H�@P�R�;�@Qsa;�W@R2^�:�@R�=�#&�@S��tc@T�w)c�@UJ�oW�@V�w���@V�W�Y�@W��ʉR�@X�y���A@Ye�ۄ�@Z?�Y��A@[)7K��@[��p�@\� jփ�@]��&�]8@^��=�@_���M�@`<F�0N@`�Uٴ2@a)��t��@a�@LQ�@b�E��@b�uf�3        ?�C�i��?�
����?����J�4?���/�@�@�L���c@�hX4h@��z��J@u1�L�@ vcdW�@#���"@'Ш#�u�@+�h6�Y@0!�5��@2oh�K/@4�OwA�@7g\s��@:� t7�@<�b1�v@?�ҡat@AX)#
Rd@B�&���;@D{��)�@F�O{�@G���oq@I�@�W��@KW�c���@M,Ҍ���@O�����@P|�j�|k@Qx��'�@Ryϧ�C�@S�fcjX�@T�Jѱj@U�dL�{�@V����T�@W��L	�j@X�!7;x@Z8�+�@[>���c@\l��B;@]����@^ב�|P@`	�{��&@`�1�T�n@aL�%lY�@a�T?�`9@b��{<C@cAe�$G@c������@d�ċ@�@eH2S?g�@e�\���h@f���h�z@ga��oj�@h�%|~@h��Vv�@i��A�@@jI��tL�@k�e�A�@k�w�5�a@l�h��8@mP`��@n�N�Y        ?�e�bZ�<?�.�R~ۋ?�z���L�?�I�I�A�?�i�n��?�݇��@8����@
��&ߘ@]���_@�P�TQ�@��u Q�@���i�@��l'��@XT���M@!#�^��@#29�� 4@%WA]�[@'���w@)�`�G@,E{���1@.�27<��@0�N�f�@1���y�@3J��Y��@4��ed�@6O�f��@7�Z�Q��@9�X@:�=��@<�*/�&@=�t�1�@?;0}3�z@@nj�嗯@AB�W�C@B"S��@B���}m@C�'Tmd�@D�ݏ��'@E�����n@F�iaS7f@Gu)K%2@He.��'@IXo[{�@JN㹕�L@KH��0R�@LECT�&�@MEzyP@NH�5��@ON���@P+�y\r�@P����?�@Q9f%�@Q���J^@RL�5��@R؀5��@Se�lk@S��l��@T� xb�@U��G~@U�k�:�@V>�5�~�@V������@WlQ�9��        ?���b%�*?�g�$���?�S_,�?�_D
���?�lcF�w�@��S��B@���@ P��1@�!-A@H+N	�@���}�*@!���]I@#���]@�@&��\=�@)��e���@,�|��w@0^sZ\�@1�V�op�@3�5�e~�@5���L�@7��2`1@9����}@;�aʏC�@=ԭ��@@J�in�@A.f^�@B\����w@C�zSZ@D�(>\q@Fh�"��@Gb>�S@H�(z�@JND�@Ks��@L��Z��o@NL�6��@OÔ�z)�@P�x����@Qbe^�{@R'�q�ND@R��e�L@S��ў�@T�g���K@UZ��r@V.�6�k�@W�8��@Wߴ,,2o@X�>��n�@Y�x��?@Z}V���.@[a��A'_@\HӍ�dV@]2\�-��@^_ ݓ�@_�%Sue@_���0�@`xl�Q��@`�/_�x�@aoy�D@a�f��@bj;�ӭ�@b�n�3��@ci��v�        ?������D?�'$���?�3}f�?�Nd[
�?�Y�b=@�t��F�@�i�?��@��@53@��3J�@51���@�����@ ��}�y|@#�/xP�@&z,�.�@)z��i/�@,�^��4�@/�P5�U�@1���-�A@3}e:;ѵ@5Z�E��t@7Id!j@9H�eg�@;X�nQ@=y<��f@?�VX���@@�}G� @B���@�@CJԚ�6@D�@�:@E�m'�M�@G�K%@HN'WU#
@I�<���g@J��L�@LXC�U�@M�����@O*���^@PN%!o�@Q
S��w@QɃU�J@R��ks�V@SP��Y�@T�8�l@T�8 �5�@U���ö@V��&�m�@WS|�.�@X(ۛ�}@Y � 8��@Y�L�̷@Z�L���m@[���<�2@\y�i�4�@]^T~�7@^D�W�Ġ@_-���.@`��"$�@`����#�@`����fO@at��M�@a���U@bjV�\��@b�����        ?�/���a�?�(�|��?�5�"1?�t��Y@�n�	 @��Q@V�:OZ�@ͽ�a�@�[Z-O�@"�FF�=@&J��I1�@*�l��@.'�.@17d@�z@3v���f@5�O�ONW@8E����@:������@=x��O��@@�����@A���\$@B���n�@Dy�Z���@Fb�DA�@G�j�Z�@I7��7�@J�uD(��@L����o@NN3)0U7@P	y�,�@P�Z+�n@Qۣ �l@R�A1\n�@S��I(@T�(�>e>@U�LT}�@V�v�M@W��;�a�@X����@Y˂�Gf�@Z�7�)�@[��Ƕ@]�,�`�@^ كV�@_?n�k9@`0�H�]�@`óW��X@aXZ��M�@a���5�@b���Nq8@c �-�q@c�JU�^�@dY��l
�@d��/1�e@e�.�n|�@f;����@fߔ�5��@g�L�X�@h,��-@hռ���@i�n���}@j,�&!@jڿJ�+        ?����s?�WpG-�?���ҫ�L?�6�Z��8?�٪]��2?���g�g_@���Sj@���U��@O����@�_	#�0@tP7�@�ZS�Q@Z���M�@ )>ʞg�@">�o��@$m��c�^@&�Q�'S;@)�
��G@+��קN�@.A���@0Z<2s�@1�z����@3!�h��@4��éH�@6��Y�@7�j�?�d@9���Fe@:�Pn��)@<LL4(u�@=�u�;3@?��[Bo@@�i�3E�@A�d�9�@By��E@CdT'�b@DS,y�0�@EF3�U@F=_�mm@G8�(�4�@H7�gX+@I;I��ל@JB�!Fӏ@KM��}:h@L\��S�@Mo�	�"�@N�Zg{��@O���zY@P_dJC�@P�@+"�@Q����R@Rd�y�`@R��6.@SE��w�W@S�i@k@@Tzܲw��@U�^�z@U��{B��@VW%ܭ�@V���V@W����t@XA��b�%@X�Qo�f@Y�jA	B�        ?�j��q?�G��??�40U�?�CO��#�?�>�\B�@|�j�d�@�/�&M�@���b�@��h��&@���+\@��0\��@ ������@#{�l߾�@&N�Y��@)J�^���@,m��ê�@/����8D@1�b]`x�@3]F�'lU@59 "���@7&!Q�WD@9$AD�	@;2���hw@=Q�_���@?��p�r^@@ߢm�e@B�M*�@C4���'�@Dj��}z�@E��ʚ�@F����@H6��s>@I��oP
�@J�<=}!@L@�;ͧb@M�ky*L@O�>�ͼ@PB�8��a@P�2��qx@Q���ت�@R�a8�,�@SF�D�K@T�Q�C9@T���*@U�x�OA@Vz���h�@WN�,@��@X%�L���@X�8>�'�@Yۀb2��@Z�r��x�@[���/�@\�6�z@]f�Еkp@^PK�b$�@_<$(GD�@`>�w�@`��9F��@aL&}�\@a�'<z�W@a�6��@b{u(���@b��z�F        ?��j�0d�?�g<!?�!A�b�?�Ů-�?��$���@o'���@	��>n��@�[�['@��ާt�@KM�dڣ@-��܈@!�HK{��@$�f��q�@'|o ^�@*�G�o�@-�;��X@0�R�f�@2B0|Sy@4`�$:Ƥ@6Tb8
�A@8Zq|%	@:rC��@<�pdF�@>՘����@@�0��_�@A���y�+@B�AJ7@D0��H�C@Eu�XO|@F�.g��@H�:��@IqN@��a@Jӟ����@L<�(\b�@M�+�v�;@O$/��'K@PP�A�q�@Q�*_;@Q�w꽋�@R�	^��{@Sl�9��@T;�p\��@Uv��$o@U�d���@V�R��Q	@W�6�#��@Xs��J�@YS�2�*@Z7E+�P>@[����@\����@\�<ùh@]�6>�I�@^�|)�@_�ki �@`^~�]p@`����<@aX��5�@a�?-f�@bXo=�?@b�� @c\��N5D@c��἖        ?�J�6r�-?��:���?��m��?��p�9��@$��@g��@��!劂@���d8@ �F�'N@$���@'���@,�W��@04�8�Wh@2��h�B@4�I�(m�@7��'��@:1$�d8�@<��[���@?��lx%@An��_d@B�1���@D������@F:sx�k�@G�~m�E�@I�x5Tׄ@Kt$l�@MIIm��@O)�J��d@P�����G@Q����|@R�(�z��@S�ٴ��u@T��|�[@U��Y�&Y@V�Z�zn�@W��-xC@X�5��@Z��F2I@[>�!�"�@\kL `1�@]�i8�5�@^�	,�@`<d]P@`�I�':[@aF���9{@a�<�y*@b��k>��@c7�M���@c�x
�&@d�Q!�	@e;+^�W�@e� �pvG@f��V1O)@gP�G��$@h$�y��@h����#@iv�,4�x@j2�q�+@j�
�"�@k��k�8@ln�++�@m0.0)^@m��;�0        ?��%�v�}?�
܉�?�f��}$+?��B�{?�ܰM��?��W?[@�x��M{@��/^1@3��B@�	�OG@L�.�T�@�3q��a@a�r��@;x'�5�@!�s� @#�3�w� @%�-�Ǳ@(A��٪�@*��3�@-���U�@/����m@1";���O@2{�j4]r@3�+Iz�?@5K�<���@6�,�i@8ALA䗉@9ɓ�1z�@;Z�߂ץ@<��Yǩ�@>�m�b@@!Z�׹$@@�@bG@A�[���@B��bQS@C�
�@D��"Hm@E{��u)@Fm��8_@Gd4�j.H@H^�2oη@I]f�%@J_BK���@KeI�h~�@Loul�@M|�vg�@N���6�@O��(�@P]���*�@P���@Q{��N��@R= .��@R���tn@S5����f@S�qxZ��@Td�Ak�@T��y@U��xʬ�@V8�2��@V��{l�C@Wx�w@XA��@X�z�N�q        ?�~([��?�L�y�?�8}��?�F�#�g&?�C��2�f@�j�q�@�"
�ƹ@��A�8�@���`f�@k7Q�f@�ej�8B@ �G����@#�����@&Ux��]�@)Q����@,t�y>�g@/����@1�rVB�@3`��!�@5<�v�k�@7)��m8@9(�Ƌq@;7���@=Vo��$@?���0�@@�ۼ �@B	��H@C8��t�@Do�#�6@E���ѽ @F�5��$�@H<�AF|�@I�x/.�@J�խ��O@LH�g��@M�� �2@O�{�I@PHà��@Qs�^X@Q�ʐ��@R�Ff���@SNw82P�@T����@T��z(n~@U��%NT�@V��E��@WYOL��@X0�f�F@Y
̎po�@Y爝��@Z��=3M�@[�����^@\�#�~�:@]tdU��@^]R!��.@_I8��@`�UnN@`���K#�@a2����@a��	]�@bo�]�@b�AF�]�@b�.��Ts        ?��`�=??�.ߥ�8�?�?���?�Z�Θ?�m
4��+@�T{. @�b��S@`z���@��l׬�@TF+E�E@�N�
@!4ĳ\�@#�:y�@&����f}@)�$��Z@,���B@0&WH_({@1��@3�O�t1�@5��Yf@7�2=���@9���)J�@;�=��@>i����@@%|oFٽ@AO����@B��B� �@C��o�Ԅ@E �I��@FL��_
@G����w@H���`H@J\cZ��/@K�X�,	'@M7�Bk�@@N�Z@�"=@P?��@Pێ�"��@Q���4Z@Rl�qQ�@S:�1xs}@T� ���@T�\���@U�rsq]@V�6�\�@Wq*��`@XRii�o@Y6��&��@Z;��@[zE,J�@[��M���@\�
����@]�'�Nr-@^��j�@_��Ϧ��@`a�i�A@`�Jx#@aa+ro��@a��q�Q@be�kg�(@b�;��?&@co�WrI?@c�����        ?����U��?�o��B�d?���"&]�?�D��N�3@~�c�K@Ip��v�@8�)V2@��`��J@ &�^���@#�Vj��@'_�v��@+eXN��k@/�����@2�8��3@4{�ī�;@6��O�a@9�e*�@<M���Գ@?����.@AфϚ�@B����8'@D��8`�@E����@GY�@��
@IsדRF@Jʄ�P,2@L����@Nh)�97W@P#���5�@Q�̴@R/���@S��K@T��j@U!����3@V0����@WDԐ���@X^�|�@Y|@���0@Z�ea@=�@[�p��Z@\�W���@^&����@_\�OP�@`K㬩)@`���|(@a�%&��@b2��[�@b٤�=�@c�Ιg/f@d.6�3�@d�ֽ�D}@e��T���@f=��]u�@f��b�r�@g�F�|�@h`vP��@i��G��@i׌�@z|@j�9�>� @kV�e��@l�7�&@lީ
��]@m��?=�        ?�c@��j?�::V*�Y?܎j�;�?�_#_��?�}8�̄?�����ͺ@P�1�i�@-2�ߣ@�B�� E@�ǐbg�@�EE�u?@<���=�@Ғh�]@���J�a@!Jĭ���@#_d'%�|@%����_&@'�KB%�	@*#*�\ݖ@,��n9	w@/��u"�@0�%6��@2$��|@3�l�X9�@4�x��@6V�{�@7��d��@9O�{BI@:١ؙZ�@<k�/]bk@>�}���@?�lQM�^@@�<Z���@A��F��k@Ba/��r4@CBz"��P@D'��vIH@E]�\8@E��L��@F������@G���/B�@Hח��@I� ���#@J���OQ@K�Wcc�l@L�����@M�ԫ�ĉ@N��Ӟ�x@O�Z(h�@P�t��U@Q��P�@Q��ȖU�@R(*7K��@R�!�-�7@SG���e�@Sِ����@Tm ]$:@U�𙪍@U�=��h@V0ޭj�@V�4-eo�@Wc�-g�@W��$,g�        ?���;L��?�c�!��+?�S
3\Z�?�_��P3E?�l���a@�%A{�`@��ES��@����@�3�dj@@�VlЎ@������@ �w�^F@#�}ٸ�q@&��ܱ@)�Ѹ'��@,��J�]O@0�E~H@1�mhW�@3�����@5v���_@7jgW�g>@9ou�n*�@;���mV�@=�6�Qy�@?�2��I]@A`Cd�@B@Q��[�@Cs4��]�@D���N@E�9�+1�@G8�%Q;@H��0�H@IޖM!�G@K;���@L��p��@N
.ZeO2@Oz�y��@Px�AM�@Q6��B�{@Q� 8+>�@R�+M�zh@S� ���@TL�����@UОz��@U��&p@V���3@W��N�@Xc��ߠ�@Y<lg��@Z�����@Z�Mџ@[�1ܛ-t@\�T6��o@]��E�W@^�%����@_j��=�@`*�/�Gd@`�v�6�@aR�2,8@a��>�z@b	�E�@b�큳!@b���Q�h        ?��Vm���?�F�l�?��'��\?�=s�?�=����@��U��@�@��7�@�S��7u@ɖ�lR@��@ @��N$��@ ��P@#�Ya��@&Q(k$7�@)J�a<W6@,jᐫ}@/��h'@1����@3Ud��0@5.g�{�V@7�ZS��@9��>%U@;��$�@=:��(�@?f{���@@�l����@A�m"�\@C!�#4R@DU����@E��
,�@FҋwL_@HiL��6@Ik�QA�@J�a�l�t@LDRv�@M��	(�5@N�V�q݆@P-���@P���!)�@Q��b��.@Rh	��x`@S,�E7�@S��=r@T���@U��سt@VX׈z{R@W*�H�7#@W��� g�@X��ù�>@Y��(N�@Z��ҸaL@[k�ؾHk@\L�^ɠ
@]0����%@^��P@^�+�H�@_��0��@`k�M7�@`�0-��n@a[����g@a��,"y,@bPܼ���@b����e        ?�/�M$ T?�C�`��?��PHz��?�2n�@��9��K@ 1�jLr@p{�˯Y@�}���@Ԉ�ys@"�OK8#�@&i���>�@*?h�О�@.R@��L'@1O�Kʪx@3��1 "�@5�;����@8g�Z�t�@:��3�t�@=��P޳m@@15]�� @A��k<}M@C�e�̑@D������@F"eF��@G���̺�@IY�c��0@K��N��@L��P��@Nx���@P�Ҩ��@Q���l@Q��Q1;@R��[0��@S��/g&@Tا����@UוS�#@Vڹ,�@W���Ix�@X�S�R�@Y��L�36@[�k�@\&� GD�@]A��qÝ@^`�Zn��@_�剧� @`TtK%	@`�F;���@a�=fP7@bH����@b�oa���@cNS�c��@c���ow@d�FeU?@e,L<��V@e��^2f@fs[�M�@g]�.�@g��93�@hj:2�^@i���@@i�pYlC@jo`���e@kؔ	�p        ?���ր� ?�A��.�?ޜ��+|?�
�YgT?�@���?���Գ@JI��E@W@3��@� ����@y��9c�@�>|�N@5����@�wM�O@��>�g@!�~]�@$���E�@&S�S7�@(��ݵ2�@+o�r�@-�"a�1@0�%�5:@1gm�B��@2�tZ~n@4/ip�.:@5����@7J�]�f@8���n"�@:2��P��@;�D�ζ�@=j�J��v@? �<�)@@b�=|��@A?�0Cm�@B �߱�@C���S@C�;)��4@D�@�%�@E�V�~@F�ǧ`%/@G�0�9-'@H�P{[v�@I��h��@J����Z@K��el#�@L�;�4��@M�eđ�@N���e@P �o��@P�_c	��@QY!�ع@Q��`Y��@R;K��q@R�8��a�@Sb���X�@S�ܰl�'@T��M5��@U)��(@U�q��a�@V`���"�@V�M�O[@W�f��_�@X=�"�p@X��Λ�        ?��[o��?�u�ذ4�?�_��D~?�fp.s�?�q��ɚ�@�G�rq�@���T�@�t[ŵ@�D�URz@3Ѭ鄻@�\J��@ �Q�w'@#�֢�Q�@&vb����@)v�+o�x@,��6N��@/�t;�@1���E�@3}�'G�@5\Z�,�3@7L�p_R�@9N`~�b@;a�m�@=�G~b^-@?��
Q�@@����X�@B'U�L�M@CX��x�@D�]U�@E�uC�@G�s+��@HgYB��@I�Ha\�'@KII ��@Lz���@M�# �f@OS��Y\@Pd�a��@Q"܇
@Q����d=@R����
@Sn�lt�@T8�N�YW@U<e�.H@UԒ<τ;@V���ϛ�@W{Li�@XR����@Y,q���@Z�Aó�@Z�̯��@[� (ɚ�@\���kFf@]��?�@^{,>�D@_e�*�@`)Z� T@`��b��S@a~���@a�'��Z@b�&�@b��E��@cSq��        ?��ʓ'�?�V�E�?��ߗ�?�;v�o��?�<�Ѿ��@��+�k�@��m�!�@�,�h�@�{���@ e?��@�y����@ ��hw�m@#�}�ɪ@&s��<@)x
!��@,��%�@/����<@1���N�@3���㙽@5lGb�_�@7`�}��@9g%�7��@;~�1W@=�a&|X�@?�N�7�@A2Ƽ �@BB@���@Cv�Ű/@D�jB��2@E�����@GC([��j@H�I�{�@I�/X<�@KQS��@L�`c�@N(9���@O���r�F@P���] @QN5y$�/@R�赙Y@R�>C��@S�徠�~@Tr�$�04@UC=��@Vׯ��q@V�Vw�0�@WƯ�@X�لsv@Y���>�@ZczM��8@[G���B@\.�^�m@]�;^՝@^M\�7@^��o�}D@_�[μ��@`l����@`�����i@adR ��@a��1M�@b`���}<@b��,���@cb)��b        ?�<����8?�`��ɑ�?��ڌ���?�SLW"��@Ȑ{c�@J~:�x�@�%���@N�N�@EN��u�@# ��G��@&��u4�@*�-�)�@.�-�Os%@1��h @3�,��!@6O�%�q�@8���z�@;������@>B�6OM@@�@���@B	D�ۄ@C���)�@E"TD��	@F��4g@HjX �)^@JM�I�&@K�=��;�@M����@O3c8��@P�jT/J{@Q�QvXJN@R�6�6�@S���]�@T�����=@U����u�@V��_	y@Wǈ��+�@Xݠ�	H�@Y�,�,_@[Wy�@\:b�Ϭ{@]a�,�@^��}(�>@_��Q�q@`x��#E@a���@a�,�2"@bSWx��@b���G@c��7�hh@d?���q@d�¹ǌ�@e��]��B@f=����5@f�8��t@g���x@hL�z��@h�8�rGo@i��۫@jj�Jӵ@k#�WJ@k���>�<@l��<x        ?��J�W?͏��6E�?��ÝH��?�gNceA?�����W�?���f�@�� �L�@��:�-@��
�ir@��,�g�@J4'�2v@�<�ym@�g�d4f@ \1����@"y��F�@$����f�@&�x6E@)b�����@+��0�}t@.qw�f`�@0��iML[@1����(@3T����1@4ǽ�d^@6D��9��@7��'�_@9\ZNt��@:�N��z@<���9��@>E�C�|Y@?�B��b�@@ܻ9>;@A�1O6�@B��\A@C����-z@D�3��-�@Ex�d�j@Fp�އ6(@Gms����@Hm���!@Ir:s���@JzoW:�)@K�rVҌ	@L�4y3#@M����@N��@z�@O�O���@P|��[��@Q~hF��@Q��܅
@R4/ƛ*~@R���7@Sa��D��@S�� [�\@T���r}@U1�N��@U��q�#�@Vo���@W��ƕ�@W�4O���@XWL&d.�@X��P�4@Y��^]�        ?�L�(�o?��CW[��?䲪ϯ�'?�a��?����3�@�����@	K]�@>I�
/@<��]�?@���Hi2@^'(=#H@!=	|�@#������@&�c��&@)�-S<O�@-%�PFB@0CE7]��@2�kP�@3��w"@5ǉ%~�@7�oYǋQ@9�Wua��@;���ސ�@>!�<Q�"@@2�E9�@A[��m@B�^!�@C�b:�yC@E	|��@FS� �@G�~��G@H�,�D�h@J`zks*�@K�Gt/t&@M9u�W��@N����@P�����@Pړ`��@Q���8
�@Rj�
���@S7����@Tm�3�@T���P	@U������@V����@Wj��SB@XJv��^T@Y-�ۃ�@Zc����@Z��-���@[�R�B�I@\ٸ��~@]���7@^�G6���@_�g�^@`Z2�)��@`����@aYt��M�@a�1���b@b^Rr���@b�Ӻ��@ch���j>@c��n1C�        ?���Q
�?�e(��?�r��o�%?��4�:?���/�@ɒ"���@	�9���@ h6.��@�֋��@r�Jm2@*�7E�l@!0﵃$@#��Y��@&��wBO@)�O�&@,�Aͳq(@0&���@1�\��@3�����@5�grw*@7���(@9�\�uk@;��I�:^@=�6+[@@��(�j@A7���@�@Be�<O��@C��ӗ�A@D�n<��@FA�^��@Gj֤#2>@H�����@J�C�M@K|/�@L�{E�ɰ@NU��SV@O��?�Y�@P�J�؟�@Qg��B-@R,�⬀#@R��z��$@S�����@T���VU/@Ub���k@V7���2@W�U��@W��w�@XȠ*�C@Y�n��@Z�{B�v@[s��7��@\\�AT�r@]H��`�@^7���<@_(�Z�2@`x��P�@`�� ���@alg*G�@a�R��>@b|�lef@b���@�@c��X؞@c�n��2~        ?�r��9g,?�5!Y��?�\^�?�!dO�&V@$[z5��@.�_�'@����@�����@ ���r��@$'��t��@'�biW;@,�����@0<��
x@2���*@4�נ�'c@7�do��@:-��	�)@<�4��/@?��#@Ae0�|� @B��q��@D�S�S�@F'���^^@G�6���@I����xH@KV�����@M( s1��@O�
�B@Pv@����@Qo�-r��@Rn6� �@Sr+�M��@T{[ݜ�i@U��ieJ�@V�.��ہ@W��6���@X�),<�@Y�����@[���"�@\H�䰏�@]y2ZTj!@^�[����@_�
Av�@`�t?��@a4Y�^M�@a���2%�@b}Y
G�@c%��%@c�ƭ��k@dz����@e(iN�] @e�?;��@f�ˢ�S@g=ב���@g󌠔ǣ@h�)h�D`@id��P�@j  �_��@j�-�J��@k�%e�҆@l\�b�'@m[elg@m㎬gOt        ?����2�L?�1 @n�?ޑ����?�5��![?���h?��/eNG@l��Q5�@��p��@>,�-@�(_�8t@�:���@�!69Io@l<xi�@ 7Ɗ^��@"TN|E8@$���@&ځ�P��@)B��띻@+���#@.Z,���@0� Ҽv�@1�GҦʎ@3SR����@4����n@6M<���@7ٮ�ɻ�@9p/!��~@;��u��@<��[3
N@>nP&�*@@m���@@�d���@A���H�@B˰���@C���胒@D�T���@E��M�@F����/�@G����	"@H�nP�Y@I�4����@J��D6j�@K�S�F@L�@�@M��6(�'@O05[��@P<ap�B@P���0T�@Q@�O@Q�� ���@Rl�����@S�yEg@S�4�\- @T;@T؎��R�@Uw��M��@V�t��@V��m��@W^��y�@X�	��@X��YM��@YTih�'@Y��_X        ?�fJ%�|?� �U���?���[�?��y��H?�2�d���@)��@�@	��³�J@p�(�"@{���@���.�@�����@!s�9�!@$6�JI�t@'%ʶ��`@*?0��@-����w�@0vpv<q�@2?��t�@@4��-@6,�Ԍ�@8����@: IؗY�@<Ew?=*(@>{鎯�@@a��eL�@A����@B��5���@C�8s�N@EB"�"�@F���)�@G�X���@I<1`W��@J�Y'j�H@L��:�@Mx	�kh@N�b�A�v@P6�g� �@P�&�Yc@Q�ӕܞ�@R��Jx�@SS�Y�P�@T#L�`�@T�J؁��@UʚyT��@V��/c'�@W~&\�k@X\M"I�k@Y=P�Έ�@Z!'�{Y�@[ɵ��@[�-���@\�J���@]�&�M3@^��uu� @_����@`T*���W@`��77v@aN�rY|>@a�Ӌꫀ@bN3\��A@b�ˁ�r�@cR��q��@c֗V��        ?�u��M�/?�ۑ�Ť?��$U��?�� W�*?�S���2{@E珑}�@	�韆��@�SS C@��T��@!��7�V@�����@!���_%g@$ky���@'e<�0�@*��X7?@-��*�@0�E���@2{�4��@4`�M��@6Y[���@8e15��@:��2���@<�Հ��{@>��-?�@@�`�Ll@A�}I���@C%'�m�@DY/P�|6@E�tVE��@F��X��@HV(��@I�)ʭ�F@K%߃�I�@L�h/T@N��ǘ2@O�b�Kaw@P�x�@QW	Tx�e@R"a/X�@R��U#�@S� "-�@T�mi�p@Up��G�@VL��?@W+�|�s@Xm���l@X�a�b��@Y�O���%@Z�,���@[����@\��!�2�@]��(��@^����@_�W�=@`@�h���@`����V?@a@f�}d1@a�(ʬ�@bE3����@bɆ���,@cO�3@@c�����@d^�j��        ?��tP���?��K!j��?�\�=B�?��-���@�J���@�}^7@<�$�@A8d3�@ �bb�H@$����Y@(���\3h@,�	�C-�@0��c���@3x�¯@5��-�p@82c�^�@:�v"�@=�C����@@h}_M2-@A��i�9@C�N.ζ@E6�z�J@F�VC���@H��Q׊@Jz�T� @LUE���@N;�M�d@P��C�@Q� @R�|��u@S$��[��@T4Yu��@UId))@Vc����@W�@�^@X�����@Yя'��b@[ )�"�@\3�P	�@]k�u�R@^���-��@_�B��}�@`�(l���@a=k��T
@a��a��@b��0��/@c:J��q�@c�-����@d�'҄&�@eJ1\�h�@e�C�>q;@f�Wڻ�@gle:K�@h&c.z��@h�H���@i�JI��@j_��Ű@k!�|��@k�6�H�:@l�T���@mo�M{��@n8�M�a@o��qW        ?�W�99�?�)48Q9?�x�U��?�H���J?�g��d-?�؋2��@3X1�N3@ �\&(�@M~�vD�@�߸�@����>@��J��@v�4O@*�\��@!=Ɉ	-@#a�m<�@%)Ր*ܲ@'Z�x�A@)��6֒@+�l�@.aۨ�J�@0o(�
��@1�&q9yk@3��01@4]zi�M�@5�Zx�9@7%5cl�@8�v�>J@:R�q�K@;�����@=�P�EO@>�X�)� @@^���\@@�x�"Z@A��|�@B����@C_�nH�?@D9���1@E�׋�@E�.�0_�@F�zH:"@G��B�+@H��z*��@I�ެE8�@J����@Kv0�c3�@Ljm�}@MaU�� �@NZު?@OV����@P*�Z(Q2@P�q���@Q-J�<s�@Q�]T��C@R4�Ɠ��@R��!� @S@��DU�@Sȉ%*a@TQw�sj�@Tۇ�8�@Uf��讑@U�����"@V�Yؑ�9        ?����YL�?Ӊ�[�??�v����?�|8� ��?��+���@�Fbv �@	z��@��gRo@N��R�@]]�0y@p�M>�@!,<#'�@#× 8�@&�����H@)�+���@,� ���B@0`�Z@1�ůRqP@3�7�~;@5��-'_d@7��J��@9����k@;�c.p��@=ʯx��m@@?���r@A'A�W$�@BT9F@C���8�@DŇ�T@F	�(ds$@GU*���b@H�Jԁ�@J$x�a@KcV��@L˄M+ �@N:��x�@O�d�V�@P�o�@QW�I֙@R�_�V@R䔦���@S��@��@T}��=�@UN�?���@V"�z�C?@V�[\@W��t@X��SL@Y�AJ��@Zr�][�@[W�S**@\?P�s��@])��D:%@^�F&@_9.�@_�R˩�@`vu�ì�@`����a@an�I�=@a�AȮ�@bk�KH�@b�G!�O@cm�WGJc        ?��_=�]�?�/�g�s?�B����?�]�t��?�q)�k@��ӡ�@����"x@9�a@����E�@J��G%;@��Q�(@!�j@#����_@&�>W�DB@)����h@,�|���T@0�W�@1�4�a1S@3�Aꐖp@5�� B�N@7~asx�@9���5��@;�W��@=��,@@7s��S@A)!̠%@BW�-%�@C� ���@DʯDB%�@FeU"@G\���4@H�,D�N@J��Mڍ@Ko~L�X�@L�M��}%@NJ$%0`@O���3	@P� r"��@Qb}�^p�@R(?�j��@R�:�8�Z@S�d-K@T���:@U_�z�@V4��"3�@Wqh��@W蓪��@X�#�6@Y�e��#@Z��iL@[s���6E@\]�7C�@]J�_��J@^:.��ő@_,���I@`�զ�X@`�βQ��@a
k�(�@a��$v)�@b��hy@b��Ƹ�@c��b3@c�d��=�        ?�Ng�+KW?�w�y��?���_K?�Y���GJ@� �]�C@=��Q��@��<��@���5Yl@,+<r@"�-|!w?@&f���@*5�H7��@.@�&�&�@1A�G�,�@3~����2@5�.�\�@8DfK{�@:˵��Tf@=j�@@@`'��@At}a�!�@B�ME@D]��|@E�h>�2#@Gn��o@I3[��@J���2�@LMk��D@M��D�Cr@O�K�~s@P� 8�R@Q�(�<@R�)���@Sxށ�/@Th���@U],���@VU?��Sl@WP�2:�@XP�.H@YR�_���@ZX�T��@[b�N�@\n�MD}�@]~�9陣@^���(-@_�S{�@``��w�<@`��:��@a~�Z<�l@b�w�@b�����@c6���!%@c�(��R�@dc*U��@d�c�ۊ�@e�I��@f0%ex�@f̑���;@gjW!�T@h	r^��@h����[[@iK��W�*@i�y5}�        ?�)�@1?�`+��2�?ݱ���`[?�F��ک?��9}?�̻�z��@ͣ��r@�+����@-v.J��@�^v��@:��&/;@�Q`�F@<�S�@
q'� �@!��0FD@#���~@%�@��w�@(&��@*f��&t�@,��97|�@/W�Y��`@0�_I)4�@2L��EHY@3�z�io@5ź��@6�R����@7��$p��@9��$g�J@;Ӏ���@<�Ñ�f@>B-�:@?��MH��@@��T��-@A���{�@B�`@Cg��ZS�@DNƤ�>v@E9j既�@F'�zDr7@G�Xh@H��cs�@I	e7�V�@J��:J�@KF>�$@L���k@MWA�/@N��z�D@O-L.A4&@P�'��@P�o�Qbl@Q6֘3�@Q����@RT�)j�@R��ɡn�@Sx����@T2E��@T�7bA��@U:ǊB@U����@Vnz�:C�@W
�h��~@W�1�R>@XGGL��"        ?�:�T�C?��c:f?��1��|�?�	�D�j?��$�I�j@:���l�@V��	�@=���Ȫ@suɇղ@�NS��K@0�B�
7@ �T�03�@#$ m"ʟ@%�a�1@(�Jt"��@+��:��@/�ȳ@}@18$uO�>@2�r{��@4�����@6�:� E�@8��Pe&�@:���V�@<�hK�@>�p����@@{ʚ��z@A��(���@B��R��@C�N��I�@E"�)��@F]�Ba�@G��/px�@H��Qw�i@J6�'ߧ@K� ��@L�j�@NIO8W� @O���c�@P�cus�=@QI1vM�!@R�r�2@R�p��K�@S��#g|X@TL���@U�gD�@U�8�8�v@V�`�Ȫ[@W|'��@XN�kĉ�@Y#o^�
@Y��x��@Z���%b�@[�1SMj-@\���hq>@]q+6;��@^T�ߺiW@_:�H7۞@`N{�`o@`�z�^c�@`�Ü~�@at&a��X@a�v�\}@bf.��>_        ?��w^^�i?�X��ؘ�?�gs߆�?�z_�q2�?�����\@�wxU��@	��J"@ �@2���y@n+���@&|k�+@!�޲�f@#ҙ�Fm@@&����_@)�����F@,��r�@0#��B�@1�i�� @3��m@5����s(@7�+8��G@9� ��@;�9��[D@=��h�@@6�	�@A0o5z�
@B]����m@C�g��4�@D��Vi�@F�$~�g@G]܂Ck@H�)��7&@J	x���@Ki�&h�l@LГ4*@N>�%�R@O�&����@P�JB���@QV�6A�@R�[d�@R�����0@S�h03�@Tv�����@UE�lٵK@V-k|@V�=��5M@W��:3�@X���n)@Y|�_�?@Z\ԍх�@[?SlcQ@\$`� ��@]�D��@]��jDC@^���TZ@_у,��@`ap?�I�@`�O_��@aV\=�z@aғԖ
~@bO�ੳC@b�u�g��@cN�2�l        ?�";�Y�$?�$�鉎�?﨔{�Uy?�=�%�@�n��O@�a��6@U���@�l�U�q@�T�d��@"��'�':@&Iea.F@*�N�@.(r���@19���@3zdB�k3@5�9R��:@8N��K�@:��N	L;@=�8�	g1@@&q�Ũ�@A����@Ca{�:q@D�e���z@Fn�Y�@G�Aܪ=>@I]���n@Ky�@L�~�ӷ�@N��38X�@P*�gGE�@Q&8��@RO���@R�0�@��@S����k@T���~ܭ@U�q�8@V���F<@X��>P@YƦ|x�@Z+Ր��@[D��65@\`����	@]�df0�@^��<I@_�2i'�@`}_�Q�/@a�Dϒ]@a���Α�@bK�\"~@b���Rn@c����@d+�D���@d�N�.[�@et�[i�#@f
`�x�@f���@go�d���@hy̋J@h��]G�#@iz�d�&�@j,t�n3�@j�ќ��@k��$�uy        ?���?[�2?�G[�xD?�Z�DԜS?��Z` #�?�^�$�,?�d��M4�@~ZTK�i@������@�o�*-@��؊ �@����@��;Ab�@�����@ ڷ���@#n���e@%C?�N�@'�V�(_�@*�8���@,������@/2U�@0��s���@2W^���@3�6�#��@5?H�o��@6�b�#�D@8OS��_�@9��TF��@;���ϱy@=/V���@>�׉�@@N���2�@A0�T'�0@B]B�Q@C-�X�w@C�6���@D�f( �@E۪�P�C@F��3�P�@G�+�7@H�G'8�@I�5�@@J���@K�OK�@M`���@N!���@O:]�f*D@P+�]�o@P���%p�@QM����@Q�,��/@Rvd��<@S@l$��@S��W}�@T?�JNӦ@T�n�1��@Ux����@VWdu��@V��D�@WYF�	��@W�p�xS@X�	A���@YG	.p��@Y�i)��        ?�Mm3{�?����i'�?��ʩ�կ?��-�4�?�)�Gv�y@"AQ�l�@	���:��@h��P@p���&@�K,��U@�k��7�@!g���?h@$(Ks���@'��=O�@*+y��!�@-k��,S@0j$ӽ+@22-C��@4��:@5����@7��(k��@:s�cCo@<4D� �'@>j�?���@@Y$xA@A�t�
|�@B�"ĔA�@C�mm�x@E<�U��@F��-3�@G���b�@I:�*�X@J��=��@L
ΊnR3@M~e��<@N�����F@P=O*y�^@Q�Bl�@Q��L�@R�J�0| @Sd,եG�@T6n8�Tt@U���W@U��d:!{@V�\"0z@W�Y����@X��a[�J@Yhwo��	@ZQ-˦�@[<��c�6@\+��	@]x�
�@^/�T��@_	ԘW0]@`0{+��@`��_)_@a���@a��X��E@b�4?|@b��*V�@c��Gf�@c���U��@d5�ϱ�        ?�|�	\P?��:�`�?��Ъ9��?���p'53?�X��@F	t��%@	��F�"�@��ν�U@�َZ �@�[��B@���� �@!�nN��^@$Qx�z�@'C3?��@*_j�c7@-���r-@0���s�@2T^�֚�@42�����@6#�P3��@8')���@:<�4�@<d{jL!
@>��?��@@s�4*!�@A�V��@B���c�@D�P��@EZӫ>æ@F��D���@G��@H��@IZ��'�@J�o&G@L+H��`@M�a�OA�@O�p��b@PL�;�,h@Q�4X@Qؑ�� u@R�o#M�@Sq���x@TC�i"@U�<�8X@U�q����@V�XR���@W�O�"�7@X�M=4@YmDVŢ�@ZT)���@[=�$���@\*��k@]����@^a+1��@_l��@_�2b�@`y�r^� @`�gҒ0�@axK�.��@a�|�1��@b{�e��}@b�����J@c��ʏsM@d
�� ��        ?�bh�o6�?�%��H�?���Ie4K?��đ�b@��) �@؟H��@�8���@�T��vL@ �T-;S�@$)U;@'�*W��t@+�?IT�U@0*$�"˲@2vLYj�@4���i>@7h�݀/�@:;
Do�@<�4m�:[@?� ,&+�@ANu��3�@Bթؖ�C@DiO_)7b@F	���@G��\���@Il:���@K/	w���@L��>�\@N��t�o@P\֠f�@QS����@RPE�K5D@SQ��@Z�@TX$s@UcA��@VsMo�g@W�E�3�@X�u~̇]@Y�g<L��@Z�О%�,@\�R�B�@]3�a��`@^c$M��@_��&�'l@`gA�:�@a1BQ@a�&�܎�@bGvZl@b���$�@c��1&�v@d8���*�@d�8184@e���Nm(@f:��	�@f�����@g���o�@hM<6<u @ip�r�@i�Nꉬ�@jn�o&Ϻ@k'����@k��Df@l����@m\�\v1�        ?�����\?�N�^(E�?ݥ9�m��?�@��g�*?�1P��?����m�@���v��@����o@'2 _��@��Ņt@0���N8@���S9�@&K��Y<@�^61@!q�j��@#�����&@%�vt1�`@'��!a �@*>{�<U@,���A��@/#A��.`@0��x(�*@2+���@3�#ɮ�@4��Y���@6Z�1ڗ@7�7ڊ~�@9QJZ^F�@:�&M��@<k�����@>�F���@?�@A}@@���23�@A��F8�@B`�
��o@CBR'���@D'����@E[:̓�@E�����@F����@G�Ά<@H݅:fAK@I��P�
@J�>��F@K��6^�$@L�2�5��@M�(L��@N������@P[��Ƨ@P���q`@Q����@Q���]��@R=��~@R�*���@SbY*`0@S�-���M@T����Џ@U%�.Y��@U�����k@VZ����$@V������@W���t,�@X6�;�w>        ?��#�ֳ?���U�R?�tK�K�?���A_�A?��� �7�@_PQ]m@�1�?R@��ѷ�|@I�D��m@y6%+"'@"pv4i@ s�m��h@#�����@%��C�?�@(��IĴ@+�5D��X@/�ʹK�@1=��d1@3$l��@4֒�_�g@6�����@8����7@:�ݠ�Hj@<�v��%�@??�ٙ@@���#@A��@B��N@D"�NաL@E]��D�T@F���:Y@G�/�<@I:�eT�@J�qV��@Kאּ��T@MT��v�.@N�8hP@P/X{+�@P�c,B@Q� צD@RW�A�O@Sj��9�@S�>��@T�}@U���;G@VRÉ��k@W'��ƫ@W�$����@X٤n���@Y���hC�@Z����|@[zT�zp@\_��O�n@]H(k]��@^3H��l@_!q[3@`�Oj�C@`�L��p@`�#}I��@ayE9�6�@a��~@a�@bu[�7zX@b�H����        ?�@��	?ӕJ��4�?�mg�?�M���?��@��@��>�z@	W��=��@G����9@Ky���@�`C@w��Hm�@!M&헭	@$1J�X@&�m�
�@*�Z���@-D�c��@0S��I�@2����@3�
�ty�@5�9_�Q@7�6L�m�@9�]��@<�C�6@>1�J��;@@8l�}8�@A_���wq@B��,k@C���Z�@E-Dr�@FI�񈠅@G�ir�F@H�͒R�@JD�D�'�@K���>t@M���@N|�簇�@O�o'��@P�K���@Qv��KS�@R:��C�@SZ;(J�@S��1�C@T��q��a@Uf�K-<@V9	��<�@W�"��;@W�-<��@X����1 @Y���,9�@Z|��c@[^�HLS@\C�&�4 @]+I��,@^���|@_P�)h@_��y�x@`p�8yG@`�w���9@aet�I�#@a�f㒈@b^����@b�oT��)@c]|��        ?�GB��?���6�?��
��?�Pg({@���
�@�8I�%@@V�*��@����0@�(67��@"�%�<�@&Y�e�@*2֨M��@.KI+�v�@1Pi�Uf�@3��6�c@5�o\9V@8}�K_��@;/�;�@=ν�0�e@@N��eg2@A��ϛ@CC�}���@D�!��@Fh�#K�@H�bI@I����
@KvϧB�@M<����@O8��@Pt'�@a[@QgA4a�@R_�8m�@S\=�+�p@T^sS��w@Ue�� �@Vq�1�45@W��뻅�@X�X���e@Y������@Z�܌l�@[��d�@]���}@^J����W@_| �{�@`X��@�@`����_�@a�<[�hM@b6�,�@b�=B3K@c�Ȯ��@d'��c��@dѦG�~@e}��y��@f+��&@O@fۼ6�V�@g���U;�@hB�IՉ@h�-����@i�ZX��@jj� �w�@k&�r�E�@k�����@l��B~I        ?���ؗ�?�;�Q�?ޙ�3�Ej?�iEc>?�c��U?��?'�ܓ@Z����{@rAҷD�@K�@�zpl(�@ߊ1��@c�jG;@�8,-@ �$W��@"��a��@$A��Ήh@&�M3a@(�=0+n@+K����@-�7v��w@06��|@1��7Q}�@2��7A��@4[�.wm�@5ѼzE3A@7P�[�Xx@8ٔƈ��@:kNi���@<�#E�@=�d��@?U^;)\;@@��$3s@Ac�;��@BEd�i�b@C+�!2>D@D�'>^#@E��B*�@E�'�G@F�Rņcz@G���Z�@H�b���@I���H@J�<0��@K�S�s�@L��|b�L@M�L��4�@O��;w@PK�2��@P� �PN�@Q'q7��@Q�89���@RDp=��n@R�w6�L@Sgҝ@S���m�@T�H���@U%a��@U����5�@VUr���/@V�]��a�@W��2Qw�@X&���@X�`�%�x        ?�k8�io�?���S�}?��ݔ(�G?�ӛI���?�����@<���@	���:2T@e�$�h@pu'�Tc@�'R��@�
����@!p�77@$5E�}�3@'&Ň@�@*C]�\@-��E�h�@0|�"$�[@2H�X@�@4'�?@6-Ut�&@8 ��͙@:6?��@<_!�p_y@>�bgG�@@rQ�t9�@A�H
k��@B�il��@D�.�,�@EZ��-M,@F�>��Ǹ@G����wQ@IZ,#�Y@J���@L)6~��@M�W�7��@Oe8 \@PJ"�K`:@Qo�@��@Q��s�S@R��>�@Sj����@T;8���@U�ؘ�@U�����@V�I�;u�@W��8?O@Xy��ۿ�@Y[�C�i�@Z@�2�@[(��U�0@\B��w@] >wt6@]�!��!�@^�[l�G@_��C��@`g���A�@`���w�@acynlk�@a�2hN)@bd-�H� @b�i��}@ci�_$<1@c��w�	        ?�YY>6�h?��K4��?����/�?��G�|�?��nC���@&�iz!@C�ǟ�_@.dߓ@oa�w�,@���ہ@:s��N@ �w�EW@#4�q�@@%����@(���>{�@,.��O@/Q2r.E�@1\i�O�@3"��Mߛ@4��TH��@6�U�\�5@8�ז�B@:�p��t@=v���@?2T���u@@��[{�@A�f�(��@C	i/�u(@D=ӒY�@Ey���D@F�HS�@@H��[�@IV��U�"@J��aц@L�8Ӧ�@Mp	�J��@Nڣ�w��@P%��M��@P�'}�LS@Q�� �)0@R`���ɒ@S%P䪏@S��*�@T�����@U�Vx�@VQt�dE@W#.�g��@W�x_e�@X�EM��@Y���m�@Z�>�#*l@[aY���9@\A�'��@]$����@^	�oё7@^���l)@_ڢކ(}@`c3�w�}@`�*�(/"@aR1��N(@a�DHK��@bE^��0@b�}ĵR�        ?�p�ʫ��?ޯ/��?�*��B?��E��J@�ܚV�.@�t��@��/��@TR
s_@���G9�@#(��%{@&��J2O�@*�e/~|�@.��ٝ�f@1���g��@4M�	#@6t�t�g�@9�����@;��1�8�@>l1��m@@��-�@BL\��@C��ٟ�y@E7�:��@F��%��@H}��)�@J1�#��Y@K�p&;�@M��o�S@O�M����@P�c�R�@Q�*DLB@R�n�в�@S��c@v�@T�8�-�(@U�h폳@V�-D�o@W��|l�@X�%H&��@Y��t@[��`+@\%l�L�@]H�^�œ@^p$��N@_��G�@`d�)�m�@`�鏣�,@a��Ta��@b5p�@=�@b��j�Dl@cs�ԲB@d��=c@d���W;_@e]�f�0�@f�n��@f���R�@gVT�'C@h��p�@h�&�K@"@i\>2�;�@j�Ӭ�t@j��b'pL@kn�x�2@l"���1I        ?���=2[?�DǪ���?ݢ%z�Y?�E�䋤�?�(bڈH?���`S�{@�o#�%@��bٴ�@w˓��@@ǦA>O@�Rm��S@���#D@��r 2�@��Z88�@!��F�H@#����ߌ@&8�[��@(�+=Y�@*�X�ؾx@-p����@0�t��@1S�;���@2�a��#@4N�,-(@5�v���L@6��S��@8~��At@:a��|M@;��DF�@=5��ͧ@>��jxi@@AE��@A�%��2@A��n�P@Bط��88@C�h)�
}@D��+v�@E����[.@F�,IS&�@Gt F	�@Hj��J
@IdHݒ�@Jae�ְm@Ka�Qz�@Lez���@MlW�Xt@Nv\Nt\@O�}%�{�@PI؆��k@P�vl4Є@Q^����@Q�'�5{j@Ry1�N��@S�4j�G@S��Wo��@T+�e/��@T���5W�@UT��8u@U�B�y@V��S�iC@W��`xW@W��_/@XQ�7z        ?�ķM�6?�t� x	?�\�K�A�?�d���֥?�o�!���@��w�@���B�j@�b�j�@��Y�P'@3���@�ڔ���@ ����@#�	*O�@&s��
�o@)s���U@,��I{@/�}��%@1��|/�A@3y���W@5W�k̓�@7G\��@9G��}�@;YR�2O@={���@?��.3@@�6K���@B����@CO�""��@D�j"px@Ež׮[@G���I�@HX;ao�@I��f=t@K�AQ!@Lf��_�@M�>��%f@O;�V*d0@PW���E�@Q�!{#@Q��Q20R@R���1��@S]���/@T&.�[K]@T��.�@U��~0J�@V��[o�@Wdt&x�@X:9��Y@Y��`8@Y���*�@Z��S�t�@[��#{@\�uL��.@]sa8��[@^Z��Ѥ�@_D<���*@`CT�{@`�&�kt�@a_�q��@a���#�i@a�2�ۄn@bv����@b�v�&��        ?���K��?�^"�Sh�?�k�Nd�?�}r_Y��?�����I@�\[r��@	6���@��o�@��z3@s�lq�k@-��@! ǈ�N@#�0���;@&�rm�@)�\O�@,���@0(��[g@1��9z�u@3���8x@5�8����@7��U��D@9�0x�#@;��3|�@=���"[�@@� T@�@A=����@Bm(	 ��@C�<�S��@D��-�@F)sUeHA@Gw?�� @H�J�@J(m���@K�����@L�\���N@Ne���>@O���U@P�-(���@Qo4!1@R3�%=��@R�� 9�@S��sr�@T�����@UeXX�@V8۸kP:@W$��)@W�%���N@X��*i�@Y�'&�U@Z�S>_�@[f��)�^@\L}WAK@]4�aHf@^���@_�7m3@_����!@`w9Q<@`�JE��@alxDG�@a�Žo @bfLL:@b䃛��#@cc��W�        ?�k4ٯe&?ޤ��?�U�NP?����~R�@��Ұ�@�����@���X��@D�g�K:@p�>� @#���@&�cԨ�@*��แM@.�՟�Y�@1�/�jh8@3��|���@6B���>m@8�>�Я@;^�=�H@>؁�*�@@nCY�)�@A�v�~@C[7%p9@D��^���@Fs5w��@H�^�x@I��59�@Kd(��Oj@MW���L@N��Yl@PU�
��@Q@[(�>T@R/Am5�>@S"��Ѡj@T�z�@U��c�`@V�`�-�@W�$
�@X!m���_@Y-:��@Z<�NK�@[PW���@\g��V�@]�k�^��@^���jW@_�	Uk@`tU
�b�@a�<��@a�*�(a�@b7���1@bлQw�@ck�LԨ,@dɈ���@d�.�I��@eG����@e��b�@f��Qx��@g/�А@�@g��(>�n@h}<I1~@i%��Uε@i�&
��@j{�DN�y@k(�M��        ?�Ux�S�
?�����&�?�3���?鿝%��?��[�?�eZY�@;�i}e@S}��@�Si�@����@�b/3�@f]׮��@*Z���@ �EQ?�@"*}�M �@$[���Z@&�B�7@)��X[@+�\�y*@.��c�@0\ׄ 0@1�g�pU@3#��:�@4�!���@6|.&v�@7���	{@9,Ь�h@:�q.4��@<k��@>�@�@?�N+x��@@�aͰ�[@A���'�@B�UO�@C����m,@Dq�_�R@Ef��\�@F`7����@G]�4T�@H^��@Id���@Jm<�wxt@Kz8�bO@L��=���@M�|N5��@N����9@O�w?n�6@Pym�k�@Q
���g@Q�_���@R3� =*@Rɸw	_�@Sb�,t�@S����B@T���
��@U5��@U���˚@Vt�[���@W��Pv/@W��ǖs�@X_��O�P@Y����/@Y�!��V�        ?�
�Q#p�?Ӷ�,�t*?�b�1
�?�B���?���al�k@������@	<�BJ�|@4ڵ �|@1l&t�@�7�7_@M��F�@!3O� �-@#��k� @&ϤْD@)���� @-�lV��@08-͍ @1�.��|@3��\w�@5�9�d�@7�m����@9�>�y+�@;�S�y@>S�pz�@@ v���n@AGe�;��@BvMS��@C���s6@D�\oj5@F12�":@G~a�$v}@H�Ǡh^�@J.CU�r�@K��N&�v@L��~�q�@Nj �:��@O�_���@P��  "Z@Qp�É�;@R5�
��k@R��?�`i@S�0��l@T�����@Uh֒�2�@V=$� v@W`�"�@W�|��,@X�nAmMA@Y�(A�'@Z��i�d�@[r�=��@\Z��Q��@]D���3@^1��o�@_!e
�J@`	��Va!@`���0@`�.���@a{�a�|@a�[����@bx$��C{@b�	m�k@cy�;z�        ?�f
�b?�|���?�-W�F�?�.�Pt�?�ǐW���@�n��@	<U����@5���J@4+]�xI@���&z6@T����@!8@�?�9@#��bh@&�:��@)���%@-�d�@0?�Z�@2#�]n�@3�m�$�@5�H�,/@7�CJl�i@9Ɩ�	�@;��+~+�@>�:>�@@&*�c�M@ALe�"��@BzDʜ�@C��9�r�@D�'����@F/�x�@@Gzkʊ@H�ɤ���@J#�v��@K�E�ap@L�yZ�@NR*v2�M@O�QJޛ8@P�8�-E�@Q[���6@Rqȡ�@R�F�-�@S�@	A�H@Tq�7U��@U>e@�@V|�%�@V�6R�Š@W���\f@X�ik#$@Yc�m��U@Z?���|@[#1?D�@[���`\�@\�7 z��@]�׹H�@^��Џ~)@_�(,7�/@`Ce�t�@`�ح�G�@a3jk�$@a��@$@b'�2�w@b��ݴx@c �Vz�        ?��6�p�h?�b!E�?�|S,�rw?�2�G��O@p����@4�P^"@*�vު@��ɐ@ �@ l@#���i΁@'N4�$pE@+P�v��@/������@2�#d�@4l5ɕ�@6��E)9@9��?1�+@<9����l@?
4+�IG@@��;mL�@B|�@�S @Dx*��z@E�U��L	@GMB1;6@H�{�	#@J�@�'��@L�+��u8@NZ�6��@PH@��@Q͍�� @R
xl��@S	/sn��@T��uQG@Uj�6��@V"���5�@W4Ԛ�#�@XK����@Yf����@Z��.�^@[���x��@\Ә�.~�@^ ��i��@_1�����@`3�0w[]@`�y��@aoO��w@b'��H~@b��&SU,@cW�,�fl@c���@d�"��g@eQ�����@e�
�
�m@f�EJ�@g\Q��k�@h+c�E�@h��[�I�@iw/6�p@j.NҭQ�@j�&�#��@k��H���@l]���e9@m����        ?��7iO��?�� e?�q����?���� ?�.�u?����}�@��4�@�<���Q@#S#�ۘ@
�՗N@=�&��@��4Ռ?@NC_��@&��/��@!���;��@#�T�w�Y@%���܈q@(;��LV@*� ��W�@-�t�1�@/��w787@1(���v@2�*��y@3��g�6@5_��)c*@6�8��Ͳ@8`���@9�^�@;��*���@=)�r��@>�Ev��@@C���H�@A"B{:��@B۞x��@B봎n�%@CֻA���@D��Ж}�@E���@F�Ep��@G�b@���@H�\}���@I�%���@J���*�_@K��q'�@L��呬�@M�I�,�@N�UU{�[@Psn�@P�z�36�@Q#;J���@Q���D��@RGһ��r@RܟU���@SsJk�	@T#B�6J@T��ix�@U@�\�@U��ږO|@V{Ct�v@W,/�@W��;�M�@X_�y-��@Y�Vn�:        ?��G�BD�?Ҹ�1�?�H��?��u����?�z��T+�@�xB�@���ow@ϻL��@2]�`OK@ZC��'�@� ��cW@ Zg@���@"����@%���z�o@(�����@+��:3^�@.�pR�
�@1TF_q�@2�,��(�@4�TԠ\Y@6eKCp�@8n�4}+�@:n�1�@<~P�x �@>�[}U'@@e�%��q@A�IqP�	@B�2��@C��K.y�@E
��0�@FE|[%yH@G��!�em@H�ТSg@J8���@Kq��Fl�@L��z�T@N.�#�@O�!���@P� ��Z@Q:Ǆ�@Q��k,P@R���u�@Sw�p�N@@T<O<�N@U����@U̓vE�@V��r�@Wi/�I�@X:�3�4@Y���@Y��VU"@Z������@[��f�@\x���@]YZ�m"@^;����P@_!�@`7��a@`y��k,@`�C�}@af'�Np@a�[^ŖG@bW��&!        ?��>�T�?�F<�IG?�f	n��?�W��N?��uR�<@�F�BN-@
b}]T��@��D�h�@,znX@ʘ	u��@�1�
�B@"�s�a�@%�]W�@(�n��/@+[�⡽E@.��	d[@15Q '��@3X>�@53vX�@7#cv[�@9G?���@;oz�H@=˚ĺ�@@�CGy@AOL�@B�iS&ҥ@C��ȹ�@E4�RF�@F��ޖ�@G�vS�w>@IlA�y�=@J���7o�@Lh�IU�@M���}%@@O�Tq�@P�̠�@Qb��`@R8�V�@S��>QN@S�5C�@Tҍv?^Y@U�fǥ3@V���Ԝ@W���̊[@X�b�7@Yv�J�r@Zn�88��@[kb��F@\k||��@]o-C��@^vk9��t@_�-���@`G����2@`ЍLx/@a[-�E'@a�Qfh\v@bu4a���@c��n2.@c��3��m@d(� �@d�F�*N@eR�G�,�@e�|�缢        ?�ovM��?޹hC��5?�'t9 ��?����[��@
Z.(T@��?Z�@���w��@v�ؠ�@�!�2*@#I�b=)�@&���\�}@*��Vx�@/:�[�@1�$^KrT@4<L)�/@6��Npm�@9T�(�x@<e4�[1@>��D�@@�wU�9�@BlGI��@C�%mm~H@E��w"O@GG����@H�^ϋ��@J�ԺzG�@L�1�@Nl�9��@P)���@Q"Z{)q�@R ���q@S$J!��@T-S �D0@U;���T�@VO%���@Wg��Sj@X�u��`@Y����@Zϛ��@[��[8@],��s��@^b�9�@_�锶�@`m��D�@au�	P�@a�CK,a�@bY:��M�@cU�q�a@c������@dW��Q=@eMY�l@e��k�̋@fiFO4@g�UU&@g�D����@h���@iG|�9@jSu��R@j�y0X��@k�|- ��@lCV��q�@m���,@m�v;">        ?�G����?̧�U;E?�+��-m?����(E?�d���p?�:��~@�;�@-�L9�@��~ʖ9@lZ� `@�A^�(Y@6gv�@�dY�&G@��O�/@"��;��@$,�Eݶ@&o�x\@(ʂ-P��@+<O���@-ęêN@01pO�!"@1�W�l0�@2��r=��@4^�:��3@5נuQ�@7Z�X%5'@8�j-���@:}ܐ��C@<�5�z@=� ��g@?y��d��@@��5~k�@A}
_}ޑ@Bc�2�}@CO"2@D>�	���@E2`��V�@F*r�]��@G&�� ��@H'��c�@I+s��w�@J3�"�@K@+���0@LP[��~@Md[���@N|	]�@O���.v�@P[b�q�?@P��~�l�@Q��@�@R��x9@R����՛@SD%��@S�RgKh"@Tz0&PS@U�z9ۻ@U���M@VW���@V�@�ǳ�@W�W:l/@XDL�#"@X�DE���@Y�}-�        ?�����?��S?�bO,�?�~B���?�aTw2�q@Lv�8@	�\zk�p@���?�@�2��@";��N�@�2���B@!�sb�@$i5�Z�@'a���uF@*�1�|N@-�Y���@0��~n�@2t�Ib9@4X�)@6N����@8W��]��@:s���A@<���3��@>�%b�#^@@�(�@A���@CX���@DDڏr�@E�b�e��@F�ʏ�.�@H8��@I��+��@K˾cV�@LqF��<@M��6�L]@Oe��1q{@Pu/�;�@Q:���b@R��@RЋ�!� @S�B�b�@Ts.�j�L@UIDr��V@V"w�p/�@V��]���@W���e@X�X�B�@Y��;:�@Z��t
�@[x�&ƞ @\fμP�@]W���d@^K �Fhc@_Aw����@`Hv)m�@`�3~��T@az5@@a���^�@b��U)@b�Q]6�@c$�7dTU@c��;^��@d1��΂        ?��8�\�?�yl�(?䈧!��?���?��Z{pa�@���}q@	:r��w�@4��w��@2v��@�{\z�@Q@41@!5�8+@#�+��@&Ӄ��z$@)ᑰY��@-3~1>@0;.п�7@1��_p�]@3��2�?�@5�dS�E�@7�v�]�@9�Z-��@;��ŀ��@>	���J�@@#�W���@AK?T�K�@Bz��iO�@C��Nf�1@D���r�@F7��"x@G���9Yc@H�`�Z@J8d�<S@K���y�R@M��n
@Nx	��@O�1F���@P�j9���@Qy��d�U@R?�D�@SH���@S�i�jZ@T��1��(@UtV��-�@VH��;@W 	<wZ@W�/�£>@X��N�@Y�u���$@Z��`��O@[}J�m�@\d��k�@]Na���@^:��^Or@_)p����@`O��?@`�Ĥ];@a��@a~(�*l@a�i��p�@by΄�=�@b�Sݝ��@cy��y&�        ?�VҝcL?�$z��M?�ؔ��,�?���(�w@��J@�: �@����@m��wP@ q��C��@#���g%@'ʛ����@+�WS�D@0xZ-�@2ja��j@4�;Ȥ@7_�4P�F@:����@<Ɇ
���@?��K��@APY�z�@B��g8��@Dp(��,@F��(
�@G�����@I}+�}@KD̯��@M��@N��P=@Pn��}�@Qh�"8%@Rh[)�%+@Sm/�z�-@TwH'@U��;q��@V����*5@W�zU���@X��o��M@Y�g�!��@[�����@\K����@]}�g���@^�ᘦ�@_�-�NkS@`�`�Uw�@a9bԐ�|@aݔ �v�@b����4@c,a����@c��*�JE@d���Ƞ@@e24t�i�@e��w�@f����@gJ0lZ͆@h ��zW@h�L���@is��^w@j0	�8	)@j�7�0i�@k�=���@lp�⿱@m3�/)�@m�/�}��        ?��\g���?ʃ:��{�?��HD��9?�3���4?��o��m?�D�r8k4@ �/��d�@�����@
�����@3��CM@BUe�@��)9�@���Q%M@����.^@ ��#TP�@"³2}W@$�\��/ @'	,w{��@)K}Z�%@+���Ђ@.L���1@0Cߞ	��@1�O�SB�@2����@45{T��@5���@7T��@8tw4�@9����:@;q�]��Z@<��~�Ӱ@>�9%��@@�e��@@�M��.@A�����r@B���!@Cm_(<�@DLfD�@E.P_��@F��@*�@F���2�v@G��e�@H�o[�y@I��R�l�@J�xH��x@K�2y�C@L��RR��@M��?�@N�s�H��@O���1؝@P_�?ɧ@P������@Qkbu1�@Q��s��t@R{�N���@S(۞�@S��M,@T�؅G�@T�B��/@U<�z��@U��lF@V`?.!N@V��=�Ɩ        ?��l��?�c��č?�[f'��?�A��W�v?���xPq�@�m�@
1��j�^@�~���@ <��;@�Z��@�l�j�6@!�%���@$����@'�����@+�Y�K�@.po�
�p@0��6n�%@2�<n���@4���R�@6͎\��@8䖀�r�@;�o%�@=Ke᥄@?�n���@@��jR@B7 O|@Cx���@D�n���1@FF#���@Gq\ rKH@Hԑ5�G�@J?Ǻ�tW@K��n�0@M-��P�.@N�b4lG@PJ-?�@P�#�;�@Q��#Z@R����@SV�ڔ�@T.
�j@U�w^�N@U�7�@�@V��I�@W����@X����@Y���gkM@Zq�3��<@[d+��@\Y蠮O*@]R�@]%�@^OZ�ȩ@_Nh]̡@`(s�6C~@`�C}�[�@a/��@a�����@b<��xu@b����0@cPS���@c�>]��@di���r�@d�v)W
~        ?����
?Ҡ_����?���,?�ҌQ��d?��X#{�c@��D�@(2K��@���Sq@Y�[a@�z���@!��1�@ Ҟ���@#Oe^�@%�S��@(�p&T��@+�2w���@/ ���q@1?�$Ώ@3 �.��}@4Ӑ5WX@6��L	W@8�.:3��@:�d%��@<�_���Q@>��ȗȩ@@��M��@A�'�R��@B��>9�@D��4��@E9,7^�@Fuj�B@G�,���F@IMR�4l@JP��6;�@K��~�@Md��a~@Nb�e+�@O�R[]|@P��}L��@QS�2#��@RDE�@R�nN��@S�(�Ȁ�@TQe3db@U\��'@U�+�? �@V��+Dи@WvW�L�@XET���_@Y�c c@Y����4@Z�N�5��@[���447@\pL>4F�@]K�}|�@^)%�}D�@_j�N?+@_野v��@`f8��WQ@`؎�aNc@aK�0��@a��KK�L@b4����        ?���.q�?�п=f�?�U�3p��?��;c�Q�@bD�a{C@��@��@,V�%e�@��m��@�U�O"'@"�\/�D@&#���@)�H��9@-�he��@1�~%�@3^_�c0�@5�;KG�@8,N��x@:�� ]@=_�q�<r@@����@Ayup��9@B�\�ц@DpP֓@E���/;@G�q�g��@I3-�q��@J�T���@L��3ُk@NQ}�Q��@P�h�n�@P����@Q��B��@RԴtM�@S��Y��$@Tń��B�@U�Y���*@V�]&H�@W�|�P�@X٨<��O@Y���|@Z����(@\Ü$�[@]-qnkct@^K֛��@_m���@`I��^�@`�`���i@at����@b�2�d�@b���v�@cB�^� @c�2�3*�@d}��*�@ed�D��@e�n�:j@fdv���@g	US>}+@g�*��}�@hX�~�>�@i����@i��}f�@j[�L�@k	��B        ?�{�{���?���*��?�yW�N�R?��ډ���?���@"?���C���@gy���@����?<@4��:��@�� _�_@����Y@��|�H�@P�J8�6@ $)C ,@"9/`��@$f�YH]@&�Yp��"@)�+YN�@+xkOBɷ@-�U���P@0M�-϶�@1�ƿ�@@3]�@K@4r評��@5��yv2@7fCh"@8����.@:~.���@<y�!��@=�w͙3-@?d6�J @@�{r�E8@Ai!�F@BJ�+c@C0w���@DS�i�@E�gLa@E��l�~@F�"�6p@G�
��u�@H�C04!@I��\dZI@J���5�@K�]�Pv@L�lRHB�@N�F��@Ow�-@P8n��@P�����Q@Q2��8�,@Q�US��@RS�{��D@R�n���j@Sz�x��@T��<��@T���Y�@U@����@U�K݃=�@Vw��M@WNIWM�@W���
�@XR�`-e�@X�^A�"E        ?��#p�^�?�#���H?�����e?���?��?�jK�q�Y@QZ���~@	ϲ�'H�@��&ua�@�	�Su�@!~���@�Țg�@!�|1��@$b�>�	@'X���0�@*y �@��@-Þ�]@0�ۅ��@2i*t�X@4J]��$�@6>�I�9@8E�;��=@:_�F	�@<�ej"��@>�Tt�sg@@��ؗ�@A�YX�A0@B�Aw�@D2W8�f�@Ezx)�[N@Fʀ��l�@H"M�Ğ2@I�����7@J�$�@LW	�Z�@M̨�lh@OIs��p�@Pf��Z�@Q,�	�@Q���1�N@R�?_��@S���?�E@Tc����@U:8\Z�@V�Hr��@V��ӿ$@WЗ�&�@X��}��0@Y�m��:@Z�^��j�@[o�-
�@\_"7��@]Qw h�@^F�eV$�@_>�R��|@`��V$�@`��4���@a6�-f@a������@b �g��U@b��2@��@c*����@c�kŐ��@d9��e��        ?�sMOU�?��܍[w?���X:?�-TC6��?�"�jqJ�@j��x�@��x��@�g��h�@���O��@�v{�%�@���1H@ �EUWf@#Z;� ��@&$��̂?@)T6s��@,0����@/nV,��@1h�#��@3+���"@5 Y���@6��?���@8�F�O>@:��c5>�@<�p���@?���J�@@�����@A��]UHk@B���w!�@D'�\}M�@E_��?�@F����@G�i�>�@I1O��S @J�w��q@K�8
_p@M=���L@N�pH@PN�W;@P�/O���@Q}3衋�@R<�@R���f@S�r�6��@T��ߙmU@USͩ喁@V ��Y\M@V�ٌ
Z�@W��U�@X�Ff�Pr@YmLҥ@ZF���߇@["�+�6�@\C���@\����@]�`�M�@^������@_��?H=@`>���@`���S�@a,EV�C@a��x�@bp?��"@b�-u\�#        ?�N�j���?���U&r?��1��?��c�
�@�̋�@��A�q@���a{@fP"�l	@ h�X�<@#�A_��@'�=}@+���)1@0�Ox#@2E���)R@4������@7#ӭ};f@9�Y���@<o;��@?;�	Π�@Ae{}ү@B� ܌�@DQ����@E��R]@GO�ek>S@H��ba�@J�+���@Ls�~�@N>X/{�@P	����@P���%E�@Q���C�@R煈���@S寠<��@T�$-S�@U��T�[[@V��)���@XoZ��e@Y!PDipn@Z:�f� �@[XT��@\y��Ȧ@]��,W��@^�E�d6@_�B�U@`�CBv")@a0aa`m�@a�u���@blw�	E@cc���S@c�1p��@dTعٯ�@d�St甹@e�����@fM����0@f�w��Մ@g�Xwl�@hVC٢�8@i7��%P@i��
q@jn!��C@k$� �M@kۓϻ�@l������        ?���>��?��d��Y�?�Y[v�?��/Q(#?��Tp�J�?���	,�@��O�h@��z�|�@*%���@J�~�M@A��Z�@���r?@I�\{��@g�H�~@!� �Wsq@#�-Jn0�@%���{�@(�D��@*c�L�>�@,�n��8�@/HSq�C@0�� �h@2;%��d_@3����N@4�,HR�@6^�����@7�b��@9I�5,�@:�W��|@<TRHֳ#@=���-�@?|�Y@@�ª��@A`�����@B77�{�@C�15@C�:�E@DΪ��@E�PO@F���@G��NyM@Ho�!w>@I_��2�@JR����@KHl2q|@LAn��0@M<����@N:��X8\@O;��>Rw@P�$��u@P���2@Q'x��K@Q�Gc�0�@R4_����@R��R"$�@SFZ��p@S�4�8�k@T]E�c�,@T����@Ux���f)@V�#���@V�e��k@W+Ux�        ?��*�?����(?��H`o�~?�&�H?���Zix@ $�-@@	b7�c�@L�]*6�@M�ФK�@�Iy1�@r�U��Z@!G}�9[S@$P��V@&�a=�if@)�O�r��@-&�,w��@0@�����@2,���@3�U`Il@5�W�8X@7��M�3&@9����@;ɍO�F�@=�n'��6@@��"�@A6����@Ba4�u��@C�4���@D�n���@F����e@GS�$>u	@H�Ѵ���@I�L��@KQ-��lR@L�M�WE5@N��@O��u\�@P|լ� �@Q9(uD��@Q�>TexG@R��tQ�@S~mMULG@TEf�k@U�>�j@U���y�2@V�#�xx0@Wy�x ��@XL�e\�@Y!�z+a@Y�k5	}@Z��T�@[��j���@\����@]l�cE�@^N�.d^!@_2�09_m@`@y�C�@`�5n���@`�!�u|g@ak6��@a�עO��@bY��E�U@b�O�_        ?��FQ�+?�E.�)?�U��	,?�m!���?�����A@��z3�@	#fd�9@B"f�(@���<@^:A���@pb�@!xp�q@#�\�s��@&��V̮�@)�����v@,Ե7��^@0�c�S�@1�0V@3�ǅE��@5�x��k�@7v�1�s@9{K%L�@;�L�S��@=��+D�@?���e@A��R��@BC(�?I�@CuN����@D��O� @E���x@G8���@H�CT��@I�yDϺF@K:�\���@L�[&�G�@NҨn�	@Oy�A4ǈ@Px��-�@Q7�g"�6@Q����r"@R���S�@S����n@TR08�y�@U N�}�@U�Q�� �@V�-gK�@W��~���@Xu>�n��@YQ`�ɿ�@Z02���@[�!c �@[���]҃@\�i�9�@]ř�Ki�@^�If�,�@_�n�Sg@`G���d@`�xJ�l�@a<s\Z�@a���'K!@b4�]�>�@b��!��K@c2.��%4        ?o-��?��K_�~P?�-;��?��w�.T�@6���E@���CJ�@����@Bf�/�O@b� �@#U����@&�Q�!5@*u��%@.�0�"k�@1h�%wV#@3�L�!j@6�3�,�@8t1�=�@:�c����@=�����.@@+�2:W�@A�%���w@C2E��@D~p��@F���ϥ@G�l� �'@I*��tVA@J�&qn�@Lv�ɞy8@N)�",��@O��Y�M@P�4����@Q����ڹ@R�⑬t@S�~�W5@T��Av�@U}��� @Vv�	_@�@Wt�v`z�@Xu��h�@Yz�O#�@Z��y;�@[�����@\�
��f�@]��w`>�@^�>)�f@_�3Z�K@`}� ��@aJi�Z�@a�t�;�@b1#��W@b�Q�$�@cZ���v@c�l�/j@d�����@e$�D��D@e���[@f\�1��J@f���dy|@g�w�	7�@h;Q(��@h�|^w$@i���K��@j%���CY