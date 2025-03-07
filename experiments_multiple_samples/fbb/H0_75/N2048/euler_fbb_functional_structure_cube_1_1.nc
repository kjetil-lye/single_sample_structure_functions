CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            h/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_75/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-030          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190901T131109        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
8513978368         /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1733500        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             20         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_py            �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_xml           �<?xml version="1.0" ?>
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
          <value>0.75</value>
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
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�%d%uu�?ź����?��Щr71?り�AS<?��k�z�?��(9i=>?���4�q@��:�@9��C.(@
�`
Z�m@5"�ȑ@�� ��@�@��,@�Sה�x@�1<H�@S1����@!irOpw�@#:�ȷ�V@%=��V�@'����@)��eyf@+ }�w�A@-@!����@/n9x1M�@0�3�9��@1�)�4@3%�W�ht@4X	� @5��K��@6�nN�Q@8S�j�@9_-����@:��q�T�@<?��@=b:+��@>ó�n�@@J#@@�aҲ��@A����|@B?^�ԝ�@B�1޷��@C��ʺRQ@D�Qk��@EE�w� @F-�ۢ@F�/}�H�@G��z��@Hr3�,D@IC&]�}Z@JX���&@J��\+�@K�W��-�@L���M�@Mx����@NV���@O6���)*@P�� �@P~��c��@P�r�@Qe��
@Qڪ��@RP�9?@R���O        ?�,���m�?�?�uo�?�@$l��?��C�[S?�_3V!�?�	�"λ?�����*�@�@�r^@w�`9t@����@�����@�~\ܘ�@�rv��!@?c�7C|@̍uϙ"@!B1.��@#2���M6@%7Qsb�@'OS���.@)z>m�@+��a��@.�P���@03���q@1m	,�C@2��ƨ.�@3�v���!@5J�"�4@6���<i�@8��A@9p�JU[�@:�^�� @<[��e��@=ܙ'A>D@?d��V5@@zB��d@AE�iV�@B��ʣ@B�$�f�@C���xe�@D�RE���@EsĒ/�@FS�[�E@G6jX�@H�S�/@I���ϴ@I��˲�@J���,@K�l�w�@L��N~8@M�D���@Nø��o�@O�%c�"@Pb���V(@P�_�m}@QikYN�@Q����w@Ru���	@R��W�Cf@S��!�E@T�f� @T�⏼Xn@U,�L��@U������        ?�/\��~?�H��~K[?ښ4霆�?��&Ņ�O?�MoD��#?�_ �,�@ D?4�@�J�0��@	�A�Ͼ@�.����@�T>D	@kQY]�@p�f�g4@E���@ s�J���@"u�ӱ!y@$�jZq�>@&��68�@)�t��W@+c1�Hj@-�WhI~�@0.OIϒ�@1|YGp�m@2Ԣ��6�@47����@5�a�ͦ�@7�����@8���F�6@:#4>Ы@;�>��Y@=Rک��@>��i�|@@T�Y�U@A0Y���G@B6f�fr@B��b�qc@C�����@D��VM�@E��]N��@F�3�U @G��a��i@H��q�%@I�nw�<M@J�)��##@K�*�W%�@L�j�`�6@M����@O��Mw�@P��C��@P���/o4@Q:վ)V�@Q�q>�Y@RgE��1�@S ��_�@S��[�M@T9[�~��@T��l��@Uz9�[�E@V�KeWa@V��ˏ�@Wjyi�@X�ৡ`@X� �`�        ?�ϩ8�M?� r��g�?�V�U��2?��kG]�T@ x|�a@1���N@����.L@��$i��@�"s�@@��D�m@!Ӊ+A��@$��%Tz@(�S� 8@+	Baj@/QaR�%@1fq��H�@3X���(@5\���@7t���'@9�:�]�l@;��2A�@>#G���@@?��bG@Au��L�s@B�x���@C���d}>@EE�^@F�#�5�:@G�q��@IW�,,@J������@L0A��8@M�X�c5�@O"�����@PR�Z�Q!@Q�Zw�@Q���.@R���u+�@Sv�R�@TF7��F@U+���@U�聍�/@V�b�2��@W��Y�/@X�g,�W�@Y`�r�N@ZC�i9�@[)��5T�@\�XK�@\�N��@]�d�%q@^����B@_�͜�� @`_���bx@`��k�٧@aW@EA�@a����N@bS|XD�@b�@aF�j@cT�x�@c�	�6@dX��@m�@d���F�        ?�
+���O?���2h�t?����?��}F�X�?쉋�as?�E؛�x?����;s@7id��@k;�
�@
R0�Q�@�x.ˌ�@��u�l@��۰�@�"���@��\	�@H�7�"D@ ��뒐R@"�c�Jp�@$q��#@&W�Rs�@(LZ��r@*Q҃��@,dռB; @.�Z^�s@0\%�@1{��E%@2���d@3�N"@(�@5wS�@6=e��@7~���b@8��O�-@:ԝk�@;d�#��4@<��$���@>w�@?�E���@@t��>O�@A,�:a�,@A���D@B��B���@Cb��@D$��N��@D�.
�Y@E������@Fy:E<�@GD��� @H@��Ρ@H�;o�	�@I�i�k\@J��XSG[@K_8��@L7�nS�@Ma� W�@M�&B�B@N͜�@O�)��w@PHP��8@P�|�bT@Q-��_�@Q��R�P@R|��3@R�B����        ?�"r�D�?��.��?�>�R],?�s�t*?�bVR௿?��Vv?���5;c�@��l[?@���JM�@Ɩ�l�@�X8@��Wً%@����@b�m�X�@�����@!]��[�c@#TP&��@%_�4�i@'���r�@)�F�J�@+�ca+�`@.T��a�@0`��Z�@1�C��3@2�ׁ-��@4:B�r%@5�_�km�@6��d �@8b'PhZ@9Փe?�s@;Q2`��@<��ݎ,�@>`��(@?�A�mD@@��rVQ}@A�k�"e�@Bn�+���@CG��B�@D$�ZUԗ@Ex�H�@E�;;Ї@FђC���@G����@H���j@I��a�E�@J�����@K���Ι!@L�ן6W�@M��`�@N���.4�@O���<�$@PO�ħ�@P�y����@Q^��x��@Q� JJG@Rs頻|�@S �GP@S�O��@THs/�2@T��&ˊ�@UC��%�#@U�<�LȖ@Vn5d8!        ?���r?ǃ��S��?غ�n�";?�$�\e*�?�W��?��n�Y�@?�&HY2@QaR��@�uA�@�n�6@Qf(�=\@D"�W)@ek��@�s�a�c@,}5�4�@ �q2��@"��K���@$��I�7z@&��#PЊ@(�_S�@+!i.��@-d
�6W"@/���'�@1���@2I�d�@�@3���I�r@4�-Z�/@6+x�U��@7�����0@8�w��@:S�'�S@;��n�
@=?�u��4@>�^h��@@$>P�E@@�����o@A�g�L�@B��OQu<@CW�G��@D-�S���@Es��n'@Eⱺ:)Z@F�1͂N|@G��0�@H����bg@Is�?�9�@J`=�,)@KOMh&��@LA�%���@M7��vf@N/�)�O�@O+
��8�@P��	{@P�~�X?@Q�g S@Q�R���\@R c0�p�@R��$-*@S.��o0 @S���M@TB�5��@T΍�՗�@U[�        ?���]U5z?��/�?�:BuEU?��F<�e?��N	�/@4����r@��Ҝ&�@y��4�@�����@�
���@!X�W�@$Gv-:�@'� s�@*e�a��X@-֍�l�A@0�E*@2���"�K@4����u@6��@�)@8�@i�7�@:�B��C@=A^�m�@?V�i�F�@@���<h�@B-��(M@CKK�KO@D�T��:@E�-	�D@G/��hCD@H�'(�(@I���V@KTo��@L���tx@N8����@O��� �@P���k�@Q`�x�@R'q�Y�c@R�����F@S�.0�O@T�b��@Ubg�i&�@V8-��c@W�t�k@W��D���@X�~�5��@Y�ķ���@Z��`��Y@[q��gAQ@\Yr���@]C}n�{;@^/�ۤ��@_���R�@`�x[�i@`�SE�`@`������@aw�6���@a���8F@brg{��@b�H$�w@cq+��rv@c����@ds��p��        ?�g��ѵK?���Ϯ?�$�you?��_d�A?�I��:?�*�.K5�?�B�qts�@!4�]�q@��"�b@d�.Dw�@N���n @��F�c@��ls@3���@ (�	[@�&�&Z�@!�o�e3�@#�h]�9@%�� "??@'�S��G@)�@��� @+�8�7�@-��Գ^�@0]bkX @1A̤̛@2p�8b��@3���X�@4㖙�hu@6'���#�@7rh�tV�@8��\�n�@:�c;�@;z����@<��e�ʳ@>K%�Fh�@?��O�O�@@�*h�@AYj!��@B�YW�/@Bߒ�L��@C�7L���@Dq��.o(@E?#B(@F��1@F��2@G�N͇�L@H�ei��a@Ij�z��@JGP�'-@K'��k�@L	Tl�8 @L�	
�2�@M�*NSOs@N���|%Z@O��3 8@PLf匆�@Pī���R@Q>L�D�@Q��r���@R4I̱��@R�ӿ*B@S.�
�@S��gVv        ?�2oFfE�?�$\���?�O�ʹ<?坄�
ض?�i�{,�?�ׂ��3?��"T'�v@�����@�Nz}{@�x'4>@���Zz�@�Y/F�@�{���@=�+�@�1��J@!=�4ɥY@#,&O59�@%.RC�/�@'C����<@)k���Y@+����z�@-��
���@0'�����@1_댎�@2���)C�@3�Ͱ]@56���v@6��"W��@7�� H�@9V�x�V@:�g�>��@<=vܙ�@=����@?A� K[@@grK|Y@A1��>@A�?����@B�je^�@C�x��@D}��i]@EXv�.'�@F74^&��@G=l\3�@G��~��@H�"�O{@I���r�@J��<��@K�����@L���`H@M����~�@N��܁�B@O���q@PMc���@P�N�45�@QR����@Q�k��U@R]�� �@R�&���@Sn^�@S�a�	*@T���ʐ@U��
@U�W��O        ?�����?�_��+�?٣�qyF�?�����t?�9��a�?�x�?|�w?�S��q�@D�FQ@�M��M'@U�˘�@�F
#F@&�v4- @qI�x�@�QM��@���@!��"tf@#�/�+X@%��g�5@'��-�@*:�d���@,�s9+Z�@.��� �w@0�+����@1����@3N����@4�yQ�@6	>
9�@7s����@8�����@:b�&i>@;���-7B@=sobwZG@?=L8H@@R��/�g@A%(d���@A���Z��@B�=G^�@C��.�}[@D�2�8�@E}Q��L�@Fgg��/I@GUL��(�@HF�Y�kD@I<g����@J5���@K2n_�L�@L2��_�@M7.�%�m@N?�Ȫ�@OJr���@P,��f��@P��x��@QA�F`u@Q�Ɇ�=�@R\H=�J�@R��Iz"@S~m	��@T$�&@T�`���<@U>a�~{�@U�~M�@VqdQ;�A@Wb��kt        ?�^{S�u�?�sAa��Z?�X',�?���
2@@ �P���@���+'@l�ϯt@@(�H��@v-���@s�zt��@" ?�P�@%:x��t@(���3v@, �K^�@/�as���@1���ǥ�@3��N�#@5��vs��@7�:wJ�N@:+TN�D�@<u����@>ы.���@@�`18�@A�jn���@C%�P�9@DuqŸ�@E�qGM5^@G+�0*�@@H�V��qY@J �'z�&@KvV.�c�@L�PvT�@Nwra� @PN��^�@P�[��J�@Q�ј��k@Rf��H�U@S9��ԥK@T&���@T��z� �@UƆR���@V�m7��@W�i�.ъ@Xopw�/@YXt��YC@ZDl!�@[3Ka�|�@\%	�@]�|�{�@^�>3&>@_"��^T@`��W�@`����h�@a�	c10@a�W}f��@b�s!�@b�ID$�@cP*�x@c��zT�0@d&�R�?]@d��`�Q�@e;���]@e��m�X        ?�*@l�M
?�-�f��?�6�r�Ö?�$��z��?땑�t�e?�k�@�S?��(=���@ ��+䖛@�ɝ���@	�A�W�@˚��@m����A@
(�
�@�<ef�@��
R@@ ���@ Ƽ�S�@!ȦH�M�@#�r����@%L��x�e@'#�.�Ή@)�}�)�@*���.G@,��˯�@/����@0��J��c@1�� ##@2��Tӹ�@3ց���@4�B��@6#W��@7Q�sb�@8��j��@9���ds@:���U�@<@Pw�
g@=��?ꠞ@>ձ��%)@@�� �@@�F��{@Al����@B�/p�9@B���]��@C�"�K@D9�7=�+@D�oV��@E�JyS:�@Fj<%��4@G);	��@G�?^�3v@H�B�|b�@Ir>�މ@J9-�5ާ@K�O�@K��$���@L�`�K@Mg��|`�@N8�A h@O
y�=�@O��'�@PY�.L-�@P�2���@Q1���#�        ?��^��{�?ǻ��@K?��Au2e?�C��e�c?�&����?��m��Y?�RAL+
@o�Cq�@(��܎1@P�h(@pp��"�@j+"�=@�T�}դ@��i�6@l`O��@!����@"�kN��@$�=�+g�@'}bh�@)-���(�@+exX�X�@-�lU
 �@0�<I7d@1<D���H@2{�����@3�9�Ś@54�]NW@6kP�cl�@7�j]!К@93a1��@:�IJ�r@<lB[Ep@=�D�U@?~97�G@@V}�5�@A ��r�I@A���H@B����Ie@C��ja=@Dl�����@EG��A��@F&hvO�f@G+��xm@G�� xl@H�<x,:�@I�|5��@J�؅�+@K�K.�Q�@L��Y@M�Z�5E�@N��N$�*@O�p�߾w@PBt��A@P�$�+ �@QGEW�HQ@Q����\@RQä�RO@R�����@Saʊw��@S���'X�@Tw.��C@U�4��@U�Ń�P        ?���*�Dh?�Z���?ׅ׼P��?��֎�?��^?�|zG��?��(�O;@VR%�G @�Щ�c@��2�rH@fT鏄@,�R!N�@A2���@6[�]��@vs�\�@ژ[
��@!�Q���@#�m�]��@%lh��I@'a��d�@)f����H@+z�
q? @-��PL^-@/�;B�3t@1J=��@2-ӻ��u@3[~Y��@4���@2@5�L��@7
Y,�@8P��"�@9��b@�@:�4�a:�@<J;*�?�@=�۴�@?���@@;�&#�@@��m�}@A�3%ɄN@Bko��l1@C+S�(q�@C�ԧ�҄@D���4p�@Ez�#m��@FD��_�@G?�թ@G�J �*t@H��v�M!@I����f�@J[�0�$w@K4p�G�k@L^#���@L�N�,�@M�ww�@N�����@O�Щʇv@P;����@P�.n�@Q%N�y��@Q�����@R��@R�c�l�@Si9���        ?�����-?�=?����?�b?fM��?� Ne+?�h���@i�@��VA*W@P*C8
p@�|�Բ@����@ lڀ�D@#6V��n~@&+up�Q@)I.l��@,��BX,�@/�ނa-�@1��p�l@3�1f�@5�f2.�@7x�X�6~@9�}kZ@;�Ӿ���@=�h�s@@?�)�*@Aߓ��@B=�.t`A@Ck��C~�@D��d��~@E�T�1��@G�`�@Hb�O9-@I��(�d�@K����@LZ옆 @M�!ϻ��@O���o�@PBP��@P�n/_n�@Q�#��H6@RogJxm|@S./O#@S�t[�~@T�/?�j&@UyW��@@VA�P�tT@W�[��@W�����@X��
b"@Y{h�`g@ZOj�!�@[%�c���@[��=Y��@\�s�1�@]���@^��K�.�@_tU��I8@`+�El�h@`��R�j>@a�g]�@a�U��7[@a��l��@bp�+�`�@b�]8�?        ?�(�z��l?�����?��!͝V?㎉��uV?���m��x?��{���W?��z��U@�\��nH@Mh�Y�@F<�@9�@��@��L�a�@�XcX�6@��_�@#�F�@�
���@!���F@#a|��wN@%JKRx	�@'C�O�s@)N��J4@+hSJ���@-�J-ig@/˳\K6�@1
"_��J@25�;�u5@3h���@4�a��@5�f�i@7,����@8{�$�N�@9ч�^W*@;.^K;@<�ȕ��@=�����@?j�Z�qf@@px��V�@A.���EZ@A�	�N�L@B�bh_�@C{���8�@DFp��+@E6��,*@E�K�1[�@F�:�O!n@G����#6@Hd��%):@I?�1��@J��˗@J�Ȧm�|@K�L��z�@L�#� @M�Z�9$P@N���L��@O��sFx@P=�z-��@P��Gط@Q2�v���@Q��m�x@R,Ay`�!@R�f�T	@S+UN��@S�9�T�P        ?��u��9*?Ș��u�?�˦%�V�?�	c�`�L?�4p�e5?���&x��?�o.=��@'���<@	
�kI�@l�87��@��,J�@5��d��@�b�<�@����� @�:&�t@!��;�@#�9;��Y@%��f �;@(}*�ؙ@*N�𓶲@,��z@/�&cU�@0�F+_:@2'ǈ�@3_�0�n�@4��y^�@6����@7�I)=�`@8��U���@:}�k�oL@<p�[��@=�����@?+Kӈ@@e��-@A9���]�@B�J�j@B����?@C�@Յ��@D�Z���@E�W����@F�-m�i@Guϸ�nB@Hi4}
�K@I`R5��A@J[ �6p@KY�	��,@L[��Sc�@MaB���@Njg!��@Ow��@PC��A�@P�L���@QX���N�@Q���AR_@Rt�u�*@S8���@S�kZ��.@T+K�#H/@T��Ķ��@UX	���@U����@V�z�X�@W'�K�V�        ?�9�=Y?Ȝ���W%?��@��?�-u�#��?��gDyv?������?����=�@M���@	>���@��CN�@;�53�z@Z��@�ӢD�3@+��Dm@ۃy]��@!�V���@#�Gzjrd@%�����@('��C�@*jCn���@,�~��d�@/*3��I�@0ӈnn@2e�Ց�@3l��s@�@4��Aؘj@6*;v��@7�{v�_K@9�	��@:�1 >l@<c?�@=��i���@?4�.��@@iކM�@A=W턘@B�n��k@B�]���@C�:�&"@D�+�J�-@E��eZ�@F�=�0F3@GqH]���@Hb񘪩%@IX/�w�@JP� O�R@KME�z6�@LM�p��@MP7�j�H@NV�S���@O`��V��@P7 ��J@P�F��S@QI)��c�@QԦ
<H@Ra��e�@R�PJ6@S�t;U"@T#Ǟ�@T�@���@U9�pn�@U����o8@Vg�a*�[@W �hxQ        ?�C�yS-?�[b1O]?�ID�?��x!��B@ �r'���@n~�LX@G�X=�@?߻��@�̀�l�@N��r�@"	���{@%�<$/O@(gN��$P@+�ɷ�@/�Z��@1�!-I�@3�w�ʇk@5��ISn�@7�
�Ee�@:ӈ�b@<Y��fG�@>�>���@@�@��"@AІ�G�&@CF��@DhZB�@E��O��@G ��Ϋ@H�$�.t"@I�.�@Kp���D@L�7�M��@Nv�D��8@P�U��Y@P�F҂��@Q���x�V@Rmc����@SB�����@Tp�g8�@T��z|�@U�E�A�@V�өL?@W��H7�@X�#X�@Yu�Oo/@Ze@ɗ��@[XwiO�@\M��Y�t@]GRPz�@^C%h�B@_BUŪ�9@`"G�Z�@`��L���@a) g��t@a���B@b5��=h@b�!��@cH����@c�o2��j@d`5��	@d�`�p)�@e}�j��@fШ^��        ?�����?ėR*7�?գE�-?⁸��0�?�$��3 �?�҉�G6�?�vS��@ ��ϤC@�6�	�@	�� O�@�h�?�@ڵI���@�&��@�P�嗩@�X����@ɓ,v�?@ ��5���@"H�͠@$��54?@%�N�g��@'ҊF�N@)�՜�T�@+��^���@-��)��@/�+��@1�h�k)@2+�'L}�@3L��\v@4s����@5�W��S�@6�m5�_�@8	���@9F��q@:�r�a�!@;�B)�Mw@=�8Ά�@>kPX6�]@?�M��xL@@�����M@A;�l	~@A���E��@B��>��;@CU.Q�eM@D`ɻ�@DŎX���@E��E&�@F=�ʹ`1@F��+���@G�n|]�*@H�=S�@IDv�Hy�@J
�t�|w@Jҥ-bj�@K�^��8�@Lg�$ϝ@M4��ϒY@N�}�s@N�Mb��@O�n��@P=Ѥn@P��>�_b@Q6m�q@Qtbs        ?�������?�������?�d��Rc?���YF?�'�B��L?��`eў�?�;>���@�+\���@H4��@>P7wRE@�PcE�@�ۙ��@�L�< f@�R��|@H����$@ hQ��pv@"?��#�@$*";8�@&&�ń�K@(5l�;�@*Uy�X�@,��9�.�@.�^�h�@0�B�QOi@1�]BdV�@2�[�]�@482�t
@5�y��{�@6�ZM߀@8'���`@9�E?6P�@:� oX(�@<Y!�E�	@=�3ӵb@?H><�8@@eA�@@A)w��Q�@A�7� �b@B�L���@C���@D\Nf�9�@E1&���@F	*|�-�@F�P���@Gt��r@H��Ox42@I�9���j@Jo�B�wj@KY��;@LG�.�@M75��ˡ@N*2��/�@O O5��@PT���@P�	p��&@Q	����@Q��{�&�@RJ׼�Q@R�[�;g�@S�)I�B@S�[���@TC8ܴ@T�j�+�        ?���華�?��zQH�?�*`4�)?�@� �?�Z� F��?��b1!�?��rd
�@�qa���@x֬k~�@����@�"�i��@��A&{@�g!��@<�0��@�V�A��@!>
F��%@#,��[�8@%/1���i@'D�R�|@)md�9�@+�K��q@-�B�m9�@0)�9�@1b����@2��ٹ��@3멯Q"�@5<���@�@6�a��Qx@7�Ϋm�@9as(L@:���'@<J��
k�@=��9�ha@?RNfg@@p����k@A;uYڱ-@B	��XU@B�߮/��@C�B ٰ|@D�
�C3�@Ef0ˉ}V@FE�I�Y�@G(m��@Hq��&X@H��!E��@I�}�'�@JӰ=���@K�aI��1@L�'�20@M���_��@N��_��@O��EOOe@PX��@P���[�@Q^�����@Q���H�@Rj[�&�
@R�IB�O�@S{��"�@T:��@>@T�6]�jH@U�/�@U�!��-        ?�n��?�?��hLR�?���<'Ep?�2+K�?�.�z@���ǒc@R8�K@�5?�%@dP�fG�@eq�M@ �A�'V@#ǕRJ%�@&����@*.7c~@-t���@0~�`#��@2Vn5e�@4?�v\�d@6:E��g�@8EP���7@:`X��'�@<��N�y�@>�d����@@�C����@A�s���U@B㔬��@D{��@E[��s��@F���W��@G�1"N��@I@�<_'@J���(J@K�ܮ��M@MZ� R�@NÝ���@P�[�@P����V�@Q�(P��@RM��P&�@S+�K�=@SҼ�ۼV@T��ah��@U`��+z@V+
b�IJ@V��#ME@W�'�6�@X���5b@Yi�wyUp@Z>}ta�^@[R�ie�@[�$�
7�@\��3�/x@]��;��@^�RMM@_d�_���@`#�.��:@`���@�Y@a�Yi�@a|�wnz"@a�}q��h@bg(�� �@bݰ>��@cUt�!�        ?����H&�?ğ��Ý?լ��[�T?≣����?�0>S���?�ڰd��?��c��@ ]-�q
@&�%�$@	�����@�G���;@��3!��@�h�<�@�j�P��@��oH�@� �C��@ �YϘ��@"^���@$,�D;�&@&��1@'��23�2@)��ks�@+����¨@.�x40�@0����@19�����@2Z��@3���@4�47��*@5ဴy�@7�lx��@8Y�#�a(@9���W+a@:�~�y@<9����@=�]���@>�yq\^�@@%wz���@@�U��x�@A���+��@BE���~�@C x#�Q�@C���~K@D}1-So@E??	l�@F�@�w�@Fʘ	���@G�ӯ(�O@H_d���E@I-C2S=@I�g�Nѯ@J�˹�>�@K�h�@=@L{924�@MT6���3@N/\2���@O���v�@O�'Y��@Pf���0o@P؂b��@QKHmޓ�@Q��'֌@R3�Ee�        ?�u��/�?�]'��(?َǼ�2?�֬���?�%��h?�[紊 ?�+=��1@�1<��F@�J��[�@,����@��{^�W@	O:}�t@N��kW.@��VPM@gk�c+�@!�ʮ�@#������@%�Nݭ��@'Ӑ��8@*ɣk\G@,]~~?�[@.�?sL�@0��U�� @1�)��<@3)t��+K@4~�s��u@5�6@$ޯ@7BWuT��@8��'>�D@:'M�vi�@;���B9#@=,9�Z@>�]���!@@(�O@@��V��B@A�'��@B�<���@Cx��ڱ�@DVC&���@E7O��.@Fu?�x�@GB�z
p@G�z����@H�Y��U@I�x��X@J�B��@K��;��a@L��"�9�@M��V�� @N��É�@O�`0�ۤ@PdKkL@P����@Qqo^�9@Q�}�+�@R��!�[@SEg,+�@S���kʤ@T.@9�=s@T��r6@UQjwGؾ@U�M灉@Vz���S�        ?�v"��?��;�Sֶ?�#I�I?�/��,?�X���!?����?��G�P�y@��-˂�@���{�@��*�w@��D��O@�W�Z@�.��Q@[����s@�ԍޡ@!X����@#N8p�Z(@%XV�*��@'v���h@)�F-�@+�/�b9@.D�nB@0Wt�!�@1�}�^��@2�_¯Q�@4+�8��o@5�V!�T@6��W�@8M=b�lt@9��^R@;7�v'@<���@>@���"�@?��v�d@@�y�\~�@A�;]t d@BW����#@C.ԧ��!@D	��|l�@D��M3�@E��O0@F�����@G��F�Z�@H�&A���@Is�c�@Jf��j�@K\걥t@LVfa���@MSA"3@NR�W��@OU�49#�@P.�4v@P���$@Q8�[�O@Q�.�Md@RI.in�"@RӞy?��@S_yx��u@S��ͯ�@T{^����@Ua7*�@U�����G@V/w�
�        ?�����.�?�:)��4H?�i~ܾ�?���Hp�?���&�d�@^�K}Y@�惣��@(�m�ū@�aHa8@�Tr@�@!:U���@$-� o�@'N��Ԋ@*��]���@.�5}��@0���~�@2�h��9@4��<Ƒ@6�@=�@8�>�W"�@;�1���@=I��GW@?�1T �@@�T�4;@B2WBNB@Cp��gm@D��#T]�@F8f���@GX��`K�@H�ж��@J�
	�T@K~�1�R�@L���{�@NcZ�ؕ@O�B���@P���^{@Qt�u���@R;�t�:�@S�dP�@S��܄��@T����Y@Uu���Q@VK2BPe%@W#�T:2@W��H��@X�n��@Y��dl�@Z����_@[���F�@\n=6a�Q@]Y#�0��@^F���Q]@_6k�|�y@`^����@`���1"H@a
P�^ik@a�T6V�@b���@b�"cx@cd��,�@c�ȯƄ{@dIw�X�@d����        ?��Wc�?�n6��|?י��/�2?�2�Qf:?���+�?����C��?����^*�@�VD��@�#�mt@�̋� @�Y�1B@��*�@�Ҡ.8�@��n�U@O����@ q:R�$�@"O�!e@$@�)JM�@&E�`vh�@(]ȍ^�
@*�8���@,��S�w@/�*[�@0�Uwb�@1�.��@32ju9'�@4{^���@5�gb��@7%dHӝ^@8�4D�6�@9���EG@;^�G�+�@<�j�d@>Ui��թ@?۾e�|h@@���vke@A,��@BMC;��@C���*@C�(O@D��N@E�����@F�a���`@Gj/��@HP^:y� @I9��v!j@J&Ć�rb@K��Y��@L
eF�o@Mqe��@M��`��@N�(�� R@O�q��̍@P}��ϙ@Q1�o#t@Q���&�@RQ}O�@R�%N�7�@Su[�+�@S�<�
��@T4wiN�?@T�!���@UQ8��J        ?���-'�?�l��v?��!��i�?�|\?�ZH؜�?�k�se�@ �����"@�h-���@s�^�p@w��ܵ@�#�0�@����n@�Yi�&a@k}�V��@!8�-?^%@#U��U�@%��1^ _@'�.���@*@�|�y�@,��xp�@/S�
c��@0����y�@2`�a�L�@3̉���G@5C1���@6�rۘ�@8P+p�6@9��e�s@;��<%@=0i���@>��Jf��@@P�h��6@A4#�Nbb@BbAw A@C	R&���@C���'NJ@D����\@E��<� �@F�#���;@G��v���@H�"�@J��n�@K��0�n@L*	��5q@MC�a)�&@Natc4�@O�~�ـ�@PTږ:�@P�Z�9P@Q�@��[�@R����@R�����@SSG��@S�@�>r)@T�j9�4�@U6~�"@U�w�	�)@V�PfZ�)@W+�Iͺ@WՑ�̞�@X��ּ@Y0(���@Y�+,י�        ?�|�V���?Ȯ��X�?���!�I?�6�\��?������?�Ț16	�?��>'x��@]7�
�@	VST��j@���@S)����@y��pLk@�-�p@a'���J@ ����y@"4��*�@$##G8@&8�WL�A@(steD@*���N��@-)���@/��6��p@1A���a@2l9�F�e@3�2}��@5.}z��@6���KSl@8��/��@9�h��d;@;%q���@<���E�
@>YB�^�@@ p0���@@����@A���"��@B���ZL�@C|�7>H@Df���:@EU����@FG�𵼾@G>�ZҟO@H:L! �@I9�J�p�@J=��^:�@KF�+7�@LRf�T�@Mb��t�@Nw���w/@O����_�@PV��.ET@P�q��@Qz
1}$@R��S�@R�A��t@S=��O_�@S�k��'@Tt�y&@Um��@U��ă7@VV19e_@V�r�	�@W���S��@XH�t"y�        ?�n;�\5?�(�:�]?�y2I���?��x�j��@<pF��E@J��I�@9&)��@�ՠS��@�����@~r����@"�C4��@%��w�ܴ@)k�/���@-�ؼ��@0pA���@2qa�,�@4�q�-<@6�΀�%@8���}L)@;U0�&6@=�;���@@"��*�@Am�`��6@B��{5�{@D!V��τ@E�5���_@F�M��h@Htv����@I����x>@K�]�q�@M�A�;C@N��@)��@P-�"%E@Q�n��/@Q޴��a@R�����@S���7�@T��ʓ4�@Uru�{8@VaH2M�j@WT8�z�@XJ���c@YE	Տq@ZCIBt�0@[EN��L�@\K���=@]T��Ǌ@^a��\R@_r~iҐ@`Ct4� @`�s�d@a]9$�$�@a�����@b~��;@c"�3�@c�ås�2@d<-��I�@d�E6s�@en%�K@f	e�@;�@f�e���@gE �"�@g�1���W        ?��(���c?ŉ��OP?֤�����?�_R���?�wfq�E?��#u��]?��!���@��m-@!�&O�@
�xO]�@ ��ۣy@��2�P�@��+m�m@�v!��@��I�C-@`���Û@!u��l� @#M?���@%6ɋ�ؓ@'1�A>q�@)=�B<ċ@+Z���`�@-�%>آ�@/ŭG��@1	�����@28&
��@3nz"���@4�vx�~�@5��R�@7?`R��@8�}���@9�>h�@;R?oD �@<�p��@$@>-�Yf@?�"+�pu@@��uMZ@AUߜ�L�@Bk�}Gn@B�YhP @C��Ɗ�z@D�,p�jF@EW���Cv@F.�<~a@G	"v�$[@G�g�pO@Hƽ:{�O@I�j��M@J�u�$.g@Kyƕg �@Lf�G�@MU+6X�"@NG/1�X�@O<	�ʰ@P��;O(@P��F�@Q�U���@Q��X�j�@R��]!@R�a�G�j@S@+h@_@S�g�y�@T(�I�m�        ?�jE?�TY�r��?ك��Rw�?���W��P?��֠�ĉ?�J���?����'�@�3��@��� И@�B+�`@��'�
@�,$e�@)��pG @�#��F@2D.)�:@!|��D @#u�D�@%���<�@'����!�@)ە�?�@,$����@.�Y�0�@0x1��**@1��m���@3�T�@4U�L�Y@5�i����@7N���[@8����#@9�u��}O@;r�t0�#@<��!��@>��T�@@<Ww��@@�����@A�����I@B����J@C_Q�H��@D=o ���@EG��{�@F�%,CB@F���	�@Gڴ9}@H�����\@I���"iI@J���A�@K��`���@L�	0n�@M������@N��:��@O���rd�@Pd��`�7@P�(?�~V@QuEY�K@R 	n2�@R�s�bsG@S�e��a@S�6;��#@T;�̶��@T�{.���@Uc�Ͽ@U�+�4�"@V����6I        ?�}G��?��eҩ�?� �ʲl?�}Ʀ��&?�T卋_w?�����Q�?��XVܭ*@�|�M�@p��"�@�Y(��.@��n��4@��r��@ۄ5G�@=4� �h@�o�D�{@!BX3�ڽ@#3�S�R�@%9���o@'S�d�N@)���@+�I���@.7�D7 @0:����@1ugW�Xc@2����d@4�j�PA@5YR#�^@6���z@8���4@9�j��%�@:���u@<x`~l?@=�a�?1�@?��K���@@�w��i@AZ�͚�@B+p�v��@B���n�@C�����@D�1gNܿ@E�E��`@Fts=G�@GZ.FgP@HCAeV��@I/��8��@JO�X�0@K8£�@LVZ���@M���@M�r�T@N��B@P ��
@P��Iiɱ@QJ��y�@Q�#�r��@Ryi"��@R�I��4�@S'����@S�O z�J@T@4�2@T�t�E@U_,F^�y@U�Ҧ�        ?����iWz?�������?�#�D��?��vߗ�0@ Z�ބѳ@Y"�z4@�q%ud@� 9�O@����H@՞2�~@!�TT�a@$΅�c�m@( ����@+v\{��.@/�F��7@1i9���@3`�@5k)���b@7��ǵ�@9�N�(x�@<q9���@>Y�!�-@@as��h�@A�G>j�@B��U�G@D5%�a�@E��yb�B@F�9��`}@HUډ)9S@I���p$�@K?ԍ��@L��c+=@NJ)�1l@O�@�ǯW@P�~`_@Q�r�7җ@R^��o]�@S6��x�@Te��۳@T���[�@U�f��@V��@C�/@W�$�7�@X�`���@Y�\�W�@Zz%)��%@[rO�b,�@\m���b�@]l�)�T`@^n�[�d�@_t��I@`>D���@`�Gq�W@aK�+c�B@a�tz�KB@b^���F@b�踃��@cx`��t3@dPd���@d����oU@e)���`#@e���8�@fQY��7�        ?��e���?�� ��01?�ғ�	��?⩏���x?�^�},�/?��S�s=?���N�@ȅ���@=��u�b@	��?��Y@�`J^�*@�T,0U�@��c��@�ݭ-@�I �g�@�,�N
@ ��ZD�@"L���,�@$98��@%�c���@'���k@)��L|��@+��Zw@-�2,�*�@/� �	@12�σ�@24���|@3>/�V�@4cįeZ@5��w�[�@6���e�@7�F#Q@9.��1y�@:o8���@;��}�B@<��L��s@>O����@?���,�@@$���@A.nb�@A�ٱW@B���3@CJ[�8l�@D�S��F@D��@z�x@Ez����V@F9�� r�@F���w�@G�OQ�?=@H���VAT@IK�h��@JY��F�@Jߝ�@K���MwW@L{��]@ML�)D�8@N���I�@N�'�s�@Oʅae�@PQQ�k�]@P�?���@Q,�>E@Q���        ?���\�7?ǲ,E^C�?����HC?�8�<:��?�kG2U?��S%�u�?�;��>�]@^ᅽ�$@�V�0k@3Hݻ\E@]cgK$@R
�e�@uN����@�- �,@?�`��@ ��kʉ�@"��I�Mj@$�j��b�@&���^5@(��3<�@+-b����@-o�q�wZ@/Û��3@1&���@2N���I@3���!��@4�y�>�@6/2���@7��(8@8���}�:@:U}�Z�@;Ɩjx�@=?���@>��m�7�@@"�� c�@@颍�DT@A��g��@B�ی3~�@CS���@D'��@D�f6��@E�kB��@F����<@G��昅@H~[n��r@Ie��c�@JPZ4��l@K=��tȏ@L.X�ւ@M!ȶ��@N&ꆯf@Om��W�@P�D��@P�M�Z�@Q:k��8@Q����TQ@REZ��@R�]���j@SӖ�4@S���P�@T)��j�@T�>�z�@U@�E��        ?�E�Xx�%?ǲ�9�?�����O�?�R�J��?�4h�~
?���"X`�?�n�'Ƽ@�����@@�%Îf@np��h�@��/�@���e@��9���@
Ŋ-W�@��>��=@!#�x�#@#�]?
�@%�)h�k@'.!����@)Y\{@+��o,؟@-�<ͨ�@0&�:��@1a����@2���r�@3�Î#�@5Hj�Ͼb@6��m�6@8\�̺9@9|o�Y;�@:��T�Q\@<s;��YK@=���R��@?�"�cr@@��+G�@A`&�ʣ�@B3o�̂@C
|3@C�HdΗv@D��1��@E��`މ@F����D6@Gt�l"@�@Ha�z��@IQׅ��I@JE���4@K<�zK@L7���@M4ݒ7�@N5����K@O:i�P*W@P!�V�
@P����"�@Q-���EW@Q�n汻�@R@���v@R�˞�X
@SZc%��Y@S针S�E@TzWX$�@U�}g�[@U��i��^@V6�J4�        ?��	����?���%�?�+~c��?������?�le�WU&@�e��G@�O�j�@솧>�@��b�oZ@��XՂ�@ �	��@#ۿ/��@&��?S�@*$ a�ʈ@-�%��
�@0�62Ki�@2\~�O�@4Co_в8@6;�D���@8DDm�&@:\3�L%:@<����X�@>�ۏ���@@E-��@@A��[�@B���m��@D����@EMb��5'@F�\��@Gۦ��~@I,#�$!@J���8F@K�:��2@MA�j_��@N��L�8@P�o�j�@P�x=��@Q��	z�@RA����@S�T���@S�4vm�@T�,��]@UW�MRԼ@V#�[��!@V�.X��e@W�����@X�]� =C@Yk�5w�@ZC�{C��@[��@[�pp��@\���͛@]����ў@^�~��@_�cJBG@`4+r��@`����@a'�Ad@a���
�a@b:"b�@b��@b���@cx-B�]�        ?�aiyC�?��ʀ�?�-�8�C?�����?��L�F?�Q
��?�W}c��@es,�#@���ZT�@
E{
	��@D����@NR�9�@$v���@"����@G�\��@�"��ǧ@ �����@"��l&4a@$��?�B@&�s��@(xuC�@@*���(��@,���̭�@.���㤙@0zC���@1���	-�@2���df`@3�ޚ 5E@5$b�ā@6_Y�b�@7���/�@8�*�tq�@:5��'@;�P}��@<��.@>A�_��@?��Nu@@�����K@A@cےӂ@A����p@B� ��զ@Cw�E�E@D:8w��k@D��`�L@E�d���@F�/U?;�@G\ht#�@H+�y@H�K���@I�ZI�@J���d�{@K|�3�@LWY�>>@M3c��$�@N�����@N�KA��@O�nW���@P]+�.�P@PЩG�K@QE-:��@Q��}�\@R1:'R�@R���Ԏ�        ?�\d\�K�?�G�ĶB?�w�x�?��4��S�?��+�~?�C|���c?�����z@�yð@�]Pu�o@<�I��@���ϣ@�|;���@),�F#@������@29�΢@!|��?)�@#u��"(�@%�"��8�@'��nL8+@)�{����@,#]�&e�@..(�e�@0vȔ��@1���H@3 h$�s�@4R�����@5�X'���@7�]#ZG@8|g���h@9�^�y@;ll+��@<�m`�#�@>|A��מ@@�<��@@�|s)P@A���B!�@B{���B(@CT���Q�@D0�@q�x@EΤ�di@E�4���@F��rC@G�b�f�Y@H���-@I�/��Ű@J���O�@K�\�x@L�ib�@M��6���@N�Q7��@O�%�s@PL(�F�@P����VD@QY �Ԥ)@Q�ײLI@Rl@��$@R�6���n@S��u���@T��<��@T�FP"_�@U7P�m�@U��~c�@V_�շr�        ?�x���0?Ǘ�Kg�k?��D���?�;�Y��<?�!�;!�?��e�mV�?�E][��@dQ��@vw�?@8�tl�@_�t�A_@Sәj��@ve�_�@�v�Q_@?K����@ �/?
`@"֨�8h�@$�u��6o@&�v0$�@(�����@+(�7�G@-i�h�/@/�Yp5y@1��=�4@2I�9b�@3����B-@4�{HW�@6'E� �@7��ܮ��@8��5c*@:J��utt@;���[@=2k}!��@>�Fa�N�@@�>���@@�E���^@A�e9<OT@BzX��@CK'�W�@D�-=<_@D�jFI*@EҢ<3�@F�+1�OP@G�����@Hx�i�M@I`Dfioc@JK�����@K:1�S��@L+��_X@M ����&@NV��@O&���_@P{�hE@P���x�@Q
��h�@Q�Q$�G@RδY!@R���P��@S ���@S����8z@T3׆��N@T��S2�@UL����        ?����C�?�O�o�¨?�~��#�?��6`'�?�ۗ��n!@pe�Ȝ�@��!�*�@6�9��q@�Z�&�Z@r�F�3@!C����S@$7")&D@'X�I@|@*��F!�@.;�R�@0�#k~R@2�;Gp�J@4�7��Z6@6�}�@�@8߂w��@;�=�@=HԹ��_@?�DrP��@@��:�/�@B0a���r@Cn�^15�@D�AP	��@FLnoV�@GU�����@H��ǞJ@J>	��@K|b_���@L�9��E@Nb�N'*@O߉Jseq@P�aIW�@Qv����@R=�qk��@S�B>��@S�^]�Q@T����@Uzzo���@VP����@W)�}�}�@X�]}uJ@X�7�?@Y�2~/!1@Z��Q�P@[�H���{@\x.���;@]c��u�I@^Q��~��@_A��@`\�S@`����_�@a���@a���j�@b���?@b�����@c<�Y��@c�� R�q@d��R@d��e�e        ?��xw�?�z�w���?֗s�	c�?�U7`I$}?�i����?��x`�4?�����pT@��Ï�@�G7U�@
��-�@��R�5@�����@��i?@��(�I@��9�@@K4t@:�@!h$�0@#<��{�m@%"/^�E@'�Q��x@)oo�:�@+6(x��@-\ki_�@/��c3��@0�/	��@2���a@3E;#�ZT@4|�|q@5��Um۶@7 海��@8M�C?+@9����l@:��z��@<Xlv*�/@=�N�S@?*m5X,@@NY��@A
���,@Aɧ�a��@B����@CP�П�@D�U���@D�ZS$�@E�x^Sf`@F��c�X�@GS:.۲�@H(��Բf@I tjW��@I����.p@J��͊�@K�G��8�@Ly$�^~<@M]kFy��@NDz�	@O-�>�P@P7q��@P�	���@P� :
�@Qt�u��@Q�M��h@Ri�Ȥ��@R�jl�o@Sc�I��~        ?�A'� �m?�Bz��"?�w8��f�?��'���?��'O�?�I����J?�t���Z@�``�O_@�s�Mm@�+�@��1��~@�{���@@>D*`�@��|o�@WM�Gu�@!��h�|�@#�,5>@%�y$�w@'ˡ �%@*c>B�@,V�;��@.��mܭ'@0���!`@1��0.@3)fw٠�@4Ĳ�A�@5���� @7F�%P^,@8�T"�t�@:06 �1@;�j��5@=:���{�@>�i�@{>@@3 ���O@Ađcwj@A�s�2)@B��|��#@C�\f��=@Dm{���@EQN�k�@F8ə�<�@G#�����@H��l�n@I�\H@@I�iY�z�@J��]�@K�,��@L�/<K-�@M��Ԧ�@N�Jc���@P'(���@P���i@Q	a�l�@Q��>��[@R&M��h.@R�J���@SAӦV�@S��r��h@Tczg��@T���Po�@U�(��c�@V!=���@V��-���        ?��"�	�E?�-�[��?�un�7h?���%��?���k`#O?�N|Vi��?�ѣ7t@�0�o@ǋ�.D}@� ��@����@��ayg@0�?��A@�h����@90@2ۤ@!�q�5�@#w���~>@%�u�c�@'��f2��@)ة�DC�@,P��4j@.xq�ǚ�@0q���8G@1�P�64�@2�|f8�}@4G,�{K@5�:����@6�`�q�@8g���@9�����@;P)b4ٸ@<��D��?@>W e�.@?���5@@��cD�@A�|���@B^��xF�@C4[�ȭ�@D��@D�3�e�@E�J�K�)@F��NY�@G��Ӌ�@H~��$b@Ilf���E@J]3��!�@KQ>ߺ��@LH~(�b�@MB��w�@N@j�K��@OA~�A@P"P��@P��4��2@Q*d�e��@Q��(0(�@R8I��`�@R�_���@SKޓ�x�@S���T�h@Te
�b:@T����@U��^�g@Ve��d        ?�pX�1Z?׺��.�?���pXh?�[�D�@ >��L�@��f�M@�ۥY�Y@��:ڝ�@i(�A�@�Ģ2]@!�Ʈ�Y1@$��k�H@'ᥲ�@+E��̧,@.�v*�@1G���A@39+if(�@5><���@7V`F05:@9�
��q?@;���w@>��^��@@5�U�(m@Am���@B���iS@C�~pl��@EF�8�O�@F��U���@G��O�!}@Ie�����@J�Ra�U�@LJ'���@M�&����@OK6YA�'@Pkh��@Q4��ͬ@R o����@R�%A4j@S�)�
|�@TyqG�8@UR��K�@V/���\�@WPq9�@W�r]"@X��kI�!@Y���nx@Z�J�7S�@[��̰y�@\�1xe�@]�]qd�C@^wM��ى@_p���(6@`6�A���@`�/A�m�@a7X4�@a�&p��@b<��RǷ@b�C/���@cG7����@c�k�pa@dV��k�n@d���:@ekiPK#>        ?�Φ��ޏ?�q;�s�?օ�SC@?�Bp$�?�G�Kmƴ?����%�?��-��@��H��X@��K�.Y@
�|����@�P���@��!�-@t��Q@~rޭX�@�d �@^QG�|@!B�G�ZF@#��l8@$��oq@&�ʘ��@(������@*�M"6�@-��o�@/L7�`�@0����2`@1���gC/@3�eR�@4O����@5�|��Q>@6��7�h�@8�F^�G@9f/ܠAm@:���LK@<�Pk�@=yv�;�@>�C��@@'uDoö@@�)�"y�@A��x屓@B]v, �@C[��@C��V��D@D�B���@EuJ�VŸ@FA��h�@GG��@G�=\l@H��/�@I�:<K�@Jf �guQ@KAbyEV@L�q�/@L���4@M��l���@N�VY_��@O��1��@PJM��S�@P��B8�(@Q60���@Q���hCS@R&1�P�D@R��/X�@S)D`�        ?�[x�ױI?��~��_�?�! ||w?�Q�pV�?��� �?��̸k�?��w�`W�@r._�6F@	q��Q�C@��>�@h��/@�c�`�@��z���@��t�p@ &M�u�@" ��3�n@$2f��"@&Z�_@�@(���Ђ@*�M��_@-X�W�@/�>�O:@16-��f}@2�vQ��@3����J�@5Q��N�@6�4�.[@8>��
j^@9�T$��@;S'�oz@<�ZU��Q@>�Ԛ)��@@�(	0v@@����Lu@A��ĬI�@B���T@C����z@D�Tg
U6@Ey:u�@FmAX\@Ge(�L��@Ham��;�@Iaˋ+�@Jf7y�P6@Kn��`��@L{2_G�@M�w�:�@N��'�@O��F,��@Pjr�Ҩ@P����@Q���X��@R��
��@R�T�@�@SL�x��]@S�]�+�)@T�����@U���E@U�䙷��@V^�>�:@Wg���@W�ۅ�*@XLݮ-�        ?�@�]��P?ǈ�B~<?ظ��D?�-�D)�?�
�oݡ?��	�\&?��>�.S@C����@T�U@|��|@?��B�@-��r�@I?j�|@��V��@KA�N�@ �;��0{@"��˯�@$��;��@&�Ϻ��@(��Ӄ�@*ꥤ��@-%t���@/qB���@0�y��	�@2y��%@3ZZS���@4����^@5�9.=.@7A�+:ݣ@8�+<0�M@:�E�J@;lZWG�@<�'i\�@>V�	���@?֭���@@�����@Au6q���@B?ckD�@CCd��:@Cܘ~�j@D��S��@E��T`b�@F`6�W�@G<��3 T@HX�ּ@H��jR��@I�#��'@J�O�f�@K�E^��@L�����@M�h�tu�@N��OP�@O~EC��M@P;S�e��@P�ћ�]�@Q7�2���@Q�����@R8�"�)#@R���ug@S?`��<&@S�m}Ň&@TJ����{@T�,ᾉ        ?���i�	�?��p���?������ ?�U��6�@ 8m#��@��c*@ǀ7�(@�����@Ur?��@��D�&x@!�2��њ@$��e�c�@'Ƨ�N!l@+%_S���@.��|�^@122��4�@3 ƕ�D@5"�	�@78:��{�@9_�tӕ!@;���P�G@=��]�D�@@ ��
f�@AW ��@B��ݽ��@C�8T�@E*r�Q۩@F�i�v�1@G�ݮ�@IB�P��@J��@��@L!�^[�@M��.�{)@O����L@PR�l��@Q0���5@Q��˂@R��Y�@S��<Ы@TU}cI�@U,H:,|�@V�"-i@V����@W�g�
�#@X��,?��@Y�+Wm�@Zr<E7L@[]
�|7@\J��ic@]:�[s�r@^-}%��>@_"ܟmh�@`d�x�@`���*@a	3'b@a����z*@b	�3���@b��$���@c�o�)�@c����@d��$W�@d�
�c�w@e&��y�        ?�'�'�Q�?�^o�m�?��}��6?�
ɞ��?�k���U?�L�J {�?����m��@ ��0}@��&�?@��*�S@��H��=@Hm�mݢ@�K�a�@��n�ƹ@�[����@����@޿uð�@!��/v @#F�9:ݝ@%��r�@&Ջ~"�@(�q� ��@*��WF@,��r1�U@.�A٢$@0KA�_��@1V��|b8@2ga�aJ�@3}�~��>@4�+,���@5���-@6߻��n-@8
���<@9:5r�=@:n�F���@;�Ε�:f@<��Y*c@>'�"�@?n��i�@@\�q��@A����[@A����@BZ���@C�L[a @C����@Dj���|;@E�<�8@E������@F����@GF��/@@H���H�@H��P���@I�KsL@JAܗ���@KNJ��W@Kʝ�g=1@L�Ǻ�1*@MZ��Hh�@N%��gD@N�,`N�@O����!@PHN�X2(@P�5��	        ?��ܷ?�?��a��T?��)?LlX?�`�2��?��8"�?�������?�����@�K2W�@S�\�@����x@�Z,��n@o ��Q@j�3���@�0�Lv@��r^��@ '�J��@!�'��@#�73l� @%�U%?��@'�J��@)��)�V@+�vc�@.t���@0*����@1P���@2}��#��@3�#R�+T@4�r����@6/�b��@7x�S2�l@8�ij��@:�?!�@;{���_@<��̌U;@>HN��4�@?��F�@@���Db4@AT�Ά@B�M߫�@B��ىǋ@C��d��@Dj*���M@E6�	��B@F�Ɖ�@Fל����@G�2���@H�pi��v@I]Nb|0]@J9ųy��@K�s5 @K�c<ml�@L�y��h�@M���t\@N�;pe�@O�����@PC�b?��@P���~��@Q54b��@Q���&}�@R+d4"�7@R�9�t��@S&6=]@S�U��~-        ?���q]\�?�ԇH3�?�K���?��hF8͘?�{s�?�8G�ٷ�?����5<�@�R���@�ڽ�?@�N_'�@@��=I@���^�@��v���@6����@��:%��@ �&B��@"p�7Iٓ@$^k��@&^-�%u@(o�h? G@*��!��@,�SI�z@/
���=@0����q!@1�쁙��@3	iS�@4]�z���@5�LR�fd@6�:ze�w@8P�#�p@9�)R�(�@;���@<��7-a�@=����h�@?ur湯�@@{��<`�@A@���`l@Br��W6@Bӕ�W��@C��t�?@Dso8H|�@EH��%@FÀi!\@F�}�ů�@G�1�_�@H�Ե��@I�\�G@J��ȍ��@Kk�Td�@LW���,�@MF����@N8����@O,D�ʴ�@P�0�D�@P�E��L@QL��E�@Q���qV@R8~U��@R��S�@S5�v�@S��M�
�@T �ݷ�@T���y��        ?��m�9?�,ނK�?�J+�n
�?��5HVf�?�B���l�@L��CY@isǶ�$@4�f@�I�yC)@p��'�@ O!L�&@#W\���@%�T/�w�@)���� @,Ml��oI@/����@1��< �@3eG3@5D���(@73���@91
���4@;<�p[7@=V<v��@?}1"��a@@ؠ_q@A�
oOh�@C�܋�@DLh`�n�@E6�<�@F��K��R@G��d��B@I9�R��@J���I�@KѬ�fm@M%�=ɀ@N~�@O���>�@P���
Q�@QS�,գ�@R
c�K�0@R�+���@S~G���@T;���G@T�U�\@U�7� &@V�K�]0�@WG��7�q@X��w��@X�p���G@Y�_�@Zu���(i@[F�����@\s\ȭ�@\�a�$�@]�\,��8@^�^�a��@_yd���	@`+5[nF'@`���Ҭ�@a1��w@a|�i�W@a�r��@bbiO��>        ?�����?�wcX�[?֎�����?�J�pIѱ?�Uѡ���?��R�h\F?�� D�@�f�@H1d;@
���G�@����0�@�/�F��@�J"���@���[��@� �%p$@"�;�@!Qd �٭@##A���\@%S(o�3@&��o<:@(�O��@+�$i�@-5��YW@/gcE���@0�.j�@1��x�>	@3*��z�)@4`a�s��@5��T4�@6�6�ݓB@8*�=]P@9z_��@:�	� �@<-�:�@=��/�/@>��>�VS@@4u��t@@��?��@A��2@Bl����@C.�;̭ @C�'S�Z@D�+����@E���r�@FS�:��d@G#g��@G�_Q��7@Hɱ�t�@I�RaF�@Jy4��(p@KTLɳ�	@L1�12�3@M�Ό�-@M�x�"+@N�G���@O���5nY@PQ��d߀@P�pY�N�@Q<5˼�@Q��ɗ|�@R*�Ƞ��@R�-cW��@S�k!��        ?������?�z���5?٫&��2 ?���<�<?���)2?�o7j��g?�B6PE�@	0ex�`@�k�H>�@;҄q@�@�uRC7@�[�T@U�����@��D��Y@m�c�4d@!��e�-@#��:J��@%�]N��@'�JԜc@*<"z�/@,^���u�@.�h�q}@0�h���@1�ΎY��@3*:ƚ3�@4��%@5ݑܦ'@7D>۟%;@8�rDd]�@:+;%D@;��[o@=3���@>�& ��8@@-�ȉ��@@�:[��@A�F���@B��} o�@C�<1��@DcP�3��@EF8�K�@F,oq��@G`XҮ@H�A9��@H���M@I�/w�
@J���k@K�����@L�U�zQ7@M����qF@N�ܳ	?@O���4�@PzlJx�@Q7�(��@Q������@R.x! 1@R�����@S-G�RR@S�q�т@TLr���q@T�F����@Uq���s�@VY��_d@V���T�        ?�vmT�yU?ȱa���#?����@��?�:�G���?��Ts<�?�ͤD"�?��<�%X@a�DP�)@	[�W��@�}��f�@V�-�X�@}�+���@���%@eb���@ cn�v�@"�?�;4@$ͼ�x@&8W;H@(q�6x��@*��i�h�@-$���)@/�!���h@1	]w?�@2e�m��@3��ɜY@5#�"� @6�b厥6@8X�mv4@9��7��u@; ︚@<�v.-j@>?�NZ<S@?����<@@Ȋm��@A�X���@B�l�,2@Ce���5@DM+�J@E8�ߖʙ@F(a�B�x@GiY�@H�M��j@IA��
4@J��k� @K�T�@L&�E@M$���5@N2�4�ސ@OD��<��@P-w4���@P�@m��;@QH�ﳃ�@Q�4Ph�@RkW�ĩ{@R�<��c7@S��x���@T,=�#��@T�SlB,@U`�Rf`@U������@V���f�|@W:~t��
@W��ȕ�        ?���#I��?�����?�Ap4C�?��� �/v@ lyC��@"��Ĳ@�ٵDN�@Ϝ��F@�N����@�&�>��@!��ܢ�@$�$ V^@(�=�{@+�D���@/[{�}@1m��~�@3bؕtF`@5k��j;�@7�Mj��@9�;��F�@;�B��a@>J�cK�0@@W_�y��@A��e|G4@B�6k�_Y@DŃ�fH@Eq4�d�@F�^J��@H-��]@I�F����@K�	�*�@L~S��A@M��}F#~@O�z��S@P�e��v�@QP���@R�P:k�@R���mռ@S����"@T��u�@UpE�9[@VL|�P��@W+��ո`@X�a��@X�J����@Y��컊3@Z��Xp@[��	'7�@\�
�='h@]���En@^�28��^@_|����@`:���=@`��*C�@a7�B��@a����e�@b8���!@b�ɟ4��@c>��]W@c�M�k.}@dG��)ղ@d��n�K�@eUH�x\        ?��k�({�?ś�34�h?ִ�d�l�?�l
!K��?�g�?iJ?�Ι��e�?��9a�@�����|@-��ԏ�@
�R�I�@	���@��_=W@���S<@ʯ��K�@	$� @n��E��@!|�$SX@#T]�@�@%=�G\@'8�i�@)C3���@+^��lB�@-��ɫ�`@/�a����@1
�慱@23@��@3f��4@4�:�j@5�^̔6�@7*dE���@8x�����@9����@;)`�f��@<���*@=�Aؓ @?`/K�[@@i��@A&��^��@A��8=@B�c��?@Cm�ݙ�@D5]d�J�@D��u�@E�.Q٤�@F�*���@Go�o��@HD��Ɛ�@I[�@I��1ɬ@J�.}��!@K�I��%�@L���	w@Mw��|��@N^�Ņ�@OF�)�Zc@P�	�n@P�X�|�`@Q�Z �@Q�T9R�@Q����U@Rt�I\�)@R���@Sm�n�K�        ?��T�.?�|�6�?�/P��?傥���b?�U�O?��ߕoY+?��q�Z�@������@iFo_>8@�N�^I@�+V��@���/��@���@,�jM5@�%sj׵@!5a�&�N@#$B��1�@%'}|R@'=u��y@)f�[?�$@+�ԁ0�@-�!=hF�@0(�&���@1a��/�@2�F}S��@3�rn�C@5@���@6��d��@7���@9h����5@:��a"�@<V��&��@=�ȡ��@?c�y�G@@zP���,@AFĳ�I@B�.�<R@B�A_�@C��o@�@D��o�	@Ez�(@F\]�@(@GAhj:��@H)�ؤ?4@I���Y�@J���C6@J��c"@K�H��`�@L���:�@M�ʯ�O�@N߼R�@O��X*�@Psj�e�@P�v|B�(@Q} x�@R�PI@R�|,)u�@Sc���@S���V]@T.q�C��@T���Dyv@ULM��5@U��1��        ?� �wN$�?�B���?قst�g�?��6w�?�2X�B�?�Tڶ�?�V�^n@�o�%��@�`�\-@}�Q�@��p%�@��ȅ^@1��t@��W��@8� �@!9Ẵ�@#w .Ϙ@%�80�i�@'�Y���j@)�����@,{&K1�@.v� H�@0q`J @1�ŵ&��@2�H����@4Gt��C@5�(!r|@7@R��@8j��|@9��e�y@;U��v.q@<��g �@>`C�hf>@?�5���k@@�㏏��@A����@Bh�ɤ�@@C@'(k�@D<PܓD@D��f~�@E�&�,5@F���J	@G�#��,�@H�ТU��@I��Bq�@J{U�.7�@Kr\�A�@Ll1RH@Mi�����@Nj+��y|@On�P�~@P:���uL@P��tt�5@QFK��M@Q΄�z�@RXH�ϤH@R��tQE@Spi���@S��vZ�@T������@U��d?^@U��e]�@VF�EN^        ?�-�*�d7?�E�G�	W?遲��?��՝'n
@ ��pv��@a�\iI�@9`Q��@���@����@H�Q���@"��3@% Q���@(i��n�@+�'. i@/��'[�@1�y��A@3�����@5�5[�9@7�5p?�@:!���2@<n� c�@>� �o@@����9�@A��6^i@C*��G�@D|��m±@E�7z��<@G9c��E@H�R��^+@J�yfߞ@K��A~@e@M�dJ�@N�m6���@P�˾�@P܆����@Q���T�@R{�?L�@SP���/9@T(�ID�@U��K�@U���1�@VÁ7�D�@W��Q�~@X����2,@Yz�Ҡ�@Zh>�([�@[X�ؽ�V@\L�.J:@]C���@^<L����@_8b3l�@`� ��@`�c�1@a�ߦ�@a��K˶�@b&�-��p@b���-�"@c4=�2�@c��I�)@dFhp�P@d�gs� h@e]�ں�F@e���@N�        ?��dp�?�Ŵ)�?��A?� ����?�]���>?�DE��?����3@ zQ��[5@{؈9�@�C�OS�@�4�d��@I`1ࣨ@���@�� (��@�s����@Æΰx@���1��@!��C@#Z>ᵍ@%�o�\h@&�d��X@(���@�@*��U�#�@,�m�xE@.�t�]�=@0kL���@1z�&��L@2�	i�V@3����J@4˾	-�|@5��g�"�@7pP_qG@8NP��O@9�g0e�@:����@;��,'(�@=D�`��@>���7��@?�^#D@@�E�O�*@AD�,�@A�&�:`-@B�\J�P@CT��"2@D	$K>��@D�����@Ex0 �û@F2��)@F�9���@G��p�d@Hm��jX@I04HYb:@I�E�
�@J�)58o@K�ٛ��m@LKP��;@M�ԛZ@M�n�T�@N��PY@O�<+jf�@P*�i@P��-�N�@P�%��|�        ?������?��f�Y/�?���~��?�-�5U?�$�^��	?���y�?�1�J�w�@�^8��@9y�6��@'��\k�@���L�@�wXx�@�֛rt
@�&m�m
@�Az t@ HE{�5�@"I��I�@#�2b0/a@%�g=�W>@'�^��0�@*���4f@,)�M$ 2@.]O��@0PRN�@1x�ՔQ@2���7@3��zm Z@5=�s�@6b�`@7���1ٵ@9 ���!@:Ye�ha�@;�b_s�@=����#@>��̟1@?�X�GU@@���Y�<@Awe����@B8�]��m@B�&)�+n@C�>Q(['@D��'��@EZ��&�,@F)�b�j@F��j�E@G�:��8�@H�Dv�~O@I��&45�@J\�����@K;}YwX�@L���@L��W3E�@M��k�Z@N�<��@O���2f�@PR����@P�^�Gs�@QC �T�@Q���c)@R8v}��@R�"��@S1V\�LR@S��4*\N        ?�o�_+v�?�_x��r?�Q,K�`?�Ϳ�	,?��&� �?�A{`��?��i���@ޞ[B@����=�@��u��@� �D�@���b��@	��I@H�TI:�@����@@ �V(k�N@"~���@$n����@&o�'�@(�$�{�@*������@,ݸ�;R�@/$	_���@0�B��i@1�h�Q�@3+GR'�*@4m�1�BC@5��Us��@7�wF�@8a`��c@9�b�SDa@;&�a�?0@<����w"@>���P�@?�'���@@�����@AEP8��@B24�A;@B�.篳{@C�8ȕ�f@DsB/� �@EF=˚�"@FL���@F��D��@G�f�AE�@H�����@I��K�2@Jst���y@KY���g@LB�mqD@M..>���@N%�x��@O��Dmf@O�t/��@Pz_��OJ@P�8�c׵@QsC�s��@Q�~�ǿ�@Rp�w�@R�}?)�h@Ss;<�X�@S�p��@Tz&�uݴ        ?����x7?�(��J�N?�L��FJ?������?�J����4@S���D+@t�i�T@=��EC@�Θ���@���o�@ [4� �@#"�%"X@&��ҽ�@)/ow�8�@,p�ȇf�@/֠v(@1���_�@3��L �@5k�I\i-@7ar �z@9f����D@;z��jV@=�O�4}�@?���'�@A%� �@B,�V�@CXq���N@D�H��!�@E�j6g+�@G�}1F0@HI�D�;@I�q��{@J塖���@L<����T@M�;�T@@N�%�7 @P1M�u�@P�\�n@Q��C_Nu@R\0��kA@S4�G:�@Sڪ��@T����2�@Ub�K
�@V*Ku�w@V���'�@W�'�'<H@X�fIn��@Y^��jL@Z1WA|�@[�U)*_@[ܭ(�@\�j��@]�'˗�@^l�W��@_K�d�g@`�"��@`�L���@`�v�Go�@al�'s�@a�~���I@bUS0\�@b���q        ?���Z<;
?Ĳ�%�)?�Ý���?⟶?�m?�U��x��?��t=��
?����.�@ �
���@S[��UZ@	�f	��@��S�8@`jz�@�E�$�@�$�;��@%
e&@]��$3@ ���3@"����3@$�¥��r@&aT,�:@(:���@*�_��H@,�����@.� LC�@0��ݻ�u@1��	
@2��Y�n@4 ��cGY@5_�VAo�@6���6)@7��|�P!@9H���3�@:�ތQ��@<�j��@=r#á��@>��&�F@@-qI��i@@쭭�\v@A�;>T�A@Bu�)��@C>%0[H�@D
q�Wi@D����\@E�����@F�e���)@G[S	K>�@H7[��@IxV�1@I��m|�@J��j�Q}@K��H��@L�?�q�%@M�adGf@N�n�N�@O�e@w�~@P=�����@P�|	�p�@Q8�b� �@Q�y�z@R9� ��@R��ca�@S@ �/��@S�M�Jb<        ?�n6����?��Cg��?أ
N��o?�	۹$��?��\/��?�x��bl?���E�@1���پ@�ję@�m�J�|@4+;,Ǭ@!�-�ǌ@=r/It@��fd5K@�D9�@ �-:c��@"����e�@$�_G�4@&�Ԅ�1<@(�����>@*�h�]@-)	�1��@/wH�^@0�ب:�,@2"c��9�@3a�Lf�@4��[
�>@5���@>@7O��]�J@8�
��@:��x�k@;��m�f�@<��X
��@>p�q�@?��:�@@�wp��f@A�=�ש@BPT]p-�@C�E�F�@C�Gw#�/@D��~g@E��֑v@Fx!���@GVV��|[@H7�� ��@I���I@J>hwV@J�y"�@Kڼ���&@L���~�@M���
�@N����Q@O�w�Oa@PS���z@P�(�y�@QS��Ċ�@Qը�B@RX�:`��@Rݧ��@Sc�e�+g@S�m��@Ts�$D��@T��W�n�        ?�IYג��?��^�3H?�b��ѳ?�w1�^��?�PBFٻS?���U�?��e�#�*@�xn�R@h�G���@�<�{<I@��\���@�.ӥ,�@�̪6��@1i���\@�>V�=�@!9�P�9@#)�~�ea@%-��8c@'D�Ï�~@)n� ��@+�i�#��@-���T�@0-��Z@1e�	���@2���r�}@3�"j>~�@5A�l��@6�&��B@7������@9e�g4;�@:�]^�@<N�$`�>@=�W��t�@?UiC~�@@q���@A<��2�R@B
����
@B��+�{v@C�"�k�@D����%^@Egr@FF�K�@G)i�B.�@H�|J�(@H��3��@I��:|@J�N��@K�=Y��x@L�J]w&8@M�me;ܢ@N��L��@O�܁�	@PZ�y�7�@P�*�-�g@QaB��&@Q���&��@Rm���Ʉ@R�N˱�@@S�3���@T��B��@T�8E��)@U&QC�J@U��V���        ?��&�+�v?��K��f_?�.Ocr�k?��ݹ�?�{��w�@/�s=�5@��!b�@�^_�@���Y9�@ɵ7�b@!&K�~�E@$3M}s8@'>Y��+:@*��x@f;@.�e�=@0���U	-@2ƙT
R�@4ĢUO|�@6�j,�=@8�}�1��@;3tkJ�@=}�@H� @?ڛmR�@A$�3B�V@Bd�
,�<@C�g�ȇU@D����Н@FXoKs"@G�|��s�@I$���`�@J�1k8�@LY9Ejg@M�|~+��@Oa���@PWx� �@Q$q�ж@Q�\��N&@R�`�Z��@S��NJ5@T{R4�%�@UZ*`Zv@V<���H�@W"q����@X�1���@X�����*@Y��@.�@@Zܷ���@[�� M�@\�^l.�^@]�:�rs�@^�g�=�@_���`�Y@`l�����@`�A����@ayR���&@b��$�@b�4�0�@c����@c�W���@d49��΅@dĢ���@eV��{oc@e��)Y�        ?���?�~?��X�N1�?��);rϵ?��1�Q*?�J�!6�?�����b?��6��3@/WL1t@_���@	�I0ȁ@����˔@�S&@ݣ����@�����@�K!�@&��1@ �H��Qf@"���zI@$U8z���@&68z�o�@(&����@*&#m鄌@,4ID�!@.P�J�֤@0=�GO��@1Y���`�@2|�	���@3��zl)@4���Y@6�<e@7H�� p�@8�A=zf�@9��.l_"@;"n��K@<v��|�@=������@?0R��	�@@J�c-��@@���O;@A���@Br���j@C.��ֿ@C�U���@D�2�A9@Et�Y@F;3��e�@GG)�=f@Gϲ��j@H�l����@ImohY��@J?����6@K/I�>@K�ݯ�� @L÷�)�@M��ԙ�a@N{���K@O[��@P-�"7�@P�ك�=�@Q��g@Qv6h�D\@Q��[�w�@R`�uF�        ?�������?ǔB����?ض�t�?�̂�xD?�?>���?��w:n3R?��1�#�@B�8.@�H9�@	�ӻ�@D�{"	@5�0?��@Uf��@��XQ�@��Ͱ�@ ݻ�귵@"¸^�ʫ@$�Z3��@&�!8ɵ�@(�D+@+\��@-Y��т@/�?n09�@1	]2f��@2D����^@3�&�U�X@4��m��@6'�3���@7��d��s@8�ZƱb$@:RӞ&>@;��ª�@=@�1�	�@>��(��d@@&.i��@@�L��@A����99@B�ѳ8@C\����@D3ij�@E?6��M@E�vl��/@F�Hd1*@G��<u�@H�q~��@I�|t!H�@Jn#�w�@K^��QE_@LS
��@MJ?�@ND�!�C�@OB
����@P!Kȗ�D@P�0D��@Q&s�q{@Q�O~�ԭ@R1�7�@@R��y��@SBﹹ>�@S�ѽ{Z�@TZ3`K5�@T��5�@Uwmt_�        ?�ި���p?�&��U�?�eP�O?巊��	y?������j?�;�Q�?��z��G5@�	��,�@��� @��{�ŕ@�j�7*@�/T�K@�F.�p@��)�@��,}�@!n���m�@#d�����@%o��E��@'��_@)���H�o@,t{1�@.^�ܚ�I@0d��� �@1�3�ə@2ꂴ��t@4:�����@5�2��}\@6�GXS��@8]��_&�@9�"8J@;H�5�4"@<��*�[�@>R� �T�@?�h���W@@���l@A�V�fs�@B`�LD@C7g�<&�@D���f�@D�~�5g�@EЬȵ��@F�7���"@G�����@H�;יHN@Iv��q�@Jh9Ɣ�r@K]���@LT����@MP �s#5@NN"H��x@OOMߦ��@P)����]@P�Ns7HC@Q2W�3m>@Q���V�@R@��Q�8@R���H@ST��5��@S���5u�@Tn6���@T����h�@U�4��@Vi7�        ?��OD���?�X�U�?�B�x�/�?���A��?���Y��@6w��x@��$�-@Ȯ!�S@����AV@���*I�@!��܈@#�d���@'5�.�>@*Tb<�]@-� �d�@0��\�A@2����@4u�\r��@6w!r?S@8��3��*@:�z<բ@<�rt�@?%��|"Q@@�Q]�@A�ǋO&�@C(4 �@Dhȅޡ�@E��AT
@F���!
�@HU����@@I��t�I@K��p�@L��XS�@M���@�@Oh�d�� @Ps�p�@Q4�G��d@Q���-�e@R�G?}@S��8ۏ@TY6h��@U)_o��H@U�F���@V���@W�'Iwd�@X��C@Yb����@ZB�N���@[%1k6q[@\
E5?��@\���A��@]��a{*�@^�*�� @_����@`T κb@`ʹ��O@aH�e܅F@aĉ��E�@bA�+\��@b���)�(@c?%G%�p@c��.&B:@d@��߳a        ?��Y?B@o?�=��{.�?�Q1cr�{?������?�% ��?�o8�e:?�F�TnQG@~,��@�<7�x�@
i��2,�@o��@gz�@A���2@Du~��@n5i�>@�o��i�@!l�W+�@"�䒑"@$��4���@&���;�|@(���[h�@*�3�́)@,�Pq7�A@.��=)[@0��5�@1�[-� Z@2�q��k@4�Ắ�@5X���4�@6�r�{e@7�	�~@9/U��j@:�G��j@;��)W)@=A��y6@>���xRh@@;���-@@ƊJd@A����vh@BD"3�pC@CT}�k
@C�es9��@D�I{�W�@Ea��;�@F0`_7ء@G}�n�@G�BI��@H��Aǵ
@I��ݱփ@J`)��]�@K>:�C@LȤK[�@Mΰ/�@M�F�Q��@N�+��Fd@O�yK��K@PS�bA@Pʛ���@QCL�-�g@Q�&h�C]@R8%4�@R�E�>�@S1�â/�        ?�&��I�?������?�8�AT�g?劐��L?�[��6)�?�g�Cp�?��}W���@��u�@w%J��@��2�}�@�h$SZ�@�T�o�@�m���@C��6�@����>@!F��@@#8[s_��@%>mecQ�@'X82N��@)�JH�\r@+�=� {�@.��ܘ@0>'u%@1yb2�̊@2�d}r%2@4
2�8@5_<Mx=@6�ӆ�.&@8"�2$@9����@;�`@<����S�@>
�6�9@?��PF6�@@���w.@Ae;�Q�F@B7Hҭ@C����@C�F��m<@D�"�M@E��O���@F�`>On�@Gn���*�@HY]����@IGj[f�@J8���@K-m��6q@L%S���@M s�E�@Nȅ�q @O L�O��@P~4a3�@P�i�d�;@Q�E���@Q��-J@R+����@R������@SAC��$d@S�c�)[J@T] �[�@T���M@U~�����@V�}�))        ?��Hc�}?�T��J
?ٚV9ƕ]?��;�D��?�Ҧ���?�n�`��?�C����@=C�Y�@�ҍ�f�@@�����@ �z���@��}@[/{@�$Ϲ�`@uE<ι#@!��@#�.��
@%�|� �@'�w���@*�����@,h�5 �\@.�Z&]�@0����7@1�S��b�@34^�[S�@4��ӫ֍@5�\��\@7T� =�@8�.��-@:@;�V[@;��
l!�@=M��oϛ@>���&��@@=�#CT@AD��%@A�Y]�6@B��MC�9@C�Q�@D{��C�5@E`t_��g@FH��t$@G4���-�@H$G$�Uk@It%�x@J/VXc�@Kp��<�@L1/K�@Mjk�~@N�g�@O-A	Y�@Pծqj�@P�E��_2@Q d?h=@Q�.jY�@R7�E��{@RŹk~�q@SUs/�U�@S��0/K@Ty�t�jd@UT~�4J@U��S�|,@V<C��?�@V՜PQ u        ?�o���|.?ר/�h�?�����?�A� ׁ�@ )]�W�5@��^�@c�n�� @}��٠@?B��o_@o�ܭ�]@!��!�MF@$�H���6@'�{�/�@+�¶�@.����@1"z��^�@3[|�d@59��/S@7"M�!҆@9G����@;Q���@=�i�C	�@@\�l
�@AF���P�@B���$�m@C��o��!@EL }+@Fo5xV s@G� �DK�@I2�to�@J��"0�@L�"��9@M���wZ@OD�1�V@POf٦�@Q.o��a@Q�k0R@R�@]*K@S��t�)@T]U|�s@U6ܖ���@V�>0��@V�r@��B@W�g�ݖ�@X�k�TϦ@Y�rKr��@Z�o^ 8f@[�Y#N�@\r'��  @]f��٪�@^^VY9@_X�4��@`*�1գ�@`��
�J@a,  �v@a���18@b2��o@b�����@c>����a@cƑoF?�@dO�tY�@d�.�#�i@ee��WB�        ?����亾?âu|���?ԟ}��";?�k��?��b%�r�?��
��AO?�&g�j�^@ �8��#@����@H[�5 �@�w��g�@�o1t@wH�&�@0}��A@|=0�@C@E*@����@!)�{+ܥ@"�R��@$���j��@&L7@("�ȫ@)���~��@+�+B5ox@-�o��@/�#3RUw@0��#ϛ@1��Eh��@3
�:�V@4 4���c@5:}��Y@6Y��׼6@7}��F��@8�^�d)�@9ө����@;up���@<;��0e�@=v-: ɘ@>���?@?�٪0�e@@�l[f�l@AD��@A�`���@B���@CA
4`�@C�1�P� @D�2����@EN��[�@F �����@F�
��$�@Gk/�*J�@H#GW_f@Hܥm)��@I��~@JT�J�@KF2/�@K�O�cg�@L�ݦ�,�@MW��-�@Nb��@N�G|��/@O�����T@P9��=        ?�:��~ ?�@k2�?�]�$W�?��#�3��?��<�?�=�"\�|?�����@��;@� ��Ǔ@�:� 4�@j�TM@��3��@]��D@Y�YQ�A@ʓ�KVG@ �c���@"��2@�@$�`Q�tF@&�,l�Vf@(��j��@*�T�+�@-g�u5�@/e5���@0�G`k�@2��H�"@3]1BG�0@4��t���@5��EJ�-@7Qp�_@8��+|M@:(�0K@;���4=@=���@>��vOO�@@iⵢ�@@������@A��*��@Ba���A@C2�p���@D�Ql��@Dށ�+6�@E�|�A�,@F��>+�@Gy@��`\@H]��&�@IE��b�@J0�e�P�@K�	���@L�l}�@M;H�@M�]`sv@N�r]R�>@O�p�ӵ�@Py([��@P��D��@Q}KMk"�@Rv���@R�cr��@S�o?B<@S�/��F%@TƏ�X�@T���e��@U6��_r�        ?���?��M�f?��v3��?�|����?�!���?��}���?�7h���v@�*�n@C'�Q��@6��k�@�l�+@�y�,��@�6��@ذ��1@3-��;�@ Z��M�_@".��1��@$TTx@&w�(Ȅ@(4���1@*1����M@,] ]���@.�<���@0q����/@1��X?a@2Ӂ��G2@4�ސ�m@5R�S'�@6�{�	�@7���+��@9GdNB�o@:���4�@<~��v�@=y� �@>�
b��@@2�ᮘ�@@�q=r@A���bm@B{�A�R@CD�z+�@D̱��@D�8f|~�@E�Fmb�u@F�9O��@G_N%^�@H9��,g@I�գ@I�S�}�@J�F���#@K�����@L�D��>�@M�A��|@N���k�{@Oq�dW@P1��a՟@P����#@Q(�"�o+@Q��t�@R$L�tޫ@R�ifB�@S%�q&H@S�a�# @T*嬨��        ?�|�YE�?ճ�VW��?��Ε��?�}39�V?����� �@�R>mW@Ϣ��q@�o#�x@%ד$M@ۛr+��@������@"�J#�ۉ@%��Q~��@(��Snj�@+�_%��5@/&�Q�@17=D�@2�KR��@4�Y����@6���P�@8���P�Z@:��< ,*@<��a�*�@>���c��@@�����@A�2ET0.@B������@C��( �(@E{I�C�@FI�	��@G�	]2B@H��yL)`@J�د�a@KN�5��Y@L��]¡@M�Ve͈�@OH����M@PR���E5@Q���7@Q��β6�@RlOfL;@S$u�2@S����'@T��!A@UX \`�@Vf6���@V��K��5@W�'eR�@Xe����@Y-�XyҬ@Y�W��t�@Zĥ&c�0@[�݈�R@\b��&�A@]4�q,!K@^���bn@^�T�}��@_�����@`GW�@��@`��y���@a"�!?@a��4�1�@b~��q        ?��߽���?Ņ�hW�h?֞"Q�tr?�Y�8�3?�o�;H�0?����	��?�������@��ɇ��@#����u@
�*] ��@a��1@�t�Ax�@�(���@̎�H&@�z���@vƑ�-�@!��
���@#\�rX�z@%H��̌@'E�y��@)S�#�e�@+r���m�@-���@/�n��b�@1`l�?K@2F&ʙ)s@3|f>��!@4��AUWZ@5��b�h@7J�����@8�}\�@9�(�a�E@;W�)�@<��M`��@>,1~EyL@?�9�B�@@�Ol�L�@AM�j)S@B�O O@Bט潶@C� ��]�@Dm���7�@E=!Q�AT@F�ݻ�@F���);�@G��4��@H���k�@Iu����@JV8�:@K9w��z
@Lj��W�@M
�0@M�RE}��@N�;;�V:@O��lL�S@Pbn�nE@P�C����@QY]��%�@Qַ�if�@RUM�S0N@R��KS
@SV�sv�@S�C�2�I        ?��Z���H?����K�?��ȑM.P?�J��k?�*�^.?���Se^?�T�{���@o���f@(+�� 0@Nh���t@nZ��=@g��@�#Ǯ3+@����@e�P<�x@!�B"�@"�����@$���+|@'����@)&��@+]��;�@-�@ �j@0 II0��@16���	@2tG�,��@3�ȬB��@5	l
���@6`
u�}�@7�~!��@9$���<S@:�\_��@<��D�@=��4�"�@?�����@@I><���@A'��i�@AފF)]�@B�ZeOe�@C����p9@DX�j�@E1�G�e�@F���<@F�@�Ϸ�@GҼ���@H�`$D�@I�"���s@J���N�~@K�E��R@Lr��6�@Mh�L}�@Na۩܌@O]�aD$�@P.U�)��@P�5إ49@Q1�0�@Q�7D���@R:RH�K�@R�Я�ʙ@SH�%�@S��U� �@T\� vy4@T�y@{�@Uu��"��        ?�Iʛ�1?�R�&��?ٕ�O�>?��MW�r�?�T&��?�lkʔ4?�B>�ao�@Q5�L@�r�7b@D�d�ŉ@%U+��@V�ԋ@b����@�*���@����@!�ڽ�`g@#�]v�@%���@'��I8�@*$�$�Kq@,uw��(�@.���Y��@0���du.@1���a�E@38�7��@4��;R.=@5�]�"�@7Tt�!�c@8���wu/@:;��<�@;��.>@�@=C����?@>�|V���@@5�̀Z�@AY�Q�@A���`B�@B�1��g�@C�3AZ�R@DiݍH��@EL$��@�@F1����@G`�ק@HE�%S�@H��QC;@I�q
	@J㧳O35@K�?���@L�0	5�@M�r�a��@N��2��$@O�ʑ�U�@Pzg2���@Q�O�X@Q�*�"�@Rd�K�@R�(�8�@S-ukkwv@S�F�G�@TL�Ѯ��@T�hВ@Uq��M|@Vxu��@V��s:        ?���>*�6?�Ӌ��?�?�	�bq0i?�k��7]@ KMY��@�'Ж�	@�;hk@�hxp�@������@�9��@d@!�@�0@$Ȟ�ɰ7@(V�#��@+sG����@/�[�s�@1i��xD@3a�dS�@5n%��@7�R���@9��lK�@<�>�@@>`B(��q@@eAZJ�@A�J�L�@B�.e��@D8T�(�@@E�]�2�p@F�|�=��@HU�6�+�@I�fŘ^�@K:��!f^@L��JX�@N>Z���@O���l@P�|/��M@Q|�4�ձ@RM�m�@S"eL.�@S�;yK� @T�nA�	@U���p��@V�����u@WzǞ���@Xc�J5�@YNjG®~@Z<��Oo�@[.�'a�j@\#=+@]���s@^�]�6@_(6�z]@`	�B�@`��_am�@a����@a�.ͣ��@b �I��@b�v��u�@c),���@c�=��Uu@d>�F�\�@d�Z�.�@eYZ��}@e�1<��        ?�4��xD^?��GRbl�?��%ԥ�)?��'�s�?��x�Ql3?����=g?���07�@���-@UP�&�@tJŌ�@#T=E�@��ON
W@�m>c�@쥾�:1@,ۗ�%@��g%�@!��(@�A@#gV�לy@%PtM��@'Ju7c޸@)T��w�@+o����@-�����@/��{QF�@1}K-�+@2:�/i�@3n����@4�뵋�E@5����o@74	/�J @8�!I1,"@9�!����@;8���R@<��8d�@>ӝ��@?z�|B�M@@y���@A8�5̏�@A����'A@B�Hv�˜@C�vCj�@DVaaZ�@E$�:��I@E��U�h@F����e@G���U2�@H~G,@I[����@J<Q���7@K�)�GL@L�bl�@L�rpC�@M��,(�@N�%�sK@O��g�J@PV8���@P�?2�,@QM��j��@Q��"^�@RI�R�f@R��h�s@SKMհ�@S��jD w        ?�'X�R[7?�����	?�$5�*6?�U��V�p?���Og+?����?��q����@o��\�Z@	kV/�@�pmI�@^�bI��@���G�@���{>@j1v\�@ ��
�C@"t(�.�@$���R8@&3��H�@(jzz/�@*�ῃ�@-��'Fw@/�����@1��k�3@2U�����@3����_@5%! �@6v���p@7� ��w.@9dP�a��@:�]��4�@<uS�YG@>
4�L��@?���@@��Q�}@A}�Xp{�@BX�;�.@C7����@D��ķT@E��E�,@E�G~Ƒ@F�U��@G;�7K'@H��w��@I��$��@J�jfw�?@K���'�x@L��'�vX@M��9��@N�'r)tp@O����T@P|j5��!@Q��1�1@Q��O>�Z@R#[��2@R��M3}q@SE�3C�@S�j�^�@Tn�%�>�@U�"2�|@U�!߿3@V88x��G@V��[-5�@Wq|���        ?���j9C?���5(��?�G����v?�y/U��?�����r?�����@ 1�k�@�a�L>C@	����ʙ@��L�@��R�@�>F�b9@
�/e�@��B���@ .c�8|@"&6���@$4��p�@&Y#�N�z@(� �K��@*�%���=@-E�Im�#@/��R}j@1$�G��'@2tU���Y@3͖�xk'@50R4Ӏ�@6�i�w��@8�-�>@9�<���u@;��5�|@<�+��9k@>Ab%��3@?�Dq}(_@@���X�k@A�D�R��@B}�Њ+]@C_��L�@DE5h�u�@E.��-u�@F�Z�g@G���@H�!@@H��@�M@I�ƺ?�;@J��ފZ�@K����@MX9+YK@NI�";@O"��9@P���@P���lN@Q3�B(@Q½D��@RS��Z��@R���!�@SzDa�K�@T9z֫�@T��31��@UA<7��@U�D���@Vx��}��@WT��:@W�UE�a�        ?�8$"%�:?�I5��}4?��.�?��x���@ �{�N�@]Ƒ�	@1J/0G@��_�>@���25@6�§�@!��!�Z�@%�"X�@(QR�@+��7�h@/`�VEW\@1��D�:�@3�ȴ��@5��{��@7������@9��=l@<2��Lo@>��}���@@y�jr�@A�����L@B�![4��@DH�����@E�����@F���:X @Hbs�k��@I�>�ƚ@KẼ��x@L�=Q\*@NG����@O���@P��^q�@Q�p�l��@RR��N�@S'Lȭ�X@S���'@T�Dv���@U�o��1@V��2��@W��a��@Xl;!_�9@YX�1m�H@ZH�OU=<@[;���a�@\2R�B�@]+�fِ5@^(#��V�@_'��g@`Rt% @`�8~�є@a�~�|@a�z	Z�@b)˶�&0@b��(�[@c<�W�OV@c�I�\��@dUA�D�@d�%��N@esO�$~P@fb{iG�        ?�Qr��.h?��7���?�4���C?���?�ߐ�;��?�T�ϐ��?�!�K��@e��� �@�Db!l�@
A^C��@=��@H�ަ.@�/;@1@�bH@;�(	@�ö3��@ �����@"�:u#@$�j��ģ@&{۲O�@(s*���W@*y���d>@,�
�G8@.� ���@0tM�7�0@1�K�*��@2�Xr��V@3�T� �@5"![��@6^�ʒ��@7������@8�BQh
�@:;0̬�@;�b��X@<��P{8�@>P7�)t@?��MRe�@@��I��k@AM�g���@B
�$�(@B�VŹ��@C��+v�@DRG�ӵ@E]�u,@E�&^	�@F���T�@G��$$0@HU`T �@I*���.s@J~s�4�@J��4O�@K��| '�@L��2�@Mz����@N^�-��@OEB�lO�@P����@P�y8Qu�@QS H@Qz��ي@Q�a�@Rmhm��^@R�LU
$�        ?�]�;TŠ?Ǉ��B*X?ر��/?�ὣ�`?��*�?����o �?���`s�@C��M�f@�k���@�9���@Fd��Y�@8\�1 @X�W|�@�'5/b@�-Y��@ �(Y�I@"�Ai>-@$�g��9�@&ˠ���d@(�nl-/�@+\�r�@-^5�3@/�
���y@1���b@2Fn:�T@3���.�/@4ԩ��@6'�g�)@7���ܥ�@8�1�ںG@:OX|q@@;��.E�&@=9��9�@>�:$�a@@ د���@@�#C��@A��qzÈ@B�6�&[�@CR�6Q��@D'��|��@E ^4�0@E�d��@F��%C@G�7]�+�@H����-8@Ik�_7�@JV��!a@KESLsh�@L6�Ͽ�@M+�����@N#'���@O�C�XK@Ps@��W@P��Ar�4@Q�q_!D@Q�˰��o@R�ك�@R��Â�@S"gƘ��@S��L7+R@T4	�@T����G�@UJӀ��        ?�"[��?�P˾d�?ڧ|�?��m\�?�Yz�>�H?�q�i�mN@ Q��w�@�^N�w@@
�˜O@�Ȼ��@������@N��-@��F9��@;-v�)�@ �w��֑@"������@$�҈�ה@&���`�@)0�Q�@@+��@if@.
�0e�@0K�af`&@1��4!0@2�g$��@4]nb�`@5̶>:@7Eʨ�^@8ȇ�PO�@:T���JW@;�pK��@=�U!��@?1ZF�e�@@q2�5P@AN-'N@B/��'u@CXH+��@C�rx�X@@D�����@E�vi�Es@F�G�1@G�>	w @H�Np�<k@I�lb �@Jۋ?N�@K�s z@L�����@Nv��r@O(��y|@P��f��@P��:�W�@Q=^^�@Q��U�ie@Rd���x@R�T�J�@S����Q�@T.���@T�,�F�X@Uh��@V�<���@V�'.YQ�@WLW�s@W�G�xE;@X��-� �        ?�v�vqD?׼�YAu?��!�G?�W���$Q@ 9�ef��@څpN-"@�u�oTI@��?Ο@S]�W@����I�@!��Ҧ:q@$��%p �@'�K��@L@+��AU\@.�e�g �@1(9Vd@3A-C�"@5�w�z8@7%⍻@9Jv2;�9@;��B+@=��l�0@@%�*�@AF9=f)@B����yQ@C���W~@E�^9p|@Fk��#��@G����f@I-���`@J��=��@L!��a�@M��4�@O	���^�@PI#rz60@Q�5���@Q�%p8�@R����Ts@S|��cDf@TQ�
�%@U)���Ь@Vo��/�@V��� o@W�����]@X�����:@Y�F*�@Z}�c8�@[j��!.�@\[`��_@]N��}ws@^EU~*9@_>��2�E@`O��c�@`���?@awe\)�@a���K��@b"�EB��@b��&��@c-��]�@c��Oai�@d=q���v@d�.���.@eR G�<�        ?��G�`�?Ēĕ碉?՞ȕ?]�?�~h��8?� 
�ڬ�?��բ��z?�s^UDd@ �}��!@�@'�n@	�;찒B@�[��@ێ�,~@�3X�D@��lyI�@�F"d@Һpl�@ ��z���@"R�
�D�@$��F*@%�a�*��@'�v�u��@)�߯�-�@+�L��?�@.no�N@0}#�N @15���i�@2X%�4hm@3�H9�=@4���̾@5�L9"�@7$q�	KW@8g��Ƙ@9�U�1�V@;!���/@<W����@=��t���@?�;8 �@@>WXQ��@@�&{��F@A��M�c@BkaB��g@C*�Ņ�0@C����ǐ@D��h-�@Ey]���@FC�9W��@G����b@G�,��>@H�U�!S�@I��8�@J^Q�wE}@K8����@L`*���@L� Q��h@M�TXf�@N��7�.@O��� �@PC;	�@P�����@Q/24?A@Q��3ܮ�@R�{��@R��kT�        ?������?ǎ� ?س2��?H?�A��l�?�#+��4?���`0T�?�F�`�@F"<Ka>@�g]�F8@c��(*@JE�"@<�w�r,@^r3��@��ˊ�#@&��Oa@ ����2@"��k�y@$�J �$�@&��hV��@(�K�-�@+!��m�@-e�kS�2@/��C}@1��,O@2LE0 X'@3�Tz��@4ܛЛ��@60�I��1@7�U�yq@8񊾖2@:]�����@;��q�3@=LN/S �@>����f�@@,����@@�0�y}@A�z��p�@B�V!�@Cd�*���@D;���@E�^vD	@E� .}�@FԎe��@G��r}��@H�~��P�@I�Vqfʯ@Jya�`��@Kj��Ý�@L^�*im@MV_9@NP�#�<�@ONd~0�H@P's�8�F@P�0uW�@Q,d��j@Q�g��(@R7%"��&@R���� @SG�T���@S����2�@T]�K�i@T����n�@Uyc�h�        ?��-��P%?��ܝP�?�]�/Z8�?屰��_k?�}A|�?�7{KZd�?��)��5@�Xh���@�����@�?��jB@���_@�㗧e@){����@��#�B@8��*��@!���_�@#}���J@%�K�#�@'���Q�i@)���5�@,:]�Q5�@.�3rn�@0�\�	�W@1ʖ�O��@3ܱ��@4l�����@5�/S��@72�<��X@8�Ţ�H@:��F@;��.A�@=&�;uu�@>��3�lf@@)dդ�n@@���H�S@AϹL��@B��`��@C��V���@Df�b>�j@EK��Q`�@F4$�
�@G f2�wc@HV���@I바@I�A2G@J�ި��@K�)oGy@L��z`�@M�9b~J�@O�3@P����@P��q9�S@QL=w��@Q�pCf�@R1;��]s@R�����,@SO�?��7@S�aM\J�@Tt�=���@U	xm���@U��s�O�@V7�֢�@V�bC�.        ?��o�&�?��{6�6?���C";?��rp��?�^�==�@�=��@�����@�����Q@�p�ց@���Y��@!!Q$0@#��|)@';��x@*D��ď\@-��/���@0���0%@2�-�T�j@4p�2��@6sX�M��@8��G�p�@:��]~@<�H��5�@?-8+^&�@@�����R@A��"F�@C2��{@Dv��r@�@E�)`kX@G�u}�@Ho�Y��@I�oĞ+�@K8�	�1�@L�]�c�-@N�8w�@O��`��@P��!ݘ@QU'���@R�����@R�v��@S�m���j@T����D@U_�J=�x@V8!t\2�@W��U�@W��6���@X�I��@Y��HΕ�@Z��L.@[���:@\u⭨r�@]e�Rq�@^X8V�x@_M���@`"���4@`�4e@a�Z@a�j��@b n)�\�@b�"j�W�@c'޼�+@c�a�儣@d2��@d��y_&�        ?����r�M?��5Bf� ?��t���?�9�*D?�x�CS�I?����(?�Ħ� �H@*��Ȭ\@Y��X��@	��$��@��ఛ^@K%?(�@�g8.@Ŧ�:��@�9�JA@�s@ �jU]�z@"u�j�f@$BJ�,��@&���5@(	����@*$mP�@,
a��C@.-W�7c@0 ���Hm@18#'�G@2V�r:�@3z*�+��@4�p�ʾp@5Ժyhig@7
��e�@8F�cj�@9��� �C@:��V��*@<��/��@=n�WGx�@>�[�U�@@{N�B@@�Lb�@Au��ڷg@B+@���7@B�K�s��@C�����@DZF�c��@E!����@E�-�P�R@F�`���!@Gb��},]@H*P��@H�0Q~�@I����@J�i6Nk�@K[ģ�!3@L-��@M )5%ck@M�!W>��@N���1D@O�u�`E@P/a7E)�@P�d��(�@QC~�@Q{�a��Z@Q�;k�        ?��Hf��?����R	?�&D�g"?�}�v��?�SIs?2L?����ѭ�?����_�@���E�@mt�K��@����j�@����A+@��RW�@ت��Ot@9�Z:GZ@��6�O�@!@[zA@#1����@%7&T���@'Pa��o�@)|�@��'@+�f4@.���r�@08����@1s7�p@2�pL¹G@4"	I�@5V"mq�@6�I��$�@8t�o�9@9��t)t�@:�LQ	�z@<q�.?>i@=����t�@?~�3���@@�2���@AT���L�@B$~�c��@B���#X�@C�ڄ~d�@D�4��-�@E�� ��@FhM-��@GL|�E�'@H45W���@I.���@J^��P@J��Q�DW@K�Cj?�@L��?O>�@M嬙��@Nㄟ�߲@O�j�.ۡ@Pt+0,�@P��i�f�@Q|�^^?4@R����7@R��{�U@S���@S��}ë�@T*�!�@T�|αa�@UGf���@Uׯ4���        ?�ۘ٘��?�K�yŌW?�~�:�?��aY?��	ZT0e?�a��8?��:jO,4@��|�@�ܾ�>@�B�H�@{��-@h�2C�@�����@\��P@�#U�@ ���@"�|/w�[@$w��}��@&y	��hH@(�2�c��@*���x�@,��$�j@/+��l��@0�oA�@1��&@3.�{.D�@4qm	(@@5�r��5G@7߄V��@8e���P�@9�nrTa�@;,O�m��@<���<@>����@?��!��@@�����@AJ���@B\�x@B���3�@C�s��Bq@Dz|Z��@EM��e@F$ygl�@F��6KY@Gڪv��#@H�c:%�@I�da	��@J�|1��@KiY���@LS�ӤD�@MAA92��@N1=T =B@O#�� @P��e�@P��;YXS@Q�r�eD@Q�8����@R�9k�@R���bD@SP)��@S��A���@T�� �{@T��t�Xa        ?��4��
?�S#ro1?�6�ӯ�?���#�MQ?���A9�n@1q��|@� .�9�@�˶���@��j�@�IKXH@!�+:�A@#�q<J;@'0��@*K79���@-���~=@0��F��@2|yZ&��@4h���rs@6f�)���@8u)����@:��r�eT@<�'�?��@>��1-@@�-��K�@Aӿ[�@Csr��Z@DD$��A@E���1*@F���h�@H���)@Iv��'@J�΍50�@L5���@M��,A�@O���Y@PA��w�@P� �A��@Q�IW�;j@R�V�c
@SH��4�@T���.@Tۀ��k�@U�	�ֶ�@Vyx}<�@WK�Ɩ�d@X h!��=@X��ym�q@Y�0=bM@Z�B���@[��;A�@\k^�P9a@]M҃F�@^2g�`�H@_)?�@` �:-�@`vF����@`�~��g@ac�03�(@a�MK[6^@bU��7�@b�ĔlP@cJ���C�@c����u_        ?�y7�D}?�.� ��?�A�Iթ�?�	(��\�?���ʀ�*?�b���T?�6Z��@#@s��!b�@����
@
YZ�A�@[7�}N@Zفk�@2-5���@1�`P�@Wkd���@��S0@!T7@"�Y����@$�78���@&�9��;@(���@*����%)@,��E0}@.ϰ�T�u@0��j@1���*E@@2���FW^@3��>�J@5/M����@6kcR�z@7�����@8�ݡ�8�@:F�-ȃ@;�d��T@<�ǽI@>X ��N@?�Z��M�@@�15�79@AO���4�@B�r�7@B��U�XS@C��t��@DQg�?@E*���@E��r�6�@F�R����@G}@�)2@HN�^��@I"�\�4@I�����I@Jѹl�]@K���;�@L�O�<%�@Mjo��@NL 'b@O0fμ9�@Ppy��@P�@@P�%`Q@Qk�S�@Q���@R[�I��+@R���j�        ?��>��T�?ǆ E4X�?ا��7�-?��J4�?���`&yX?�zi��1�?��8Ɔ8@1�W]�@٭&���@���kxB@2���@ 	��s@;}�cW�@�o'*p�@�>��7	@ �B,��S@"��#{�0@$�K����@&�];�@(�~�6�@*��*	@-2?Qϗ�@/��L�@0�5vX��@2+R���k@3l�9{ϓ@4��S���@6KMV@7`���~@8��ڂ'@:(����@;�W�R@=@N���@>�fˌ2@@	ZJ���@@ϊ���<@A�;��`�@Bfe�Le@C7J ��@D�*"@D�s��~@E�@+Hc�@F�g���@G|�+P2a@Ha��Dw@II��*��@J5	�-l@K#���I�@L?���@M
�jw�@N�/X�@N�ވ��@O�!�g�@P~�^�-@Q 3>��@Q����='@R�uy�@R��:a3@S��8S�@S�����n@T*87��@T�\��^@UC=	
	�        ?���-��?�2�KQ��?�t�\��?��V^��x?��5�W��?�N�0��"?��N��@�B�Y@@����K�@¿���@���r@�_�(@A��ͫ�@��W�dX@U�hmj@!��vۇP@#�ޡ���@%��;E@'ı�[;@)�8���@,K<<,8@.�X�7��@0��Q�@1Ѳ>���@3R���@4q�(a$�@5�J�g�@74� �5�@8�@�[ѳ@:��Kt�@;��^gĒ@= +>��A@>�pz�`�@@#Y&��@@��Ɛ1�@A�d5{��@B���Kn@Cx����@DW�I��W@E:Y[�@F �}c��@G
�R�1�@G�&�.��@H�L���U@I���V�t@J�7�G�m@K��r+g7@L����K@MӟA{
�@Nٌ���@O�� �Q�@Pw����@P���R	@Q�!c�@RCy��@R��9��@S/F��G@S���_�@TP����@T�g�̖�@Uw�Qy@V�&j@^@V�
���        ?����?�cDQl�?蒰l�?�Ks�<d?��$1��@�?��@ir*�4@D�%��C@�!���@��9&�@!N�a6i@$C �$9�@'e��/s@*�i�͌@.-{=_�@0�yM��@2��}�6@4�?Q�pI@6��z�@8�>7@;�L6ֱ@=R��h]�@?��>)�@@��s�f4@B6� ^�@Cu|�CcM@D���F�@F	�{�@G_TN�$@H��ˎ�@J�����@K�Iʽϊ@L��F���@Nt���@O�&��@P�<#�;�@Q�-�t��@RKM�C@S�}�_=@S���B6J@T�ZLD#@U������@Vg3�K;�@WB�R`��@X �Fw�@Y�C��@Y�s��@Z�!bv��@[�aL.4�@\�H8�w�@]���c��@^��z�rS@_t�T*��@`5WRl��@`����'@a/1��@a��� �@b-�M�q@b��o�@c1t�u�@c�qgѦ@d8��Wb@d�a):y�        ?�'����?���3G�?��Ƞ�?�׀2���?�V ɽ�?�-���8�?��w�.a@F�U��@}����8@
��ʵ@�DR��@.�F%�\@ ���U@�
�DO�@���A@a�̙�@ �ErP�@"��8q��@$�wW���@&iXo�>@(_��ƒ�@*e�vl@,z�뫔@.�c��ƌ@0h!Au��@1�&B`@2����@3�r	�g@5�`��@6KH!�}�@7�Wi��@8Ӱ'�ϰ@:!7IJ�B@;tӧ�-f@<�l�W�@>-����@?�5��5�@@��O�@A7l��@A�4+�k@B�W��
@Cp�kO�y@D4�iw�@D����/�@E�SՆ��@F�X`F��@GZ�M��@H+|�=�@H���7�@Iҽ��@J�L�c@�@K�I�L3�@L`�;H�@M?q�gk@N �>�:�@O
�O�@O��
��@Ph��b�:@P�.mHdF@QT�>S��@Q���-�@RD�[��@R�j���        ?���O�?��{ޟ��?���'\?�p����4?�HPO>'9?��`��ɡ?��wh��@�e�oG7@VJx�Q0@���P��@��d�@�h���@��>�<@���� @��P
H�@!)��ڭn@#T�,�A@%����@'.�r	�@)U���O�@+�+G�Z@-�D[��^@0�0���@1T8q���@2�����*@3۵W90a@5+���@6�<KO@7�?&R@9I�*��@:���n�@<-���78@=���j�@?.���D@@\�z��@A&�xU@A����@Bl�@C��U�t�@Dl~�d��@EFv��?@F#�T�m�@G?Ǜ�H@G�O�@H��5�@@I�'JG$N@J�{����@K�����@L��#��@M�27Iי@Nz�t�+�@Ow�@$=�@P;�r�x@P�	%:�@Q?�8��1@Q�ð�@RI�� �,@R���L@SYq�^�@S�d�.��@Tn�+�Yq@T�~2�O�@U����~        ?���?�q��3G?ٽ�Ü�=?���z��?�;숥�?���`�?�|RE�@�@1����@	����@�:5h)@)�����@H^,�@�,;|�p@�S�,@�}=�@!��v}��@#�J��RD@%��N\@(+zM��G@*r7>�	@,�y�Q3@/<�\���@0�B�0�@2+U��[j@3�9o9��@4ދ���+@6F+��fs@7���sn�@90�r��@:��fr�@<?Fʵ}�@=ӡM,3
@?p��D��@@� U�\U@Aa�o-h@B<�n�@C���[@C�\=2�@D�����@E��KM�@F�ˏ��!@G�g��� @H�ɬ���@I��o�@J����3@K�9��nl@L�_)�ڊ@M�"��(o@N�|4~�m@O�b�&Y�@Po�7�@P�\���@Q��߅��@Rw4���@R�4��@S:_�lO@S�T�c��@Tc�Q^2�@T�*jRf�@U��I��@V.q:ǅb@V�s��-@Wh���        ?�1y/+�R?�^�[s?�Յ�(*?� }^<>�@ I�?��@�����@5d�_@`2���@}�vN@C^_N�^@!j����@$e	���@'���@*�뿿i�@.h:;�M�@1
蓵�@2�=/�o@4�JM,��@7KW�h�@9#x]���@;WS�hLP@=�l�h��@?�[Ф��@A,`|,I.@Bg��f8Q@C��U�Z@D���>�@FHI��Z@G���@I7L�m@Jk��N�@K�"�1�@MQ�O���@N���;94@P)s�h�y@P����-@Q�K�T�s@R�}�1�@SQ�>�|@T#�n�t�@T��D}�@U��q�n@V�+��0�@W�6�M�@Xk,Q�z�@YO��e�@Z5�zW@[1��v�@\w@�܊@\�{[�(�@]�6���@^�n�ο@_׵mK�@`h�J��@`��&݅�@afX�ZO@a��3�@bi͖m�@b�i�"e
@cp�����@c���h7@d}Ӝ���@e�u�        ?�ːEK�?Ĥ�݉E3?ղ�-�l�?�m��ap?�9��P<?��f�?��+3[�V@�o��:@,���nG@	�B/�T@�U2	#�@�v��g@�M�P�@�3�E*�@�_lN�w@�;���@ ��?�_@"ZH� ��@$&�g��e@&����@'��Z�@)��r�@+�h�IՒ@.��r@0#���@1,V_2O@2J�j�z�@3o�{1U�@4�-jǔ^@5�uR��@7��Y��@8@�.��$@9��Q��@:�]��X@<���8�@=nJ���@>�ju '@@�H�ia@@���!�i@Ay,K���@B0AN�@B��;9@C�X��A�@Dc���d�@E$-˃b�@E���m�@F�B����@Gs�KX�.@H=DHB%�@I	�<}�@I��Y��[@J��ϴ��@Kxˢg��@LL��"@M"����@M���u{@N�w����@O�06�ܰ@PF㱥��@P���%�@Q'6O���@Q�����@R	~$f�        ?��dP�z�?ǡQ��?��Y�^`^?�(�̙�?��d��G?����m?�*ۜuh�@U���3@
5H�@+�����@Z���X�@Q��G�^@w�鱏1@���{[�@K���%�@ ����@"���_V@$❠窨@&�� �7�@)C~P4�@+O7?fT@-�c��8�@/�p����@10ő�q@2n�:�@3�\�Pk�@5&�}�k@6^6�!�@7�q^e�,@9&�����@:�Ci�N@<@�Af�@=�L`�0�@?˷@@SL�Ƅ�@Aج�\@A�&����@B�,>��@C�ݳ
�@Dr1j��@EP1��D@F1��֖]@G���V�@G�)��a�@H�-�'W�@Iڦ\���@J͍Ä6A@K��ӹ@L������@M���0��@N���5+�@O����^c@Pb�/q��@P������@Qnf��tY@Q����~g@R�rK��+@S����@S��"��@T'=h�H@T�A���@UH̚���@U�ڂ�M        ?�Q�H�@?ǂ�v��?غ�I(�?�%Ӗ�z�?���1��?��F~���?�+H8�l@U���22@��o�@(X	�:@W�2 @Lf<]�;@o���@�R���x@;�KCl�@ �\��69@"��o���@$н�'Z@&�k�Dժ@(�`�vn@+-"Bb�@-o;�E'b@/�D�}�H@1����)@2L�<yh�@3�Ģi��@4؃E���@6)�0`7�@7��dW��@8�l��#�@:K,��-�@;�}��0@=0��S@>��Ƴ�I@@^x|j�@@ݗ�Uuk@A�J�V�@Bq���:@C@ޑ5�`@D���$�@D�9g���@E��~u<�@F���Q@@Gzdf�@@H[V}?e�@I?~�^˔@J&�C�2Q@Kl9zY@@K�oY��@L���/@M޼���@Nӑ$K�@O�M)�@Pb�9)w�@P�����@Q`TCzj@Q����@Rc��h@R�7� ��@Sj�w�2@S�v�<@Tv���<�@T���'�        ?��@�4u�?����M?����D?���ss"�?�M�
�u@��8�@o��@@��Q�H:@z����@�]��"�@ �nb�E@#ځ-�O@&���]0@**rD"ܢ@-�4�%�@0���~�Z@2iy�
?@4U���L6@6SE��@8a�'���@:�.�0߅@<�l��¸@>�H,���@@���?�H@A�#��Ɗ@C�a�4�@D?���w+@E�m�J�V@F�}P�@HI�1[}@Iw��H�@J�gU�@L:̵yV@M����D@OԽ�@PFf��!�@Q��~@Q�*����@R�Võ�s@SQNG���@Tl�b�@T�tcь�@U��,8W@V�E�B��@W\�t��@X3j��a8@Y�=�֌@Y��#�g@Zƻ�som@[�H3��@\�%!�T�@]oI�h�@^V���+@_@CbC�@`S��@`�����@a�y�;�@a}��F�L@a�e��@bs{� Q@b���n�@clO��@c���J�]        ?��ȸ��?ć �-	d?Րx�y?�ojq��?��I�p$?�O�~\�?�PD>�q�@ �y�9$b@�����W@	m�ׅ�M@<�ִ�@���(�@h��az@F���d�@HR+"@k��t@ X9]I@"	��?f2@#�c^e�@%���*@'v��/=@)a���@+Y�f��v@-^�b �_@/p��JQ+@0�E#~Z�@1�Lߕ�s@2�;�j?�@4�ל�@5>L�(#�@6j3Q3��@7���oX@8�>���@:;�6��@;Ol:r��@<��~��@=���c@?1s>B��@@C[�@@�k�@r@A���n�@BQ���5�@C�0%q'@C�X���@Du+��@E0(F�K�@E�ma8�@F������@Gn��[�v@H2WK�_r@H�?
���@I�;�ƴ@J�F���@KVT����@L$]��0@L�V6�u&@M�3���@N���%@Oow��h�@P#e��9�@P��5��-@P�VnEK�@Qk�v�=        ?���	=?ǌ��5?د�Y��?��d��?�Ю��?��*���}?��Jo��@<��.@�@��2AB@��È|@=�U���@,�"1;@I�@����t�@��/�@ �vo���@"��󢗿@$��R�@&�I��!@(�ȌP�@*��}(@-8��T��@/����3h@0��7X�e@2+��T�z@3l���@4��*.L@6���@7[���L@8���@:!jI���@;�l��_f@=�����@>��l@@@ae͸@@�p5˳H@A��UN@B\
-:�]@C+[��2@C��J�ě@D��.�%�@E��0���@F���@GhB��UR@HJ�j1,F@I/�I�Ԇ@J,.���@Kg��}@K�Q,]@L�_Q�@M�{ fq@N�3�<@OƸڥ��@Pa�J�@P��|ק@Qa� �fy@Q�*^��@Rg�e0��@R�[	��@Sr���P@S�����@T�{oM�@U�.��Z        ?����8o?�1'R�?�f	��<�?�ܽ� 2�?�wUk��?�M"��C$?��d�y�'@����@�6��x@���@7^�xX@�e�j@	5r�{�@G�.t�@�6�9�@ �_��@"z]��TK@$g��s�0@&g����@(x��K�@*�9P�{@,�Vb�'@/ӟz�w@0����F@1�SDn��@3�ϰ��@4^�����@5��zB @6��6'=�@8M]�F��@9��6'@;�Lj3�@<z�o��F@=����@?d�J�l@@q���T@A3�|Lh�@A���y@B��� z@C���*��@DY7�h��@E)`Ȧ @E� �\:@F�h8ٮ#@G�/`WBM@H�m7I7@I`�L*@J?)��3j@K �L	��@LXLm�@L�b���@Mҫ���@N�'���@O���q?@PLF�sf�@Pı�s�J@Q>"H[�@@Q��ZKo�@R4 7���@R�d �-#@S-�N��@S�w�� @T+4a�        ?�Zo�#�?ֿu���?���v��?�n&�.�?�SY%7z@����h�@)��M�@�����@;V�J�@-����@ ��
�@#�X�m�@&�3b�@)�.w�t@-��)@0L&���8@2�9��6@3��) B@5떨���@7�#J�-�@9�#f�1�@<!����@>H�.���@@B@u�O@Ag�#{@B�����@C��@D��H��@F<�R�x<@G�[E��@H��aWk@JT����@Kv�pZ�%@L���ȫ@N6��?�@O�K���@P��,�{�@Q@x���@Q��Nv"0@R��L�@S}���@TBJ%� @U	@]�b�@U���5�j@V��ef_[@WmC8�A5@X>5��A�@Y�HeC@Y�SN���@Z�lE��@[���% @\v�d�'@]Ud0��{@^6u0�]�@_�hu�@_��h��@`s����@`�§x�g@a]c38"C@a���LGd@bK�?��q@b���"m@c=Y��*        ?����u�X?�l_����?�p~'X�B?�S\�P@N?��ǳ�;R?����?�'���&�@ ó;%q�@�� ��&@	GR�h@�D�/�@��𦚯@J�M�B�@$�a�(i@"�Z��@@B!=Y�+@ A�X�@!��umi�@#���֕k@%}���;@'X��<�K@)Bx*� �@+9�;��@->�Qb@/O_W��^@0���D�{@1˫+:�@2�B�ʦ@4�,]l@5.>���@6Zz	Ř�@7�3�l�K@8�P҉/�@9��uU��@;AP|il�@<���s@=ӿ�\@?$fk>6 @@<�!b�@@�fv)&@A���9B0@BKI%�_k@B�P��:�@C��r��@Dnɛ�-@E(��f��@E�omt^�@F�U�ibP@GeR�f�@H(YO��@H�`�.�@I�^`��@J}G1��@KH֏��@L��ߔ@L�1z�T�@M�|W�c�@N��;J-@OYmV Ȇ@P�,`��@P�/��[@Pﴎt�@Q]
%-'        ?����1�?ǟ~�bz?��z����?�#]q��@?��bVn1?���M�ң?�"�>FP�@P����u@�{f/@$��-wZ@W 13'@Ml0K�@se1�ȴ@�%���@G��	g@ ���#J@"����@$���- �@&�#\tu@)��jK�@+O���@-�щ܄�@/�d���@10�0���@2p+N΅�@3���g�@5�J�@6`(ߐ�@7�in(T@9(�}�Ֆ@:����X`@<-���K@=�l�fC@?,�E@@R,	1@A����@A�K[��@B�@l�,@C����*y@Dk����,@EHR���N@F(Mw�&�@G����@G�p�r:�@H܃���@I�����@J�x�bf�@K�G%s�	@L�B��&@M�d��t@N��O�jE@O�8Yp5@PP7�cBJ@P�uM�@QX5-��@Q�r��fS@Rf*:��V@R�V�~&�@Sy�[�@T�ئ�@T�nB��~@U"C̃j�@U�y�a�\        ?�#�w�C?Ǐ�C�?��u�?:�?�1�n�yi?����Fr?��
�t�8?�<����@`щ�_�@���o�@9��o�@bjUt؁@YAk�.�@G�s�s@ґE��@Qk�!��@ �*u�yD@"��n`\-@$�K0�@&�Yդa�@)�Ό��@+I�OL8@-���N"@/�Kk�@1)����@2f���@3�����o@4�Vݨ��@6P$o�z�@7�ͫ��@90����@:�/�X��@;��k�cA@=p��[�b@>��&�@@>�F�3@A�H~@�@Aӓ���@B��5��V@Cu����@DK�5�]�@E$��G@FJwZ<�@F��	�d@G�X���@H��X\3�@I��.���@J}.�/�@Kk��[@L]9��Vi@MQ��l�@NH��J�4@OBڸnv@P�}��@P�� ���@Q Ӕ�@Q�]Ьi�@R'A���t@R�|��?@S3	���@S��r@TD����@TΊ����@UZG��o        ?�*��E�U?ֈA�w�?�*b�F�?�7�o��?��.�j�@�Ii��.@�am�jo@~����@��i���@�@rܴ�@ ����}@#e�`1�@&b@F���@)�zE�Q�@,ӴUo�@0"��0/�@1�:���@3���S[@5��L�@7�'�1�@9�g ��@;��u��B@>P84͌@@��~�@AB*�%�S@Bl�+f+�@C���Ŗ@Dէ7�S�@F�qf@GX{��(o@H�2j@�@I��f� 5@KJ��\�a@L���R�@N	�`*@Op�D��@Po�O]b@Q(U��Y@Q�M��^�@R���>i�@Sd�!)@T'�����@T�����@U���ߩ@V���6��@WO3�q`@X�lD5@X�E�`�o@Y��m9��@Z�����A@[uy{捆@\P�[�v*@]-�z���@^)�� @^�5�|�@_���
w@`[�'~V�@`�Z�_��@aD�99@a���/=9@b04��@b���xG/@c 'QvZE        ?���R��?��b
�w�?������?��#����?�u[�g?���{�?�j���@ I����@>]]�K�@�5�+��@0�ٳ�@g���@�B7�K@t�:�W@X����@^�m@�do���@!b[W�"U@#0@H6@$���*z�@&�1 ��$@(s���@*Y���U@,L*MG��@.KB���@0*��wV�@16a�Q�/@2G����V@3^r����@4z���ht@5��qzo@6���L@7���@9"0K-�@:X�~�.�@;�С�d�@<՗ړ�@><Z���@?e��(�@@Zg��_h@AP鮋�@A���l��@B_��
�@C����@C��YbYk@Dx����@E/^�*�@E�����@F�~.Ǆ�@Gb1���@H!�N��@H���:@I�~�$d8@Jm<I6�@K4���>�@K��޾��@L� �sv3@M�Zɭ9�@Nf��E{�@O7�@��@P/�̂�@Po}-��@Pڭ�j�        ?�Bb��?�VKŰ�g?�xD�l|?��R&��n?�d�gc:?�U�����?��2�g�{@[��lt@��LG�s@Ȁ�'��@��/2�@	�k�[h@"���\P@hX�K�@ؑXC�.@ ����vB@"���V�@$��W	��@&�\L\�@(�{ ��@*����@-�Ko�@/b�>yv�@0��Џ=�@2w '@3W��x?&@4�$d�2@5���LB@7E��-4I@8�'�V�.@:
0)�@;w��:�&@<��i�@>g�q��@?�?2��@@��M3I�@A��I/�@BMT��s@C�+'�@C���X$d@D�N˪O@E�bϜ��@Fvð���@GU2�Z3K@H6�����@IAD�@Jk���@J�i�r�@K�Ȱ�.T@Lɻe���@M�z��@N�����@O�7���@PR��j�@P�U��.p@QQh-�9�@Q��^*��@RU^�H5�@R�8�Z�N@S^K4^��@S�'{O�@Tl��"�@T��V�         ?�i���s�?� U���M?�4a���?䳂E��?�u�gP?�#ӒU��?��X�[��@�����@��t@h�@��[��@���@�c$�q&@�1TLE�@'w�@�@��Z�p@ �Ӥ"X�@"hB�KCm@$Um��n@&T�C�]�@(e�U*��@*�ػ��@,���On�@.� �a�5@0��H��@1�6�C�@3��ww@4Th�O��@5��oA@6쇏@8C{k'��@9��8"_@;����L@<rw�"t�@=�ٔu�@?^i�-(�@@o_T�@A28��i%@A�~ �h�@B��[<b!@C�V�r#�@D]к��X@E0C��?�@F��Ƥ�@F���� @G���j�[@H����@Iw����@JZ�@�6�@KA	��7�@L)�vm<@M!p>�@N���G@N�w��3@O�`�x/@Pm���Rs@P�����@Qg)pW@Q�`V��1@Rdـ�"@R�w���@Sg8��@S����@Tn�Ux�        ?�Kcn��?�����S�?����?�+e�J.?��E(7@Y���e@�m��N@���.@X̨���@Y��*@ �~UR@"�J��V�@%�h3tn�@(�ߦ!N@+�ȂI��@/Qu2�@1d���@31qv;�?@54?��@6�Z5�4@8��@��%@:��Qh^_@=Z-)�@?>��>bn@@��Os�@A�t�C0�@C� �i@D/�p���@Ec��4j@F�=���R@Gަ��I@I%�@Jq@R�w�@K�A5K��@M��q>@NxC���@O�:թ�@P����V@QXz�&��@R�<.!@R����Bv@S��&�.@TM��]j@Uv����@UפNR�@V�E`ۏ@WkP��/@X8���8
@Y�ذ1�@YڞԳ#[@Z�Iv��@[�����@\^����@]9����@^�6v�@^�	腪@_�w��x]@`]v�"�@`�4�P3x@aC�6�A�@a���sV+@b.i�k�@b��T�